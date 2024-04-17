# -*- coding: utf-8

# WIN32资源脚本说明
# 脚本依赖于 config.ini 和 resource.ini
# 接受两个参数 local/remote cache/nocache

# 1. 拷贝资源到 work_path/[项目名]/ 没有指定work_path 则为系统临时目录
# local   从config中的path 读取resource中所有 [path]/[local]路径中的资源
# remote  从svn中拉取resource中所有 [config.svn.url]/[config.project.name]/[resource.XXX.remote]路径中的资源

# 2. 将所有资源按照[resource.XXX.order]逆序拷贝资源到 ./[out]

import sys
import os
import platform
import shutil

import subprocess
import tempfile

import threading

import urllib
from urllib import quote

import ConfigParser
import codecs


def isWindows():
    return platform.system() == "Windows"


def isLinux():
    return platform.system() == "Linux"


def absPath(filePath):
    return os.path.abspath(filePath)


def joinPath(*filePaths):
    return os.path.join(*filePaths)


def deleteDir(dir):
    if isWindows():
        os.system('rd /s /q "' + dir + '"')
    else:
        os.system('rm -rf "' + dir + '"')


def copyDir(srcDir, desDir):
    for root, dirs, files in os.walk(srcDir):

        for name in files:
            srcname = absPath(joinPath(root, name))
            dstname = absPath(joinPath(desDir, name))
            if os.path.exists(dstname):
                deleteDir(dstname)

            shutil.copy2(srcname, dstname)

        for name in dirs:
            copyDir(absPath(joinPath(root, name)),
                    absPath(joinPath(desDir, name)))


def safeCopy(src, dst, symlinks=False, ignore=None):
    print "safeCopy src: " + src + " dst: " + dst
    if os.path.exists(dst):
        deleteDir(dst)

    shutil.copytree(src, dst, symlinks, ignore)


def svnCheckout(name, dst, path):
    print "pull remote resource: %s" % name
    if os.path.exists(dst):
        if os.path.exists(absPath(joinPath(dst, '.svn'))):
            os.system("svn cleanup " + dst)
            os.system("svn cleanup " + dst + " --remove-unversioned --remove-ignored")
            os.system("svn revert " + dst + " -R")
        else:
            deleteDir(dst)
    os.system("svn checkout " + g_SvnRoot + g_ProjectName + "/" + quote(path) + " " + dst)


g_ProjectName = None
g_SvnRoot = None
g_ProjectPath = None
g_ProjectWorkPath = None
g_AllResourcePath = []


def loadLocalResource(rootPath):
    localResource = absPath(joinPath(rootPath, "localRes"))
    if os.path.exists(localResource):
        deleteDir(localResource)
    os.makedirs(localResource)

    for v in g_AllResourcePath:
        src = absPath(joinPath(g_ProjectPath, v["local"]))
        dst = absPath(joinPath(localResource, v["name"]))
        if v["type"] == 2:
            src = absPath(joinPath(".", v["local"]))
            dst = absPath(joinPath(localResource, v["name"]))
        safeCopy(src, dst)

    return localResource


def loadRemoteResource(rootPath, cache):

    svnResource = absPath(joinPath(rootPath, "svnRes"))

    if os.path.exists(svnResource) and not cache:
        deleteDir(svnResource)

    if not os.path.exists(svnResource):
        os.makedirs(svnResource)
        print "%s create ok" % svnResource

    for v in g_AllResourcePath:
        if v["type"] == 1:
            dst = absPath(joinPath(svnResource, v["name"]))
            svnCheckout(v["name"], dst, v["remote"].encode("utf-8"))
        elif v["type"] == 2:
            src = absPath(joinPath(".", v["remote"]))
            dst = absPath(joinPath(svnResource, v["name"]))
            safeCopy(src, dst)

    return svnResource


def copyResToTemp(resDir, tmpDir):
    for v in g_AllResourcePath:
        src = absPath(joinPath(resDir, v["name"]))
        dst = absPath(joinPath(tmpDir, quote(v["out"])))
        safeCopy(src, dst, ignore=shutil.ignore_patterns('.svn'))


