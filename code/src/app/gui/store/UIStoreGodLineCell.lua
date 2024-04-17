local UIStoreGodItem = require("app.gui.store.UIStoreGodItem")
local UIDiceCupItem = require("app.gui.store.UIDiceCupItem")

local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIStoreGodLineCell", UIPanel)

M.GUI_FILE_NAME = "csd.03_01_Shop.03_01_NodeLayer.lua"

M.BINDGUIDATANODE = {
    ["GoldRechargeNode_1"] = { varname = "GodNode_1" },
    ["GoldRechargeNode_2"] = { varname = "GodNode_2" },
    ["GoldRechargeNode_3"] = { varname = "GodNode_3" },
}

M.ITEM_COLUMN = 3

M.CELL_WIDTH = 690
M.CELL_HEIGHT = 288

local GodNode = "GodNode"

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(false)

    self:resetRootNodePosition(cc.p(0, 0))
    self:resetRootNodeAnchorPoint(cc.p(0, 0))
end

function M:removeAllGodItem()
    for i = 1, M.ITEM_COLUMN do
        self[string.format("%s_%d", GodNode, i)]:removeAllChildren()
    end
end

function M:refreshData(data, index, shopShowType)
    self:removeAllGodItem()
    if Enum.ShopShowType.DiceCup == shopShowType then 
        self.mGodItems = {}
        for i = 1, M.ITEM_COLUMN do
            local item = UIDiceCupItem.new()
            item:setName("UIDiceCupItem")
            item:resetCenterPosition()
            self[string.format("%s_%d", GodNode, i)]:addChild(item)
            self.mGodItems[i] = item
        end
    else
        self.mGodItems = {}
        for i = 1, M.ITEM_COLUMN do
            local item = UIStoreGodItem.new()
            item:setName("UIStoreGodItem")
            item:resetCenterPosition()
            self[string.format("%s_%d", GodNode, i)]:addChild(item)
            self.mGodItems[i] = item
        end
    end
    for i = 1, M.ITEM_COLUMN do
        --local idx = tostring(index * M.ITEM_COLUMN + i)
        local idx = (index * M.ITEM_COLUMN + i)
        local cfgData = data:getCfgData()
        if cfgData[idx] then
            -- cfgData[idx] 对应item的纯表数据
            self.mGodItems[i]:setData(clone(cfgData[idx]))
            --data 为全量数据(网络数据、表数据、自定义数据)
            self.mGodItems[i]:setItemInfo(clone(data))
            self.mGodItems[i]:setVisible(true)
        else
            self.mGodItems[i]:setVisible(false)
        end
    end
end

return M