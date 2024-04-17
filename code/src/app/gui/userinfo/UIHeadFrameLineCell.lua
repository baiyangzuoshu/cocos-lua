local UIHeadFrameCell = require("app.gui.userinfo.UIHeadFrameCell")

local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIHeadFrameLineCell", UIPanel)

M.GUI_FILE_NAME = "csd.01_06_PersonalCenter.01_06_HeadSittingNodeCell.lua"

M.BINDGUIDATANODE = {
    ["HeadNode_1"] = { varname = "HeadNode_1" },
    ["HeadNode_2"] = { varname = "HeadNode_2" },
    ["HeadNode_3"] = { varname = "HeadNode_3" },
    ["HeadNode_4"] = { varname = "HeadNode_4" },
}

M.ITEM_COLUMN = 4

M.CELL_WIDTH = 500
M.CELL_HEIGHT = 130

local GodNode = "HeadNode"

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(false)

    self:resetRootNodePosition(cc.p(0, 0))
    self:resetRootNodeAnchorPoint(cc.p(0, 0))

    self.mGodItems = {}
    for i = 1, M.ITEM_COLUMN do
        local item = UIHeadFrameCell.new()
        item:setName("UIHeadFrameCell")
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

function M:setIsSelect(id)
    for _,v in ipairs(self.mGodItems) do 
        local itemInfo = v:getItemInfo()

        if itemInfo then 
            local netData = itemInfo:getNetData()

            if id == netData.id then 
               v:setItemSelect(true)
            else
               v:setItemSelect(false)
            end
        end
    end
end

function M:refreshData(data, index, selectId)
    for i = 1, M.ITEM_COLUMN do
        local idx = index * M.ITEM_COLUMN + i
        if data[idx] then
            self.mGodItems[i]:setItemInfo(clone(data[idx]))
            self.mGodItems[i]:setVisible(true)
            if data[idx]:getNetData().id == selectId then 
                self.mGodItems[i]:setItemSelect(true)
            else
                self.mGodItems[i]:setItemSelect(false)
            end
            
        else
            self.mGodItems[i]:setVisible(false)
        end
    end
end

return M