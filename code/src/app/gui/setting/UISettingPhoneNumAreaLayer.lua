local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UISettingPhoneNumAreaLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_07_Sitting.01_07_SittingPhoneNumAreaLayer.lua"

M.BINDGUIDATANODE = {
     -- 关闭按钮
     ["ReturnPanel"] = { varname = "Return", onEvent = "onReturnTouch"},
     ["ReturnButton"] = { varname = "ReturnButton"},

     ["AreaNumPanel" ]= {varname = "AreaNumPanel"},
}

function M:onCreate()
    M.super.onCreate(self)

    self:setShadeShowModel(true)
end

function M:onInit()
    M.super.onInit(self)

    self.ReturnButton:setTouchEnabled(false)
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:onReturnTouch(data)
    if data.event == "end" then 
        local scaleToStart = cc.ScaleTo:create(0.05, 0.9)
        local scaleToEnd = cc.ScaleTo:create(0.05, 1.0)
        self.ReturnButton:runAction(cc.Sequence:create(scaleToStart, scaleToEnd, cc.CallFunc:create(
            function ()
                self:closePanel()
            end
        )))
    end
end

return M