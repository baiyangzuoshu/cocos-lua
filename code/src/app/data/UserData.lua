--
--------------------------------------------------------------------------------
--  FILE:  UserData.lua
--  说明
--      游戏数据管理
--------------------------------------------------------------------------------
--
local UserInfo = require("app.bean.UserInfo")

local Payment = require("app.native.Payment")

local M = class("UserData")

function M:ctor()
    self.mServerTimestamp = 0
    self.mClientTimestamp = 0
    self.mAvatarFrameData = {}
    self.mPlayerOnlineData={}
    self.mUserInfo = UserInfo.new("")
    
    local currentLanguageCode = cc.Application:getInstance():getCurrentLanguageCode()
    local language=Enum.LanguageType.zh_tw
    if currentLanguageCode == "en" then
        language=Enum.LanguageType.en
    elseif currentLanguageCode=="zh" then
        --language=Enum.LanguageType.zh_cn
    end
    
    self:setSystemLanguage(Preference:getString("MultiLanguage", language))
end

function M:initData(data)
    if data then
        self.mServerTimestamp = data.unixTime
        self.mClientTimestamp = socket.gettime() * 1000

        local userInfo = data.userInfo

        self.mUserInfo = UserInfo.new(userInfo.uid)
        self.mUserInfo:initData(userInfo)

        local guideInfos=data.guideInfos or {}
        g_HotData:initGuideData(guideInfos)
    else
        self.mServerTimestamp = 0
        self.mClientTimestamp = 0

        self.mUserInfo = UserInfo.new("")
    end
    self:savePlayerInfoToPanamath()
    self:AFSetCustomerUserID()
end

function M:getPlayerOnlineDataByUid(uid)
    for i=1,#self.mPlayerOnlineData,1 do
        if uid==self.mPlayerOnlineData[i].uid then
            return self.mPlayerOnlineData[i]
        end
    end

    return nil
end

function M:getAllPlayerOnlineData()
    for i=1,#self.mPlayerOnlineData,1 do
        self.mPlayerOnlineData[i]["day"]=Utils.getDayByCreateTime(self.mPlayerOnlineData[i]["createTime"])
        
    end

    return self.mPlayerOnlineData
end

