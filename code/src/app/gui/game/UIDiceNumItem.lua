local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIDiceNumItem", UIPanel)

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_NumberLayer.lua"

M.BINDGUIDATANODE = {
    ["NumberCheckBox"]={varname="NumberCheckBox"},
    ["NumberBottom"]={varname="NumberBottom",onEvent="onEventTouch"},
    ["NumberText_1"]={varname="NumberText"},
    ["NumberPanel"]={varname="NumberPanel"},

}



function M:onCreate()
    M.super.onCreate(self)
    --self:setSwallowTouches(false)

    self.NumberPanel:setTouchEnabled(false)
    self.NumberBottom:setTouchEnabled(true)
    self.NumberBottom:setSwallowTouches(false)
    self.NumberCheckBox:setVisible(false)
    self.mCallBackfunc=nil
    self.mNumber = 1

end
function M:setCallfunc(callFunc)
    if callFunc then

        self.mCallBackfunc = callFunc
    end
end
function M:setNum(num)
    self.mNumber = num
    self.NumberText:setString(tostring(self.mNumber))
end
function M:setSelect(value)
    self.NumberCheckBox:setVisible(value==self.mNumber)
end

function M:onEventTouch(data)
    if data.event=="end" then
        SoundSystemManager:playSound004()
        --self:setSelect(true)
        --Log.info("111111111111111111111111111")
        if self.mCallBackfunc then

            self.mCallBackfunc(self.mNumber)
        end
    end
end

return M