local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIGuideBigPrizeLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_16_NoviceGuide.01_16_GuideBigPrizeLayer.lua"

M.BINDGUIDATANODE = {
    ["BigPrizeButton"]={varname="BigPrizeButton",onClick="onClickEvent"},
    ["Middle"]={varname="Middle"}
}

function M:onClickEvent()
    self:closePanel()
    local panel=UIManager:getOrCreatePanel("UIGameGuideLayer")
    if panel then
        panel:showToScene()
    end
end

function M:onCreate()
    M.super.onCreate(self)

    self:setShadeShowModel(true,125)

    self.Middle:setScale(0.2)
    self.Middle:setOpacity(0)
    local easeBackIn=cc.EaseBackOut:create(cc.ScaleTo:create(0.1,1.0))
    self.Middle:runAction(cc.Sequence:create(cc.FadeIn:create(0.1),easeBackIn))
end

function M:onInit()
    M.super.onInit(self)
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:OnUpdate(dt)
    
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
end

function M:onCleanup()
    M.super.onCleanup(self)
end

return M