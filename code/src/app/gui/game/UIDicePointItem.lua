local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIDicePointItem", UIPanel)

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_PointLayer.lua"

M.BINDGUIDATANODE = {
    ["PointBottom"]={varname="PointBottom",onEvent="onEventTouch"},
    ["PointCheckBox"]={varname="PointCheckBox"},
    ["PointPanel"]={varname="PointPanel"}

}

function M:onCreate()
    M.super.onCreate(self)

    self.PointPanel:setTouchEnabled(false)
    self.PointBottom:setTouchEnabled(true)
    self.PointBottom:setSwallowTouches(false)
    self.PointCheckBox:setVisible(false)

    self.mNumber = 1
end
function M:setCallfunc(callFunc)
    if callFunc then
        self.mCallBackfunc = callFunc
    end
end
function M:setNum(num)
    self.mNumber = num
    self.PointBottom:loadTexture("00_01_Common/2D_Dice_" .. num ..".png", ccui.TextureResType.plistType)
    self.PointBottom:setBright(false)
end
function M:setSelect(value)
    self.PointCheckBox:setVisible(value==self.mNumber)
end

function M:onEventTouch(data)
    if data.event=="end" then
        SoundSystemManager:playSound004()
        --self:setSelect(true)
        if self.mCallBackfunc then

            self.mCallBackfunc(self.mNumber)
        end
    end
end

return M