
local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("MainFriendListCell", UIPanel)

M.GUI_FILE_NAME = "csd.01_02_Main.01_02_MainFriendListCell.lua"

M.BINDGUIDATANODE = {
    ["FriendListCellNode_1"]={varname="FriendListCellNode_1"},
    ["FriendListCellNode_2"]={varname="FriendListCellNode_2"},
}
local time=0.4

function M:playAction(type)
    if self.actionIng then return end
    self.actionIng=true

    if 1==type then
        self.MainFriendListCell_1:setVisible(false)
        self.MainFriendListCell_2:setVisible(false)
        self.MainFriendListCell_1:runAction(cc.Sequence:create(cc.DelayTime:create(time),cc.CallFunc:create(function()
            self.actionIng=false
        end)))
    else
        self.MainFriendListCell_1:setVisible(false)
        self.MainFriendListCell_2:setVisible(false)
        self.MainFriendListCell_1:runAction(cc.Sequence:create(cc.DelayTime:create(time),cc.CallFunc:create(function()
            self.actionIng=false
            self.MainFriendListCell_1:setVisible(true)
            self.MainFriendListCell_2:setVisible(true)
        end)))
    end
end

function M:refreshUI(data)
    self.MainFriendListCell_1:refreshUI(data)
    self.MainFriendListCell_2:refreshUI(data)
end

function M:initUI(data)
    self.MainFriendListCell_1:initUI(data)
    self.MainFriendListCell_1:refreshHeadIconTime(120)

    self.MainFriendListCell_2:initUI(data)
end

function M:resetAllNode()
    self.MainFriendListCell_1:resetAllNode()
    self.MainFriendListCell_2:resetAllNode()
end

function M:onCreate()
    M.super.onCreate(self)
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.VipIconTail))

    self.MainFriendListCell_2=UIManager:createPanelOnly("MainFriendListCell_2")
    self.MainFriendListCell_2:resetCenterPosition()
    self.FriendListCellNode_2:addChild(self.MainFriendListCell_2)

    self.MainFriendListCell_1=UIManager:createPanelOnly("MainFriendListCell_1")
    self.MainFriendListCell_1:resetCenterPosition()
    self.FriendListCellNode_1:addChild(self.MainFriendListCell_1)
    self.MainFriendListCell_1:openHeadEvent()
end

function M:onInit()
    M.super.onInit(self)

end

function M:OnUpdate(dt)
    self.MainFriendListCell_1:OnUpdate(dt)
end

return M