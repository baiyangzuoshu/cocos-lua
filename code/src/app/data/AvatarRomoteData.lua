local M = class("AvatarRomoteData")

function M:ctor()
    self.mAllDownloadTaskEvent={}

    self.mDownloadIndex = 10000
    self.mDownloadUtil = nil
end

function M:getDownloadIndex()
    self.mDownloadIndex=self.mDownloadIndex+1
    return self.mDownloadIndex
end

function M:downloadIcon(userId,url,callback)
    if not url then return end
    if not callback then return end

    local name = "DOWNLOAD_ICON"..self:getDownloadIndex()

    self.mAllDownloadTaskEvent[name] = callback
    if not self.mDownloadUtil then
        self.mDownloadUtil = cc.Downloader.new()
        local SeccesCallBack = function (task)
            Log.info("下载成功")
            self:downloadCallbackHandle(task)
        end
        self.mDownloadUtil:setOnFileTaskSuccess(SeccesCallBack)
        local onTaskError=function (task,errorCode,errorCodeInternal,errorStr)
            print("下载失败",task,errorCode,errorCodeInternal,errorStr)
            self:downloadCalllbackFailHandle(task)
        end

        self.mDownloadUtil:setOnTaskError(onTaskError)
    end
    

    if cc.FileUtils:getInstance():isFileExist(DeviceUtils.getAvatarWritablePath(userId)) then
        cc.FileUtils:getInstance():removeFile(DeviceUtils.getAvatarWritablePath(userId))
    end

    self.mDownloadUtil:createDownloadFileTask(url, DeviceUtils.getAvatarWritablePath(userId),name)
    return name
    
end

function  M:downloadCallbackHandle(task)
    local filepath = task.storagePath
    local url = task.requestURL
    local evenName = task.identifier
    
    g_UserHeadIconData:addHeadData(url,filepath)
    local acts = {}
    acts[#acts + 1] = cc.DelayTime:create(0.1)
    acts[#acts + 1] = cc.CallFunc:create(function ()
        if self.mAllDownloadTaskEvent[evenName] then
            local loadType = ccui.TextureResType.localType
            self.mAllDownloadTaskEvent[evenName](true,filepath,loadType)
        end
    end)

    display.getRunningScene():runAction(cc.Sequence:create(acts))
end

function M:downloadCalllbackFailHandle(task)
    local filepath = task.storagePath
    local url = task.requestURL
    local evenName = task.identifier
    
    local acts = {}
    acts[#acts + 1] = cc.DelayTime:create(0.1)
    acts[#acts + 1] = cc.CallFunc:create(function ()
        if self.mAllDownloadTaskEvent[evenName] then
            local loadType = ccui.TextureResType.localType
            self.mAllDownloadTaskEvent[evenName](false,filepath,loadType)
        end
    end)

    display.getRunningScene():runAction(cc.Sequence:create(acts))
end

function M:unRegisterMessage(name)
    if self.mAllDownloadTaskEvent[name] then
        self.mAllDownloadTaskEvent[name] = nil
    end
end

return M