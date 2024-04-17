# /usr/bin/env python
# coding:utf-8
import json
import os
import re
import time
from os import path

import xlrd
import xlsxwriter

import Constant

# 默认数据sheet位置
DEFAULT_SHEET = 0

# 配置中所有translate字段
allTranslationFields = set()

# 字典数据
translatedDictionaryTitle = []  # type: list
translatedDictionary = {}  # type: dict

output = ""  # type:str


# 读字典的专有方法
def readDictionaryExcel(filename):
    book = xlrd.open_workbook(filename)
    sheet = book.sheets()[0]

    translatedDict = {}

    global translatedDictionaryTitle

    translatedDictionaryTitle = sheet.row_values(0)

    for row in range(1, sheet.nrows):
        # print u"行="
        # print sheet.row_values(row)
        values = sheet.row_values(row)

        translatedDict[values[0].decode('utf-8')] = {}

        for idx, title in enumerate(translatedDictionaryTitle):
            translatedDict[values[0].decode('utf-8')][title] = values[idx]

    return translatedDict


def writeDictionaryExcel(filename, content):
    if path.exists(filename) and path.isfile(filename):
        os.remove(filename)

    dirs = ''
    paths = filename.split('/')
    if len(paths) >= 2:
        dirs = paths[0]
        for idx in range(1, len(paths) - 1):
            dirs = dirs + '/' + paths[idx]

    if dirs and not os.path.exists(dirs):
        os.makedirs(dirs)

    if len(content.keys()) <= 0:
        return

    print u"要写入的表格", filename

    book = xlsxwriter.Workbook(filename)
    worksheet = book.add_worksheet()

    global translatedDictionaryTitle

    for index, title in enumerate(translatedDictionaryTitle):
        worksheet.write(0, index, title)

    idx = 1
    for dict_1 in content.values():
        for i, title1 in enumerate(translatedDictionaryTitle):
            if title1 in dict_1:
                worksheet.write(idx, i, dict_1[title1])
        idx += 1

    book.close()


def file_get_contents(filename):
    # type: (str) -> str
    """
    读取文本内容
    :rtype: str
    """
    f = open(filename, 'r')
    s = f.read()
    f.close()
    return s


def file_put_contents(path_to_file, content):
    # type: (str, str) -> None
    f = open(path_to_file, 'w')
    f.write(content)
    f.close()


