local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("GuideNumberLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_16_NoviceGuide.01_16_GuideNumberLayer.lua"

M.BINDGUIDATANODE = {
    ["NumberPanel"]={varname="NumberPanel"},
    ["NumberBottom"]={varname="NumberBottom"},
    ["NumberCheckBox"]={varname="NumberCheckBox"},
    ["NumberText_1"]={varname="NumberText"},
}

function M:onCreate()
    M.super.onCreate(self)

    self.NumberPanel:setTouchEnabled(false)
    self.NumberBottom:setTouchEnabled(true)
    self.NumberBottom:setSwallowTouches(false)
    self.NumberCheckBox:setVisible(false)
end

function M:setNum(num)
    self.mNumber = num
    self.NumberText:setString(tostring(self.mNumber))
end

function M:setSelected(is)
    self.NumberCheckBox:setVisible(is)
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