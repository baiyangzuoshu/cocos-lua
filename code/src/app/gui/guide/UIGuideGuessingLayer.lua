local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIGuideGuessingLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_16_NoviceGuide.01_16_GuideGuessingLayer.lua"

M.BINDGUIDATANODE = {
    
}

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