local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UILoadingLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_01_Login.01_01_GeneralLodingLayer.lua"

M.BINDGUIDATANODE = {
    ["GeneralLodingSpineNode"] = { varname = "GeneralLodingSpineNode" },
}

function M:onCreate()
    M.super.onCreate(self)

    self.mDelayTime = 0
    self.mShowTime = 5

    self:setShadeShowModel(true,0.75*255)

    local effect = Utils.onlyCreateEffect(GSystem.GeneralLodingSpine ,cc.p(0,0),true)
    if effect then
        self.GeneralLodingSpineNode:addChild(effect)
    end
end

function M:setDelayTime(time)
    self.mDelayTime = time or 0
end

function M:setShowTime(time)
    self.mShowTime = time or 5
end

function M:OnUpdate(dt)
    self.mDelayTime = self.mDelayTime - dt

    if self.mShowTime <= 0 then
        return
    end

    self.mShowTime = self.mShowTime - dt
    if self.mShowTime <= 0 then
        self:closePanel()
    end
end

return M