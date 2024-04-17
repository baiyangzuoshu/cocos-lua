# /usr/bin/env python
# coding:utf-8

import xlrd

import Constant
from CellValueCalculator import CellValueCalculator
from Tools import formatErrorMsg
from Tools import mergeDict

g_CellValueCalculator = CellValueCalculator()

# 默认数据sheet位置
DEFAULT_SHEET = 0

# 表的最小行数
MIN_ROW = 5

RANGE_ROW = 0
KEY_ROW = 1
TYPE_ROW = 2
ATTRIBUTE_ROW = 3
DESC_ROW = 4


class ExcelReader:

    def __init__(self, filename):
        self.mFileName = filename
        self.mSheetName = ''
        workbook = xlrd.open_workbook(filename)

        sheet_names = workbook.sheet_names()

        assert len(sheet_names) > 0, formatErrorMsg(
            'ERROR', 'Sheets len is 0.', self.getFileInfo())

        self.mSheetName = sheet_names[DEFAULT_SHEET].encode('utf-8')
        self.mSheet = workbook.sheet_by_name(self.mSheetName)

        assert self.mSheet.nrows > MIN_ROW, formatErrorMsg(
            'ERROR', 'Sheet is illegal!', self.getFileInfo())

        self.mColumnRange = list()
        self.mColumnKey = list()
        self.mColumnType = list()
        self.mColumnAttribute = list()

        self.mRowKeySequence = list()

    def getFileInfo(self, row=None, column=None):
        rowStr = ''
        if row is not None:
            rowStr = str(row + 1)

        columnStr = ''
        if column is not None:
            columnStr = xlrd.colname(column)

        return {'FileName': self.mFileName, 'SheetName': self.mSheetName, 'Row': rowStr, 'Column': columnStr}

    def getmFileName(self):
        return self.mFileName

    def getSheetName(self):
        return self.mSheetName

    def getCellRawValue(self, row, column):
        #  0. empty, 1 string , 2 number, 3 date, 4 boolean, 5 error， 6 blank
        cValue = self.mSheet.cell_value(row, column)
        cType = self.mSheet.cell(row, column).ctype
        ret = ''
        if cType == 0:
            ret = ''
        elif cType == 1:
            if type(cValue) == unicode:
                ret = cValue.encode('utf-8')
            else:
                ret = str(cValue)
        elif cType == 2:
            ret = int(cValue)
        elif cType == 3:
            ret = cValue
        elif cType == 4:
            ret = cValue
        elif cType == 5:
            ret = ''
        elif cType == 6:
            ret = ''
        return ret

    def initColumnBase(self, row, errMsg=''):
        ret = list()

        for column in range(0, self.mSheet.ncols):
            attribute = self.getCellRawValue(row, column).strip()

            if attribute == '' and errMsg != '':
                # print(formatErrorMsg('WARNING', errMsg, self.getFileInfo(row, column))
                pass

            ret.append(attribute)

        return ret

    def getColumnBase(self, dataList, column, row, errMsg=''):
        if dataList[column] if len(dataList) > column else None:
            return dataList[column] if len(dataList) > column else None

        del dataList[:]
        dataList.extend(self.initColumnBase(row, errMsg))

        return dataList[column] if len(dataList) > column else None

    def getColumnRange(self, column):
        return self.getColumnBase(self.mColumnRange, column, RANGE_ROW, 'Row range is empty.')

    def checkAttributePlatform(self, column, platform):
        attribute = self.getColumnRange(column).lower()
        return attribute == 'both' or attribute == platform

    def isClientAttribute(self, column):
        return self.checkAttributePlatform(column, 'client')

    def isServerAttribute(self, column):
        return self.checkAttributePlatform(column, 'server')

    def getColumnKey(self, column):
        return self.getColumnBase(self.mColumnKey, column, KEY_ROW, 'Row key is empty.')

    def getAllColumnKey(self):
        self.getColumnBase(self.mColumnKey, 0, KEY_ROW, 'Row key is empty.')
        return self.mColumnKey

    def findColumnKey(self, key):
        ret = -1
        if key in self.getAllColumnKey():
            ret = self.getAllColumnKey().index(key)
        return ret

    def getColumnTypeStr(self, column):
        return self.getColumnBase(self.mColumnType, column, TYPE_ROW, 'Row type is empty.')

    def getColumnAttribute(self, column):
        if self.mColumnAttribute[column] if len(self.mColumnAttribute) > column else None:
            return self.mColumnAttribute[column] if len(self.mColumnAttribute) > column else None

        dataDict = self.initColumnBase(
            ATTRIBUTE_ROW, 'Row attribute is empty.')
        self.mColumnAttribute = list()
        for _, attributeStr in enumerate(dataDict):
            attribute = {}
            for data in attributeStr.split(','):
                t = data.split('=')
                if len(t) == 2:
                    attribute[t[0].lower()] = t[1]
                else:
                    attribute[t[0].lower()] = True
            self.mColumnAttribute.append(attribute)

        return self.mColumnAttribute[column] if len(self.mColumnAttribute) > column else {}

    def isKeyColumn(self, column):
        return self.getColumnAttribute(column).has_key('key')

    def isTranslateColumn(self, column):
        return self.getColumnAttribute(column).has_key('translate')

    def getTranslateSymbol(self, column):
        ret = []
        translateStr = self.getColumnAttribute(column).get('translate')
        if type(translateStr) == str:
            fileInfo = self.getFileInfo(ATTRIBUTE_ROW, column)
            assert len(translateStr) == 2, formatErrorMsg(
                'ERROR', 'Translate symbol length must be 2. Example: [], you fill in: {translate}',
                mergeDict({'translate': str(translateStr)}, fileInfo))
            ret = [translateStr[0], translateStr[1]]
        return ret

    def isIgnoreColumn(self, column):
        return self.getColumnAttribute(column).has_key('ignore')

    def getSplitSymbol(self, column):
        ret = Constant.CUSTOM_SPLIT_SYMBOL
        splitStr = self.getColumnAttribute(column).get('split')
        if splitStr:
            fileInfo = self.getFileInfo(ATTRIBUTE_ROW, column)
            assert len(splitStr) == 4, formatErrorMsg(
                'ERROR', 'Split symbol length must be 4. Example: [|@], you fill in: {split}',
                mergeDict({'split': str(splitStr)}, fileInfo))
            ret = [splitStr[1], splitStr[2]]

        return ret

    def getDefaultValue(self, column):
        return self.getColumnAttribute(column).get('default')

    def getCustomDataType(self, column):
        return self.getColumnAttribute(column).get('datatype')

    def replaceTranslateSymbol(self, rawValue, translateSymbol=None):
        if translateSymbol is None:
            translateSymbol = []
        if not rawValue:
            return rawValue
        ret = ''
        if len(translateSymbol) == 0:
            ret = Constant.CUSTOM_TRANSLATE_SYMBOL + \
                  rawValue + Constant.CUSTOM_TRANSLATE_SYMBOL
        else:
            ret = rawValue.replace(translateSymbol[0], Constant.CUSTOM_TRANSLATE_SYMBOL).replace(
                translateSymbol[1], Constant.CUSTOM_TRANSLATE_SYMBOL)

        return ret

    def getCellRawValueOrDefault(self, row, column):
        rValue = self.getCellRawValue(row, column)
        if rValue == '':
            dValue = self.getDefaultValue(column)
            if dValue is not None:
                rValue = dValue
        return rValue

    def getCellValue(self, row, column, enumDict):
        rValue = self.getCellRawValueOrDefault(row, column)
        typeStr = None
        fileInfo = self.getFileInfo(row, column)
        if self.getCustomDataType(column):
            key = self.getCustomDataType(column)
            keyColumn = self.findColumnKey(key)

            assert keyColumn > -1, formatErrorMsg(
                'ERROR', 'Custom DataType:{key} column is not exist.', mergeDict({'key': str(key)}, fileInfo))

            eType = self.getColumnTypeStr(keyColumn)
            enum = self.getCellRawValueOrDefault(row, keyColumn)

            typeStr = g_CellValueCalculator.getEnumeTypeCellDataFormat(
                eType, enum, fileInfo)
        else:
            typeStr = self.getColumnTypeStr(column)

        assert typeStr, formatErrorMsg('ERROR', 'Column is empty.', fileInfo)

        if self.isTranslateColumn(column):
            rValue = self.replaceTranslateSymbol(rValue, self.getTranslateSymbol(column))

        splitSymbol = self.getSplitSymbol(column)
        return g_CellValueCalculator.getCellValue(typeStr, rValue, fileInfo, splitSymbol)

    def getValidColumns(self, platform):
        ret = list()
        for column in range(0, self.mSheet.ncols):
            if not self.isIgnoreColumn(column) and self.checkAttributePlatform(column, platform):
                ret.append(column)

        return ret

    def getValidColumnKeys(self, platform):
        keys = self.getAllColumnKey()
        ret = list()
        for column in self.getValidColumns(platform):
            if keys[column] == '':
                continue

            ret.append(keys[column])

        return ret

    def getNormalExcelDict(self, enumDict):

        ret = {}
        for row in range(MIN_ROW, self.mSheet.nrows):
            rowKey = ''
            rowData = {}
            for column in range(0, self.mSheet.ncols):
                key = self.getColumnKey(column)
                if key == '':
                    print(formatErrorMsg('WARNING', 'Value\'s key is empty.',
                                         self.getFileInfo(KEY_ROW, column)))
                    continue

                rowData[key] = self.getCellValue(row, column, enumDict)

                if self.isKeyColumn(column):
                    assert str(rowData[key]), formatErrorMsg(
                        'ERROR', 'Key column is not allowed empty.', self.getFileInfo(row, column))
                    rowKey += str(rowData[key])

            assert rowKey, formatErrorMsg(
                'ERROR', 'Row not define key column. Key is not allowed empty.', self.getFileInfo(row, None))

            assert not ret.has_key(rowKey), formatErrorMsg(
                'ERROR', 'Key already exists.', self.getFileInfo(row, None))

            self.mRowKeySequence.append(rowKey)

            ret[rowKey] = rowData

        return ret

    def getEnumeExcelDict(self):
        ret = {}
        for row in range(MIN_ROW, self.mSheet.nrows):
            EnumerationType = ''
            Enumeration = ''
            Value = None
            Format = ''
            FormatColumn = -1
            for column in range(0, self.mSheet.ncols):
                key = self.getColumnKey(column)
                if key == 'EnumerationType':
                    EnumerationType = self.getCellValue(row, column, None)
                elif key == 'Enumeration':
                    Enumeration = self.getCellValue(row, column, None)
                elif key == 'Index':
                    Value = self.getCellValue(row, column, None)
                elif key == 'EataConfigurationFormat':
                    FormatColumn = column
                    Format = self.getCellValue(row, column, None) or 'String'

            if not ret.has_key(EnumerationType):
                ret[EnumerationType] = {}
            if FormatColumn >= 0 and Format != '':
                g_CellValueCalculator.getTypeAttributeByTypeStr(
                    Format, self.getFileInfo(row, FormatColumn))
            ret[EnumerationType][Enumeration] = {
                'Value': Value, 'Format': Format}

        g_CellValueCalculator.setEnumDict(ret)
        return ret

    def getRowKeySequence(self):
        return self.mRowKeySequence
