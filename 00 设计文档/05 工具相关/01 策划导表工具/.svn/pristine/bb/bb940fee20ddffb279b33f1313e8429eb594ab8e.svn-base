# /usr/bin/env python
# coding:utf-8

import Constant
from FormartOutput import getClientFileContent, writeClientConfigFile, getServerFileContent, writeServerConfigFile


def isServerPlatform(platform):
    return platform == 'server'


def isClientPlatform(platform):
    return platform == 'client'


def analysisExcel(out_q, allExcel, enumDict, outputList, translateHelper):
    for sheetname, obj in allExcel.items():

        print u'配置文件:{sheetname} 正在分析中...\n'.format(sheetname=sheetname)
        objectArray = obj['excel'].getNormalExcelDict(enumDict)

        rowKeys = obj['excel'].getRowKeySequence()
        columnKeyDict = dict()

        ret = list()
        for outputCfg in outputList:
            outputDir = outputCfg['outputDir']
            platform = outputCfg['platform']
            translatedExcel = outputCfg['translatedExcel']

            columnKeys = list()
            if columnKeyDict.has_key(platform):
                columnKeys = columnKeyDict.get(platform)
            else:
                columnKeyDict[platform] = obj['excel'].getValidColumnKeys(platform)
                columnKeys = columnKeyDict.get(platform)

            if len(columnKeys) <= 0:
                continue

            content = None
            writeFunc = None
            if isServerPlatform(platform):
                content = getServerFileContent(objectArray, sheetname, rowKeys, columnKeys)
                content = content.replace(Constant.CUSTOM_TRANSLATE_SYMBOL, '')
                writeFunc = writeServerConfigFile
            else:
                content = getClientFileContent(objectArray, sheetname, rowKeys, columnKeys)
                writeFunc = writeClientConfigFile

            ret.append({'outputDir': outputDir, 'filename': sheetname, 'content': content, 'writeFunc': writeFunc,
                        'RUNNING': True})

        print u'配置文件:{sheetname} 分析成功\n'.format(sheetname=sheetname)

        for data in ret:
            out_q.put(data)

    out_q.put({'RUNNING': False})


def writeFile(in_q, translateHelper):
    while True:
        data = in_q.get()

        if not data['RUNNING']:
            break

        outputDir = data['outputDir']
        filename = data['filename']
        content = data['content']
        writeFunc = data['writeFunc']

        print u'{outputDir}/{filename} 正在写入中...\n'.format(outputDir=outputDir, filename=filename)
        if writeFunc and content:
            writeFunc(outputDir, filename, content)
        print u'{outputDir}/{filename} 写入成功\n'.format(outputDir=outputDir, filename=filename)

    print u'正在生成多语言配置表...'
    translateHelper.saveTranslatedFile()

    print '+++++++++++++++++++++++++++++++++'
    print '+                               +'
    print '+            SUCCESS            +'
    print '+                               +'
    print '+++++++++++++++++++++++++++++++++'
