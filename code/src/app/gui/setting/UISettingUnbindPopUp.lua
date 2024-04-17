local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UISettingUnbindPopUp", UIPanel)

M.GUI_FILE_NAME = "csd.01_07_Sitting.01_07_SittingUnbindPopUp.lua"

M.BINDGUIDATANODE = {
    ["InteractionPopups"] = { varname = "InteractionPopups" },

    ["TipContentText_1_TT"] = {varname = "TipContentText_1_TT"},
    ["TipContentText_2_TT"] = {varname = "TipContentText_2_TT"},

    ["CancelButton"] = { varname = "CancelButton", onClick = "onCancelButtonClick"},

    ["ConfirmButton"] = { varname = "ConfirmButton",onClick = "onConfirmButtonClick"},
}

function M:onCreate()
    M.super.onCreate(self)

    self.TipContentText_1 = self.TipContentText_1_TT:getString()
    self.TipContentText_2 = self.TipContentText_2_TT:getString()
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

function M:setTipContentText(name)
    self.TipContentText_1_TT:setString(Utils.getFormatString(self.TipContentText_1, name))
    self.TipContentText_2_TT:setString(Utils.getFormatString(self.TipContentText_2, name))
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
    end
    self:closePanel()
end

function M:onCancelButtonClick(ref)
    if self.m_cancelCb then
        self.m_cancelCb()
    end
    self:closePanel()
end

return M