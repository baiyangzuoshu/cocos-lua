local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIGuideMiniTipPopUp_2", UIPanel)

M.GUI_FILE_NAME = "csd.01_16_NoviceGuide.01_16_GuideMiniTipPopUp_2.lua"

M.BINDGUIDATANODE = {
    ["PopupNode_1"]={varname="PopupNode_1"},
    ["PopupNode_2"]={varname="PopupNode_2"},
    ["PopupText_1_TT"]={varname="PopupText_1_TT"}
}

function M:onCloseEvent()
    if 1==self.mType then
        DataManager:dispatchMessage(Constant.CustomEvent.UIGameGuideLayer_handlerGuide)
    end
    
    self:closePanel(0)
end

function M:refreshData(type)
    self.mType=type
    self.PopupNode_1:setVisible(1==type)
    self.PopupNode_2:setVisible(2==type)
    if 1==self.mType then
        self:setShadeShowModel(true,1)
    end
end

function M:onCreate()
    M.super.onCreate(self)
    local str=self.PopupText_1_TT:getString()
    
    str=string.gsub(str,'\\n','\n')
    self.PopupText_1_TT:setString(str)
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