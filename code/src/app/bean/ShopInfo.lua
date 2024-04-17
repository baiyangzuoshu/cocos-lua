local M = class("ShopInfo")

function M:ctor(netData, cfgData, shopType)
    self.mNetData = netData
    self.mCfgData = cfgData
    self.mShopType = shopType or Enum.ShopShowType.Null
end

function M:getNetData()
    return self.mNetData
end

function M:setNetData(netData)
    self.mNetData = netData
end

function M:getCfgData()
    return self.mCfgData
end

function M:setCfgData(cfgData)
    self.mCfgData = cfgData
end

function M:getShopShowType()
    return self.mShopType
end

return M