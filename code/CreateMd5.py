#!/usr/bin/python
# -*- coding: UTF-8 -*-
import os
import json
import hashlib
import subprocess
import sys, getopt

import zipfile
import re



assetsDir = {
    "searchDir" : ["src", "res"],
    "ignorDir" : ["cocos", "obj","version"]
}

versionConfigFile = "version_info.json"  #版本信息的配置文件路径

versionManifestPath = "res/version/version.manifest"    #由此脚本生成的version.manifest文件路径

projectManifestPath = "res/version/project.manifest"    #由此脚本生成的project.manifest文件路径

vsesionSaveManifestPath = "version/version.manifest"
projectSaveManifestPath = "version/project.manifest"


dataDic = {}

# JR=兼容包  RG=热更包  DB=强更 
commandLine = "JR"

class SearchFile:
    def __init__(self):
        self.fileList = []


        for k in assetsDir:
            if (k == "searchDir"):
                for searchdire in assetsDir[k]:                 
                    self.recursiveDir(searchdire)

    def recursiveDir(self, srcPath):
        ''' 递归指定目录下的所有文件'''
        dirList = []    #所有文件夹  

        files = os.listdir(srcPath) #返回指定目录下的所有文件，及目录（不含子目录）

        for f in files:         
            #目录的处理
            if (os.path.isdir(srcPath + '/' + f)):              
                if (f[0] == '.' or (f in assetsDir["ignorDir"])):
                    #排除隐藏文件夹和忽略的目录
                    pass
                else:
                    #添加非需要的文件夹                                  
                    dirList.append(f)

            #文件的处理
            elif (os.path.isfile(srcPath + '/' + f)):               
                self.fileList.append(srcPath + '/' + f) #添加文件

        #遍历所有子目录,并递归
        for dire in dirList:        
            #递归目录下的文件
            self.recursiveDir(srcPath + '/' + dire)

    def getAllFile(self):
        ''' get all file path'''
        return tuple(self.fileList)

def GetSvnCurrentVersion(): 
    popen = subprocess.Popen(['svn', 'info'], stdout = subprocess.PIPE)    
    while True:
        next_line = popen.stdout.readline()         
        if next_line == '' and popen.poll() != None:
            break

        valList = next_line.split(':')      
        if len(valList)<2:
            continue
        valList[0] = valList[0].strip().lstrip().rstrip(' ')
        valList[1] = valList[1].strip().lstrip().rstrip(' ')

        if(valList[0]=="Revision"):
            return valList[1]
    return ""

def get_zip(base_dir, zip_name):
    zp = zipfile.ZipFile(zip_name, 'w', zipfile.ZIP_DEFLATED)
    for dir_path, dir_name, file_names in os.walk(base_dir):  # 通过os.walk()遍历所有子目录
        for file_name in file_names:
            zp.write(os.path.join(dir_path, file_name))
    zp.close()


def CalcMD5(filepath):
    """generate a md5 code by a file path"""
    with open(filepath,'rb') as f:
        md5obj = hashlib.md5()
        md5obj.update(f.read())
        return md5obj.hexdigest()

def main(arg):
    global commandLine
    commandLine= arg

def getVersionInfo():
    '''get version config data'''
    configFile = open(versionConfigFile,"r")
    json_data = json.load(configFile)
    configFile.close()
    # beforeverstrs = json_data["beforeVersion"].split(".")
    # json_data["version"] =  beforeverstrs[0]+"."+beforeverstrs[1]+"."+beforeverstrs[2] + '.' + json_data["smallVersion"]
    return json_data

