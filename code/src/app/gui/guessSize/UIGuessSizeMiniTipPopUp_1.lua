local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIGuessSizeMiniTipPopUp_1", UIPanel)

M.GUI_FILE_NAME = "csd.02_02_GuessSize.02_02_GuessSizeMiniTipPopUp_1.lua"

M.BINDGUIDATANODE = {
   ["ContentText_1_TT"]={varname="ContentText_1_TT"},
   ["ContentText_1_1_TT"]={varname="ContentText_1_1_TT"},
   ["ContentText_1_2_TT"]={varname="ContentText_1_2_TT"},
   ["ConfirmButton"]={onClick="onClickEvent"}
}
function M:onClickEvent()
    self:closePanel()
end

function M:onCreate()
    M.super.onCreate(self)
end

function M:refreshUI(type)
    self.ContentText_1_TT:setVisible(3==type)
    self.ContentText_1_1_TT:setVisible(1==type)
    self.ContentText_1_2_TT:setVisible(4==type)
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:onCleanup()
    M.super.onCleanup(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
end

return M