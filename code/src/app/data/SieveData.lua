local M = class("SieveData")
local palayer = require("app.Entity.SievePlayer")
   
function M:ctor()
    self:clearAllData()
end

function M:clearAllData()
    self.mAllPlayerBetData={} --所有玩家下注信息
    self.mBankerInfo=nil  --庄家信息
    self.mSecBankerInfo = nil  --备选庄
    self.mRobBankerMoney = 100000;  --抢庄需要消耗
    self.mShaiBaoState = Enum.ShaibaoState.Init --当前游戏状态
    self.mNowStateEndTime = 0;  -- 当前状态剩余时间
    self.mDiceRecordList={}  -- 开筛子记录列表
    self.mDiceDoubleAreaList = {}  --加倍区域列表

    self.mAllNeeedHandleBetMessage={}

    self.mAllPlayerInfos={}
    self.mMuteList = {}
    self.mAudioCheckList = {}

    self.mChip=0
end

function M:getmMuteList()
    return self.mMuteList
end

function M:addMuteMember(uid)
    if tonumber(uid) == -1 then
        return
    end
    for k, v in pairs(self.mMuteList) do
        if v == tostring(uid) then
            return
        end
    end
    table.insert(self.mMuteList,tostring(uid))
    DataManager:dispatchMessage(Constant.CustomEvent.refreshMuteList)
end

function M:removeMuteMember(uid)
    for k, v in pairs(self.mMuteList) do
        if v == uid then
            table.remove(self.mMuteList,k)
        end
    end
    DataManager:dispatchMessage(Constant.CustomEvent.refreshMuteList)
end

function M:addAudioCheckList(uid)
    for i, v in ipairs(self.mAudioCheckList) do
        if v == tostring(uid) then
            return
        end
    end
    table.insert(self.mAudioCheckList,tostring(uid))
end

function M:removeAudioCheckList(uid)
    for index, value in ipairs(self.mAudioCheckList) do
        if value == tostring(uid) then
            table.remove(self.mAudioCheckList,index)
        end 
    end
end

function M:getAudioCheckList(uid)
    for index, value in ipairs(self.mAudioCheckList) do
        if value == tostring(uid) then
            return true
        end 
    end
    return false
end

function M:getAudioIsSound()
    return Preference:getBool("ShaibaoAudioIsSound"..g_UserData:getUserId(),true)
end

function M:setAudioIsSound(isSound)
    Preference:setBool("ShaibaoAudioIsSound"..g_UserData:getUserId(),isSound)
end

function M:getIsMicOpened()
    return Preference:getBool("ShaibaoIsMicOpened"..g_UserData:getUserId(),false)
end

function M:setIsMicOpened(isSound)
    Preference:setBool("ShaibaoIsMicOpened"..g_UserData:getUserId(),isSound)
end

function M:getBankerAllMoney()
    return self.mBankerInfo.chip
end

function M:s2cAvatarInfo(data)
    data.avatarInfo=data.avatarInfo or {}

    for i,v in ipairs(data.avatarInfo) do
        self.mAllPlayerInfos[tostring(v.uid)] = v
    end

    DataManager:dispatchMessage(Constant.CustomEvent.ShaiBao_refreshSayHeroHead,data)
    DataManager:dispatchMessage(Constant.CustomEvent.DiceBabyShutupPopUp_refreshData,data)
end

function M:getPlayerAvatar(uid)
    if self.mAllPlayerInfos[tostring(uid)] then
        return self.mAllPlayerInfos[tostring(uid)].avatar
    end
    local _uids={}
    _uids[1] = tostring(uid)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sAvatarInfo, {uids=_uids})
    return nil
end

function M:getInfoByuid(uid)
    return self.mAllPlayerInfos[tostring(uid)]
end

function M:isMeBeBanker()
    Log.info("isMeBeBanker")
    Log.print_table(self.mBankerInfo)
    if self.mBankerInfo and self.mBankerInfo.banker then
        Log.info("my userid:"..g_UserData:getUserId().." self.mBankerInfo.bankerInfo.uid:"..self.mBankerInfo.banker.uid)
        return g_UserData:isSelfUserId(self.mBankerInfo.banker.uid)
    end
    
    return false
end

function M:getShaiBaoGameState()
    return self.mShaiBaoState
end

--获取当前状态剩余时间
function M:getBetingLeftTime()
    return self.mNowStateEndTime
end

--获取抢庄消耗
function M:getRobBankerMoney()
    return self.mRobBankerMoney