def GenerateversionManifestPath():
    ''' 生成大版本的version.manifest'''
    global versionManifestPath
    global vsesionSaveManifestPath
    json_data = getVersionInfo()

    beforeverstrs = json_data["beforeVersion"].split(".")
    newversion=  beforeverstrs[0]+"."+beforeverstrs[1]+"."+beforeverstrs[2] + '.' + str(int(json_data["smallVersion"])+1)  #获取当前存储之前版本+1
    verstrs = json_data["version"].split(".")
    if commandLine=="RG":

        versionManifestPath="newVersionSourse\\"+newversion+"\\version.manifest"
        if not os.path.exists(versionManifestPath) :
            os.mkdir("newVersionSourse\\"+newversion)
        json_data["version"] = newversion
        json_data["beforeVersion"] = newversion
        json_data["smallVersion"] = str(int(json_data["smallVersion"])+1)
    elif commandLine=="JR" :
        #my_file = Path("./res/version")
        versionManifestPath = "newVersionSourse\\" + verstrs[0] + "." + verstrs[1] + "." + str(int(verstrs[2]) + 1)+"." + str(int(json_data["smallVersion"])+1) + "\\version.manifest"
        if not os.path.exists(versionManifestPath):
            os.mkdir("newVersionSourse\\" + verstrs[0] + "." + verstrs[1] + "." + str(int(verstrs[2]) + 1)+"." + str(int(json_data["smallVersion"])+1))
        if not os.path.exists("./res/version"):
            os.mkdir("./res/version", 0777)
        if not os.path.exists("./version"):
            os.mkdir("./version", 0777)
        json_data["version"] = verstrs[0] + "." + verstrs[1] + "." + str(int(verstrs[2]) + 1)+"." + str(int(json_data["smallVersion"])+1)  #版本+1
        json_data["beforeVersion"] = verstrs[0] + "." + verstrs[1] + "." + str(int(verstrs[2]) + 1)+"." + str(int(json_data["smallVersion"])+1)
        json_data["smallVersion"] = str(int(json_data["smallVersion"])+1)
        json_data["targetVersion"] = str(int(json_data["targetVersion"]) + 1)
        json_str = json.dumps(json_data, indent=2)
        fo = open(vsesionSaveManifestPath, "w+")
        fo.write(json_str)
        fo.close()
    elif commandLine=="DB":
        if not os.path.exists(versionManifestPath):
            os.mkdir("newVersionSourse\\" + newversion)
        if not os.path.exists("./res/version"):
            os.mkdir("./res/version", 0777)
        if not os.path.exists("./version"):
            os.mkdir("./version", 0777)
        json_data["version"] = verstrs[0] + "." + str(int(verstrs[1])+1) + ".1"
        json_data["beforeVersion"] = verstrs[0] + "." + str(int(verstrs[1])+1)  + ".1.1"
        json_data["smallVersion"] = "1"
        json_data["targetVersion"] = str(int(json_data["targetVersion"]) + 1)
        json_str = json.dumps(json_data, indent=2)
        fo = open(vsesionSaveManifestPath, "w+")
        fo.write(json_str)
        fo.close()
        # os.system("XCOPY "+vsesionSaveManifestPath+" " + versionManifestPath + "\  /Y")
    print "jjjjj" + versionManifestPath
    json_str = json.dumps(json_data, indent=2,encoding='utf-8')
    fo = open(versionManifestPath,"w+")
    fo.write(json_str)
    fo.close()

def GenerateprojectManifestPath():
    global projectManifestPath
    global projectSaveManifestPath
    searchfile = SearchFile()

    fileList = list(searchfile.getAllFile())
    project_str = {}
    project_str.update(getVersionInfo())
    global dataDic
    for f in fileList:    
        if f.count("NetBaseConfig") :
            continue
        dataDic[f] = {"md5" : CalcMD5(f)}

    project_str.update({"assets":dataDic})

    #project_str=unicode( project_str, errors='ignore')

    beforeverstrs = project_str["beforeVersion"].split(".")
    newversion = beforeverstrs[0] + "." + beforeverstrs[1] + "." + beforeverstrs[2] + '.' + str(
        int(project_str["smallVersion"]) + 1)  # 获取当前存储之前版本+1
    verstrs = project_str["version"].split(".")
    if commandLine=="RG":
        #os.mkdir("newVersionSourse\\" + project_str["version"])
        projectManifestPath = "newVersionSourse\\" + newversion + "\\project.manifest"
        # if not os.path.exists(projectManifestPath) :
        #     os.mkdir("newVersionSourse\\"+newversion)
        project_str["version"] = newversion
        project_str["beforeVersion"] = newversion
        project_str["smallVersion"] = int(project_str["smallVersion"]) + 1


    elif commandLine=="JR":

        # if not os.path.exists(projectManifestPath):
        #     os.mkdir("newVersionSourse\\" + newversion)
        f = open(projectSaveManifestPath, "r")
        proj_data = json.load(f)
        f.close()
        proj_data["version"] = verstrs[0] + "." + verstrs[1] + "." + str(int(verstrs[2]) + 1)+"." + str(int(project_str["smallVersion"]) + 1)  # 版本+1
        proj_data["beforeVersion"] = verstrs[0] + "." + verstrs[1] + "." + str(int(verstrs[2]) + 1)+"." + str(int(project_str["smallVersion"]) + 1)
        proj_data["smallVersion"] = str(int(project_str["smallVersion"]) + 1)
        proj_data["targetVersion"] = str(int(proj_data["targetVersion"]) + 1)
        json_str = json.dumps(proj_data, sort_keys=True, indent=2)
        fo = open(projectSaveManifestPath, "w+")
        fo.write(json_str)
        fo.close()
        #json_str = json.dumps(project_str, sort_keys=True, indent=2, encoding='utf-8')
        fo = open(projectManifestPath, "w+")
        fo.write(json_str)
        fo.close()
        project_str["version"] = proj_data["version"]
        project_str["beforeVersion"] = proj_data["beforeVersion"]
        project_str["smallVersion"] = str(int(project_str["smallVersion"]) + 1)
        projectManifestPath = "newVersionSourse\\" + proj_data["beforeVersion"] + "\\project.manifest"
    elif commandLine=="DB":
        project_str["version"] = verstrs[0] + "." + str(int(verstrs[1])+1) + ".1.1"
        project_str["beforeVersion"] = verstrs[0] + "." + str(int(verstrs[1])+1)  + ".1.1"
        project_str["smallVersion"] = "1"
        project_str["targetVersion"] = str(int(project_str["targetVersion"]) + 1)
        json_str = json.dumps(project_str, sort_keys=True, indent=2)
        fo = open(projectSaveManifestPath, "w+")
        fo.write(json_str)
        fo.close()
        # os.system("XCOPY version\\version.manifest" + "version\version.manifest" + "\  /Y")
    #print "写入文件" + versionManifestPath
    json_str = json.dumps(project_str, sort_keys=True, indent=2,encoding='utf-8')
    fo = open(projectManifestPath,"w+")
    fo.write(json_str)  
    fo.close()

