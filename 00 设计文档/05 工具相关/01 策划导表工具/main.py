#! /usr/bin/env python
# -*- coding: utf-8 -*-
import sys

reload(sys)
sys.setdefaultencoding('utf-8')

import ConfigParser
import codecs
import os
import shutil
import threading
from Queue import Queue

import AnalysisHelper
import Constant
import Tools
from ExcelReader import ExcelReader
from TranslateHelper import TranslateHelper

g_TranslateHelper = TranslateHelper()


def main(excelDir, outputList):
    allExcel = {}
    enumExcel = None

    for path, _, fileList in os.walk(excelDir):
        for filename in fileList:
            if filename.find('~$') != 0 and filename.find('.xlsx', len(filename) - len('.xlsx')) != -1:
                filepath = os.path.abspath(os.path.join(path, filename))

                print 'Excel ' + filepath + ' is reading ...'

                excel = ExcelReader(filepath)
                if excel is None:
                    assert 'Excel ' + filepath + ' read failed. Please check and execute again.'
                    return

                sheetname = excel.getSheetName()

                if enumExcel is None and sheetname == Constant.ENUMERATION:
                    enumExcel = excel

                assert not allExcel.has_key(sheetname), Tools.formatErrorMsg('ERROR',
                                                                             '{sheetname} already exists.'.format(
                                                                                 sheetname=sheetname))
                allExcel[sheetname] = {'excel': excel}

    assert enumExcel, 'Enumeration table missing.'
    enumDict = enumExcel.getEnumeExcelDict()

    for outputCfg in outputList:
        outputDir = outputCfg['outputDir']
        print u'删除输出目录： ' + outputDir
        shutil.rmtree(outputDir, ignore_errors=True)
        os.makedirs(os.path.abspath(outputDir))

    q = Queue()
    t1 = threading.Thread(target=AnalysisHelper.writeFile, args=(q, g_TranslateHelper))
    t2 = threading.Thread(target=AnalysisHelper.analysisExcel,
                          args=(q, allExcel, enumDict, outputList, g_TranslateHelper))
    t1.start()
    t2.start()


def getConfigValue(config, section, option, default=''):
    ret = ''
    if not config.has_option(section, option):
        ret = default
    elif not config.get(section, option):
        ret = default
    else:
        ret = config.get(section, option)

    return ret


def initChannelOutPutConfig(config, section):
    DEFAULT_VARS = dict({'Platform': 'client', 'OutputDir': 'lua', 'TranslatedExcel': None, 'UntranslatedExcel': None})
    Platform = getConfigValue(config, section, 'Platform', DEFAULT_VARS['Platform'])
    OutputDir = getConfigValue(config, section, 'OutputDir', DEFAULT_VARS['OutputDir'])

    TranslatedExcel = getConfigValue(config, section, 'TranslatedExcel', DEFAULT_VARS['TranslatedExcel'])
    UntranslatedExcel = getConfigValue(config, section, 'UntranslatedExcel', DEFAULT_VARS['UntranslatedExcel'])

    global g_TranslateHelper
    g_TranslateHelper.addLanguage(TranslatedExcel, UntranslatedExcel, OutputDir)
    return {'outputDir': OutputDir, 'platform': Platform, 'translatedExcel': TranslatedExcel,
            'translateHelper': g_TranslateHelper}


def initConfig(configPath, channels, outAll):
    ret = []
    if not os.path.exists(configPath):
        print 'Config file is not exist.'
        return []

    cf = ConfigParser.ConfigParser()
    cf.readfp(codecs.open(configPath, 'r', 'utf-8'))

    for section in cf.sections():
        if outAll or channels.has_key(section):
            ret.append(initChannelOutPutConfig(cf, section))

    return ret


if __name__ == '__main__':
    assert len(
        sys.argv) >= 3, 'Parameter length must not be less than three, please input [Excel Directory] [Config Path]'

    excelDir = sys.argv[1]
    configPath = sys.argv[2]

    channels = dict()
    outAll = True
    for idx in range(3, len(sys.argv)):
        channels[sys.argv[idx]] = True
        outAll = False
    # initConfig(configPath, channels, outAll)
    main(excelDir, initConfig(configPath, channels, outAll))
