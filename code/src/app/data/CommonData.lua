--
--------------------------------------------------------------------------------
--  FILE:  CommonData.lua
--  说明
--      公共网络消息
--------------------------------------------------------------------------------
--
local UserInfo = require("app.bean.UserInfo")

local M = class("CommonData")

function M:ctor()
    self.mMsgList = {}

    self.mIsAuto = false
    self.mAutoIndex = 1
end

function M:getMsgList()
    return self.mMsgList
end

function M:getFirstMsg(languageType)
    if languageType == Enum.LanguageType.zh_cn then 
        return self.mMsgList[1].zh,self.mMsgList[1]
    elseif languageType == Enum.LanguageType.zh_tw then 
        return self.mMsgList[1].tw,self.mMsgList[1]
    elseif languageType == Enum.LanguageType.en then 
        return self.mMsgList[1].en,self.mMsgList[1]
    end
end

function M:removeMsg()
    if not Utils.isEmptyTable(self.mMsgList) then
        table.remove(self.mMsgList,1)
    end
end

function M:getAutoPopUp()
    return self.mIsAuto
end

function M:setAutoPopUp(isAuto)
    self.mIsAuto = isAuto
end

function M:C2S_GetUserInfo(uid)
    if not uid then
        uid = self:getUserId()
    end

    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_GetUserInfo, { uid = uid })
end

function M:S2C_RefrshUserInfo(data)
    local info = data.userInfo
    local userInfo = UserInfo.new(info.uid)
    userInfo:initData(info.nickname, info.sex, info.headUrl, info.gold, info.diamond)

    local gameStatistics = data.gameStatistics

    DataManager:dispatchMessage(Constant.CustomEvent.RefrshUserInfo, { userInfo = userInfo, gameStatistics = gameStatistics })
end

function M:S2C_NewItem(data)

    local items = data.items
    if not Utils.isEmptyTable(items) then 
        local panel = UIManager:getOrCreatePanel("UIGetMulResLayer")
        if panel then
            panel:refreshData(items)
            panel:showToScene()
        end 
    end
end

function M:S2C_ErrorMessage(data)
    -- TODO
    if not data.code then return end

    UIUtils.popToadtByMessageId(data.code)
end

function M:S2C_PopMessage(data)
    if not data.code then return end

    local code = data.code

    if code == Enum.PopMessage.DiamodNotEnough then 
        local panel = UIManager:getOrCreatePanel("UIClientErrorTipsLayer_2")
        if panel then 
            local TipTitleText = Utils.getTextByTextId(Enum.Text.DiamondTitleText)
            local ConfirmText = Utils.getTextByTextId(Enum.Text.DiamondButtonText)
            local ContentText = Utils.getTextByTextId(Enum.Text.DiamondContentText)
            local CancelText = Utils.getTextByTextId(Enum.Text.BlackCancle)
            panel:setText(TipTitleText, ContentText, ConfirmText,CancelText)
            panel:showToScene()
            panel:setConfirmCb(
                function ()
                    local panel=UIManager:getPanel("UIMainLayer")
                    if panel then
                        panel:requestShopDiamond()
                        return
                    end

                    panel=UIManager:getPanel("UIGameLayer")
                    if panel then
                        panel:requestShopDiamond()
                        return
                    end
                end
            )
        end
    elseif code == Enum.PopMessage.DiffLogin then 
        g_LoginData:closeBKick()
        Client:kickTagIng()
        local panel = UIManager:getOrCreatePanel("UIClientErrorTipsLayer_1")
        if panel then 
            local SystemMessage = DataManager:getTbxData("SystemMessage",Enum.PopMessage.DiffLogin)
            local TipTitleText = Utils.getTextByTextId(Enum.Text.DiamondTitleText)
            local ConfirmText = Utils.getTextByTextId(Enum.Text.DiamondButtonText)
            local ContentText = Utils.getTextByTextId(Enum.Text.DiffLogin)
            panel:setText(TipTitleText, ContentText, ConfirmText)
            panel:showToScene()
            panel:setConfirmCb(function()
                kz.IAgoraRoomManager:instance():leaveRoom()
                DataManager:dispatchNetMessage("S2C_Disconnect")
            end)
        end
    elseif code==Enum.PopMessage.Error then
        local panel = UIManager:getOrCreatePanel("UIClientErrorTipsLayer_1")
        if panel then 
            local SystemMessage = DataManager:getTbxData("SystemMessage",Enum.PopMessage.Error)
            local TipTitleText = Utils.getTextByTextId(Enum.Text.DiamondTitleText)
            local ConfirmText = Utils.getTextByTextId(Enum.Text.DiamondButtonText)
            local ContentText = Utils.getTextByTextId(Enum.Text.DiamondContentText)
            panel:setText(TipTitleText, SystemMessage.Msg, ConfirmText)
            panel:showToScene()
        end
    else 
        Log.log("defaultPopResponse code %s is not defined", code)
    end