end

--获取是否有备选庄家
function M:isHaveSecBanker()
    if self.mSecBankerInfo then
        return self.mSecBankerInfo
    end

    return nil
end

--筛子结果记录
-- function M:MSG_c2sShaibaoDiceHistory()
--     Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sShaibaoDiceHistory,{})
-- end

--庄家选择翻倍
function M:MSG_c2sShaibaoDouble(betType)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sShaibaoDouble,{area=betType})
end

--下注请求
function M:MSG_c2sShaibaoBet(chip,betType)
    Log.info("all in"..chip)
    local isAllin = false
    if tostring(chip) == "99999" then
        isAllin = true
        Log.info("all in")
        chip=g_UserData:getGold()
        if chip > GSystem.AllinGoldLimit then
            chip = GSystem.AllinGoldLimit
        end
        --Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sShaibaoBet,{chip=chip,betType=betType})
    end
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sShaibaoBet,{chip=chip,betType=betType,isAllin=isAllin})
    
end

--抢庄
function M:MSG_c2sShaibaoRobBanker(chip)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sShaibaoRobBanker,{cost=self.mRobBankerMoney,chip=chip})
end

--庄家下庄
function M:MSG_c2sShaibaoBankerOff()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sShaibaoBankerOff,{})
end

function M:getBankerInfo()
    return self.mBankerInfo
end

--筛宝初始化数据
function M:s2cShaibaoInfo(data)
    self.mAllPlayerBetData={}
    self.mDiceDoubleAreaList = {}
    self.mDiceRecordList={}
    self.mAllNeeedHandleBetMessage={}
    self.mBankerInfo = clone(data.banker)
    if data.secBanker then
        self.mSecBankerInfo = data.secBanker
    end

    self.mRobBankerMoney = data.robBankerCost
    self.mShaiBaoState = data.gameState
    if data.betList then
        for i,v in ipairs(data.betList) do
            local _data={}
            _data.betInfo = v
            self:s2cShaibaoBet(_data)
        end
    end
    
    self.mNowStateEndTime = data.timeLeft

    if data.diceRecord then
        for i,v in ipairs(data.diceRecord) do
            table.insert(self.mDiceRecordList,1,v.dice)
        end
    end
    
    if data.area then
        for i,v in ipairs(data.area) do
            table.insert(self.mDiceDoubleAreaList, v)
        end
    end
    
    DataManager:dispatchMessage(Constant.CustomEvent.ShaiBao_RefreshBankerInfo,{banker=data.banker,secBanker=data.secBanker})

    DataManager:dispatchMessage(Constant.CustomEvent.ShaiBao_refreshInfo,data)

    DataManager:dispatchMessage(Constant.CustomEvent.ShaiBao_Double,data)
end

function M:getAllDicesData()
    return self.mDiceRecordList
end


--开筛子记录
-- function M:s2cShaibaoDiceHistory(data)
--     table.insert(self.mDiceRecordList,data.diceResult)
--     DataManager:dispatchMessage(Constant.CustomEvent.ShaiBao_refreshInfo,data.diceResult)
-- end

function M:getDoubleAreaList()
    return self.mDiceDoubleAreaList
end
--设置翻倍区域
function M:s2cShaibaoDouble(data)
    table.insert(self.mDiceDoubleAreaList, data.area)
    if data.betInfo then
        for i,v in ipairs(data.betInfo) do
            local _data={}
            _data.betInfo = v
            self:s2cShaibaoBet(_data)
        end
    end
    

    DataManager:dispatchMessage(Constant.CustomEvent.ShaiBao_Double,data)
end

--筛宝开局
function M:s2cShaibaoStart(data)
    self.mAllPlayerBetData={}
    self.mDiceDoubleAreaList = {}
    self.mAllNeeedHandleBetMessage={}
    self.mNowStateEndTime = data.openTimeLeft
    self.mShaiBaoState = Enum.ShaibaoState.Beting
    DataManager:dispatchMessage(Constant.CustomEvent.ShaiBao_Start,self.mNowStateEndTime)
end

--抢庄回复
function  M:s2cShaibaoRobBanker(data)
    if data.result == 1 then
        UIUtils.popToadtByMessageId("60026")
    end
    DataManager:dispatchMessage(Constant.CustomEvent.ShaiBao_robBetResult,data.result)
end

