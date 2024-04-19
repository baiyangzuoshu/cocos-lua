# -*- coding: utf-8

import sys
import os
import io
import re
import shutil

import tempfile

import platform

import ConfigParser

TexturePackerPath = 'D:\\Program Files\\CodeAndWeb\\TexturePacker\\bin\\TexturePacker.exe'

# cocos.tool publish -a -d Serializer_Lua -f ccsPath -o outPut
plistResList = []


def absPath(filePath):
    return os.path.abspath(filePath)


def joinPath(*filePaths):
    return os.path.join(*filePaths)


def safeCopy(src, dst, symlinks=False, ignore=None):
    print "safeCopy src: " + src + " dst: " + dst
    if os.path.exists(dst):
        deleteDir(dst)

    shutil.copytree(src, dst, symlinks, ignore)


def safeCopyFile(src, dst):
    print "safeCopyFile src: " + src + " dst: " + dst
    if os.path.exists(dst):
        deleteDir(dst)
    shutil.copy(src, dst)


def isWindows():
    return platform.system() == "Windows"


def isLinux():
    return platform.system() == "Linux"


def deleteDir(dst):

    if not os.path.exists(dst):
        return

    if isWindows():
        os.system('rd /s /q "' + dst + '"')
    else:
        os.system('rm -rf "' + dst + '"')


def deleteFile(dst):

    if not os.path.exists(dst):
        return

    if isWindows():
        os.system('del /f /a /q "' + dst + '"')
    else:
        os.system('rm -f"' + dst + '"')


def initTexturePackerPath():
    global TexturePackerPath

    if not os.path.exists(TexturePackerPath):
        configPath = absPath(joinPath(absPath(os.getcwd()), "config.ini"))
        if os.path.exists(configPath):
            cf = ConfigParser.ConfigParser()
            cf.read(configPath)

            if not cf.has_section("TexturePacker"):
                print '[config.ini] "TexturePacker" is not exist.'
            elif not cf.has_option("TexturePacker", "path"):
                print '[config.ini] "TexturePacker" "path" is not exist.'
            else:
                TexturePackerPath = cf.get("TexturePacker", "path")

    assert os.path.exists(
        TexturePackerPath), "检查配置文件config.ini中TexturePacker.path 是否存在"


def runTexturePackerCmd(inputPath, outputPath, name, multipack=True, prependFolderName=True):
    multipackCmd = ''
    if multipack:
        plist = absPath(joinPath(outputPath, name + "_{n1}.plist"))
        pvr = absPath(joinPath(outputPath, name + "_{n1}.pvr"))
        multipackCmd = '--multipack '
    else:
        plist = absPath(joinPath(outputPath, name + ".plist"))
        pvr = absPath(joinPath(outputPath, name + ".pvr"))
        multipackCmd = ''

    prependFolderNameCmd = ''
    if prependFolderName:
        prependFolderNameCmd = '--prepend-folder-name '
    else:
        prependFolderNameCmd = ''

    cmdStr = '"' + TexturePackerPath + '"' + ' ' + \
        '--format cocos2d' + ' ' + \
        '--opt RGBA8888' + ' ' + \
        '--texture-format pvr2' + ' ' + \
        multipackCmd + \
        prependFolderNameCmd + \
        '--alpha-handling PremultiplyAlpha' + ' ' + \
        '--data' + ' ' + plist + ' ' + \
        '--sheet' + ' ' + pvr + ' ' + \
        inputPath
    os.system(cmdStr)


def findItemInList(list, res):

    for item in list:
        if res == item:
            return 0
    return 1


def replaceImage2PlistLoad(data, plistResList, imageType, prependFolder, holdPre=False):
    matchObjs = re.findall(r'"' + prependFolder +
                           r'/(.*?).' + imageType + r'"', data)
    for item in matchObjs:
        if not holdPre:
            data = data.replace(prependFolder + '/' + item + '.' + imageType,
                                item + '.' + imageType)
            data = data.replace('("' + item + '.' + imageType + '",0)',
                                '("' + item + '.' + imageType + '", 1)')
            data = data.replace('("' + item + '.' + imageType + '", 0)',
                                '("' + item + '.' + imageType + '", 1)')

            paths = item.split('/')
            if len(paths) >= 2 and findItemInList(plistResList, paths[0]) == 1:
                plistResList.append(paths[0])
        else:
            data = data.replace('("' + prependFolder + '/' + item + '.' + imageType + '",0)',
                                '("' + prependFolder + '/' + item + '.' + imageType + '", 1)')
            data = data.replace('("' + prependFolder + '/' + item + '.' + imageType + '", 0)',
                                '("' + prependFolder + '/' + item + '.' + imageType + '", 1)')
            if findItemInList(plistResList, prependFolder) == 1:
                plistResList.append(prependFolder)

    return (data, plistResList)


