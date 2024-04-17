-- @Deprecated
--------------------------------------------------------------------------------
--  FILE:  DownloaderManager.lua
--  说明
--      下载管理器 
--------------------------------------------------------------------------------
--
local DownloaderManager = {}

local HttpClient = require("app.net.HttpClient")

local mFileMap = {}
local mFileList = {}


local OFFSET_TIME = 3
local MAX_RELOAD = 3

local TASK_MAX = 1

local mTaskCount = 0

local function getKeyByFilename(filename)
    -- TODO 
    return filename
end


local function getFirstFile()
    local key = mFileList[1]

    table.remove(mFileList, 1)
    return key
end

local function isValidParams(filename, filepath, url)
    if Utils.isEmptyStr(filename) then
        Log.warn("isValidParams, The filename is empty.")
        return false
    end

    if Utils.isEmptyStr(filepath) then
        Log.warn("isValidParams, Filename:%s, the filepath is empty.", filename)
        return false
    end

    if Utils.isEmptyStr(url) then
        Log.warn("isValidParams, Filename:%s, the url is empty.", filename)
        return false
    end

    return true
end


local function mkPath(filename)
    local len = string.len(filename)

    local str = string.reverse(filename)

    local _, i = string.find(str, "/")

    local i = len - i + 1

    local path = string.sub(filename, 1, i)

    cc.FileUtils:getInstance():createDirectory(path)
end


local function tryToSaveFile(data, filepath)
    mkPath(filepath)

    if io.writefile(filepath, data, "w+b") then
        return true
    end

    return false
end

local function onDownloadCompleted(filename, filepath, url, state)
    Log.log("onDownloadCompleted, Filename:%s download completed, url:%s.", filename, url)
    DataManager:dispatchMessage(Constant.CustomEvent.FileDownloadCompleted, { filename = filename, filepath = filepath, url = url })
end

local function onDownloadFileResponse(response, fileInfo)
    local state = false

    if response then
        local data = ""
        for i, v in ipairs(response) do
            data = data ..  string.char(v)
        end
        state = tryToSaveFile(data, fileInfo:getFilePath())
    end

    local filename = fileInfo:getFilename()
    local url = fileInfo:getUrl()


    local completed = true
    if not state then
        fileInfo:downloadFail()

        if fileInfo:getTryTimes() < MAX_RELOAD then
            mFileList[#mFileList + 1] = fileInfo:getFileKey()
            completed = false
        end
    end

    local filepath = fileInfo:getFilePath()
    if completed then
        mFileMap[fileInfo:getFileKey()] = nil
        onDownloadCompleted(filename, filepath, url, state)
    end

    mTaskCount = mTaskCount - 1
    DownloaderManager:processDownloadFile()
end

local function requestFile(fileInfo)
    fileInfo:startDownload()
    mTaskCount = mTaskCount + 1

    local function callback(response)
        onDownloadFileResponse(response, fileInfo)
    end

    HttpClient:sendHttpAvatarRequest(fileInfo:getUrl(), callback)
end

local FileInfo = class("FileInfo")

function FileInfo:ctor(filename, filepath, url, key)
    self.mFilename = filename
    self.mFilePath = filepath
    self.mUrl = url
    self.mKey = key

    self.mTime = os.time()
    self.mState = false
    self.mTryTimes = 0

    Log.log("FileInfo:ctor, Filename:%s Filepath:%s Url:%s key:%s", filename, filepath, url, key)
end

function FileInfo:getFilename()
    return self.mFilename
end

function FileInfo:getFileKey()
    return self.mKey
end

function FileInfo:getFilePath()
    return self.mFilePath
end

function FileInfo:updateTime()
    self.mTryTimes = 0
    self.mTime = os.time()
end

function FileInfo:getTime()
    return self.mTime
end

function FileInfo:getUrl()
    return self.mUrl
end

function FileInfo:startDownload()
    Log.log("FileInfo:startDownload, Filename:%s  start download.", self:getFilename())
    self.mState = true
    self.mTryTimes = self.mTryTimes + 1
end

function FileInfo:downloadFail()
    Log.log("FileInfo:downloadFail, Filename:%s  download fail.", self:getFilename())
    self.mState = false
end

function FileInfo:isDownloading()
    return self.mState
end

function FileInfo:getTryTimes()
    return self.mTryTimes
end

function DownloaderManager:startDownload(filename, filepath, url, force)
    if not isValidParams(filename, filepath, url) then
        return
    end

    if not force and cc.FileUtils:getInstance():isFileExist(filepath) then
        onDownloadCompleted(filename, filepath, url, true)
        return
    end

    local key = getKeyByFilename(filename)
    if mFileMap[key] then
        mFileMap[key]:updateTime()
        return
    end

    mFileMap[key] = FileInfo.new(filename, filepath, url, key)
    mFileList[#mFileList + 1] = key

    self:processDownloadFile()

end

function DownloaderManager:processDownloadFile()
    if mTaskCount >= TASK_MAX then
        -- Log.log("DownloaderManager:processDownloadFile, The download task full.")
        return
    end

    if #mFileList <= 0 then
        -- Log.log("DownloaderManager:processDownloadFile, The download list empty.")
        return
    end

    requestFile(mFileMap[getFirstFile()])
end

return DownloaderManager