function M:getAllPlayerOnlineDataByTag(tag,is,sort)
    local data={}
    if 1==sort or 2==sort or 3==sort then--繁体 简体 en
        local v=3
        if 1==sort then
            v=2
        elseif 2==sort then
            v=1
        end

        for i=1,#self.mPlayerOnlineData,1 do
            if v==self.mPlayerOnlineData[i].language and not self.mPlayerOnlineData[i].isBot then
                table.insert(data,self.mPlayerOnlineData[i])
            end
        end
    elseif 5==sort or 6==sort or 7==sort then--1男 2女 3未设置
        local v=3
        if 5==sort then
            v=1
        elseif 6==sort then
            v=2
        end

        for i=1,#self.mPlayerOnlineData,1 do
            if v==self.mPlayerOnlineData[i].sex and not self.mPlayerOnlineData[i].isBot then
                table.insert(data,self.mPlayerOnlineData[i])
            end
        end
    else
        for i=1,#self.mPlayerOnlineData,1 do
            if not self.mPlayerOnlineData[i].isBot then
                table.insert(data,self.mPlayerOnlineData[i])
            end
        end
    end
    --tag 1收藏 2性别 3注册天数 4充值金额 5语言 6当前客服数量 7当前玩家 8有无跳转
    if Enum.ServicePlayerSort.GenderButton==tag then
        Utils.bubbleSort(data,function(a,b)
            if a.sex<b.sex then
                return true
            elseif a.sex==b.sex and a.day<b.day then
                return true
            elseif a.sex==b.sex and a.day==b.day and a.playerStatus<b.playerStatus then
                return true
            end

            return false
        end)
    elseif Enum.ServicePlayerSort.RegisterButton==tag then
        Utils.bubbleSort(data,function(a,b)
            if is then
                if a.day<b.day then
                    return true
                end
            else
                if a.day>b.day then
                    return true
                end
            end

            if a.day==b.day and a.playerStatus<b.playerStatus then
                return true
            end

            return  false
        end)
    elseif Enum.ServicePlayerSort.RechargeButton==tag then
        Utils.bubbleSort(data,function(a,b)
            if is then
                if a.vipExp<b.vipExp then
                    return true
                end
            else
                if a.vipExp>b.vipExp then
                    return true
                end
            end
            
            if a.vipExp==b.vipExp and a.day<b.day then
                return true
            elseif a.vipExp==b.vipExp and a.day==b.day and a.playerStatus<b.playerStatus then
                return true
            end
            
            return  false
        end)
    elseif Enum.ServicePlayerSort.LanguageButton==tag then
        Utils.bubbleSort(data,function(a,b)
            if a.language>b.language then
                return true
            elseif a.language==b.language and a.day<b.day then
                return true
            elseif a.language==b.language and a.day==b.day and a.playerStatus<b.playerStatus then
                return true
            end

            return false
        end)
    elseif Enum.ServicePlayerSort.RoomServiceButton==tag then
        Utils.bubbleSort(data,function(a,b)
            if is then
                if #a.currentPlaymateIds>#b.currentPlaymateIds then
                    return true
                end
            else
                if #a.currentPlaymateIds<#b.currentPlaymateIds then
                    return true
                end
            end

            if #a.currentPlaymateIds==#b.currentPlaymateIds and a.day<b.day then
                return true
            elseif #a.currentPlaymateIds==#b.currentPlaymateIds and a.day==b.day and a.playerStatus<b.playerStatus then
                return true
            end
            
            return  false
        end)
    elseif Enum.ServicePlayerSort.RoomPlayerButton==tag then
        Utils.bubbleSort(data,function(a,b)
            if is then
                if #a.currentPlaymateIds>#b.currentPlaymateIds then
                    return true
                end
            else
                if #a.currentPlaymateIds<#b.currentPlaymateIds then
                    return true
                end
            end

            if #a.currentPlaymateIds==#b.currentPlaymateIds and a.day<b.day then
                return true
            elseif #a.currentPlaymateIds==#b.currentPlaymateIds and a.day==b.day and a.playerStatus<b.playerStatus then
                return true
            end
            
            return  false
        end)
    elseif Enum.ServicePlayerSort.StateButton==tag then
        Utils.bubbleSort(data,function(a,b)
            if a.playerStatus<b.playerStatus then
                return true
            elseif a.playerStatus==b.playerStatus and a.day<b.day then
                return true
            end

            return false
        end)
    end

    return data
end

function M:getSystemLanguage()
    return self.mMySetLanguage
end

function M:setSystemLanguage(language)
    if language then
        self.mMySetLanguage = language
    end
end

function M:saveDataToLocal()
    Preference:setString(Constant.PreferenceKey.MultiLanguage, self.mMySetLanguage)
end

function M:getAvatarDataByTab(tab)
    return self.mAvatarFrameData[tab] or {}
end

function M:getUserInfo()
    return self.mUserInfo
end

function M:getUserId()
    return self.mUserInfo:getUserId()
end

function M:isSelfUserId(uid)
    return self.mUserInfo:isSelfUserId(uid)
end

function M:getHead()
    return self.mUserInfo:getHead()
end
function M:getHeadIcon(Callback)
    self.mUserInfo:getHeadIcon(Callback)
end

function M:getHeadBox()
    return self.mUserInfo:getHeadBox()
end

function M:setHeadBox(avatarFrame)
    self.mUserInfo:setHeadBox(avatarFrame)
end

function M:getMyDiceBox()
    return self.mUserInfo:getMyDiceBox()
end

function M:setMyDiceBox(diceBox)
    self.mUserInfo:setMyDiceBox(diceBox)
end

function M:getMyFansNum()
    return self.mUserInfo:getMyFansNum()
end

