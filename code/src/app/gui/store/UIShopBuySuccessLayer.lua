local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIShopBuySuccessLayer", UIPanel)

M.GUI_FILE_NAME = "csd.03_01_Shop.03_01_SuccessLayer.lua"

M.BINDGUIDATANODE = {
    ["ConfirmButton"] = { varname = "ConfirmButton", onClick = "onConfirmBtnClick"},

    ["DiamondText"] = { varname = "godText"},
    ["DiamondIcon"] = { varname = "godIcon"},
    ["Bg"]={varname="Bg"}
}

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.ShopGoods))
end

function M:onInit()
    M.super.onInit(self)
end

function M:setShopGodsId(id)
    self.mShopGodsId = id
end

function M:setRechargeId(id)
    self.mRechargeId = id
end

function M:showReward(data)
    if Utils.isEmptyTable(data) then return end

    if table.getn(data) == 1 then
        local rewardData = data[1]
        local id = rewardData.id
        self.godText:setVisible(true)
        self.godIcon:setVisible(true)
        local itemData = DataManager:getTbxData("Item", tonumber(id))
        if itemData then 
            local showType = itemData.ItemType
            if showType == Enum.ItemShowType.Diamond then 
                self:showDiamond(rewardData)
            elseif showType == Enum.ItemShowType.Gold then
                self:showGold(rewardData)
            elseif showType == Enum.ItemShowType.Avatar then
            elseif showType == Enum.ItemShowType.AvatarFrame then
            elseif showType == Enum.ItemShowType.DiceCup then
            elseif showType == Enum.ItemShowType.BubbleBox then
            elseif showType == Enum.ItemShowType.Material then
            else
            end
        end
    else
        self.godText:setVisible(false)
        self.godIcon:setVisible(false)
        self:reloadItems(data)
    end
end

function M:reloadItems(items)
    self.Bg:removeAllChildren()
    local size = self.Bg:getContentSize()
    local itemListView = ccui.ListView:create()
    itemListView:setContentSize(cc.size(size.width-50,150))
    itemListView:setDirection(ccui.ListViewDirection.horizontal)
    itemListView:setBounceEnabled(true)
    itemListView:setScrollBarEnabled(false)
    itemListView:setItemsMargin(10)
    itemListView:setPosition(cc.p(50, size.height/3))
    itemListView:setAnchorPoint(cc.p(0, 0))
    self.Bg:addChild(itemListView)

    for i=1,#items,1 do
        local v=items[i]
        local itemId=v.id
        local itemNum=v.num
        
        local item=DataManager:getTbxData("Item",itemId)
        local netData = {}
        netData.itemShowType = item.ItemType
        netData.itemId = item.ItemId
        netData.itemNum = itemNum

        local itemInfo = require("app.bean.ItemInfo").new(netData, item.ItemType)
        local item = UIManager:createPanelOnly("UIEmailItem2")
        item:setItemInfo(itemInfo)
        item:resetCenterPosition()
        item:setPosition(cc.p(75,75))
        local panel=ccui.Widget:create()
        panel:setContentSize(cc.size(150,150))
        panel:addChild(item)
        itemListView:pushBackCustomItem(panel)
    end
end

function M:showDiamond(rewardData)
    local shopGodsData = DataManager:getTbxData("Recharge", tonumber(self.mRechargeId))
    if shopGodsData then 
        self.godText:setString(Utils.showFormatText(Enum.Text.DiaMondBuySuccess, Utils.getFormatNumber_MuitiLanguage(rewardData.num)))
        self.godIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.ShopGoods, tonumber(shopGodsData.ShopGoodsIcon)), ccui.TextureResType.plistType)
    end
end

function M:showGold(rewardData)
    local shopGodsData = DataManager:getTbxData("ShopGoods", tonumber(self.mShopGodsId))
    if shopGodsData then 
        self.godText:setString(Utils.showFormatText(Enum.Text.GolsBuySuccess, Utils.getFormatNumber_MuitiLanguage(rewardData.num)))
        self.godIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.ShopGoods, tonumber(shopGodsData.ShopGoodsIcon)), ccui.TextureResType.plistType)
    end
end

function M:onConfirmBtnClick(ref)
    self:closePanel()
end


return M