--庄家信息刷新
function  M:s2cShaibaoBankerUpdate(data)
    local oldBankerInfo = nil
    if self.mBankerInfo then
        oldBankerInfo = self.mBankerInfo
        if oldBankerInfo.banker and oldBankerInfo.banker.uid ==g_UserData:getUserId() then
            Log.info("刷新玩家下庄信息"..g_UserData:getUserId())
            DataManager:dispatchMessage(Constant.CustomEvent.ShaiBao_BankerDownLoadRefresh,{offReason=data.banker.offReason})
        end
    end
    self.mBankerInfo = data.banker
    self.mRobBankerMoney = data.banker.robCost
    if data.secBanker then
        self.mSecBankerInfo = data.secBanker
    else
        self.mSecBankerInfo = nil
    end
    

    DataManager:dispatchMessage(Constant.CustomEvent.ShaiBao_RefreshBankerInfo,{banker=data.banker,secBanker=data.secBanker})

end

--下注回复
function M:s2cShaibaoBet(data,needAct)
    if not data.betInfo then return end
    if self.mAllPlayerBetData[data.betInfo.uid] then
        self.mAllPlayerBetData[data.betInfo.uid]:addOneBetInfo(data.betInfo)
    else
        self.mAllPlayerBetData[data.betInfo.uid] = palayer.new()
        self.mAllPlayerBetData[data.betInfo.uid]:addOneBetInfo(data.betInfo)
    end
    if data.betInfo.isAllin then
        self:setbet(data)
    else
        if data.betInfo.chip ~=100 and data.betInfo.chip ~=1000 and data.betInfo.chip ~=10000 and data.betInfo.chip ~=100000 and data.betInfo.chip ~=1000000 and
           data.betInfo.chip ~=100 * 2 and data.betInfo.chip ~=1000 * 2 and data.betInfo.chip ~=10000 * 2 and data.betInfo.chip ~=100000 * 2 and data.betInfo.chip ~=1000000 * 2 then
            local nums = { 100, 1000, 10000, 100000, 1000000 }
            local betInfo = clone(data.betInfo)
            local index = 0

            for i = 1, #nums do
                if betInfo.chip - nums[i] >= 0 then
                    index = i
                end
            end
            local newChip = index + 1
            if newChip > 5 then
                newChip = 5
            end
            betInfo.chip = nums[newChip]
            table.insert(self.mAllNeeedHandleBetMessage,betInfo)
        else
            self:setbet(data)
        end
    end
    
end

function M:setbet(data)
    if self:getChipNumber(data.betInfo.chip,1000000)>0 then
        local chipNum = self:getChipNumber(data.betInfo.chip,1000000)
        for i=1,chipNum do
            local betInfo = clone(data.betInfo)
            betInfo.chip = 1000000
            table.insert(self.mAllNeeedHandleBetMessage,betInfo)
        end
    end
    if self:getChipNumber(data.betInfo.chip,100000)>0  then
        local chipNum = self:getChipNumber(data.betInfo.chip,100000)
        for i=1,chipNum do
            local betInfo = clone(data.betInfo)

            betInfo.chip = 100000

            table.insert(self.mAllNeeedHandleBetMessage,betInfo)
        end

    end
    if self:getChipNumber(data.betInfo.chip,10000)>0  then
        local chipNum = self:getChipNumber(data.betInfo.chip,10000)
        for i=1,chipNum do
            local betInfo = clone(data.betInfo)

            betInfo.chip = 10000

            table.insert(self.mAllNeeedHandleBetMessage,betInfo)
        end
    end
    if self:getChipNumber(data.betInfo.chip,1000)>0  then
        local chipNum = self:getChipNumber(data.betInfo.chip,1000)
        for i=1,chipNum do
            local betInfo = clone(data.betInfo)

            betInfo.chip = 1000

            table.insert(self.mAllNeeedHandleBetMessage,betInfo)
        end
    end
    if self:getChipNumber(data.betInfo.chip,100)>0  then
        local chipNum = self:getChipNumber(data.betInfo.chip,100)
        for i=1,chipNum do
            local betInfo = clone(data.betInfo)

            betInfo.chip = 100

            table.insert(self.mAllNeeedHandleBetMessage,betInfo)
        end
    end
end

function M:getChipNumber(value,chipSize)
    if chipSize == 1000000 then
        return math.floor(value/chipSize)
    else
        return math.floor(math.floor(value%(chipSize*10))/chipSize)
    end
end

