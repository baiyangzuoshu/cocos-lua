local M = class("HeadFrameInfo")

function M:ctor(netData, showType)
    self.mNetData = netData
    self.mShowType = showType or Enum.HeadFrameTab.UnKnow

    self.mIndex = 1
end

function M:getNetData()
    return self.mNetData
end

function M:setNetData(netData)
    self.mNetData = netData
end

function M:getHeadFrameType()
    return self.mShowType
end

function M:getIndex()
    return self.mIndex
end

function M:setIndex(index)
    self.mIndex = index
end

return M