def initConfig():
    configPath = absPath(joinPath(absPath('.'), "config.ini"))
    if not os.path.exists(configPath):
        print "config.ini is not exist."
        return

    cf = ConfigParser.ConfigParser()
    cf.read(configPath)

    if not cf.has_section("svn"):
        print '[config.ini] "svn" is not exist.'
    elif not cf.has_option("svn", "url"):
        print '[config.ini] "svn" "url" is not exist.'
    else:
        global g_SvnRoot
        g_SvnRoot = cf.get("svn", "url")

    if not cf.has_section("project"):
        print '[config.ini] "project" is not exist.'
    elif not cf.has_option("project", "name"):
        print '[config.ini] "project" is invalid.'
    else:
        global g_ProjectName
        g_ProjectName = cf.get("project", "name")

        global g_ProjectPath
        if cf.has_option("project", "path"):
            g_ProjectPath = cf.get("project", "path")
        else:
            g_ProjectPath = absPath(joinPath(absPath('.'), "..", "..", ".."))

        global g_ProjectWorkPath
        if cf.has_option("project", "work_path"):
            g_ProjectWorkPath = cf.get("project", "work_path")
        else:
            g_ProjectWorkPath = absPath(joinPath(tempfile.gettempdir(), g_ProjectName))

class DefaultOption(dict):

    def __init__(self, config, section, **kv):
        self._config = config
        self._section = section
        dict.__init__(self, **kv)

    def items(self):
        _items = []
        for option in self:
            if not self._config.has_option(self._section, option):
                _items.append((option, self[option]))
            else:
                value_in_config = self._config.get(self._section, option)
                _items.append((option, value_in_config))
        return _items

def initResourceConfig():
    configPath = absPath(joinPath(absPath('.'), "resource.ini"))
    if not os.path.exists(configPath):
        print "resource.ini is not exist."
        return
    cf = ConfigParser.ConfigParser()

    cf.readfp(codecs.open(configPath, "r", "utf-8"))

    global g_AllResourcePath
    for section in cf.sections():
        name = cf.get(section, "name", vars=DefaultOption(cf, section, name=None))
        local = cf.get(section, "local", vars=DefaultOption(cf, section, local=None))
        remote = cf.get(section, "remote", vars=DefaultOption(cf, section, remote=None))
        out = cf.get(section, "out", vars=DefaultOption(cf, section, out=None))
        order = cf.get(section, "order", vars=DefaultOption(cf, section, order=None))
        resType = cf.get(section, "type", vars=DefaultOption(cf, section, type=None))

        if name == None or local == None or remote == None or out == None or order == None or resType == None:
            continue
        g_AllResourcePath.append({"name": name, "local": local, "remote": remote, "out": out, "order": order, "type": int(resType)})

    
    def takeOrder(elem):
        return elem["order"]
    g_AllResourcePath.sort(key=takeOrder, reverse=True)


def main(env="remote", cache="nocache"):
    initConfig()

    if g_ProjectName == None or g_SvnRoot == None:
        print "config is error."
        return

    initResourceConfig()

    if not os.path.exists(g_ProjectWorkPath):
        os.makedirs(g_ProjectWorkPath)
        print "%s create ok" % g_ProjectWorkPath

    resDir = ""
    if env == "local":
        resDir = loadLocalResource(g_ProjectWorkPath)
    else:
        resDir = loadRemoteResource(g_ProjectWorkPath, cache == "cache")

    # res
    print "cleanup ./res dir"
    res = absPath(joinPath(absPath('.'), "res"))
    if os.path.exists(res):
        deleteDir(res)

    for v in g_AllResourcePath:
        src = absPath(joinPath(resDir, v["name"]))
        dst = absPath(joinPath(absPath('.'), quote(v["out"])))
        safeCopy(src, dst, ignore=shutil.ignore_patterns('.svn'))

    if cache != "cache":
        print "cleanup origin resource"
        deleteDir(g_ProjectWorkPath)


if __name__ == "__main__":
    if len(sys.argv) == 2:
        main(sys.argv[1])
    elif len(sys.argv) == 3:
        main(sys.argv[1], str.lower(sys.argv[2]))
    else:
        main()