function M:getNickName()
    return self.mUserInfo:getNickName()
end

function M:getSex()
    return self.mUserInfo:getSex()
end

function M:getSlogan()
    return self.mUserInfo:getSlogan()
end

function M:getVipLevel()
    return self.mUserInfo:getVipLevel()
end

function M:setVipLevel(vipLevel)
    self.mUserInfo:setVipLevel(vipLevel)
end

function M:getVipExp()
    return self.mUserInfo:getVipExp()
end

function M:setVipExp(exp)
    self.mUserInfo:setVipExp(exp)
end

function M:getCanReveiveVipReward()
    return self.mUserInfo:getCanReveiveVipReward()
end

function M:getIsChangeNickName()
    return self.mUserInfo:getIsChangeNickName()
end

function M:getIsChangeSex()
    return self.mUserInfo:getIsChangeSex()
end

function M:getIsSystemHead()
    return self.mUserInfo:getIsSystemHead()
end

function M:getAvatarUrl()
    return self.mUserInfo:getAvatarUrl()
end

function M:setGold(gold)
    self.mUserInfo:setGold(gold)
end

function M:getGold()
    return self.mUserInfo:getGold()
end

function M:setDiamond(diamond)
    self.mUserInfo:setDiamond(diamond)
end

function M:getDiamond()
    return self.mUserInfo:getDiamond()
end

function M:upDateServerTimesTamp(time)
    if time then
        self.mServerTimestamp = time
        self.mClientTimestamp = socket.gettime() * 1000
    end
end

function M:calcServerTimestamp()
    if not self.mServerTimestamp then self.mServerTimestamp = 0 end
    return self.mServerTimestamp + (socket.gettime() * 1000 - self.mClientTimestamp)
end

function M:gotRegisterRewardTime()
    return self.mUserInfo:gotRegisterRewardTime()
end

function M:getChargeNoviceProductTime()
    return self.mUserInfo:getChargeNoviceProductTime()
end

function M:setChargeNoviceProductTime(chargeNoviceProductTime)
    self.mUserInfo:setChargeNoviceProductTime(chargeNoviceProductTime)
end

function M:getDailyReliefCount()
    return self.mUserInfo:getDailyReliefCount()
end

function M:setGuideTime(guideStep)
    self.mUserInfo:setGuideTime(guideStep)
end

function M:getGuideTime()
    return self.mUserInfo:getGuideTime()
end

function M:isShowMainHot()
    local is=false
    if g_HotData:hasHot(Enum.redPointSubcategory.avatarEditButton) 
        or g_HotData:hasHot(Enum.redPointSubcategory.nicknameEditButton) 
            or g_HotData:hasHot(Enum.redPointSubcategory.sexEditButton) 
                or g_HotData:hasHot(Enum.redPointSubcategory.avatarList) then
        is=true
    end

    DataManager:dispatchMessage(Constant.CustomEvent.UpdateHotShow,{type=Enum.mainHotType.userInfo,is=is})
end

function M:getServiceTag()
    return self.mUserInfo:getServiceTag()
end
-- ========== 网络相关 ========== --
function M:requestSvnMuitiLanguageToServer(languageType)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_MultiLanguage, {lang = languageType})
end

--个人中心修改信息
function M:requestModifyUserInfo(data)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_UpdateUserInfo, data)
end

function M:requestReceiveVipReward()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_GetVipReward)
end

