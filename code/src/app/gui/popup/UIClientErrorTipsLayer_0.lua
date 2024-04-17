local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIClientErrorTipsLayer_0", UIPanel)

M.GUI_FILE_NAME = "csd.01_02_Main.01_02_CommonMiniTipPopUp_0.lua"

M.BINDGUIDATANODE = {
    ["InteractionPopups"] = { varname = "InteractionPopups" },
    ["TipTitleText"] = { varname = "TipTitleText"},
    ["ContentText"] = { varname = "ContentText"},
}

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)

    self:initOutClickableArea()
end

function M:initOutClickableArea()
    local function onOutOfQuickBoxClick()
        self:closePanel()
    end

    UIUtils.addClickableNode(self.InteractionPopups, nil, onOutOfQuickBoxClick)
end

function M:onInit()
    M.super.onInit(self)
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:setText(TitleText, ContentText)
    self.TipTitleText:setString(TitleText)
    self.ContentText:setString(ContentText)
end

return M