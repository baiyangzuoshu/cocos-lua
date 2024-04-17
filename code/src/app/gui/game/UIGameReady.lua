local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIGameReady", UIPanel)

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_MatchingLayer.lua"

M.BINDGUIDATANODE = {
    ["MatchingSpineATNode"]={varname="MatchingSpineATNode"},
    ["MatchingExitButton"]={varname="MatchingExitButton",onClick="onClickEvent"}
}

function M:onClickEvent()
    if g_GameData:isQuitMach() then
        Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_CansualMatchGame)
    else
        g_GameData:C2S_LeaveGame()
    end
    self:closePanel()
end

function M:onCreate()
    M.super.onCreate(self)

    local s = cc.size(display.width, display.height)
    local layerColor = ccui.Layout:create()
    layerColor:setContentSize(s.width, s.height)
    layerColor:setBackGroundColorType(ccui.LayoutBackGroundColorType.solid)
    layerColor:setBackGroundColor(cc.c3b(0, 0, 0))
    layerColor:setBackGroundColorOpacity(255*0.75)
    layerColor:setLocalZOrder(-1)

    self:addChild(layerColor)
end

function M:refreshEffect()
    self:setVisible(true)
    self.MatchingSpineATNode:removeAllChildren()

    local effect = Utils.onlyCreateEffect(GSystem.BragMatchingSpine ,cc.p(0,0),true)
    if effect then
        self.MatchingSpineATNode:addChild(effect)
    end
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
end



return M