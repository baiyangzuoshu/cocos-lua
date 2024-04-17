local M = {}


function M:ctor()
    self.mResouseVersion = ""
    self.mHodDowonUrl=""
    self.updateFailTimes = 0
    self.mIsUpdate = false
end

function M:getInitData(version,requestType)
    local data ={}
    self.mIsUpdate  = false
    data.version = version
    data.env= requestType
    data.system=2
    
    if DeviceUtils.isIOS() then
        data.system=1       
        Client:sendHttpGetHodRequest(Net.HttpCmd.HodeRequest, data, handler(self, self.onRequestHodLeveCallback))
    elseif DeviceUtils.isAndroid() then
        data.system=2
        Client:sendHttpGetHodRequest(Net.HttpCmd.HodeRequest, data, handler(self, self.onRequestHodLeveCallback))
    else
        -- self:deleadDownlodeDirectory()
        -- Client:sendHttpGetHodRequest(Net.HttpCmd.HodeRequest, data, handler(self, self.onRequestHodLeveCallback))
        g_GameSettingData:panamathInit()
        self:gameStart()
    end
end

function M:getIsUpdate()
    return self.mIsUpdate
end

function M:chackVersion(url,version)
    local storagePath = cc.FileUtils:getInstance():getWritablePath() .. "download/" 

    self.assetsManagerEx = cc.AssetsManagerEx:create("version/project.manifest",storagePath)
    self.assetsManagerEx:setMaxConcurrentTask(64)
    self.assetsManagerEx:retain()
    local eventListenerAssetsManagerEx = cc.EventListenerAssetsManagerEx:create(self.assetsManagerEx,
       function (event)
           self:handleAssetsManagerEvent(event)
       end)
    self.eventListenerAssetsManagerEx=eventListenerAssetsManagerEx

    local dispatcher = cc.Director:getInstance():getEventDispatcher()
    dispatcher:addEventListenerWithFixedPriority(eventListenerAssetsManagerEx, 1)
    local localManifest = self.assetsManagerEx:getLocalManifest()
    Log.info("version:"..localManifest:getVersion())
    local localversion = localManifest:getVersion()
    local remoteVersionstr = string.split(version, ".")
    local localVersiondtr = string.split(localversion, ".")
    Log.info("远程版本号%s", version)
    if table.getn(remoteVersionstr) ==4 and table.getn(localVersiondtr) == 4 then
        if tonumber(remoteVersionstr[1])>tonumber(localVersiondtr[1]) or tonumber(remoteVersionstr[2])>tonumber(localVersiondtr[2]) then
            --需要强制更新新包
            local panel = UIManager:getOrCreatePanel("UILoadingTipPopUp_2")
            if panel then 
                panel:showToScene()
            end
            return
        else
            if tonumber(remoteVersionstr[1])==tonumber(localVersiondtr[1]) and tonumber(remoteVersionstr[2])==tonumber(localVersiondtr[2]) then
                if tonumber(remoteVersionstr[3])>tonumber(localVersiondtr[3]) or tonumber(remoteVersionstr[4])>tonumber(localVersiondtr[4]) then
                    --Log.info("走了热更新了 ")
                    localManifest:setManifestFileUrl(url.."/"..version.."/project.manifest")
                    localManifest:setVersionFileUrl(url.."/"..version.."/version.manifest")
                    localManifest:setPackageUrl(url..version.."/assets/")
                    self.assetsManagerEx:checkUpdate()
                    return
                end
            end
        end
    else

    end
    
    self:gameStart()
end

function M:gameInit()
    require("app.util.Constant")
    require("app.util.UIUtils")
    require("app.GameEnum")
end

function M:gameStart()
    SoundSystemManager:stopBackMusic()
    self:cleanHotUpdateEvent()
    if tonumber(Net.NetworkEnvironment) ~= tonumber(Enum.requestServerHodType.outLine) then
        Log.info("------------------------------------转成非线上环境")
        kz.IAgoraRoomManager:instance():initVideo("2acbf2a03b594419ae04848c2bd1264d")--测试
    else
        kz.IAgoraRoomManager:instance():initVideo("a40a77269a004206a3ec8f47dbb1eb3e")--线上
    end
    self:gameInit()
    SceneManager:runScene(require("app.scenes.LoginScene").create())
end

function M:reloadFile()
    --加载初始化最初定义文件
    GlobleReloadLua("app.Enum")
    DataManager:reloadTbxAllData()
    GlobleReloadLua("app.config.UIManagerConfig")
    GlobleReloadLua("app.util.DeviceUtils")
    GlobleReloadLua("app.util.Utils")

    cc.exports.UIManager=GlobleReloadLua("app.manager.UIManager")
    cc.exports.SoundSystemManager=GlobleReloadLua("app.manager.SoundSystemManager")
    
    cc.exports.DataManager = GlobleReloadLua("app.data.DataManager")
    cc.exports.ConfigManager = GlobleReloadLua("app.config.ConfigManager")
    cc.exports.NativeBridgeManager = GlobleReloadLua("app.manager.NativeBridgeManager")
    GlobleReloadLua("app.data.GlobleCallBack")

    --加载 config
    ConfigManager:reloadAllConfig()
    --加载 数据
    DataManager:reloadAllData()
    
    GlobleReloadLua("app.config.NetCodeConfig")
    GlobleReloadLua("app.config.NetDataConfig")
