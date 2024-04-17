local BaseScene = require("app.scenes.BaseScene")
local M = class("LoginScene", BaseScene)

function M:ctor()
    M.super.ctor(self)
    self.mName = "LoginScene"
end

function M:run()
    M.super.run(self)

    local panel = UIManager:getOrCreatePanel("UILoginLayer")
    if panel then
        panel:showToScene()
    end
end

return M