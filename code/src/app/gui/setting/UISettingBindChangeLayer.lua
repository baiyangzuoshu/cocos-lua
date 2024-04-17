local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UISettingBindChangeLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_07_Sitting.01_07_SittingBindChangeLayer.lua"

M.BINDGUIDATANODE = {
    -- 关闭按钮
    ["ReturnPanel"] = { varname = "Return", onEvent = "onReturnTouch"},
    ["ReturnButton"] = { varname = "ReturnButton"},

    ["PhoneAreaPanel"] = { varname = "PhoneAreaPanel",onEvent = "onPhoneAreaPanelTouch"},
    ["PhoneAreaNum" ]= {varname = "PhoneAreaNum"},

    ["PhoneNumField" ]= {varname = "PhoneNumField"},
    ["PhoneNumError" ]= {varname = "PhoneNumError"},

    ["VerifyTextField"] = { varname = "VerifyTextField"},
    ["VerifyError" ]= {varname = "VerifyError"},
    
    ["VertifySendPanel"] = { varname = "VertifySendPanel",onEvent = "onVertifySendPanelTouch"},
    ["VertifyTime" ]= {varname = "VertifyTime"},
    ["VertifyTimeNum" ]= {varname = "VertifyTimeNum"},

    ["ConfirmButton"] = { varname = "ConfirmButton",onClick = "onConfirmButtonClick"},
    ["PhoneNumPanel"]={onClick="onClickEvent"},
    ["VerifyPanel"]={onClick="onClickEvent"},
}

function M:onClickEvent()
    SoundSystemManager:playSound004()
end

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

    -- local panel = UIManager:getOrCreatePanel("UILanguageChangeLayer")
    -- if panel then 
    --     panel:showToScene()
    -- end

function M:onPhoneAreaPanelTouch(data)
    if data.event == "end" then
       
    end
end

function M:onVertifySendPanelTouch(data)
    if data.event == "end" then
       SoundSystemManager:playSound004()
    end
end

function M:onConfirmButtonClick(ref)
    
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