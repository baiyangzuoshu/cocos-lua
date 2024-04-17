# /usr/bin/env python
# coding:utf-8

import csv
import io
import json
import numbers
import os

SEQUECE = ["\\", "\'", "\"", "\b", "\f", "\n", "\r", "\t", ]
MY_ESCAPE_DCT = {
    "\\": "\\\\",
    "\'": "\\\'",
    "\"": "\\\"",
    "\b": "\\b",
    "\f": "\\f",
    "\n": "\\n",
    "\r": "\\r",
    "\t": "\\t",
}


def replaceStr(srcStr):
    result = srcStr
    for key in SEQUECE:
        result = result.replace(key, MY_ESCAPE_DCT[key])
    return result


def value2LuaStr(value):
    result = ""
    if type(value) == dict:
        result = '{'
        for k, v in value.items():
            result += '['
            result += value2LuaStr(k)
            result += ']'
            result += '='
            result += value2LuaStr(v)
            result += ','
        result += '}'
    elif type(value) == list:
        if len(value) == 0:
            result = '{}'
        else:
            result = '{'

            for i in range(len(value) - 1):
                result += value2LuaStr(value[i])
                result += ','

            result += value2LuaStr(value[len(value) - 1])
            result += '}'
    elif type(value) == str:
        value = replaceStr(value)
        result = "\"{}\"".format(value)
    elif type(value) == unicode:
        value = value.encode('utf-8')
        value = replaceStr(value)
        result = "\"{}\"".format(value)
    elif type(value) == bool:
        result = str(value).lower()
    else:
        result = str(value)
    return result


LUA_CONTENT = '''local {filename} = {content}
cc.exports.g_{filename} = {filename}
'''


def getLuaTableLineStr(dictData, keys):
    content = ''
    if len(keys) == 0:
        content += '{}'
    else:
        content += "{ "

        for idx in range(len(keys) - 1):
            key = keys[idx]
            value = dictData[key]
            content += (key + " = " + value2LuaStr(value) + ", ")

        lastKey = keys[len(keys) - 1]
        lastValue = dictData[lastKey]
        content += (lastKey + " = " + value2LuaStr(lastValue))
        content += " }"

    return content


def dict2LuaTable(dataDict, rowKeys, columnKeys):
    ret = ''
    if len(rowKeys) == 0:
        ret += '{}'
    else:
        content = ''
        for r in range(len(rowKeys) - 1):
            rowKey = rowKeys[r]
            lineStr = getLuaTableLineStr(dataDict[rowKey], columnKeys)
            content += "[\"{rowKey}\"] = {lineStr},\n".format(
                rowKey=rowKey, lineStr=lineStr)

        lastRowKey = rowKeys[len(rowKeys) - 1]
        lastLineStr = getLuaTableLineStr(dataDict[lastRowKey], columnKeys)
        content += "[\"{rowKey}\"] = {lineStr}\n".format(rowKey=lastRowKey, lineStr=lastLineStr)

        ret = "{{\n{content}\n}}".format(content=content)

    return ret


def getClientFileContent(dataDict, filename, rowKeys, columnKeys):
    content = dict2LuaTable(dataDict, rowKeys, columnKeys)

    return LUA_CONTENT.format(filename=filename, content=content)


def writeClientConfigFile(outputDir, filename, content):
    luaFile = os.path.abspath(os.path.join(outputDir, filename + '.lua'))
    with io.open(luaFile, "w", encoding="utf-8") as fo:
        fo.write(content.decode("utf-8"))


def mystringify(s, encoding):
    if s is None:
        return ''
    if isinstance(s, unicode):
        s = s.encode(encoding)
    elif isinstance(s, numbers.Number):
        pass
    elif not isinstance(s, str):
        s = str(s)
    return s


def getJsonLineStr(dictData, keys):
    content = ''
    if len(keys) == 0:
        content += '{}'
    else:
        content += "{ "

        for idx in range(len(keys) - 1):
            key = keys[idx]
            value = dictData[key]
            # content += (key + " : " + value2LuaStr(value) + ", ")
            content += "\"{key}\" : {valueStr},".format(key=key, valueStr=json.dumps(value, ensure_ascii=False))

        lastKey = keys[len(keys) - 1]
        lastValue = dictData[lastKey]
        content += "\"{key}\" : {valueStr}".format(key=lastKey, valueStr=json.dumps(lastValue, ensure_ascii=False))
        content += " }"

    return content


def dict2Json(dataDict, rowKeys, columnKeys):
    ret = ''
    if len(rowKeys) == 0:
        ret += '[]'
    else:
        content = ''
        for r in range(len(rowKeys) - 1):
            rowKey = rowKeys[r]
            lineStr = getJsonLineStr(dataDict[rowKey], columnKeys)
            content += lineStr
            content += ",\n"

        lastRowKey = rowKeys[len(rowKeys) - 1]
        content += getJsonLineStr(dataDict[lastRowKey], columnKeys)

        ret = "[\n{content}\n]".format(content=content)

    return ret


def getServerFileContent(dataDict, filename, rowKeys, columnKeys):
    # j = json.dumps(d)
    return dict2Json(dataDict, rowKeys, columnKeys)


def writeServerConfigFile(outputDir, filename, content):
    jsonFile = os.path.abspath(os.path.join(outputDir, filename + '.json'))
    with io.open(jsonFile, "w", encoding="utf-8") as fo:
        fo.write(content.decode("utf-8"))


def writeCsvConfigFile(outputDir, filename, srcData):
    dataDict = srcData['objectArray']
    filename = srcData['filename']
    rowKeys = srcData['rowKeys']
    columnKeys = srcData['columnKeys']

    csvFile = os.path.abspath(os.path.join(outputDir, filename + '.csv'))

    dataList = list()
    for key in rowKeys:
        dataList.append(dataDict[key])

    with io.open(csvFile, 'wb') as f:
        f.write(u'\ufeff'.encode('utf8'))
        w = csv.writer(f)

        w.writerow([mystringify(item, 'utf-8') for item in columnKeys])
        for row in dataList:
            rowList = []
            for key in columnKeys:
                rowList.append(row[key])

            w.writerow([mystringify(item, 'utf-8') for item in rowList])
