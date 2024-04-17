local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIKickPopup", UIPanel)
M.GUI_FILE_NAME = "csd.01_02_Main.01_02_AccountReplacePopUp.lua"

M.BINDGUIDATANODE = {
    ["ConfirmButton"] = { varname = "ConfirmButton",onClick = "onConfirmButtonClick"},
    ["ConfirmText_TT"] = { varname = "ConfirmText_TT"},
    ["ContentText_1"]={varname="ContentText_1"},
    ["ContentText_2"]={varname="ContentText_2"},
    ["ContentText_3"]={varname="ContentText_3"},
    ["TitleText"]={varname="TitleText"},
}

function M:onCreate()
    M.super.onCreate(self)
end

function M:onInit()
    M.super.onInit(self)
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:setConfirmText(txt)
    self.ConfirmText_TT:setString(txt)
end
function M:setContentText(txt1,txt2,txt3)
    self.ContentText_1:setString(txt1)
    self.ContentText_2:setString(txt2)
    self.ContentText_3:setString(txt3)
end
function M:setTitleText(txt)
    self.TitleText:setString(txt)
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