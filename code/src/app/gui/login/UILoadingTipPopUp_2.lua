local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UILoadingTipPopUp_2", UIPanel)

M.GUI_FILE_NAME = "csd.01_01_Login.01_01_LoadingTipPopUp_2.lua"

M.BINDGUIDATANODE = {
    ["JumpButton"] = { varname = "JumpButton",onClick = "onJumpButtonClick"},
}


function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)
end

function M:onInit()
    M.super.onInit(self)

end

function M:onEnter()
    M.super.onEnter(self)
   
end

function M:onJumpButtonClick(ref)
    if DeviceUtils.isWindows() then
        
    elseif DeviceUtils.isIOS() then
        DeviceUtils.openURL("https://apps.apple.com/us/app/lets-roll/id1603405880")
    elseif DeviceUtils.isAndroid() then
        DeviceUtils.openURL("https://play.google.com/store/apps/details?id=com.yippeekiyay.letsroll")
    end
    
    Utils.exitGame()
end

return M