function M:requestUseDiceBox(itemId)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_UseDiceBox, { itemId = itemId } )
end
--
function M:requestRecharge(payInfo)
    if DeviceUtils.isIOS() then
        local data = {}
        -- 用户数据
        data.user_id = g_UserData:getUserId()

        --支付订单数据
        data.receipt = payInfo.receipt
        data.quantity = payInfo.quantity
        data.productIdentifier = payInfo.productIdentifier
        data.transactionIdentifier = payInfo.transactionIdentifier
        data.date = payInfo.date

        Client:sendHttpPostRequest(Net.HttpCmd.ReCharge, data, handler(self, function(this, response)
            -- Log.info("response:"..response.code)
            if not response then return end
            response = cjson.decode(response)
            Log.info("response:"..response.code)
            Log.print_table(response)
            if tonumber(response.code)==0 or tonumber(response.code)==31001 then 
                Payment.finishIap(data)
                local _isSandBox = false
                if  response.data.isSandBox == true then
                    _isSandBox = response.data.isSandBox
                end
                local Diamonds = DataManager:getTbxData("Recharge")
                local DiamondGods=nil
                for k,v in pairs(Diamonds) do
                    if data.productIdentifier == v.ProductId then
                        DiamondGods = v
                    end
                end
                if DiamondGods and not (_isSandBox) then 
                    Log.info("开始发送支付 事件")
                    --DataManager:dispatchMessage(Constant.CustomEvent.RefreshChargeData, {id = DiamondGods.ProductId, isPurchased = isFirstRecharge})
                    g_UserData:AFTrackEvent(Constant.AFEventPurchase, { { key = Constant.AFEventParamRevenue, value = DiamondGods.CentPrice/ 100, type = "float" }, { key = Constant.AFEventParamCurrency, value = "USD", type = "string" } })
                end
            end
            
        end))
    elseif DeviceUtils.isAndroid() then
        local data = {}
        data.user_id = g_UserData:getUserId()


        data.purchaseToken = payInfo.purchaseToken
        
        data.orderId = payInfo.orderId
        data.productId = payInfo.productId
        data.packageName = payInfo.packageName
        --data.isSandBox = payInfo.isSandBox
        --Payment.finishIap(data)
        Client:sendHttpPostRequest(Net.HttpCmd.ReChargeGoogle, data, handler(self, function(this, response)
            if not response then return end
            response = cjson.decode(response)
            Log.info("response:"..response.code)
            Log.print_table(response)
            if tonumber(response.code)==0 or tonumber(response.code)==31001 then 
                Payment.finishIap(data)
                local _isSandBox = false
                if  response.data.isSandbox == true then
                    _isSandBox = response.data.isSandbox
                end
                local Diamonds = DataManager:getTbxData("Recharge")
                local DiamondGods=nil
                for k,v in pairs(Diamonds) do
                    if data.productId == v.ProductId then
                        DiamondGods = v
                    end
                end
                if DiamondGods and not (_isSandBox) then 
                    Log.info("开始发送支付 事件")
                    --DataManager:dispatchMessage(Constant.CustomEvent.RefreshChargeData, {id = DiamondGods.ProductId, isPurchased = isFirstRecharge})
                    g_UserData:AFTrackEvent(Constant.AFEventPurchase, { { key = Constant.AFEventParamRevenue, value = DiamondGods.CentPrice/ 100, type = "float" }, { key = Constant.AFEventParamCurrency, value = "USD", type = "string" } })
                end
            end
            
        end))
        -- 2	1	{"purchaseToken":"bllfleoamneeelcdkkckjhjh.AO-J1OyiJF84mqrWsgImc2DTl2S0qxzypRrDKaDlkPEIhUv3x-o6dWDfVmXO-3Xi6NWfQnv48PF688jyXxjmaxEyVuJJh4uo1IDrtt0b4LRYx8k-JJc6CJs","orderId":"GPA.3383-4604-4410-43120","productId":"com.yippeekiyay.letsroll.tier_2","packageName":"com.yippeekiyay.letsroll"}
    end

end

function M:S2C_UpdateUserInfo(data)
    if (not data) or (not data.userInfo) then
        return
    end

    local userInfo = g_UserData:getUserInfo()
    userInfo:initData(data.userInfo)

    DataManager:dispatchMessage(Constant.CustomEvent.ClosePersonalInfoPanel)

    UIUtils.popToadtByMessageId(Constant.Define.ModifyUserInfoSuccess)

    DataManager:dispatchMessage(Constant.CustomEvent.UpdateUserInfo)

    if UIManager:getPanel("UIPackageLayer") then
        DataManager:dispatchMessage(Constant.CustomEvent.RefreshPackageUI)
    end