def setNewVersion(arg):
    if commandLine == "RG" or commandLine == "JR" :
        return
    fo = open(versionConfigFile, "r")
    json_data = json.load(fo)
    fo.close()
    fo = open(versionConfigFile, "w")

    json_data["version"] = str(arg)
    json_data["smallVersion"] = "1"
    json_str = json.dumps(json_data, indent=2)
    fo.write(json_str)
    fo.close()

def HandleEnedVersion():

    json_data = getVersionInfo()
    # my_ftp = FTP.MyFTP("10.32.100.19")
    # my_ftp.login("vstar", "=T5un~PBX_}~X(g^")

    beforeverstrs = json_data["beforeVersion"].split(".")
    newversion = beforeverstrs[0] + "." + beforeverstrs[1] + "." + beforeverstrs[2] + '.' + str(
        int(json_data["smallVersion"]) + 1)  # 获取当前存储之前版本+1
    verstrs = json_data["version"].split(".")
    rescouseName = ""
    if commandLine == "JR":
        json_data["version"]=verstrs[0]+"."+verstrs[1]+"."+str(int(verstrs[2])+1)+"." + str(int(json_data["smallVersion"]) + 1)
        json_data["beforeVersion"] = verstrs[0] + "." + verstrs[1] + "." + str(int(
            verstrs[2])+1)+"." + str(int(json_data["smallVersion"]) + 1)
        json_data["smallVersion"] = str(int(json_data["smallVersion"]) + 1)
        json_data["targetVersion"] = str(int(json_data["targetVersion"]) + 1)
        rescouseName = json_data["beforeVersion"]

    if commandLine == "RG":
        beforeverstrs = json_data["beforeVersion"].split(".")
        json_data["beforeVersion"] = beforeverstrs[0]+"."+beforeverstrs[1]+"."+beforeverstrs[2] + '.' + str(int(json_data["smallVersion"]) + 1)
        json_data["version"] = json_data["beforeVersion"]
        json_data["smallVersion"] = str(int(json_data["smallVersion"]) + 1)
        rescouseName = beforeverstrs[0]+"."+beforeverstrs[1]+"."+beforeverstrs[2] + '.' + json_data["smallVersion"]
    if commandLine=="DB":
        rescouseName=verstrs[0] + "." + str(int(verstrs[1])+1)  + ".1.1"
        json_data["version"] = verstrs[0] + "." + str(int(verstrs[1])+1)+".1.1"
        json_data["beforeVersion"] = verstrs[0] + "." + str(int(verstrs[1])+1)+".1.1"
        json_data["smallVersion"] = "1"
        json_data["targetVersion"] = str(int(json_data["targetVersion"]) + 1)

    if commandLine=="DB":
        dbwersion = verstrs[0] + "." + str(int(verstrs[1])+1)  + ".1.1"
        os.system("XCOPY res\\version\\version.manifest "+" newVersionSourse\\"+dbwersion+"\  /Y")
        os.system("XCOPY res\\version\\project.manifest newVersionSourse\\"+dbwersion+"\  /Y")
    #if commandLine == "RG":
    if commandLine!="DB":
        global dataDic
        configFile = open("res\\version\\project.manifest", "r")
        proj_data = json.load(configFile)
        configFile.close()
        sccesstList = proj_data["assets"]
        for f in dataDic:
            if f.count("NetBaseConfig") :
                continue
            if sccesstList.has_key(f) :
                olditem = sccesstList[f]
                if dataDic[f]["md5"]==olditem["md5"]:
                    continue
            path = f.replace("/","\\")
            os.system("echo F|XCOPY "+path+" newVersionSourse\\" + rescouseName +"\\assets\\"+path + "  /D /Y")



    json_str = json.dumps(json_data, indent=2)
    fo = open(versionConfigFile, "w")
    fo.write(json_str)
    fo.close()
    os.chdir("newVersionSourse")
    #versionWrite(json_data["version"], json_data["smallVersion"])

    # os.system("cd \\newVersionSourse")
    get_zip(rescouseName,rescouseName+".zip")
    os.chdir("..")
    if commandLine == "JR" or commandLine=="DB":
        newverstrs = json_data["version"].split(".")
        versionWrite(newverstrs[0] + "." + newverstrs[1] + "." + newverstrs[2],json_data["targetVersion"])
    print "newVersionSourse\\"+rescouseName+"\\version.manifest"
    if commandLine == "DB":
        os.system("XCOPY newVersionSourse\\"+rescouseName+"\\version.manifest" + " version\\version.manifest  /D /Y")
        os.system("XCOPY newVersionSourse\\"+rescouseName+"\\project.manifest" + " version\\project.manifest  /D /Y")
        os.chdir("version")
        os.system("svn ci -m \"上传兼容包版本文件 \" *" )
        os.chdir("..")
    os.system("cd ..")
    # my_ftp.upload_file_tree( "./newVersionSourse/" + json_data["version"], "/home/vstar/asset")
    # my_ftp.upload_file("./newVersionSourse/"+json_data["version"]+"/project.manifest","/home/vstar/asset/project.manifest")
    # my_ftp.upload_file("./newVersionSourse/" + json_data["version"] + "/version.manifest", "/home/vstar/asset/version.manifest")
    # my_ftp.close()

