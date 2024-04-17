local M = class("StoreData")

function M:ctor()
    --用户购买信息
    self.mPurchaseInfo = {}
    self.reChargeInfo = {}
end

function M:getUserReChargeInfo()
    return self.reChargeInfo
end

function M:setGodsId(id)
    self.mGodsId = id
end

function M:setShopGodsId(id)
    self.mShopGodsId = id
end

function M:getPayInfo()
    return self.mPayInfo
end

function M:setPayInfo(payInfo)
    self.mPayInfo = payInfo
    if self.mPayInfo == nil then 
        self.mPayInfo = {}
    end
end

function M:getPurchaseInfo()
    return self.mPurchaseInfo
end

-------------------------------------网络消息--------------------------------
--请求进入商店
function M:requestEntryShop(shopId)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_EntryShop, { shopId = tonumber(shopId) })
end

--请求开放的商店列表
function M:requestShopList()
    UIUtils.showLoadingLayer(5, 10)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_UserShopList)
end

--购买商品
function M:requestShopBuy(data)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_ShopBuy, { shopId = data.shopId, goodId = data.goodId})
end

--领取vip礼包
function M:requestGetVipReward()
    --Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_GetVipReward)
end

--进入商店(更新数据用)
function M:S2C_EntryShop(data)    
    if not data then return end

    local userShopLog = data.log or {}

    if not Utils.isEmptyTable(userShopLog) then 
        for _,v in pairs(userShopLog) do 
            local shopGoods = DataManager:getTbxData("ShopGoods", v.goodsId)
            if shopGoods then 
                local isCanPurchase = true 
                if shopGoods.ShopGoodsCount <= v.buyTimes then 
                    isCanPurchase = false
                end
                self.mPurchaseInfo[tonumber(v.goodsId)] = isCanPurchase
            end
        end
    end

    --required int32 goodsId = 1; // 商品id
    --required int32 buyTimes = 2;  // 购买次数
    DataManager:dispatchMessage(Constant.CustomEvent.OnShopInfoUpdate)
end

--获取商店列表
function M:S2C_ShopList(data)
    UIUtils.closeLoadingLayer()
    if not data then return end 

    self.mPurchaseInfo = {}
    
    local shopList = data.shopList

    local purchaseInfo = data.userShopLog or {}
    if not Utils.isEmptyTable(purchaseInfo) then 
        for _,v in pairs(purchaseInfo) do 
            local shopGoods = DataManager:getTbxData("ShopGoods", v.goodsId)
            if shopGoods then 
                local isCanPurchase = true 
                if shopGoods.ShopGoodsCount <= v.buyTimes then 
                    isCanPurchase = false
                end
                self.mPurchaseInfo[tonumber(v.goodsId)] = isCanPurchase
            end
        end
    end

    self.reChargeInfo = data.rechargeInfo

    if not data.rechargeInfo then 
        self.reChargeInfo = {}
    end

    if not Utils.isEmptyTable(shopList) then 
        DataManager:dispatchMessage(Constant.CustomEvent.OnShopListArrive, shopList)
    end
end

--购买商品
function M:S2C_ShopBuy(data)
    if not data then return end

    local gainData = data.gain 
    
    -- 资源获得展示
    if not gainData then return end
    
    local items = {}
    for _ , v in pairs(gainData) do
        local item = {}
        item.itemId = v.itemId
        item.itemNum = v.itemNum
        item.itemType = v.itemType
        item.isNew = v.isNew
        table.insert(items, item)
    end

    if not Utils.isEmptyTable(items) then 
        local panel = UIManager:getOrCreatePanel("UIGetMulResLayer")
        if panel then
            panel:refreshData(items)
            panel:showToScene()
        end 
    end
    
    local   chargeNoviceProductTime=data.chargeNoviceProductTime
    if chargeNoviceProductTime then
        g_UserData:setChargeNoviceProductTime(chargeNoviceProductTime)
        DataManager:dispatchMessage(Constant.CustomEvent.refreshShowGift)
    end

    --沙盒模式不传数据，无isSandBox默认不是沙盒模式
    

    -- userShopLog
    local isFirstRecharge = data.isFirstRecharge

    if not isFirstRecharge then return end 

    local DiamondGods = DataManager:getTbxData("Recharge", self.mGodsId)
    if DiamondGods then 
        DataManager:dispatchMessage(Constant.CustomEvent.RefreshChargeData, {id = DiamondGods.ProductId, isPurchased = isFirstRecharge})
        --g_UserData:AFTrackEvent(Constant.AFEventPurchase, { { key = Constant.AFEventParamRevenue, value = DiamondGods.CentPrice/ 100, type = "float" }, { key = Constant.AFEventParamCurrency, value = "USD", type = "string" } })
    end

end

function M:S2C_UpdateVipExp(data)
    -- required int32 vipLevel = 1;
    -- required int32 vipExp = 2;
    if not data then return end 

    g_UserData:setVipLevel(data.vipLevel)
    g_UserData:setVipExp(data.vipExp)
    
    DataManager:dispatchMessage(Constant.CustomEvent.refreshVipUI)
    DataManager:dispatchMessage(Constant.CustomEvent.UpdateUserInfo)
    DataManager:dispatchMessage(Constant.CustomEvent.UIChannelCell_refreshHot)
end

function M:getGooglePayDataBack(data)
    local json = cjson.decode(data)
    for k,v in pairs(json) do
        Log.info(k.."..."..v)
    end

    g_StoreData:setPayInfo(json)
end




return M