local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIConnectionErrorLayer", UIPanel)

M.GUI_FILE_NAME = "csd.0_general.0_05_error.0_05_1_ConnectionErrorLayer.lua"

M.BINDGUIDATANODE = {
    ["QuitButton"] = { onClick = "onQuitButtonClick" },
}

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)
end

function M:onQuitButtonClick()
    g_LoginData:logout()
    g_LoginData:setLoginAutoEnable(true)

    SceneManager:runScene(require("app.scenes.LoginScene").create())
end

return M