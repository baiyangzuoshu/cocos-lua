local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIDeleteAllEmailConfirm", UIPanel)

M.GUI_FILE_NAME = "csd.01_10_Mail.01_10_DeleteConfirmLayer.lua"

M.BINDGUIDATANODE = {
    ["ConfirmButton"] = {varname = "ConfirmButton", onClick = "onClickConfirmBtn"},
    ["CancelButton"] = {varname = "CancelButton", onClick = "onClickCancelBtn"},

    ["DeleteConfirmText_1_TT"] = {varname = "DeleteConfirmText_1"},

    ["DeleteConfirmText_2_TT"] = {varname = "DeleteConfirmText_2"},
}

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)
end

function M:onInit()
    M.super.onInit(self)
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