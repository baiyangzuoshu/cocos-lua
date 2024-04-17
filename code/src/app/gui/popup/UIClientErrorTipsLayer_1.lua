local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIClientErrorTipsLayer_1", UIPanel)

M.GUI_FILE_NAME = "csd.01_02_Main.01_02_CommonMiniTipPopUp_1.lua"

M.BINDGUIDATANODE = {
    ["ConfirmButton"] = { varname = "ConfirmButton",onClick = "onConfirmButtonClick"},
    ["TitleText"] = { varname = "TitleText"},
    ["ContentText"] = { varname = "ContentText"},
    ["ConfirmText_TT"] = { varname = "ConfirmText"},
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

function M:setText(TipTitleText, ContentText, ButtonText)
    self.TitleText:setString(TipTitleText)
    self.ContentText:setString(ContentText)
    self.ConfirmText:setString(ButtonText)
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

return M