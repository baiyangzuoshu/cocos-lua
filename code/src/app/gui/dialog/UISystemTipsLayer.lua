local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UISystemTipsLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_02_Main.01_02_WarnCell.lua"

M.BINDGUIDATANODE = {
    ["WarnText"] = {varname = "WarnText"},
    ["Warn"] = {varname = "Warn"},
    ["WarnBg"] = {varname = "WarnBg"},
}

function M:onCreate()
    M.super.onCreate(self)

    self:resetRootNodePosition(cc.p(0, 0))
    self:resetRootNodeAnchorPoint(cc.p(0, 0))

    self.Warn:setPosition(display.width * 0.5, display.height * 0.5)
end

function M:onInit()
    M.super.onInit(self)
end

function M:setPopToastStr(str)
    self.WarnText:setString(tostring(str))

    self:runAction(
        cc.Sequence:create(
            cc.Spawn:create(cc.FadeIn:create(0.2), cc.MoveBy:create(0.5, cc.p(0, 50))),
            cc.DelayTime:create(0.2),
            cc.Spawn:create(cc.FadeOut:create(0.5), cc.MoveBy:create(0.5, cc.p(0, -20))),
            cc.CallFunc:create(
                function()
                    self:removeFromParent()
                end)
            )   
        )
end

return M