end

function M:S2C_CheckNickNameError(data)
    DataManager:dispatchMessage(Constant.CustomEvent.CheckUserNameExist)
end

function M:requestGetAvatrFrameList()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_GetAvatarList)
end

function M:S2C_GetAvatarAndFrameList(data)
    if not data then return end 

    local avatarList = data.avatarList
    if not Utils.isEmptyTable(avatarList) then 
        local avatarData = {}
        for _,v in ipairs(avatarList) do 
            table.insert(avatarData, v) 
        end
        self.mAvatarFrameData[Enum.HeadFrameTab.Head] = avatarData
    end

    local avatarFrameList = data.avatarFrameList
    if not Utils.isEmptyTable(avatarFrameList) then 
        local avatarFrameData = {}
        for _,v in ipairs(avatarFrameList) do
            local   itemId=v.itemId
            local   isNew=v.isNew
            local   item=g_PackageData:getItemById(itemId)
            if item then
                item.isNew=isNew
            end
            
            table.insert(avatarFrameData, v) 
        end
        self.mAvatarFrameData[Enum.HeadFrameTab.HeadFrame] = avatarFrameData
    end
    DataManager:dispatchMessage(Constant.CustomEvent.UIPackageItem_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.onAvatarFrameListArrive)
end

function M:S2C_UpdateNewItemTime(data)
    if not data then return end 

    -- optional int32 avatarFrame = 1; // 新头像框
    -- optional int32 bubble = 2; // 新气泡框
    -- optional int32 diceBox = 3; // 新骰钟
    if Utils.isEmptyStr(tostring(self:getUserId())) then 
        return
    end


    if data.avatarFrame then
        g_UserData:setHeadBox(data.avatarFrame)
    end

    if data.bubble then 
        --用户数据暂无
    end

    if data.diceBox then 
        g_UserData:setMyDiceBox(data.diceBox)
    end

    DataManager:dispatchMessage(Constant.CustomEvent.UpdateUserInfo)
end

function M:S2C_UpdateDicBox(data)
    if not data then return end 

    if Utils.isEmptyStr(tostring(self:getUserId())) then 
        return
    end

    if data.diceBox then 
        g_UserData:setMyDiceBox(data.diceBox)
    end
    DataManager:dispatchMessage(Constant.CustomEvent.UpdateDicBox,data)
end

function M:S2C_UpdateUserResource(data)
    if data.gold>self:getGold() and self:getGold()>0 then
        SoundSystemManager:playSound005()
    end

    self:setGold(data.gold)
    self:setDiamond(data.diamond)

    DataManager:dispatchMessage(Constant.CustomEvent.UpdateUserResource)
    DataManager:dispatchMessage(Constant.CustomEvent.UIGuessSizeLayer_updatePlayerGold)
end

function M:checkGoldNeedEvent(gold)
    gold=gold or 0
    
    if g_UserData:getGold()+gold<=GSystem.ReliefTriggerGoldNumber and  g_UserData:getDailyReliefCount()<GSystem.ReliefDailyCapNumber then
        local   panel=UIManager:getOrCreatePanel("UIReliefLayer")
        if panel then
            panel:showToScene()
        end
    end
end

function M:openInstallCallback(result)
    Log.info("安装参数回调:"..result)
    local ret=cjson.decode(result)
    if ""==ret.bindData then return end

    local bindData=cjson.decode(ret.bindData)

    local shareCode=bindData.shareCode
    Log.info("shareCode参数:"..shareCode)
    g_LoginData:setShareCode(shareCode)

    g_shareCode=shareCode--分享code
end

function M:openInstallWakeupCallback(result)
    Log.info("拉起参数回调:"..result)
    --local bindData=cjson.decode(result["bindData"])
    --local shareCode=bindData["shareCode"]
    --g_LoginData:setShareCode(shareCode)
    --Log.info("shareCode参数:"..shareCode)
