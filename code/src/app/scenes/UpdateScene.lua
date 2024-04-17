local BaseScene = require("app.scenes.BaseScene")
local M = class("UpdateScene", BaseScene)

function M:ctor()
    M.super.ctor(self)
    self.mName = "UpdateScene"
end

function M:run()
    M.super.run(self)

    local panel = UIManager:getOrCreatePanel("UIUpdateLayer")
    if panel then
        panel:showToScene()
    end
end

return M