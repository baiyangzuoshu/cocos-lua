local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UISettingModifyAccountPopUp", UIPanel)

M.GUI_FILE_NAME = "csd.01_07_Sitting.01_07_SittingModifyAccountPopUp.lua"

M.BINDGUIDATANODE = {
    ["InteractionPopups"] = { varname = "InteractionPopups" },

    ["TipContentText_TT"] = {varname = "TipContentText"},

    ["CancelButton"] = { varname = "CancelButton", onClick = "onCancelButtonClick"},

    ["ConfirmButton"] = { varname = "ConfirmButton",onClick = "onConfirmButtonClick"},
}

function M:onCreate()
    M.super.onCreate(self)

    self:setShadeShowModel(true)
    self:initOutClickableArea()
end

function M:initOutClickableArea()
    local function onOutOfQuickBoxClick()
        self:closePanel(0)
    end

    UIUtils.addClickableNode(self.InteractionPopups, nil, onOutOfQuickBoxClick)
end

function M:onInit()
    M.super.onInit(self)
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:setCancelCb(cb)
    self.m_cancelCb = cb
end

function M:setConfirmCb(cb)
    self.m_confirmCb = cb
end

function M:onConfirmButtonClick(ref)
    if self.m_confirmCb then
        self.m_confirmCb()
        self:closePanel()
    end
end

function M:onCancelButtonClick(ref)
    if self.m_cancelCb then
        self.m_cancelCb()
    end
    self:closePanel()
end

return M