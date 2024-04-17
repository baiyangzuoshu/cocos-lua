local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UILoadingTipPopUp_1", UIPanel)

M.GUI_FILE_NAME = "csd.01_01_Login.01_01_LoadingTipPopUp_1.lua"

M.BINDGUIDATANODE = {
    ["ConfirmButton"] = { varname = "ConfirmButton",onClick = "onConfirmButtonClick"},
    ["CancelButton"] = { varname = "CancelButton", onClick = "onCancelButtonClick"},
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

function M:setCancelCb(cb)
    self.m_cancelCb = cb
end

function M:setConfirmCb(cb)
    self.m_confirmCb = cb
end

function M:onConfirmButtonClick(ref)
    if self.m_confirmCb then
        self.m_confirmCb()
    end
end

function M:onCancelButtonClick(ref)
    if self.m_cancelCb then
        self.m_cancelCb()
    end
    self:closePanel()
end

return M