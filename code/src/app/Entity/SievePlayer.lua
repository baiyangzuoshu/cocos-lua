local M=class("SievePlayer")


function M:ctor()
    self.mBetCountList={}
    self.mBetList={}
    self.mAvatar=""
    self.mChipNode=nil
end

function M:addOneBetInfo(betInfo)
    if self.mAvatar=="" then
        self.mAvatar = betInfo.avatar
    end
    if self.mBetList[betInfo.betType] then
        table.insert(self.mBetList[betInfo.betType],betInfo.chip)
        self.mBetCountList[betInfo.betType]=self.mBetCountList[betInfo.betType]+betInfo.chip
    else
        self.mBetList[betInfo.betType]={}
        table.insert(self.mBetList[betInfo.betType],betInfo.chip)
        self.mBetCountList[betInfo.betType]=betInfo.chip
    end
end

function M:getBetCount(betType)
    local _count = 0;
    if self.mBetCount[betType] then
        _count = self.mBetCount[betType]
    end
    return _count
end

function M:getBetList(betType)
    local betList = {}
    if self.mBetList[betType] then
        betList = self.mBetList[betType]
    end
    return betList
end

function M:getHeadIcon()
    return self.mAvatar
end


return M