end

function M:onRequestHodLeveCallback(root)
    
    if root == nil then
        --链接服务器失败
        self:reCheckUpdate()
    else
        Net.LoginSeverIp = root.data.loginUrl
        self.mResouseVersion = root.data.maxVersion
        self.mHodDowonUrl = root.data.downloadUrl

        Net.WebNetHttp=root.data.userAgreementUrl
        Net.NetworkEnvironment = root.data.currentEnv
        Net.versionNotice = root.data.bulletin or {}
        
        g_GameSettingData:setResourceVersion(self.mResouseVersion)
        --Log.print_table(root.data,2)
        g_GameSettingData:panamathInit()

        local  jsonData={}
        jsonData["eventName"] = "EVENT_REQUEST_VERSION_INFO"
        g_UserData:onTFEventCode(jsonData)

        DataManager:dispatchMessage("UIUpdateLayer_UpdateVerisonShow",{resourceVersion=self.mResouseVersion})
        HodUpdateManager:chackVersion(self.mHodDowonUrl,self.mResouseVersion)
        

        local  jsonData={}
        jsonData["eventName"] = "EVENT_GET_VERSION_INFO"
        if DeviceUtils.isIOS() then
            g_UserData:onTFEventCode(jsonData)
        elseif DeviceUtils.isAndroid() then
            g_UserData:onTFEventCode(jsonData)

        end
    end
    
end


function M:handleAssetsManagerEvent(event)
    local eventCodeList = cc.EventAssetsManagerEx.EventCode
 
    local eventCodeHand = {
 
        [eventCodeList.ERROR_NO_LOCAL_MANIFEST] = function (_event)
            --Log.info("发生错误:本地资源清单文件未找到")
            --self:downloadManifestError()
            DataManager:dispatchMessage("UIUpdateLayer_UpdateFail")
        end,
 
        [eventCodeList.ERROR_DOWNLOAD_MANIFEST] = function (_event)
           -- Log.info("发生错误:远程资源清单文件下载失败")  --资源服务器没有打开，
            self:downloadManifestError()
            DataManager:dispatchMessage("UIUpdateLayer_UpdateFail")
        end,
 
        [eventCodeList.ERROR_PARSE_MANIFEST] = function (_event)
            --Log.info("发生错误:资源清单文件解析失败")
            --self:downloadManifestError()
            DataManager:dispatchMessage("UIUpdateLayer_UpdateFail")
        end,
 
        [eventCodeList.NEW_VERSION_FOUND] = function (_event)
            --Log.info("发现找到新版本")
            local  jsonData={}
            jsonData["eventName"] = "EVENT_HOT_UPDATE_RESOURCE_DOWNLOAD"
            if DeviceUtils.isIOS() then
                g_UserData:onTFEventCode(jsonData)
            elseif DeviceUtils.isAndroid() then
                g_UserData:onTFEventCode(jsonData)
            end
            local serverversion = self.assetsManagerEx:getRemoteManifest():getVersion()  
            local localversion = self.assetsManagerEx:getLocalManifest():getVersion()
            local servervstrs = string.split(serverversion, ".")
            local localvstrs = string.split(localversion, ".")
            --Log.info("serverversion:"..serverversion.." localversion:"..localversion)
            if #servervstrs==4 and #localvstrs == 4 then
               -- Log.info("111111111111111111111111111111111111")
                if tonumber(servervstrs[1])>tonumber(localvstrs[1]) or tonumber(servervstrs[2])>tonumber(localvstrs[2]) then
                    --需要强制更新新包
                    local panel = UIManager:getOrCreatePanel("UILoadingTipPopUp_2")
                    if panel then 
                        panel:showToScene()
                    end
                else
                    --if tonumber(servervstrs[4])>tonumber(localvstrs[4]) then
                        local remoteManifest = self.assetsManagerEx:getRemoteManifest()
                        remoteManifest:setManifestFileUrl(self.mHodDowonUrl.."/"..self.mResouseVersion.."/project.manifest")
                        remoteManifest:setVersionFileUrl(self.mHodDowonUrl.."/"..self.mResouseVersion.."/version.manifest")
                        remoteManifest:setPackageUrl(self.mHodDowonUrl.."/"..self.mResouseVersion.."/assets/")
                        self.assetsManagerEx:update()

                        --Log.info("开始更新")
                    --else
                     --   DataManager:dispatchMessage("UIUpdateLayer_UpdateSessess")
                    --end
                    
                end
            end

            Log.info(serverversion)  
            Log.info(localversion)  
        end,
 
        [eventCodeList.ALREADY_UP_TO_DATE] = function (_event)
            --Log.info("版本相同不需要更新")  
            local serverversion = self.assetsManagerEx:getRemoteManifest():getVersion()  
            local localversion = self.assetsManagerEx:getLocalManifest():getVersion()
            Log.info(serverversion)  
            Log.info(localversion)     
            self:updateFinished()
        end,
 
        [eventCodeList.UPDATE_PROGRESSION]= function (_event)
            --Log.info("更新过程的进度事件")
            --self.progress:setPercentage(event:getPercentByFile())
            --Log.info("更新进度：".._event:getPercentByFile())
            local data ={}
            data.percent = _event:getPercentByFile()
            DataManager:dispatchMessage("UIUpdateLayer_UpdatePrass",data)
        end,
 
        [eventCodeList.ASSET_UPDATED] = function (_event)
            --Log.info("单个资源被更新事件")
        end,
 
        [eventCodeList.ERROR_UPDATING] = function (_event)
            --Log.info("发生错误:更新过程中遇到错误")
            --self:reCheckUpdate()
            self:updateFail()
            DataManager:dispatchMessage("UIUpdateLayer_UpdateFail")
        end,
 
        [eventCodeList.UPDATE_FINISHED] = function (_event)
            Log.info("更新成功事件")
            g_CommonData:setAutoPopUp(true)
            self:updateFinished()
            self.mIsUpdate  = true

        end,
 
        [eventCodeList.UPDATE_FAILED] = function (_event)
            --Log.info("更新失败事件")
            self:updateFail()
            DataManager:dispatchMessage("UIUpdateLayer_UpdateFail")
        end,
 
        [eventCodeList.ERROR_DECOMPRESS] = function (_event)
            --Log.info("解压缩失败")
            self:updateFail()
            DataManager:dispatchMessage("UIUpdateLayer_UpdateFail")
        end
    }
    local eventCode = event:getEventCode()
    if eventCodeHand[eventCode] ~= nil then
        eventCodeHand[eventCode](event)
    end
