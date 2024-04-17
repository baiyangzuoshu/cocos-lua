local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UICommonMediumTipPopUp", UIPanel)

M.GUI_FILE_NAME = "csd.01_02_Main.01_02_CommonMediumTipPopUp_2.lua"

M.BINDGUIDATANODE = {
    ["ConfirmButton"] = { varname = "ConfirmButton",onClick = "onConfirmButtonClick"},
    ["CancelButton"] = { varname = "CancelButton",onClick = "onCancelButtonClick"},
    ["TitleText"] = { varname = "TitleText"},
    ["ContentText"] = { varname = "ContentText"},
    ["ConfirmText"] = { varname = "ConfirmText"},
    ["CancelText"] = { varname = "CancelText"},
}

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)
end

function M:onInit()
    M.super.onInit(self)
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:setText(TipTitleText, ContentText, ConfirmText, CancelText)
    self.TitleText:setString(TipTitleText)
    self.ContentText:setString(ContentText)
    self.ConfirmText:setString(ConfirmText)
    self.CancelText:setString(CancelText)
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

function M:setCancelCb(cb)
    self.m_CancelCb = cb
end

function M:onCancelButtonClick(ref)
    if self.m_CancelCb then
        self.m_CancelCb()
    end
    self:closePanel()
end

return M