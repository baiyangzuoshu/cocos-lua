local AvatarWidget = require("app.gui.widget.AvatarWidget")

local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIChooseOpenSeatLayer", UIPanel)

M.GUI_FILE_NAME = "csd.4_playing.4_01_open.4_01_2_OpenInquiryLayer.lua"

M.BINDGUIDATANODE = {
    ["OpenButtonText"] = { varname = "CountDownText" },

    ["OpenText_1"] = { varname = "DuelInfoText" },

    ["OpenButton"] = { onClick = "onOpenButtonClick" },
    ["CloseButton"] = { onClick = "onGiveUpButtonClick" },
}

function M:onCreate()
    M.super.onCreate(self)
    -- self:setShadeShowModel(true)
end

function M:onEnter()
    M.super.onEnter(self)

    local openInfo = g_GameData:getOpenDiceBoxInfo()

    local players = g_GameData:getGamePlayers()

    local openName = ""
    if not players[openInfo.openSeatId]:isEmptySeat() then
        local userInfo = players[openInfo.openSeatId]:getUserInfo()
        openName = userInfo:getNickName()
    end

    local callName = ""
    if not players[openInfo.callSeatId]:isEmptySeat() then
        local userInfo = players[openInfo.callSeatId]:getUserInfo()
        callName = userInfo:getNickName()
    end
    self.DuelInfoText:setString(string.format("%s開%s了，", openName, callName))
end

function M:onOpenButtonClick(sender)
    g_GameData:C2S_ExtraCompareChoose(false)
end

function M:onGiveUpButtonClick(sender)
    self:closePanel()
end

function M:onGameExtraCompareChoose(data)
    if g_GameData:isMineSeatId(data.bettor) then
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