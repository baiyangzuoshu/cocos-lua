local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIBoastListLayer", UIPanel)

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_BoastListCell.lua"

M.BINDGUIDATANODE = {
    ["List"] = { varname = "ListLeft" },
    ["FriendsPanel"] = { varname = "AddFriendBtn", onEvent = "onClickAddFriendBtn" },
    ["GiftPanel"] = { varname = "SendGiftBtn", onEvent = "onClickSendGiftBtn" },
    ["ExpressionPanel"] = { varname = "SendEmojiBtn", onEvent = "onClickSendEmojiBtn" },
    ["PlayerCardPanel"] = { varname = "ShowPersonInfoBtn", onEvent = "onClickShowPersonInfoBtn" },
}

function M:onCreate()
    M.super.onCreate(self)

    self:resetRootNodePosition(cc.p(0, 0))
    self:resetRootNodeAnchorPoint(cc.p(0, 0))
 
    self.mPlayerData = nil
end

function M:setPlayerData(data)
    self.mPlayerData = data
end

function M:onEnter()
    M.super.onEnter(self)

    local baseData = self.mPlayerData:getBaseData()
    if baseData then 
        if g_FriendData:CheckIsMyFriendByUid(baseData.uid) then 
            self.AddFriendBtn:setVisible(false)
        else
            self.AddFriendBtn:setVisible(true)
        end
    end 
end

function M:onClickAddFriendBtn(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        if not self.mPlayerData then return end

        local baseData = self.mPlayerData:getBaseData()

        if baseData then 
            g_FriendData:requestAddFriend(baseData.uid)
        end 
    end
end

function M:onClickSendGiftBtn(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        --UIUtils.popToast("暂未开放")
        Log.log("暂未开放,敬请期待")
    end
end

function M:onClickSendEmojiBtn(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        --UIUtils.popToast("暂未开放")
        Log.log("暂未开放,敬请期待")
    end
end

function M:RefreshDiceBoxUI()
    self:removeFromParent()
end

function M:onClickShowPersonInfoBtn(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        if not self.mPlayerData then return end

        -- local seatId = self.mPlayerData:getSeatId()
        -- if not g_GameData:isMineSeatId(seatId) then 
            local baseData = self.mPlayerData:getBaseData()
            if baseData then
                local friendInfo = require("app.bean.FriendInfo").new(baseData)
                -- local panel = UIManager:getOrCreatePanel("UIOtherPersonInfoLayer")
                -- if panel then
                --     panel:setFriendInfo(friendInfo)
                --     panel:showToScene()
                -- end
                if friendInfo:getFriendUid() == g_UserData:getUserId() then
                    local panel = UIManager:getOrCreatePanel("UIPersonalInfoLayer")
                    if panel then
                        panel:showToScene()
                    end
                else
                    local panel = UIManager:getOrCreatePanel("UIOtherPersonInfoLayer")
                    if panel then 
                        panel:setFriendInfo(friendInfo)
                        panel:showToScene()
                    end
                end
            end
        -- end 
    end
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
    self:doRegEvent(Constant.CustomEvent.RefreshDiceBoxUI, "RefreshDiceBoxUI")
end

return M