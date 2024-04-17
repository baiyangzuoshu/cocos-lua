local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("GuidePointLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_16_NoviceGuide.01_16_GuidePointLayer.lua"

M.BINDGUIDATANODE = {
    ["PointBottom"]={varname="PointBottom"},
    ["PointCheckBox"]={varname="PointCheckBox"},
    ["PointPanel"]={varname="PointPanel"}
}

function M:onCreate()
    M.super.onCreate(self)

    self.PointPanel:setTouchEnabled(false)
    self.PointBottom:setTouchEnabled(true)
    self.PointBottom:setSwallowTouches(false)
    self.PointCheckBox:setVisible(false)
end

function M:setNum(num)
    self.mNumber = num
    self.PointBottom:loadTexture("00_01_Common/2D_Dice_" .. num ..".png", ccui.TextureResType.plistType)
    self.PointBottom:setBright(false)
end

function M:setSelected(is)
    self.PointCheckBox:setVisible(is)
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