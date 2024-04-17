local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UINumberCell", UIPanel)

M.GUI_FILE_NAME = "csd.3_combat.3_01_fight.3_01_6_NumCell.lua"

M.CELL_WIDTH = 110
M.CELL_HEIGT = 142

M.BINDGUIDATANODE = {
    ["NumText"] = { varname = "NumberText" },
    ["PitchPicture"] = { varname = "SelectedNode" },
    ["SelectPanel"] = { varname = "SelectPanel", onTouch = "onSelectPanelTouchEvent" },
}

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(false)

    self.mTouchNumber = -1
    self.mNumber = -1

    self.SelectPanel:setSwallowTouches(false)
    self.SelectedNode:setVisible(false)

    self:resetRootNodePosition(cc.p(0, 0))
    self:resetRootNodeAnchorPoint(cc.p(0, 0))
end

function M:onEnter()
    M.super.onEnter(self)
    self.SelectedNode:setVisible(false)
end

function M:setNumber(number)
    self.mNumber = number
    self.NumberText:setString(tostring(number))
end

function M:onSelectPanelTouchEvent(sender, eventType)
    if eventType == ccui.TouchEventType.began then
        self.mTouchNumber = self.mNumber
        self.SelectedNode:setVisible(true)
    elseif eventType == ccui.TouchEventType.moved then
        self.SelectedNode:setVisible(self.mTouchNumber == self.mNumber)
    elseif eventType == ccui.TouchEventType.ended or eventType == ccui.TouchEventType.canceled then
        self.mTouchNumber = -1
        self.SelectedNode:setVisible(false)
    end
end

return M