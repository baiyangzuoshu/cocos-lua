local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UILoadingTipPopUp_3", UIPanel)

M.GUI_FILE_NAME = "csd.01_01_Login.01_01_LoadingTipPopUp_3.lua"

M.BINDGUIDATANODE = {
    ["RetryButton"] = { varname = "RetryButton",onClick = "onRetryButtonClick"},
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

function M:setConfirmCb(cb)
    self.m_confirmCb = cb
end

function M:onRetryButtonClick(ref)
    if self.m_confirmCb then
        self.m_confirmCb()
    end
    self:closePanel()
end

function M:onCancelButtonClick(ref)
    self:closePanel()
end

return M