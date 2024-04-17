local UIPackageItem = require("app.gui.bag.UIPackageItem")

local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIPackageLineCell", UIPanel)

M.GUI_FILE_NAME = "csd.01_03_PropKnapsack.01_03_PropKnapsackNodeCell.lua"

M.BINDGUIDATANODE = {
    ["PropKnapsackNode_1"] = { varname = "GodNode_1" },
    ["PropKnapsackNode_2"] = { varname = "GodNode_2" },
    ["PropKnapsackNode_3"] = { varname = "GodNode_3" },
    ["PropKnapsackNode_4"] = { varname = "GodNode_4" },
}

M.ITEM_COLUMN = 4

M.CELL_WIDTH = 556
M.CELL_HEIGHT = 145

local GodNode = "GodNode"

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(false)

    self:resetRootNodePosition(cc.p(0, 0))
    self:resetRootNodeAnchorPoint(cc.p(0, 0))

    self.mGodItems = {}
    for i = 1, M.ITEM_COLUMN do
        local item = UIPackageItem.new()
        item:setName("UIPackageItem")
        item:resetCenterPosition()
        item:setTouchCallBack(handler(self, self.touchItemCallBack))
        self[string.format("%s_%d", GodNode, i)]:addChild(item)
        self.mGodItems[i] = item
    end
end

function M:touchItemCallBack(item)
    if self.mTouchCallBack then
        self.mTouchCallBack(item)
    end
end

function M:setTouchCallBack(callback)
    self.mTouchCallBack = callback
end

function M:refreshData(data, index)
    for i = 1, M.ITEM_COLUMN do
        local idx = index * M.ITEM_COLUMN + i
        local itemInfo = data[idx]
        if itemInfo then
            self.mGodItems[i]:setItemInfo(clone(itemInfo))
            self.mGodItems[i]:setVisible(true)
        else
            self.mGodItems[i]:setVisible(false)
        end
    end
end

return M