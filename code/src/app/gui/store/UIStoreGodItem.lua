local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIStoreGodItem", UIPanel)

local Payment = require("app.native.Payment")

M.GUI_FILE_NAME = "csd.03_01_Shop.03_01_RechargeLayer.lua"

M.BINDGUIDATANODE = {
    --购买&充值
    ["RechargeIcon_1"] = { varname = "GodItemIcon" },
    ["RechargeIcon_2"] = { varname = "MiniIcon" },

    ["RechargeNum"] = { varname = "RechargeNum" },
    ["GiftNum"] = { varname = "giftNum" },

    --购买消费
    ["ConfirmButton"] = { varname = "ConfirmButton", onClick = "onResourcePayButtonClick" },
    ["ConfirmIcon"] = { varname = "ConfirmIcon" },
    ["DiamondNum_2"] = { varname = "DiamondNum_2" },
    ["ConfirmNum"] = { varname = "ConfirmNum" },
    ["ConfirmText"] = { varname = "ConfirmText" },

    --首充&赠送
    ["Double"] = { varname = "DoubleNode" },
    ["DoubleNum"] = { varname = "DoubleNum" },
    ["DoubleText"] = { varname = "DoubleTipText" },

    --金币商城
    ["GoldStore"] = { varname = "GoldStore" },

    --钻石充值
    ["DiamondStore"] = { varname = "DiamondStore" },
}

function M:onCreate()
    M.super.onCreate(self)

    self:setShadeShowModel(false)
    self.ConfirmButton:setSwallowTouches(false)
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.ShopGoods))

    self:resetRootNodePosition(cc.p(0, 0))
    self:resetRootNodeAnchorPoint(cc.p(0, 0))

    self.mAllNodes = {
        self.GoldStore,
        self.DiamondStore,
    }
end

function M:onlyShowNode(showNode)
    for _ , v in pairs(self.mAllNodes) do 
        if showNode == v then 
            v:setVisible(true)
        else
            v:setVisible(false)
        end
    end
end

function M:setItemInfo(itemInfo)
    self.mItemInfo = itemInfo
    self:refreshItemInfo()
end

function M:setData(data)
    self.mdata = data
end

function M:getData()
    return self.mdata
end

function M:refreshItemInfo()
    local showType = Enum.ShopShowType.Null
    if self.mItemInfo then
        showType = self.mItemInfo:getShopShowType()
    end

    if Enum.ShopShowType.Null == showType then
        
    elseif Enum.ShopShowType.Diamond == showType then
        self:showDiamond()
    elseif Enum.ShopShowType.Gold == showType then
        self:showGold()
    end

end

function M:showDiamond()
    self:onlyShowNode(self.DiamondStore)

    local cfgData = self:getData()
    if not cfgData then return end

    local ProductId = cfgData.ProductId
    local isFirstReCharge = true
    local netData = self.mItemInfo:getNetData()
    if not Utils.isEmptyTable(netData) then 
        for _,v in pairs(netData) do 
            if ProductId == v.id then 
                isFirstReCharge = not (v.isPurchased)
            end
        end
    end

    --充值数量
    local reChargeNum = cfgData.RechargeBaseDiamond
    self.RechargeNum:setString(Utils.getFormatNumber_Special_MuitiLanguage(reChargeNum))
    --首充
    
    if isFirstReCharge then 
        self.giftNum:setVisible(false)
        self.DoubleNode:setVisible(true)
        local giftNum = cfgData.FirstRechargeGiftDiamond
        self.DoubleNum:setString(Utils.getFormatNumber_Special_MuitiLanguage(giftNum))
    else
        self.giftNum:setVisible(true)
        self.DoubleNode:setVisible(false)
        local giftNum = cfgData.RechargeGiftDiamond
        if giftNum ~= 0 then 
            self.giftNum:setString(string.format("+%s", Utils.getFormatNumber_Special_MuitiLanguage(giftNum)))
        else
            self.giftNum:setVisible(false)
        end
    end
    
    --售价动态显示
    local payInfo = g_StoreData:getPayInfo()
    if payInfo then 
        self.ConfirmText:setVisible(false)
        self.DiamondNum_2:setString(payInfo[ProductId])
    else
        self.ConfirmText:setVisible(true)
        self.DiamondNum_2:setString(tostring(cfgData.CentPrice / 100))
    end
    --商品图片
    self.GodItemIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.ShopGoods, cfgData.ShopGoodsIcon), ccui.TextureResType.plistType)

    self.MiniIcon:loadTexture("03_01_Shop/icon_013.png", ccui.TextureResType.plistType)
