local AvatarWidget = require("app.gui.widget.AvatarWidget")

local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIExtraCompareChooseLayer", UIPanel)

M.GUI_FILE_NAME = "csd.3_combat.3_01_fight.3_01_7_GuessingLayer.lua"

M.BINDGUIDATANODE = {
    ["MultipleBg"] = { varname = "MultipleIcon" },
    ["gold"] = { varname = "BetText" },

    ["SifterNum"] = { varname = "CallNumText" },
    ["SifterIcon"] = { varname = "CallDiceIcon" },

    ["EnoughButton"] = { onClick = "onReplYseButtonClick" },
    ["InsufficientButton"] = { onClick = "onReplyNoButtonClick" },

    ["HeadPortraitNode_1"] = { varname = "OpenSeatAvatarNode" },
    ["HeadPortraitPanel_1"] = { onTouch = "onAvatarPanelTouchEvent" },

    ["HeadPortraitNode_2"] = { varname = "CallSeatAvatarNode" },
    ["HeadPortraitPanel_2"] = { onTouch = "onAvatarPanelTouchEvent" },
}

function M:onCreate()
    M.super.onCreate(self)

    self:addPlistResourceMap(Utils.generateIconPlistData("0020"))
    self:addPlistResourceMap(Utils.generateIconPlistData("0070"))

    self:setShadeShowModel(true)

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
    self:setUserInfo(self.mOpenSeatAvatar, players[openInfo.openSeatId])
    self:setUserInfo(self.mCallSeatAvatar, players[openInfo.callSeatId])

    local iconPath = string.format("Icon/0020/%04d.png", openInfo.multiple)
    if cc.SpriteFrameCache:getInstance():getSpriteFrame(iconPath) then
        self.MultipleIcon:loadTexture(iconPath, ccui.TextureResType.plistType)
        self.MultipleIcon:setVisible(true)
    else
        self.MultipleIcon:setVisible(false)
    end

    local callInfo = g_GameData:getCallInfo()
    self:setCallNumAndPoint(callInfo.num, callInfo.point)
end

function M:setUserInfo(avatarNode, player)
    if player:isEmptySeat() then
        return
    end

    local userInfo = player:getUserInfo()
    avatarNode:setUserIdAndUrl(userInfo:getUserId(), userInfo:getAvatarUrl())
end

function M:setCallNumAndPoint(num, point)
    self.CallNumText:setString(tostring(num))

    local iconPath = string.format("Icon/0070/%04d.png", point)
    if cc.SpriteFrameCache:getInstance():getSpriteFrame(iconPath) then
        self.CallDiceIcon:loadTexture(iconPath, ccui.TextureResType.plistType)
    end
end

function M:onAvatarPanelTouchEvent(sender, eventType)

end

function M:onReplYseButtonClick(sender)
    g_GameData:C2S_ExtraCompareChoose(true)
end

function M:onReplyNoButtonClick(sender)
    g_GameData:C2S_ExtraCompareChoose(false)
end

function M:onGameExtraCompareChoose(data)
    if g_GameData:isMineSeatId(data.beBetSeatId) then
        self:closePanel()
    end
end

function M:onGameOver(data)
    self:closePanel()
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.GameExtraCompareChoose, "onGameExtraCompareChoose")
    self:doRegEvent(Constant.CustomEvent.GameOver, "onGameOver")
end

return M