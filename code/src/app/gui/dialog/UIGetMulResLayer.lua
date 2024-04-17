local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIGetMulResLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_17_GetRes.01_17_GetResourcesLayer.lua"

M.BINDGUIDATANODE = {
    ["GetResPanel"] = { varname = "InteractionPopups"},
    ["ResPanel"] = { varname = "resPanel" },
}

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)

    self:initOutClickableArea()

    local size = self.resPanel:getContentSize()
    self.mItemListView = ccui.ListView:create()
    self.mItemListView:setContentSize(size)
    self.mItemListView:setDirection(ccui.ListViewDirection.horizontal)
    self.mItemListView:setBounceEnabled(true)
    self.mItemListView:setScrollBarEnabled(false)
    self.mItemListView:setItemsMargin(10)
    self.mItemListView:setPosition(cc.p(0, 0))
    self.mItemListView:setAnchorPoint(cc.p(0, 0))
    self.resPanel:addChild(self.mItemListView)
end

function M:onInit()
    M.super.onInit(self)
end

function M:onEnter()
    M.super.onEnter(self)
    SoundSystemManager:playSound023()
end

function M:initOutClickableArea()
    local function onOutOfQuickBoxClick()
        if not Utils.isEmptyTable(self.mItemData) then 
            for _ , v in ipairs(self.mItemData) do
                v:removeFromParent(true)
            end
        end
        self:closePanel()

        if  3==g_HotData:getGuideStep() then
            local   panel=UIManager:getOrCreatePanel("UINewWelfareLoginPopUp")
            if panel then
                panel:showToScene()
            end
        end
    end

    UIUtils.addClickableNode(self.InteractionPopups, nil, onOutOfQuickBoxClick)
end

function M:formatItemData(items)
    local len = table.getn(items)
    --只有一条数据无需合并
    if len == 1 then 
        return items
    end
    local new_table = {}
    for i = 1 , len do
        local isNeedCombine = true
        --提前判断该id数据是否已经合并过
        if not Utils.isEmptyTable(new_table) then
            for _ , v in ipairs(new_table) do 
                if v.itemId == items[i].itemId then 
                    isNeedCombine = false
                    break
                end
            end
        end
        --对相同物品id进行数量合并
        if isNeedCombine then
            for j = i + 1 , len do 
                if items[i].itemId == items[j].itemId then
                    items[i].itemNum = items[i].itemNum + items[j].itemNum
                end
            end
            table.insert(new_table, items[i])
        end
    end
    return new_table
end

function M:refreshData(data)
    --特殊处理不显示活跃点
    for _,v in ipairs(data) do 
        if v.itemType == Enum.ItemShowType.WeeklyActivity then 
            table.removebyvalue(data, v, true)
            break
        end
    end
    local items = self:formatItemData(data)
 
    local len = table.getn(items)
    if len > 4 then
        self:showItemViewMoreThan4(items , len)
    else
        self:showItemViewLessThan4(items , len)
    end
end

--大于4个item展示tableview
function M:showItemViewMoreThan4(items , len)
    self.mItemListView:setVisible(true)
    self.mItemListView:removeAllChildren()

    for _,v in ipairs(items) do 
        local netData = {}
        netData.itemShowType = v.itemType
        netData.itemId = v.itemId
        netData.itemNum = v.itemNum

        local itemInfo = require("app.bean.ItemInfo").new(netData, v.itemType)
        local item = UIManager:createPanelOnly("UIEmailItem2")

        local panel = ccui.Layout:create()
        local size = item:getContentSize()
        panel:setContentSize(size)
        self.mItemListView:pushBackCustomItem(panel)

        item:setTouchCallBack(handler(self, self.showRewardInfo))
        item:setAnchorPoint(cc.p(0.5,0.5))
        item:setItemInfo(itemInfo)
        panel:addChild(item)
    end
end

--小于4个item
function M:showItemViewLessThan4(items , len)
    self.mItemListView:setVisible(false)
    self.mItemData = {}

    for i, v in ipairs(items) do
        local item = UIManager:createPanelOnly("UIEmailItem2")

        local netData = {}
        netData.itemShowType = v.itemType
        netData.itemId = v.itemId
        netData.itemNum = v.itemNum
        
        local itemInfo = require("app.bean.ItemInfo").new(netData, v.itemType)
        item:setItemInfo(itemInfo)

        item:setTouchCallBack(handler(self, self.showRewardInfo))
       
        local itemSize = item:getContentSize()
        local size = self.resPanel:getContentSize()
        itemSize.width = itemSize.width + 10
        local padding = size.width * 0.5 - len * itemSize.width * 0.5

        item:resetCenterPosition()
        item:setPosition(padding + itemSize.width* i - itemSize.width *0.5, size.height * 0.5)

        self.resPanel:addChild(item)
        --保存小于4个item的信息
        table.insert(self.mItemData, item)
    end
end

function M:showRewardInfo(item)
    --UIUtils.popToast("暂未开放")
end

function M:onExit()
    M.super.onExit(self)
end

return M