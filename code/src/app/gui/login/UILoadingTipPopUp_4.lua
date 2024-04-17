local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UILoadingTipPopUp_4", UIPanel)

M.GUI_FILE_NAME = "csd.01_01_Login.01_01_LoadingTipPopUp_4.lua"

M.BINDGUIDATANODE = {
    ["RetryButton"] = { varname = "RetryButton",onClick = "onRetryButtonClick"},
    ["CancelButton"] = { varname = "CancelButton",onClick = "onCancelButtonClick"},
    ["ContentText_1_TT"] = { varname = "ContentText_1"},
    ["ContentText_2_TT"] = { varname = "ContentText_2"},
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

function M:setIsSuccess(isSuccess)
    self.ContentText_1:setVisible(not isSuccess)
    self.ContentText_2:setVisible(isSuccess)
end

function M:setConfirmCb(cb)
    self.m_confirmCb = cb
end

function M:onRetryButtonClick(ref)
    if self.m_confirmCb then
        self.m_confirmCb()
    end

    if DeviceUtils.isWindows() then
        HodUpdateManager:getInitData("1.4.2",Enum.requestServerHodType.InternalTest)
    else
        HodUpdateManager:getInitData(g_GameSettingData:getVersion(),Net.requestServerHodType)
    end

    self:closePanel()
end

function M:onCancelButtonClick(ref)
    if self.m_confirmCb then
        self.m_confirmCb()
    end
    
    Utils.exitGame()
end

return M