local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIGuideMiniTipPopUp_1", UIPanel)

M.GUI_FILE_NAME = "csd.01_16_NoviceGuide.01_16_GuideMiniTipPopUp_1.lua"

M.BINDGUIDATANODE = {
    ["CancelButton"]={varname="CancelButton",onClick="onClickEvent"},
    ["ConfirmButton"]={varname="ConfirmButton",onClick="onClickEvent"},
    ["FinishNode"]={varname="FinishNode"},
    ["ExitNode"]={varname="ExitNode"},
}

function M:onClickEvent(ref)
    local name=ref:getName()
    if "CancelButton"==name then
        self:closePanel()
    elseif "ConfirmButton"==name then
        self:closePanel()
        g_HotData:c2sUpdateGuideGroup(g_HotData:getCurGuideGroup(),3)

        local panel=UIManager:getPanel("UIGameGuideLayer")
        if panel then
            panel:closePanel(0)
        end
    end
end

function M:refreshData(type)
    self.ExitNode:setVisible(3==type)
    self.FinishNode:setVisible(4==type)
end

function M:onCreate()
    M.super.onCreate(self)
end

function M:onInit()
    M.super.onInit(self)
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:OnUpdate(dt)
    
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
end

function M:onCleanup()
    M.super.onCleanup(self)
end

return M