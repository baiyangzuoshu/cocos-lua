local UIPackageLineCell = require("app.gui.bag.UIPackageLineCell")

local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIPackageLayer", UIPanel)

local CELL_WIDTH = UIPackageLineCell.CELL_WIDTH
local CELL_HEIGHT = UIPackageLineCell.CELL_HEIGHT

local MIN_ROW = 1

M.GUI_FILE_NAME = "csd.01_03_PropKnapsack.01_03_PropKnapsackPopUp.lua"

M.BINDGUIDATANODE = {
    ["InteractionPopups"] = { varname = "InteractionPopups" },

    ["PropKnapsackPanel"] = { varname = "PropKnapsackPanel"},

    ["EmptyImage"] = { varname = "EmptyImage"},
    ["EmptyText_TT"] = { varname = "EmptyText_TT"},

    ["AllText_TT"] = { varname = "AllText"},
    ["AllButton"] = { varname = "AllButton", onClick = "onTabBtnClick" },

    ["InterimButton"] = { varname = "InterimButton", onClick = "onTabBtnClick" },
    ["InterimText_TT"] = { varname = "InterimText" },

    ["InterimTipDotIcon"]={varname="InterimTipDotIcon"}
}

function M:refreshHot()
    self.InterimTipDotIcon:setVisible(g_HotData:hasHot(Enum.redPointSubcategory.diceList))
end

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)

    self.mPackageData = {}
    self.mTabIndex = Enum.PackageTab.UnKnow

    self:initStoreTab()

    self.mRow = 0

    local size = self.PropKnapsackPanel:getContentSize()

    self.mTableView = cc.TableView:create(size)

    self.mTableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
    self.mTableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)

    self.mTableView:setBounceable(true)

    self.mTableView:setIgnoreAnchorPointForPosition(false)
    self.mTableView:setAnchorPoint(0, 0)
    self.mTableView:setPosition(0, 0)
    self.PropKnapsackPanel:addChild(self.mTableView)

    self.mTableView:registerScriptHandler(handler(self, self.getNumberOfCellsInTableView), cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
    self.mTableView:registerScriptHandler(handler(self, self.getTableCellSizeForIndex), cc.TABLECELL_SIZE_FOR_INDEX)
    self.mTableView:registerScriptHandler(handler(self, self.getTableCellSizeAtIndex), cc.TABLECELL_SIZE_AT_INDEX)

    self:initOutClickableArea()
end

function M:initOutClickableArea()
    local function onOutOfQuickBoxClick()
        self:closePanel()
    end

    UIUtils.addClickableNode(self.InteractionPopups, nil, onOutOfQuickBoxClick)
end

function M:onInit()
    M.super.onInit(self)

    self:refreshHot()
    g_HotData:C2S_removeRedPoint(Enum.redPointSubcategory.diceList)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.RefreshPackageUI, "refreshAllData")
    self:doRegEvent(Constant.CustomEvent.UIPackageLayer_refreshHot, "refreshHot")
end

function M:initStoreTab()
    self.mTabs = {}
    self.mTabs[Enum.PackageTab.Item] = self:createTab(
        Enum.PackageTab.Item, 
        self.AllButton, 
        self.AllText
    )
    self.mTabs[Enum.PackageTab.DiceCup] = self:createTab(
        Enum.PackageTab.DiceCup,
        self.InterimButton,
        self.InterimText
    )
end

function M:createTab(tag, button, Text, redDot)
    button:setTag(tag)
    return { redDot = redDot, button = button, text = Text }
end

function M:onTabBtnClick(sender)
    self:setTabIndex(sender:getTag())
end

