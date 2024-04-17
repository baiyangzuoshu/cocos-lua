local AvatarWidget = require("app.gui.widget.AvatarWidget")

local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIChooseCallSeatLayer", UIPanel)

M.GUI_FILE_NAME = "csd.4_playing.4_01_open.4_01_1_TheOpenInquiryLayer.lua"

M.BINDGUIDATANODE = {
    ["TheOpenButtonText"] = { varname = "CountDownText" },

    ["RightQuantityText"] = { varname = "CallNumText" },
    ["RightSifterIcon"] = { varname = "CallDiceIcon" },

    ["TheOpenButton"] = { onClick = "onDoubleButtonClick" },
    ["CloseButton"] = { onClick = "onGiveUpButtonClick" },

    ["HeadPortraitNode_1"] = { varname = "CallSeatAvatarNode" },
    ["HeadPortraitPanel_1"] = { varname = "CallSeatAvatarPanel", onTouch = "onAvatarPanelTouchEvent" },

    ["HeadPortraitNode_2"] = { varname = "OpenSeatAvatarNode" },
    ["HeadPortraitPanel_2"] = { varname = "OpenSeatAvatarPanel", onTouch = "onAvatarPanelTouchEvent" },
}

function M:onCreate()
    M.super.onCreate(self)

    self:addPlistResourceMap(Utils.generateIconPlistData("0020"))
    self:addPlistResourceMap(Utils.generateIconPlistData("0070"))

    -- self:setShadeShowModel(true)
    self.mOpenSeatAvatar = self:createAvatar(self.OpenSeatAvatarNode)
    self.mCallSeatAvatar = self:createAvatar(self.CallSeatAvatarNode)
end

function M:createAvatar(avatarNode)
    local avatar = AvatarWidget.new()
    avatar:setStyle(AvatarWidget.Style.Gameother)
    avatarNode:addChild(avatar)
    return avatar
end

function M:onEnter()
    M.super.onEnter(self)

    local openInfo = g_GameData:getOpenDiceBoxInfo()

    local players = g_GameData:getGamePlayers()
    self:setUserInfo(self.mOpenSeatAvatar, self.OpenSeatAvatarPanel, players[openInfo.openSeatId])
    self:setUserInfo(self.mCallSeatAvatar, self.CallSeatAvatarPanel, players[openInfo.callSeatId])

    local callInfo = g_GameData:getCallInfo()
    self:setCallNumAndPoint(callInfo.num, callInfo.point)
end

function M:setUserInfo(avatarNode, avatarPanel, player)
    if player:isEmptySeat() then
        avatarNode:setUserIdAndUrl("", "")
        avatarPanel.mUserId = ""
        return
    end

    local userInfo = player:getUserInfo()
    avatarNode:setUserIdAndUrl(userInfo:getUserId(), userInfo:getAvatarUrl())

    avatarPanel.mUserId = userInfo:getUserId()
end

function M:setCallNumAndPoint(num, point)
    self.CallNumText:setString(tostring(num))

    local iconPath = string.format("Icon/0070/%04d.png", point)
    if cc.SpriteFrameCache:getInstance():getSpriteFrame(iconPath) then
        self.CallDiceIcon:loadTexture(iconPath, ccui.TextureResType.plistType)
    end
end

function M:onAvatarPanelTouchEvent(sender, eventType)

    if eventType == ccui.TouchEventType.ended then
        if Utils.isEmptyStr(sender.mUserId) then
            return
        end

        local panel = UIManager:getOrCreatePanel("UIMineUserInfoLayer")
        if panel then
            panel:setUserId(sender.mUserId)
            panel:showToScene()
        end
    end
end

function M:onDoubleButtonClick(sender)
    g_GameData:C2S_CallSeatChoose(true)
end

function M:onGiveUpButtonClick(sender)
    g_GameData:C2S_CallSeatChoose(false)
end

function M:onGameOver(data)
    self:closePanel()
end

function M:onGameCallSeatChoose(data)
    self:closePanel()
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.GameCallSeatChoose, "onGameCallSeatChoose")
    self:doRegEvent(Constant.CustomEvent.GameOver, "onGameOver")
end

return M