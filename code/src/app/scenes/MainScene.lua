local BaseScene = require("app.scenes.BaseScene")
local M = class("MainScene", BaseScene)

function M:ctor()
    M.super.ctor(self)
    self.mName = "MainScene"
end

function M:run()
    M.super.run(self)

    local panel = UIManager:getOrCreatePanel("UIMainLayer")
    if panel then
        panel:showToScene()
    end
end

return M