local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIBoastMoneyFlyLayer", UIPanel)

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_BoastMoneyFlyLayer.lua"

M.BINDGUIDATANODE = {
   
}

function M:onCreate()
    M.super.onCreate(self)

end

function M:StopAllGoldAction()
    local allchailds = self:getChildren()
    for _, v in ipairs(allchailds) do
        if "flyItem"==v:getName() then
            v:stopAllActions()
            v:removeFromParent()
        end
    end
end

return M