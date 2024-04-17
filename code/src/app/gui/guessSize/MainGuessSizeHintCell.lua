local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("MainGuessSizeHintCell", UIPanel)

M.GUI_FILE_NAME = "csd.02_02_GuessSize.02_02_MainGuessSizeHintCell.lua"

M.BINDGUIDATANODE = {
   ["MainGuessSizeHintBg"]={varname="MainGuessSizeHintBg"},
   ["MainGuessSizeHintText_1_TT"]={varname="MainGuessSizeHintText_4"},
   ["MainGuessSizeHintText_2_TT"]={varname="MainGuessSizeHintText_1"},
   ["MainGuessSizeHintText_3_TT"]={varname="MainGuessSizeHintText_3"},
}

function M:onCreate()
    M.super.onCreate(self)

    self.MainGuessSizeHintBg:setPositionX(-self.MainGuessSizeHintBg:getContentSize().width)
    self.MainGuessSizeHintBg:runAction(cc.Sequence:create(cc.MoveTo:create(1.0,cc.p(0,0)),cc.DelayTime:create(14.0),cc.MoveTo:create(1.0,cc.p(-self.MainGuessSizeHintBg:getContentSize().width,0)),cc.CallFunc:create(function()
        self:removeFromParent()
    end)))
end

function M:refreshUI(type)
    self.MainGuessSizeHintText_4:setVisible(4==type)
    self.MainGuessSizeHintText_1:setVisible(1==type)
    self.MainGuessSizeHintText_3:setVisible(3==type)
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