local BaseScene = require("app.scenes.BaseScene")
local M = class("GameScene", BaseScene)

function M:ctor()
    M.super.ctor(self)
    self.mName = "GameScene"
end

function M:run()
    M.super.run(self)
end

return M