end
 
function M:updateFinished()
    local  jsonData={}
    jsonData["eventName"] = "EVENT_HOT_UPDATE_COMPLETE"
    if DeviceUtils.isIOS() then
        g_UserData:onTFEventCode(jsonData)
    elseif DeviceUtils.isAndroid() then
        g_UserData:onTFEventCode(jsonData)
    end
    self:reloadFile()

    DataManager:dispatchMessage("UIUpdateLayer_UpdateSessess")
    local  jsonData={}
    jsonData["eventName"] = "EVENT_LOAD_RESOURCE_COMPLETE"
    if DeviceUtils.isIOS() then
        g_UserData:onTFEventCode(jsonData)
    elseif DeviceUtils.isAndroid() then
        g_UserData:onTFEventCode(jsonData)
    end

    require("app.MyApp"):reStartScene()
end

function M:updateFail()
    if UIManager:isPanelOpenOrOpening("UILoadingTipPopUp_4") then
        return
    end
    
    if self.updateFailTimes == nil then
        self.updateFailTimes = 0
    end
    
    self.updateFailTimes = self.updateFailTimes + 1
    if self.updateFailTimes > 3 then
        Utils.exitGame()
    end

    local panel = UIManager:getOrCreatePanel("UILoadingTipPopUp_4")
    if panel then
        panel:showToScene()
        panel:setIsSuccess(false)
        panel:setConfirmCb(
            function()
                self:deleadDownlodeDirectory()
            end
        )
    end
end

function M:deleadDownlodeDirectory()
    local storagePath = cc.FileUtils:getInstance():getWritablePath() .. "download/"
    cc.FileUtils:getInstance():removeDirectory(storagePath)
    local temppath = cc.FileUtils:getInstance():getWritablePath() .. "download_temp/"
    cc.FileUtils:getInstance():removeDirectory(temppath)
    if cc.FileUtils:getInstance():isFileExist(cc.FileUtils:getInstance():getWritablePath().."cookieFile.txt") then
        cc.FileUtils:getInstance():removeFile(cc.FileUtils:getInstance():getWritablePath().."cookieFile.txt")
    end
end

function M:downloadManifestError()
    self:updateFail()
end

function M:reCheckUpdate()
    if UIManager:isPanelOpenOrOpening("UILoadingTipPopUp_3") then
        return
    end

    local panel = UIManager:getOrCreatePanel("UILoadingTipPopUp_3")
    if panel then 
        panel:showToScene()
        panel:setConfirmCb(
            function()
                self:deleadDownlodeDirectory()
                if DeviceUtils.isWindows() then
                    HodUpdateManager:getInitData("1.4.2",Enum.requestServerHodType.InternalTest)
                else
                    HodUpdateManager:getInitData(g_GameSettingData:getVersion(),Net.requestServerHodType)
                end
            end
        )
    end
end

function M:cleanHotUpdateEvent()
    if  self.assetsManagerEx then
        local dispatcher = cc.Director:getInstance():getEventDispatcher()
        dispatcher:removeEventListener(self.eventListenerAssetsManagerEx)
        self.assetsManagerEx:release()
        self.assetsManagerEx=nil
    end
end

return M