function M:setTabIndex(tabIndex)
    --Log.info("newIndex: ", tabIndex, "old: ",  self.mTabIndex)
    if self.mTabIndex == tabIndex then
        return
    end

    self.mTabIndex = tabIndex

    for k, v in pairs(self.mTabs) do
        if tabIndex == k then
            v.button:setTouchEnabled(false)
            v.button:setBright(false)
            v.text:setTextColor(cc.c3b(0, 0, 0))
            v.text:setFontSize(24)
        else
            v.button:setTouchEnabled(true)
            v.button:setBright(true)
            v.text:setTextColor(cc.c3b(255, 255, 255))
            v.text:setFontSize(24)
        end
    end

    self:refreshAllData()
end

function M:onEnter()
    M.super.onEnter(self)

    self:refreshAllData()
end

function M:refreshAllData()
    local itemTypes = {}
    if self.mTabIndex == Enum.PackageTab.Item then 
        itemTypes = GSystem.ShowInBagItemTypeValueArray
    elseif self.mTabIndex == Enum.PackageTab.DiceCup then
        itemTypes = GSystem.ShowInBagDiceBoxTypeValueArray
    end

    if Utils.isEmptyTable(itemTypes) then return end

    self.mPackageData = {}
    local packageData = g_PackageData:getPackageDataByTabIndex(itemTypes)
    
    if not Utils.isEmptyTable(packageData) then 
        self.mTableView:setVisible(true)
        self:showEmptyUI(false)

        for i, v in ipairs(packageData) do
            local itemInfo = require("app.bean.ItemInfo").new(v, v.itemType)
            table.insert(self.mPackageData, itemInfo)
        end
    
        self.mRow = math.ceil(table.getn(self.mPackageData) / UIPackageLineCell.ITEM_COLUMN)
        if self.mRow < MIN_ROW then
            self.mRow = MIN_ROW
        end

        self.mTableView:reloadData()
    else
        self.mTableView:setVisible(false)
        self:showEmptyUI(true)
    end
end

function M:showEmptyUI(isShow)
    self.EmptyImage:setVisible(isShow)
    self.EmptyText_TT:setVisible(isShow)
end

function M:onSelectItem(item)
    if not item then return end

    local itemInfo = item:getItemInfo()

    if not itemInfo then return end 

    local netData = itemInfo:getNetData()
    
    local itemShowType = itemInfo:getItemShowType()

    local itemTypes = {}
    if self.mTabIndex == Enum.PackageTab.Item then 
        itemTypes = GSystem.ShowInBagItemTypeValueArray
    elseif self.mTabIndex == Enum.PackageTab.DiceCup then
        itemTypes = GSystem.ShowInBagDiceBoxTypeValueArray
    end

    for i,v in ipairs(itemTypes) do 
        if v == itemShowType then
            if self.mTabIndex == Enum.PackageTab.Item then 
                local itemTips = UIManager:getOrCreatePanel("UIPackageShowItemTips")
                if itemTips then 
                    itemTips:setItemInfo(itemInfo)
                    itemTips:showToScene()
                end
            elseif self.mTabIndex == Enum.PackageTab.DiceCup then
                local diceUpTips = UIManager:getOrCreatePanel("UIPackageShowDiceUp")
                if diceUpTips then 
                    diceUpTips:setItemInfo(itemInfo)
                    diceUpTips:showToScene()
                end
            end
            break 
        end
    end
end

function M:getNumberOfCellsInTableView(tableview)
    return self.mRow
end

function M:getTableCellSizeForIndex(tableview, idx)
    return CELL_WIDTH, CELL_HEIGHT
end

function M:getTableCellSizeAtIndex(tableview, idx)
    local cell = tableview:dequeueCell()
    if nil == cell then
        cell = cc.TableViewCell:new()
    end

    local panel = cell:getChildByName("UIPackageLineCell")
    if not panel then
        panel = UIPackageLineCell.new()
        panel:setName("UIPackageLineCell")
        panel:setTouchCallBack(handler(self, self.onSelectItem))

        local size = panel:getContentSize()
        panel:setPosition((CELL_WIDTH - size.width) * 0.5, (CELL_HEIGHT - size.height) * 0.5)
        cell:addChild(panel)
    end

    panel:refreshData(self.mPackageData, idx)

    return cell
end

return M