end

function M:S2C_NewMsgArrive(msg)
    if not msg then return end

    local function getFormatString(data, params, zh, en, tw, isNeedTransform, ValueType)
        isNeedTransform = isNeedTransform or false
        if not Utils.isEmptyTable(params) then
            local len = table.getn(params)
            local str = ""
            for i = 1,len do 
                if i == len then 
                    if ValueType and ValueType[i] and tonumber(ValueType[i]) == Enum.ParmType.number then
                        str = str.. Utils.getFormatNumber_MuitiLanguage(params[i])
                    else
                        str = str..params[i]
                    end
                else
                    if ValueType and ValueType[i] and tonumber(ValueType[i]) == Enum.ParmType.number then
                        str = str.. Utils.getFormatNumber_MuitiLanguage(params[i]) ..";"
                    else
                        str = str..params[i]..";"
                    end
                end
                
            end
            local formatString_zh = Utils.getFormatString(tostring(zh), str)
            local formatString_tw = Utils.getFormatString(tostring(tw), str)
            local formatString_en = Utils.getFormatString(tostring(en), str)
            if isNeedTransform then 
                --策划导出的表需要特殊处理
                formatString_zh = string.gsub(formatString_zh,'\\"','"')
                formatString_tw = string.gsub(formatString_tw,'\\"','"')
                formatString_en = string.gsub(formatString_en,'\\"','"')
            end
            data.zh = formatString_zh
            data.tw = formatString_tw
            data.en = formatString_en
        else
            if isNeedTransform then 
                --策划导出的表需要特殊处理
                zh = string.gsub(zh,'\\"','"')
                tw = string.gsub(tw,'\\"','"')
                en = string.gsub(en,'\\"','"')
            end
            data.zh = zh
            data.tw = tw
            data.en = en
        end
    end

    local broadcastType = msg.templateId or Enum.BroadcastType.Custom
    if broadcastType == Enum.BroadcastType.Custom then 
        local data = {}
        data.sortIndex = 1
        self.mAutoIndex = self.mAutoIndex + 1
        data.autoIndex = self.mAutoIndex
        data.broadcastType = broadcastType
        getFormatString(data, msg.param, msg.zh, msg.en, msg.tw, true)

        table.insert(self.mMsgList, data)
    else
        local BulletinContentData_CN = DataManager:getTbxData("BulletinContent_CN", broadcastType)
        local BulletinContentData_EN = DataManager:getTbxData("BulletinContent_EN", broadcastType)
        local BulletinContentData_TW = DataManager:getTbxData("BulletinContent_TW", broadcastType)
        if BulletinContentData_CN and BulletinContentData_EN and BulletinContentData_TW then 
            local content_CN = BulletinContentData_CN.BulletinContent
            local content_EN = BulletinContentData_EN.BulletinContent
            local content_TW = BulletinContentData_TW.BulletinContent
            local ValueType = string.split(BulletinContentData_CN.BulletinContentValueArray,",")
            local data = {}
            data.sortIndex = 2
            self.mAutoIndex = self.mAutoIndex + 1
            data.autoIndex = self.mAutoIndex
            data.broadcastType = broadcastType
            data.data=msg
            data.templateId=msg.templateId
            getFormatString(data, msg.param, content_CN, content_EN, content_TW, true, ValueType)

            table.insert(self.mMsgList, data)

            table.sort(self.mMsgList, handler(self, self.sortAllMsg))
        else
            Log.log("broadcastType %s is not defined", tostring(broadcastType))
            return
        end
    end
end

function M:sortAllMsg(a, b)
    if a.sortIndex == b.sortIndex then 
        return a.autoIndex < b.autoIndex
    else 
        return a.sortIndex > b.sortIndex
    end
end

return M