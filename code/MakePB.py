# -*- coding: utf-8

import sys
import os

import platform

import shutil

def absPath(filePath):
    return os.path.abspath(filePath)


def joinPath(*filePaths):
    return os.path.join(*filePaths)


def isWindows():
    return platform.system() == "Windows"


def isLinux():
    return platform.system() == "Linux"


def deleteDir(dir):
    if isWindows():
        os.system('rd /s /q "' + dir + '"')
    else:
        os.system('rm -rf "' + dir + '"')


def generateProtoCmd(protoPath, outputPath, inputPath):
    protoPath = absPath(protoPath)
    outputPath = absPath(outputPath)
    inputPath = absPath(inputPath)

    if isWindows():
        os.system("protoc --proto_path=" + protoPath + " --descriptor_set_out=" + outputPath + " " + inputPath)
    else:
        pass

def safeCopy(src, dst, symlinks=False, ignore=None):
    src = absPath(src)
    dst = absPath(dst)

    print "safeCopy src: " + src + " dst: " + dst
    if os.path.exists(dst):
        deleteDir(dst)

    shutil.copytree(src, dst, symlinks, ignore)

def main():
    pbDir = joinPath(absPath('.'), "pb")

    if os.path.exists(pbDir):
        deleteDir(pbDir)
    os.makedirs(pbDir)

    for root, _, files in os.walk(joinPath(absPath("."), "protobuf")):
        for name in files:
            if name.find('.proto', len(name) - len('.proto')) != -1:

                filename = name[0: len(name) - len('.proto')]
                outputPath = joinPath(absPath(pbDir), filename + ".pb")

                inputPath = joinPath(absPath(root), name)
                generateProtoCmd(root, outputPath, inputPath)


if __name__ == "__main__":
    main()
