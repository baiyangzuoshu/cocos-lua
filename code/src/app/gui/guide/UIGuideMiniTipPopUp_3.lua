local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIGuideMiniTipPopUp_3", UIPanel)

M.GUI_FILE_NAME = "csd.01_16_NoviceGuide.01_16_GuideMiniTipPopUp_3.lua"

M.BINDGUIDATANODE = {
    ["ConfirmButton"]={varname="ConfirmButton",onClick="onClickEvent"}
}

function M:onClickEvent()
    self:closePanel()
    local panel=UIManager:getPanel("UIGameGuideLayer")
    if panel then
        panel:closePanel(0)
    end

    g_HotData:searchGuideAward()
end

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true,125)
end

function M:onInit()
    M.super.onInit(self)
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
end

function M:onCleanup()
    M.super.onCleanup(self)
end

return M