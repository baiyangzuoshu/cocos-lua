# /usr/bin/env python
# coding:utf-8

import hashlib


def mergeDict(dict1, dict2):
    ret = {}
    ret.update(dict1)
    ret.update(dict2)
    return ret


def formatErrorMsg(tag, srcStr, info=None):
    errMsg = ''

    errMsg += '\n---------- ' + tag + ' ----------\n'
    srcStr += '\nFileName:{FileName}'
    srcStr += '\nSheetName:{SheetName}'
    srcStr += '\nRow:{Row}, Column:{Column}'

    if info:
        errMsg += srcStr.format(**info)
    else:
        errMsg += srcStr

    errMsg += '\n---------- ' + tag + ' ----------\n'
    return errMsg + '\n'


def calcStringKey(src):
    if not src:
        return ""

    md5 = hashlib.md5()
    md5.update(src.encode('utf-8'))
    return md5.hexdigest()