class TranslateHelper:

    def __init__(self):
        self.mData = dict({})
        self.mTranslatedData = dict({})
        self.mLanguages = list([])

    def addLanguage(self, translatedExcel, untranslatedExcel, OutputDir):
        if translatedExcel is None or untranslatedExcel is None:
            return

        self.mLanguages.append(dict({'translatedExcel': translatedExcel, 'untranslatedExcel': untranslatedExcel}))

        global translatedDictionary
        # 读取已翻译,以CN为键,[TW,EN]为值生成的字典
        translatedDictionary = readDictionaryExcel(translatedExcel)

        global output

        output = OutputDir

    def saveTranslatedFile(self):
        # type: () -> None

        global output
        global translatedDictionary  # 所有翻译过的字段
        global translatedDictionaryTitle

        translatedExcelPath = self.mLanguages[0]['translatedExcel']
        untranslatedExcelPath = self.mLanguages[0]['untranslatedExcel']

        print u"把翻译好的字段合并进已翻译..."

        # 读取 "待翻译_{language}.xlsx" 表格,并把已经翻译的内容填入字典中
        for language in translatedDictionaryTitle:
            fileName, typeName = path.splitext(untranslatedExcelPath)
            unknownFilePath = fileName + "_" + language + typeName
            # 如果这表存在,则先读取它的内容
            if path.exists(unknownFilePath) and path.isfile(unknownFilePath):
                print u"需要把已翻译的内容覆盖进字典,此表存在=", unknownFilePath
                toBeMergedDict = readDictionaryExcel(unknownFilePath)
                for key, value in toBeMergedDict.items():
                    if key in translatedDictionary:
                        if value[language] is not None and value[language] != "":
                            translatedDictionary[key][language] = value[language]
                    else:
                        translatedDictionary[key] = value

        for fileName in os.listdir(output):
            filePath = path.join(output, fileName)
            fileContent = file_get_contents(filePath)
            matchList = re.findall(Constant.CUSTOM_TRANSLATE_SYMBOL + '(.*?)' + Constant.CUSTOM_TRANSLATE_SYMBOL,
                                   fileContent.decode('utf-8'))

            for translationPrototype in matchList:
                allTranslationFields.add(translationPrototype)

        print u"删除已翻译里的冗余字段..."

        # 删除冗余的字典字段
        translatedDictionaryKeys = translatedDictionary.keys()
        for translatedDictKey in translatedDictionaryKeys:
            if translatedDictKey not in allTranslationFields:
                del translatedDictionary[translatedDictKey]

        # 把所有字段加进字典中
        for field in allTranslationFields:
            if field not in translatedDictionary:
                translatedDictionary[field] = {}
                translatedDictionary[field][translatedDictionaryTitle[0]] = field

        print u"开始翻译Lua配置中的中文..."

        statisticalTranslationTable = set()

        # 再遍历所有文件,开始替换
        for fileName in os.listdir(output):
            filePath = path.join(output, fileName)
            fileContent = file_get_contents(filePath)

            for language in translatedDictionaryTitle:

                _Language = '_' + language

                copyStr = fileContent

                matchList = re.findall(Constant.CUSTOM_TRANSLATE_SYMBOL + '(.*?)' + Constant.CUSTOM_TRANSLATE_SYMBOL,
                                       copyStr.decode('utf-8'))

                if len(matchList) > 0:

                    if path.exists(filePath) and path.isfile(filePath):
                        # print u"删除原Lua配置表,要删除文件=", path.abspath(filePath)
                        os.remove(filePath)

                    # 记录被翻译的Lua配置
                    name, _ = path.splitext(fileName)
                    statisticalTranslationTable.add(name)

                    for translationPrototype in matchList:
                        if translationPrototype in translatedDictionary:
                            if language in translatedDictionary[translationPrototype]:
                                newText = str(translatedDictionary[translationPrototype]["CN"])
                                if translatedDictionary[translationPrototype][language] != "":
                                    newText = str(translatedDictionary[translationPrototype][language])
                                copyStr = copyStr.replace(
                                    Constant.CUSTOM_TRANSLATE_SYMBOL + translationPrototype.encode(
                                        'utf-8') + Constant.CUSTOM_TRANSLATE_SYMBOL, newText.encode('utf-8'))

                    name, typeName = path.splitext(filePath)

                    # 用土办法把所有匹配内容一起换成目标内容
                    matchLocal = re.findall("local (.*?) =", copyStr)
                    for localVar in matchLocal:
                        oldText = "local {0} =".format(localVar)
                        newText = "local {0} =".format(localVar + _Language)
                        copyStr = copyStr.replace(oldText, newText)

                        oldText = "cc.exports.g_{filename} = {filename}".format(filename=localVar)
                        newText = "cc.exports.g_{filename} = {filename}".format(filename=localVar + _Language)
                        copyStr = copyStr.replace(oldText, newText)

                    # 写成新文件
                    file_put_contents(name + _Language + typeName, copyStr)

                    time.sleep(0.01)

        # 生成缺语言的语言待翻译表↓↓↓↓↓↓↓↓↓↓
        for language in translatedDictionaryTitle:
            needTranslation = {}
            for translatedKey, translatedValue in translatedDictionary.items():
                if language not in translatedValue:
                    needTranslation[translatedKey] = translatedValue
                elif translatedValue[language] == "":
                    needTranslation[translatedKey] = translatedValue

            name, typeName = path.splitext(untranslatedExcelPath)

            print u"新生成待翻译表路径=", name + "_" + language + typeName
            writeDictionaryExcel(name + "_" + language + typeName, needTranslation)

        writeDictionaryExcel(translatedExcelPath, translatedDictionary)

        self.saveStatisticalTranslationTable(list(statisticalTranslationTable))

        print u"翻译结束."

    def saveStatisticalTranslationTable(self, nameList):
        # type: (list) -> None

        jsonStr = json.dumps(nameList, encoding='utf-8', ensure_ascii=False).encode('unicode-escape').decode(
            'string_escape')

        strContent = re.findall("\[(.*?)]", jsonStr)

        fileContent = "cc.exports.g_{filename} = {content}".format(filename="TbxLanguage",
                                                                   content="{" + strContent[0] + "}")

        file_put_contents(path.join(output, "TbxLanguage.lua"), fileContent)