end

function M:showGold(idx)
    self:onlyShowNode(self.GoldStore)

    local cfgData = self:getData()
    if not cfgData then return end

    --充值数量
    local reChargeNum = cfgData.GetResData[1][2][1]
    self.RechargeNum:setString(Utils.getFormatNumber_Special_MuitiLanguage(reChargeNum))
    --赠送数量
    self.giftNum:setVisible(true)
    local giftResData = cfgData.GiftResData
    if not Utils.isEmptyTable(giftResData) then
        local giftResNum = giftResData[1][2][1]
        self.giftNum:setString(string.format("+%s", Utils.getFormatNumber_Special_MuitiLanguage(giftResNum)))
    else
        self.giftNum:setVisible(false)
    end
    --售价
    self.ConfirmNum:setString(Utils.getFormatNumber_Special_MuitiLanguage(self:getCost()))
    --商品图片
    self.GodItemIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.ShopGoods, cfgData.ShopGoodsIcon), ccui.TextureResType.plistType)

    self.MiniIcon:loadTexture("03_01_Shop/icon_014.png", ccui.TextureResType.plistType)
end

--购买
function M:onResourcePayButtonClick(ref)
    if self.mItemInfo then
        --商店id = 0 钻石充值   ~具体见 Enum.ShopShowType
        local shopId = self.mItemInfo:getShopShowType()
        if shopId == Enum.ShopShowType.Gold then
            self:BuyGold()
        elseif shopId == Enum.ShopShowType.Diamond then
            self:BuyDiamond()
        end
    end
end

function M:BuyGold()
    local shopInfo = self:getData()
    if shopInfo then
        local panel = UIManager:getOrCreatePanel("UIDiceCupItemShowLayer")
        if panel then
            panel:showToScene()
            panel:setItemInfo(shopInfo)
            panel:setConfirmCb(
                    function()
                        --g_StoreData:setShopGodsId(shopInfo.ShopGoodsId)
                        local data = {}
                        data.shopId = Enum.ShopShowType.Gold
                        data.goodId = shopInfo.ShopGoodsId
                        g_StoreData:requestShopBuy(data)
                    end
            )
        end
    end
end

function M:BuyDiamond()
    if DeviceUtils.isWindows() then

    elseif DeviceUtils.isIOS() then
        local shopInfo = self:getData()
        if shopInfo then
            g_StoreData:setGodsId(shopInfo.RechargeId)
            Payment.startAppStorePay({productId = shopInfo.ProductId})
        end
    elseif DeviceUtils.isAndroid() then
        local shopInfo = self:getData()
        if shopInfo then
            g_StoreData:setGodsId(shopInfo.RechargeId)
            Payment.startGooglePlayPay({product_Id = shopInfo.ProductId})
        end
    end
end

function M:getCost()
    local costNum = self:getData().CostResData[1][2][1]
    local discount = self:getData().Discount
    local cost = costNum
    if discount ~= 100 then
        cost = math.ceil((costNum * discount) / 100)
    end
    return cost
end

function M:getReward()
    --充值数量
    local reChargeNum = self:getData().GetResData[1][2][1]
    --赠送数量
    local giftResData = self:getData().GiftResData
    local giftResNum = 0
    if not Utils.isEmptyTable(giftResData) then
        giftResNum = giftResData[1][2][1]
    end

    return (reChargeNum + giftResNum)
end

return M