end

function M:registOpeninstall()
    Openinstall:registerWakeupHandler(handler(self, self.openInstallWakeupCallback))
    
    Openinstall:getInstall(10, handler(self, self.openInstallCallback))
end

function M:AFSetCustomerUserID()
    -- if not GameControl.getIsAppsFlyerPlatform() then
    --     return
    -- end

    local userID = tostring(g_UserData:getUserId())
    

    Log.info("============================userid:"..userID)

    if DeviceUtils.isIOS() then
        local ok, ret = Launcher.callStaticMethod("AppController", "AFSetCustomerUserID", { id = userID })
    elseif DeviceUtils.isAndroid() then
        local ok, ret = Launcher.callStaticMethod(Launcher.javaClassName, "AFSetCustomerUserID", { userID }, nil)
    end
end

function M:AFTrackEvent(eventName, values)

    if DeviceUtils.isIOS() then
        local data = {}

        for i = 1, #values do
            data[values[i].key] = values[i].value
        end

        local ok, ret = Launcher.callStaticMethod("AppController", "AFTrackEvent", { eventName = eventName, values = cjson.encode(data) })
    elseif DeviceUtils.isAndroid() then
        local data = { eventName = eventName, values = values }
        local ok, ret = Launcher.callStaticMethod(Launcher.javaClassName, "AFTrackEvent", { cjson.encode(data) }, nil)
    end
end
function M:onTFEventCode(jsonData)
    if DeviceUtils.isIOS() then
        local ok, ret = Launcher.callStaticMethod("AppController", "onTFEventCode",jsonData )
    elseif DeviceUtils.isAndroid() then

        local ok, ret = Launcher.callStaticMethod(Launcher.javaClassName, "onTFEventCode", { cjson.encode(jsonData) }, nil)
    end
end

function M:savePlayerInfoToPanamath()
    local userID = tostring(g_UserData:getUserId())
    g_GameSettingData:panamathInit(userID)
    -- local jsonStr = json.encode({ mobile = "", area_code = "", app_user_id = userID, city = "", nickname = user_name, gender = gender, other_info = "", device_new = "", })
    
    -- if DeviceUtils.isIOS() then
    --     Launcher.callStaticMethod("AppController", "uploadTFUserData", { userData = jsonStr })
    -- elseif DeviceUtils.isAndroid() then
    --     Launcher.callStaticMethod(Launcher.javaClassName, "uploadTFUserData", { jsonStr })
    -- end
end

function M:uploadTFUserData()
    local userID = tostring(g_UserData:getUserId())
    local user_name = g_UserData:getNickName()
    local gender = g_UserData:getSex()
    if gender==1 then
        gender = 2
    elseif gender ==2 then
        gender = 3
    elseif gender ==3 then
        gender = 1
    end
    local jsonStr = json.encode({ mobile = "", area_code = "", app_user_id = userID, city = "", nickname = user_name, gender = gender, other_info = "", device_new = "", })
    --print("jsonStr:"..jsonStr)
    if DeviceUtils.isIOS() then
        Launcher.callStaticMethod("AppController", "uploadTFUserData", { userData = jsonStr })
    elseif DeviceUtils.isAndroid() then
        Launcher.callStaticMethod(Launcher.javaClassName, "uploadTFUserData", { jsonStr })
    end
end

function M:getPanamathDriverId()
    local driverId = ""
    if DeviceUtils.isIOS() then
        
        local ok, ret = Launcher.callStaticMethod("AppController", "getTFDeviceId")
        if ok then
            driverId=ret
        end
    elseif DeviceUtils.isAndroid() then

        local ok, ret = Launcher.callStaticMethod(Launcher.javaClassName, "getTFDeviceId", {}, "()Ljava/lang/String;")
        if ok then
            driverId=ret
        end
    end
    
    return driverId
end

-- function M:AFTrackEvent(eventName, values)
--     -- if not GameControl.getIsAppsFlyerPlatform() then
--     --     return
--     -- end

