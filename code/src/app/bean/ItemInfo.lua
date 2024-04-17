local M = class("ItemInfo")

function M:ctor(netData, showType, isReceived)
    self.mNetData = netData
    self.mShowType = showType or Enum.ItemShowType.NULL
    self.mIsReceived = isReceived or false

    self.mCfgData = nil
end

function M:getNetData()
    return self.mNetData
end

function M:setNetData(netData)
    self.mNetData = netData
end

function M:getItemShowType()
    return self.mShowType
end

function M:getIsReceived()
    return self.mIsReceived 
end

function M:getCfgData()
    if self.mCfgData == nil then
        self.mCfgData = DataManager:getTbxData("Item", tostring(self:getNetData().itemId))
    end

    return self.mCfgData or {}
end

return M