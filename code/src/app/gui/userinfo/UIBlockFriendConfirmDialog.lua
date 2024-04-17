local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIBlockFriendConfirmDialog", UIPanel)

M.GUI_FILE_NAME = "csd.01_06_PersonalCenter.01_06_PersonalCenterBlackTipPopUp.lua"

M.BINDGUIDATANODE = {
    ["ConfirmButton_2"] = {varname = "ConfirmButton", onClick = "onClickConfirmBtn"},
    ["CancelButton"] = {varname = "CancelButton", onClick = "onClickCancelBtn"},
    ["TipContentText_TT"] = { varname = "TipContentText" },
}

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)
end

function M:onInit()
    M.super.onInit(self)

    self.TipContentText:ignoreContentAdaptWithSize(false)
end

function M:setCancelCb(cb)
    self.m_cancelCb = cb
end

function M:setConfirmCb(cb)
    self.m_confirmCb = cb
end

function M:onClickCancelBtn(ref)
    if self.m_cancelCb then
        self.m_cancelCb()
    end
    self:closePanel()
end

function M:onClickConfirmBtn(ref)
    if self.m_confirmCb then
        self.m_confirmCb()
    end
    self:closePanel()
end

return M