--     if DeviceUtils.isIOS() then
--         local data = {}

--         for i = 1, #values do
--             data[values[i].key] = values[i].value
--         end

--         local ok, ret = Launcher.callStaticMethod(Launcher.ocClassName, "AFTrackEvent", { eventName = eventName, values = json.encode(data) })
--     elseif DeviceUtils.isAndroid() then
--         local data = { eventName = eventName, values = values }
--         local ok, ret =Launcher.callStaticMethod("AppController", "AFTrackEvent", { json.encode(data) }, nil)
--     end
-- end

function M:S2C_gainRegisterReward(data)
    local   gotTime=data.gotTime
    self.mUserInfo:setRegisterRewardTime(gotTime)

    local   items=data.items
    if not Utils.isEmptyTable(items) then 
        local panel = UIManager:getOrCreatePanel("UIGetMulResLayer")
        if panel then
            panel:refreshData(items)
            panel:showToScene()
        end 
    end
end

function M:S2C_gainRescueGold(data)
    local   currentCount=data.currentCount
    self.mUserInfo:setDailyReliefCount(currentCount)
end

function M:joinRoom(roomId)
    if g_GameData:getmUserstatus() == Enum.Userstatus.ShaibaoGaing then
        UIUtils.popToadtByMessageId(Constant.Define.IsShaibaoGaming)
        return
    end
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_JoinRoom, {roomId=roomId})
end

function M:c2sGetPlayerIdsOnline()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sGetPlayerIdsOnline, {})
end

function M:c2sGetPlayerInfosForPlaymate(ids)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sGetPlayerInfosForPlaymate, {ids=ids})
end

function M:s2cPlayerIdsOnline(data)
    local   ids=data.ids or {}
    self.mPlayerOnlineData={}

    local arr={}
    for i=1,#ids,1 do
        if #arr>=10 then
            g_UserData:c2sGetPlayerInfosForPlaymate(arr)
            arr={}
        end

        table.insert(arr,ids[i])
    end

    if #arr>0 then
        g_UserData:c2sGetPlayerInfosForPlaymate(arr)
    end
end

function M:s2cPlayerInfoForPlaymate(data)
    local   infos=data.infos or {}
    for i=1,#infos,1 do
        if not self:getPlayerOnlineDataByUid(infos[i].uid) then
            local data={}
            data.uid=infos[i].uid
            data.language=infos[i].language --1简2繁3en
            data.isBot=infos[i].isBot--是否是机器人
            data.isPlaymate=infos[i].isPlaymate--是否是客服
            data.isOperator=infos[i].isOperator--是否是运营人员, 即外部陪玩
            data.currentPlaymateIds=infos[i].currentPlaymateIds or {}--当前客服数组
            data.playerStatus=infos[i].playerStatus--状态
            data.nickname=infos[i].nickname
            data.sex=infos[i].sex--性别 0:不显示 1:男 2：女
            data.avatar= infos[i].avatar
            data.avatarFrame=infos[i].avatarFrame
            data.vipExp=math.ceil(infos[i].vipExp/60)
            data.createTime=infos[i].createTime
            data.roomId=infos[i].roomId
            data.roomConfigId=infos[i].roomConfigId
            data.day=Utils.getDayByCreateTime(data.createTime)
            table.insert(self.mPlayerOnlineData,data)
        end
    end
    
    DataManager:dispatchMessage(Constant.CustomEvent.UIServiceLayer_s2cPlayerInfoForPlaymate)
    DataManager:dispatchMessage(Constant.CustomEvent.UIFriendItem_refreshService)
    DataManager:dispatchMessage(Constant.CustomEvent.UIDiceBoxCell_refreshService)
    DataManager:dispatchMessage(Constant.CustomEvent.UIOtherPersonInfoLayer_refreshService)
    DataManager:dispatchMessage(Constant.CustomEvent.UIMagicEmojiPopUp_refreshService)
end

return M