def handleOneFile(file, plisMultipack):
    plistResList = []
    with open(file, 'r') as f:
        data = f.read()
        f.close()

        (data, plistResList) = replaceImage2PlistLoad(
            data, plistResList, 'png', 'ui', False)
        (data, plistResList) = replaceImage2PlistLoad(
            data, plistResList, 'jpg', 'ui', False)
        (data, plistResList) = replaceImage2PlistLoad(
            data, plistResList, 'png', 'Default', True)
        (data, plistResList) = replaceImage2PlistLoad(
            data, plistResList, 'jpg', 'Default', True)

        if data.find('require("LuaScript.newButton")') > 0 and findItemInList(plistResList, 'Default') == 1:
            plistResList.append('Default')

        data = data.replace('cc.Sprite:create(',
                            'cc.Sprite:createWithSpriteFrameName(')

        data = data.replace('require("LuaScript.newButton")',
                            'require("csd.LuaScript.newButton")')
        data = data.replace('require "LuaExtend"',
                            'require("csd.LuaScript.LuaExtend")')

        listStr = 'Result["MPLISTLISTDATA"] = { \t\n'
        for it in plistResList:
            for idx in range(1, plisMultipack[it] + 1):
                listStr = listStr + '"ui/' + it + '/' + \
                    it + '_' + str(idx) + '.plist",\t\n'
        listStr = listStr + '}\t\n'

        strresult = 'local Result = {}'
        newstrresult = strresult + '\t\n' + listStr
        data = data.replace(strresult, newstrresult)

        #print data

        with open(file, "w") as f:
            f.write(data)
            f.close()


def publishCocosStudio(outputDir):

    ccsPath = absPath(joinPath(os.getcwd(), 'cocosui.ccs'))

    if os.path.exists(outputDir):
        deleteDir(outputDir)
    os.mkdir(outputDir)

    cmdStr = 'Cocos.Tool.exe' + ' ' + \
        'publish' + ' ' + \
        '-w' + ' ' + \
        '-d Serializer_Lua' + ' ' + \
        '-f' + ' ' + ccsPath + ' ' + \
        '-o' + ' ' + outputDir

    os.system(cmdStr)

    deleteDir(joinPath(outputDir, 'LuaScript'))
    deleteFile(joinPath(outputDir, 'LuaExtend.lua'))
    safeCopy(joinPath(sys.path[0], 'template', 'LuaScript'),
             joinPath(outputDir, 'csd', 'LuaScript'))

    deleteDir(joinPath(outputDir, 'Default'))
    safeCopy(joinPath(sys.path[0], 'template', 'Default'),
             joinPath(outputDir, 'ui', 'Default'))


def doTexturePacker(inputPath, outputPath):
    for d in os.listdir(inputPath):
        if os.path.isdir(absPath(joinPath(inputPath, d))):
            currDir = absPath(joinPath(inputPath, d))
            runTexturePackerCmd(currDir, absPath(joinPath(outputPath, d)), d)


def main():
    tmpWorkDir = absPath(joinPath(tempfile.gettempdir(), 'ROBERT_CCS_PUBLISH'))
    publishCocosStudio(tmpWorkDir)

    outputDir = absPath(joinPath(os.getcwd(), 'res'))
    if os.path.exists(outputDir):
        deleteDir(outputDir)
    safeCopy(tmpWorkDir, outputDir)

    deleteDir(joinPath(outputDir, 'ui'))
    initTexturePackerPath()
    doTexturePacker(joinPath(tmpWorkDir, 'ui'), joinPath(outputDir, 'ui'))

    plisMultipack = dict({})
    for root, _, files in os.walk(joinPath(outputDir, 'ui')):
        for f in files:
            matchObjs = re.findall(r'(.*?)_\d+.plist', f)
            if len(matchObjs) == 1:
                if not plisMultipack.has_key(matchObjs[0]):
                    plisMultipack[matchObjs[0]] = 0
                plisMultipack[matchObjs[0]] += 1

    for root, _, files in os.walk(outputDir):
        for f in files:
            pathname = joinPath(root, f)
            res = pathname.find(".lua")
            if res > 0:
                handleOneFile(pathname, plisMultipack)

    if os.path.exists(tmpWorkDir):
        deleteDir(tmpWorkDir)


if __name__ == '__main__':
    main()