def versionWrite(version,smallVersion):
    #处理安卓版本问题
    androdBuld = open("frameworks/runtime-src/proj.android/app/build.gradle", "r")
    androidbuildText = androdBuld.read().decode("utf-8")
    androdBuld.close()
    androidbuildText = re.sub("//smallversion start\n        (.*?)\n\t\t//smallversion end","//smallversion start\n        versionCode "+smallVersion+"\n\t\t//smallversion end", androidbuildText,re.DOTALL)
    androidbuildText = re.sub("//version start\n        (.*?)\n\t\t//version end",
                              "//version start\n        versionName \"" + version + "\"\n\t\t//version end",
                              androidbuildText, re.DOTALL)
    androdBuld = open("./frameworks/runtime-src/proj.android/app/build.gradle", "w")
    androidbuildText = androidbuildText.encode("utf-8")
    androdBuld.write(androidbuildText)
    androdBuld.close()


    #处理ios
    iosbuild = open("frameworks/runtime-src/proj.ios_mac/ios/Info.plist", "r")
    iosbuildText =iosbuild.read().decode("utf-8")
    iosbuild.close()
    resultstr = re.findall("<!--version start-->\n\t<string>(.*?)</string>\n    <!--version end-->",iosbuildText,re.DOTALL)
    print(resultstr)
    iosbuildText= re.sub("<!--smallversion start-->\n\t<string>(.*?)</string>\n    <!--smallversion end-->","<!--smallversion start-->\n\t<string>"+smallVersion+"</string>\n    <!--smallversion end-->", iosbuildText,re.DOTALL)
    iosbuildText = re.sub("<!--version start-->\n\t<string>(.*?)</string>\n    <!--version end-->","<!--version start-->\n\t<string>" + version + "</string>\n    <!--version end-->",iosbuildText, re.DOTALL)
    iosbuild = open("frameworks/runtime-src/proj.ios_mac/ios/Info.plist", "w")
    iosbuildText = iosbuildText.encode("utf-8")
    iosbuild.write(iosbuildText)
    iosbuild.close()

if __name__ == "__main__":
    main(sys.argv[1])
    #print("help"+str(len(sys.argv)))
    if len(sys.argv)>2:
        setNewVersion(sys.argv[2])
    GenerateversionManifestPath()
    GenerateprojectManifestPath()
    HandleEnedVersion()