--对局结束
function M:s2cShaibaoResult(data)
    self.mShaiBaoState = Enum.ShaibaoState.Init

    DataManager:dispatchMessage(Constant.CustomEvent.ShaiBao_Result,data)

    local betResult=data.betResult or {}
    for _,v in ipairs(betResult) do
        if g_UserData:isSelfUserId(v.uid) then
            self.mChip=self.mChip+v.chipWin
        end
    end
    
    g_UserData:checkGoldNeedEvent(self.mChip)
    self.mChip=0
end

function M:s2cShaibaoGameover(data)
    self.mShaiBaoState = Enum.ShaibaoState.Init
    table.insert(self.mDiceRecordList,1,data.dice.dice)

    DataManager:dispatchMessage(Constant.CustomEvent.ShaiBao_s2cShaibaoGameover,data)
end

function M:s2cShaibaoMagicEmojiBroadcast(data)
    DataManager:dispatchMessage("ShaiBao_s2cShaibaoMagicEmojiBroadcast",data)
end

--主动下庄回复
function M:s2cShaibaoBankerOff(data)
    UIUtils.popToadtByMessageId("60027")
end

--获取筛宝数据
function M:getAllSieveData()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sShaibaoInfo, {})
end

function M:getShaiZiResult(diceList)
    if not diceList then return end
    local diceType={}
    table.sort(diceList,function (a,b)
        return a>b
    end)

    local diceSum = 0;
    for i,v in ipairs(diceList) do
        diceSum=diceSum+v
        if not self:isHaveThisDice(diceType,v) then
            table.insert(diceType, v)
        end
    end

    local isBaoZi = false
    if diceList[1] == diceList[2] and diceList[2] == diceList[3] then
        table.insert( diceType, Enum.ShaibaoDiceType.Same)
        isBaoZi=true
    end

    if diceList[1]-1 == diceList[2] and diceList[2] - 1 == diceList[3]   then
        table.insert(diceType, Enum.ShaibaoDiceType.Series)
    end

    if not isBaoZi then
        if diceSum>10 then
            table.insert(diceType, Enum.ShaibaoDiceType.BigDice)
        else
            table.insert(diceType, Enum.ShaibaoDiceType.SmallDice)
        end

        if diceSum%2 == 1 then
            table.insert(diceType, Enum.ShaibaoDiceType.Single)
        else
            table.insert(diceType, Enum.ShaibaoDiceType.Double)
        end
        
    end

    return diceType
end

function  M:isBaozi(diceList)
    local isBaoZi = false
    if diceList[1] == diceList[2] and diceList[2] == diceList[3] then

        isBaoZi=true
    end

    return isBaoZi
end

function M:isShunZi(diceList)
    if diceList[1]+1 == diceList[2] and diceList[2] + 1 == diceList[3]   then
        return true
    end
    return false
end

function M:isHaveThisDice(diceList,dice)
    for i,v in ipairs(diceList) do
        if v == dice then
            return true
        end
    end
    return false
end

function M:onUpdate(dt)
    if table.getn(self.mAllNeeedHandleBetMessage)>0 then
        --Log.info("回调 sievedata update"..table.getn(self.mAllNeeedHandleBetMessage))
        local newMessage = {}
        for i,v in ipairs(self.mAllNeeedHandleBetMessage) do
            if i <5 then
                v.needAct = true
                if #self.mAllNeeedHandleBetMessage>5 then
                    v.needAct = false
                end
                DataManager:dispatchMessage(Constant.CustomEvent.ShaiBao_BetEvent,v)
            else
                table.insert( newMessage, v )
            end
        end

        self.mAllNeeedHandleBetMessage = newMessage
    end
end

--区域最大显示人数
function M:getShowNumLimit(betType)
    if betType > 6 then
        return GSystem.AreaPlayerShowNumLimit
    else
        return GSystem.DiceAreaPlayerShowNumLimit
    end
end

function M:getAllPlayerBetData()
    return self.mAllPlayerBetData
end

function M:playEffect(filePath, loop, volume)
    if g_HotData:haveNeedGuide() then return end

    SoundSystemManager:playEffect(filePath, loop, volume)
end

function M:playSound002(volume)
    if g_HotData:haveNeedGuide() then return end
    
    SoundSystemManager:playSound002(volume)
end

function M:playSound008(volume)
    if g_HotData:haveNeedGuide() then return end

    SoundSystemManager:playSound008(volume)
end

function M:playSound004(volume)
    if g_HotData:haveNeedGuide() then return end

    SoundSystemManager:playSound004(volume)
end

return M