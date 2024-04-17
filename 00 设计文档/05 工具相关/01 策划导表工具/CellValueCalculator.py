# /usr/bin/env python
# coding:utf-8
import threading

from Tools import formatErrorMsg
from Tools import mergeDict

BASE_TYPE = ['int', 'string', 'bool']


class TypeAttribute:
    def __init__(self, attribute):
        data = attribute.split('[]')
        self.mType = data[0]
        self.mBaseType = BASE_TYPE.count(data[0].lower()) > 0
        self.mArray = len(data) == 2

    def getDataType(self):
        return self.mType

    def isBaseType(self):
        return self.mBaseType

    def isArray(self):
        return self.mArray


# 同步锁
def synchronous_lock(func):
    def wrapper(*args, **kwargs):
        with threading.Lock():
            return func(*args, **kwargs)

    return wrapper


class CellValueCalculator(object):
    instance = None

    @synchronous_lock
    def __new__(cls, *args, **kwargs):
        if cls.instance is None:
            cls.instance = object.__new__(cls)
            cls.mEnumDict = None
            cls.mTypeAttributeCache = dict()
        return cls.instance

    def setEnumDict(self, enumDict):
        self.mEnumDict = enumDict
        return self.mEnumDict

    def getTypeAttributeByTypeStr(self, typeStr, fileInfo):
        if self.mTypeAttributeCache.has_key(typeStr):
            return self.mTypeAttributeCache.get(typeStr)

        # () 分割
        tRet = []
        idx = 0
        while idx < len(typeStr):
            if idx >= len(typeStr):
                break

            s = typeStr.find('(', idx, len(typeStr))
            if s < 0:
                tRet.append(typeStr[idx:len(typeStr)])
                idx = len(typeStr)
            else:
                e = typeStr.find(')', s, len(typeStr))

                tRet.append(typeStr[s + 1:e])

                idx = e + 1

        flag = False
        if len(tRet) == 1:
            flag = False
            pass
        elif len(tRet) == 2:
            assert tRet[1] == '[]', formatErrorMsg('ERROR', 'Not support, please call Robert.', fileInfo)
            flag = True
            pass
        else:
            assert False, formatErrorMsg('ERROR', 'Not support, please call Robert.', fileInfo)
            pass

        # , 分割
        ret = [TypeAttribute(value) for value in tRet[0].split(',')]
        self.mTypeAttributeCache[typeStr] = (ret, flag)
        return ret, flag

    def getCellValue(self, typeStr, rValue, fileInfo, splitSymbol):

        (types, isArray) = self.getTypeAttributeByTypeStr(typeStr, fileInfo)

        ret = ''
        if isArray:
            if len(types) == 1:
                ret = [self.getCellValue2(types[0], value, fileInfo, splitSymbol[0]) for value in
                       str(rValue).split(splitSymbol[1])] if str(rValue) != '' else list()
            else:
                ret = [self.getCellValue1(typeStr, value, fileInfo, splitSymbol[0]) for value in
                       str(rValue).split(splitSymbol[1])] if str(rValue) != '' else list()
        elif len(types) == 1:
            ret = self.getCellValue2(types[0], rValue, fileInfo, splitSymbol[0])
        else:
            ret = self.getCellValue1(typeStr, rValue, fileInfo, splitSymbol[0])

        return ret

    def getCellValue1(self, typeStr, value, fileInfo, splitSymbol):
        ret = list()
        if value == '':
            return ret

        (types, _) = self.getTypeAttributeByTypeStr(typeStr, fileInfo)

        targets = str(value).split(splitSymbol)
        # assert len(targets) >= len(types), formatErrorMsg('ERROR', 'Int type conversion error.', fileInfo)
        # for i, v in enumerate(targets):
        idx = 0
        for attribute in types:
            if attribute.isArray():
                if idx < len(targets):
                    ret.append(
                        [self.convertCellValue(attribute, targets[i], fileInfo) for i in range(idx, len(targets))])
                    idx = len(targets)
                else:
                    ret.append(list())
            else:
                assert idx < len(targets), formatErrorMsg('ERROR', 'Data length does not match data type.', fileInfo)
                ret.append(self.convertCellValue(attribute, targets[idx], fileInfo))
                idx += 1

        if idx < len(targets):
            ret.append([self.convertCellValue(types[idx], targets[i], fileInfo) for i in range(idx, len(targets))])
        return ret

    def getCellValue2(self, attribute, value, fileInfo, splitSymbol):
        ret = ''
        if attribute.isArray():
            ret = [self.convertCellValue(attribute, v, fileInfo) for v in str(value).split(splitSymbol)] if str(
                value) != '' else list()
        else:
            ret = self.convertCellValue(attribute, value, fileInfo)
        return ret

    def convertCellValue(self, attribute, value, fileInfo):
        ret = ''
        if attribute.isBaseType():
            ret = self.getBaseTypeCellValue(attribute.getDataType(), value, fileInfo)
        else:
            ret = self.getEnumeTypeCellValue(attribute.getDataType(), value, fileInfo)
        return ret

    def getBaseTypeCellValue(self, rType, rValue, fileInfo):
        oType = rType.lower()

        value = ''
        if oType == 'int':
            try:
                value = int(rValue)
            except ValueError:
                assert False, formatErrorMsg('ERROR', 'Int type conversion error.', fileInfo)
        elif oType == 'float':
            try:
                value = float(rValue)
            except ValueError:
                assert False, formatErrorMsg('ERROR', 'Float type conversion error.', fileInfo)
        elif oType == 'string':
            if type(rValue) == unicode:
                value = rValue.encode('utf-8')
            else:
                value = str(rValue)
        elif oType == 'bool':
            tmp = ""
            if type(rValue) == unicode:
                tmp = rValue.encode('utf-8')
            else:
                tmp = str(rValue)
            try:
                if tmp.lower() == "false" or tmp == "0":
                    value = False
                elif tmp.lower() == "true" or tmp == "1":
                    value = True
                else:
                    raise ValueError("Bool transform error.")

            except ValueError:
                assert False, formatErrorMsg('ERROR', 'Bool type conversion error.', fileInfo)
        return value

    def getEnumeTypeCellData(self, eType, enum, fileInfo):
        assert self.mEnumDict, formatErrorMsg('ERROR', 'Enumeration Error.', fileInfo)

        assert enum, formatErrorMsg('ERROR', 'Enumeration Error. Enumeration value not allow empty.', fileInfo)

        assert eType, formatErrorMsg('ERROR', 'Enumeration Error. Enumeration Type value not allow empty.', fileInfo)

        etDict = self.mEnumDict.get(eType)
        assert etDict, formatErrorMsg('ERROR', 'Enumeration Error. EnumerationType:{eType} value not exist',
                                      mergeDict({'eType': eType}, fileInfo))

        enumData = etDict.get(enum)
        assert enumData, formatErrorMsg('ERROR',
                                        'Enumeration Error. EnumerationType:{eType}, Enumeration:{enum} is empty.',
                                        mergeDict({'eType': eType, 'enum': enum}, fileInfo))

        return enumData

    def getEnumeTypeCellDataFormat(self, eType, enum, fileInfo):
        enumData = self.getEnumeTypeCellData(eType, enum, fileInfo)

        typeStr = enumData.get('Format')
        return typeStr

    def getEnumeTypeCellValue(self, eType, enum, fileInfo):
        enumData = self.getEnumeTypeCellData(eType, enum, fileInfo)

        value = enumData.get('Value')
        assert value or value == 0, formatErrorMsg('ERROR',
                                                   'Enumeration Error. EnumerationType:{eType}, Enumeration:{enum}, value:{value} is illegal.',
                                                   mergeDict({'eType': eType, 'enum': enum, 'value': str(value)},
                                                             fileInfo))

        return value
