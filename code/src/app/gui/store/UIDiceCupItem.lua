local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIDiceCupItem", UIPanel)

local Payment = require("app.native.Payment")

M.GUI_FILE_NAME = "csd.03_01_Shop.03_01_DiceBoxLayer.lua"

M.BINDGUIDATANODE = {
    --购买&充值
    ["DiceBoxIcon"] = { varname = "DiceBoxIcon" },

    --购买消费
    ["ConfirmButton"] = { varname = "ConfirmButton", onClick = "onResourcePayButtonClick" },
    ["ConfirmIcon"] = { varname = "ConfirmIcon" },
    ["ConfirmNum"] = { varname = "ConfirmNum" },

    ["DiceBoxText"] = { varname = "DiceBoxText" },
    ["PossessNode"] = { varname = "PossessNode" },
    ["ConfirmNode"] = { varname = "ConfirmNode" },
}

function M:onCreate()
    M.super.onCreate(self)

    self:setShadeShowModel(false)

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.ShopGoods))

    self:resetRootNodePosition(cc.p(0, 0))
    self:resetRootNodeAnchorPoint(cc.p(0, 0))
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

    if Enum.ShopShowType.DiceCup == showType then
        self:showDiceCup()
    end
end

function M:showDiceCup()
    local cfgData = self:getData()
    if not cfgData then return end

    --售价
    self.ConfirmNum:setString(Utils.getFormatNumber_Special_MuitiLanguage(self:getCost()))

    self.DiceBoxText:setString(cfgData.ShowName)
    --商品图片
    self.DiceBoxIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.ShopGoods, cfgData.ShopGoodsIcon), ccui.TextureResType.plistType)

    if self.mItemInfo then 
        local netData = self.mItemInfo:getNetData()
        if not Utils.isEmptyTable(netData) then 
            local isCanPurchase = netData[tonumber(cfgData.ShopGoodsId)]
            if isCanPurchase == nil then 
                isCanPurchase = true
            end
            self:updatePayButton(isCanPurchase)
        else
            self:updatePayButton(true)
        end
    end
end

function M:updatePayButton(isCanPurchase)
    -- self.ConfirmButton:setTouchEnabled(isCanPurchase)
    -- self.ConfirmButton:setBright(isCanPurchase)
    self.ConfirmNode:setVisible(isCanPurchase)
    self.PossessNode:setVisible(not isCanPurchase)
end

--购买
function M:onResourcePayButtonClick(ref)
    if self.mItemInfo then
        --商店id = 0 钻石充值   ~具体见 Enum.ShopShowType
        local shopId = self.mItemInfo:getShopShowType()
        if shopId == Enum.ShopShowType.DiceCup then
            --购买
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
                                data.shopId = Enum.ShopShowType.DiceCup
                                data.goodId = shopInfo.ShopGoodsId
                                g_StoreData:requestShopBuy(data)
                            end
                    )
                end
            end
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

return M