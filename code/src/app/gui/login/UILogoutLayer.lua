local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UILogoutLayer", UIPanel)

M.GUI_FILE_NAME = "csd.0_general.0_07_logout.0_07_1_LogoutLayer.lua"

M.BINDGUIDATANODE = {
    ["LogoutButton"] = { onClick = "onLogoutButtonClick" },
    ["CancelButton"] = { onClick = "onCloseButtonClick" },
}

function M:onCreate()
    M.super.onCreate(self)

    self:setShadeShowModel(true)
end

function M:onLogoutButtonClick()
    g_LoginData:logout()
    g_LoginData:setLoginAutoEnable(false)

    SceneManager:runScene(require("app.scenes.LoginScene").create())
end

function M:onCloseButtonClick()
    self:closePanel()
end

return M