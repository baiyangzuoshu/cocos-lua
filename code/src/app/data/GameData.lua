--
--------------------------------------------------------------------------------
--  FILE:  GameData.lua
--  说明
--      游戏数据管理
--------------------------------------------------------------------------------
--
local GameSeat = require("app.bean.GameSeat")

local M = class("GameData")

M.GameType = {
    Base = 1,
}

M.GameState = {
    Idel = 1,
    Started = 2, --游戏已开始
    Over=3
}

M.RoundState = {
    Wait = 1, -- 等待开始
    Playing = 2, -- 叫点
    FlyBet = 3, -- 竞猜飞苍蝇
    GameOver = 4, -- 结束结算
}

M.LeaveType = {
    Normal = 1, -- 正常离开房间
    Kicked = 2, -- 金币不足
}

M.BetCrit = {
    Normal = 0, -- 0 不暴击
    AllIn = 1, -- 1 4人全押注暴击
    WinnerTakeAll = 2, -- 2 通杀
    LoserNothing = 3, -- 3 通赔
}

M.DiceType = {
    Normal = 0, -- 0 正常点
    Straight = 1, -- 1 顺子
    Leopard = 2, -- 2 豹子
}

M.MAX_PLAYERS = 8

function M:ctor()
    -- 参与游戏人数
    self.mGamingPlayerCount = 0

    -- 房间id 
    self.mGameId = ""

    -- 房间类型
    self.mGameType = M.GameType.Base

    -- 游戏状态
    self.mGameState = M.GameState.Idel

    -- 游戏子状态
    self.mRoundState = M.RoundState.Wait

    self.mIsQuitMach = false

    -- 距离下一状态剩余时间
    self.mNextGameTimeStamp = -1

    -- 回合数
    self.mGameRound = 0

    -- 自己的椅子id
    self.mMineSeatId = 0

    -- 底注信息
    self.mBetBase = 100

    --底注等级
    self.mBetLevel = 1

    --游戏是否再开始
    self.mIsPlayStart = false

    -- 庄家信息
    self.mDealerSeatId = -1

    -- 房间内的所有玩家
    self.mPlayers = {}
    for i = 0, M.MAX_PLAYERS - 1 do
        self.mPlayers[i] = GameSeat.new(i)
    end

    --观战玩家列表
    self.mAudiences = {}
    --竞猜玩家列表
    self.mBetUserList = {}
    -- 1点被叫状态
    self.mOneCalled = false

    -- 叫点信息
    self.mCallInfo = { seatId = -1, point = -1, num = -1 }

    -- 当前玩家
    self.mCurrSeatInfo = { seatId = -1, timeStamp = -1 }

    -- 开骰盅竞猜信息
    self.mOpenDiceBoxInfo = { callSeatId = -1, openSeatId = -1, timeStamp = -1, multiple = 1 }

    self.mVoteInfo = {}
    self.mBoxSoundId={
        [1]=1,
        [2]=2,
        [3]=3,
        [4]=4,
        [5]=5,
        [6]=6,
        [7]=7,
    }
    self.mNumberSoundId={
        [2]=7,
        [3]=8,
        [4]=9,
        [5]=10,
        [6]=11,
        [7]=12,
        [8]=13,
        [9]=14,
        [10]=15,
        [11]=16,
        [12]=17,
        [13]=18,
        [14]=19,
        [15]=20,
        [16]=21,
        [17]=22,
        [18]=23,
        [19]=24,
        [20]=25,
        [21]=26,
        [22]=27,
        [23]=28,
        [24]=29,
        [25]=30,
        [26]=31,
        [27]=32,
        [28]=33,
        [29]=34,
        [30]=35,
        [31]=36,
        [32]=37,
        [33]=38,
        [34]=39,
        [35]=40,
        [36]=41,
    }

    self.mOpenSoundId = 50
    self.mQOpenSoundId = 51
    self.mGuessingSoundId = 52


    self.mAudioIsEnable = true
    
    --是否自动退出房间
    self.bAutoLeaveRoom = false

    --是否是第一次参与游戏
    self.misFirstGaming = false

    self.mRoomConfigId=1000

    self:clearGuessData()

    self.mNeedShowUpbet = false

    self.mUpbet = 0 --提升后的底注

    self.mUserstatus = Enum.Userstatus.Loking

    self.mChuiniuMuteList = {} --吹牛禁言列表
    self.GamingPlayerNum = {} --吹牛房间人数
    self.personalInfo={}
    self.privateFriendUID=""
end

function M:setPrivateFriendUID(uid)
    self.privateFriendUID=uid
end

function M:getPrivateFriendUID()
    return self.privateFriendUID
end

function M:getPersonalInfo()
    return  self.personalInfo
end

function M:getChuiniuMuteList()
    return self.mChuiniuMuteList
end

function M:addChuiniuMuteMember(uid)
    for k, v in pairs(self.mChuiniuMuteList) do
        if v == tostring(uid) then
            return
        end
    end
    table.insert(self.mChuiniuMuteList,tostring(uid))
    DataManager:dispatchMessage(Constant.CustomEvent.refreshChuiniuMuteList)
end

function M:removeChuiniuMuteMember(uid)
    for k, v in pairs(self.mChuiniuMuteList) do
        if v == uid then
            table.remove(self.mChuiniuMuteList,k)
            break
        end
    end
    DataManager:dispatchMessage(Constant.CustomEvent.refreshChuiniuMuteList)
end

function M:getmNeedShowUpbet()
    return self.mNeedShowUpbet
end

function M:setmNeedShowUpbet(bool)
    self.mNeedShowUpbet = bool
end

function M:getmUserstatus()
    return self.mUserstatus
end

function M:setmUserstatus(status)
    self.mUserstatus = status
end

function M:getmUpbet()
    return self.mUpbet
end

function M:setmUpbet(bet)
    self.mUpbet = bet
end

function M:clearGuessData()
    self.mGuessType=Enum.GuessType.Size
    self.mGuessData={}
    self.mGuessData.banker={}--庄家数据
    self.mGuessData.Leopard={}--豹子数组
    self.mGuessData.bankerCost=0--抢庄金币
    self.mGuessData.bankerGold=0--庄家押金
    self.mGuessData.goldPool=0--奖金池子
    self.mGuessData.player={}--闲家数据
    self.mGuessData.goodLuck=nil--豹子大奖获得者
    self.mGuessData.sizeResult={}
end

function M:insertSizeResult(ret)
    table.insert(self.mGuessData.sizeResult,ret)
end

function M:clearSizeResult()
    self.mGuessData.sizeResult={}
end

function M:getSizeResult()
    return self.mGuessData.sizeResult
end

function M:getGuessLuckData()
    return self.mGuessData.goodLuck
end

function M:getGuessLeopardByIndex(index)
    for i=1,#self.mGuessData.Leopard do
        if index==self.mGuessData.Leopard[i].baoziDiget then
            return self.mGuessData.Leopard[i]
        end
    end

    return nil
end

function M:getGuessRankData()
    return self.mGuessData.rank
end

function M:getGuessPlayerData()
    return self.mGuessData.player
end

function M:getGuessGoldData()
    return self.mGuessData.goldPool
end

function M:getGuessBankerGold()
    return self.mGuessData.bankerGold
end

function M:getGuessBankerCost()
    return self.mGuessData.bankerCost
end

function M:getGuessBankerData()
    return self.mGuessData.banker
end

function M:isGuessSizeIng()
    return self.mGuessType==Enum.GuessType.Size
end

function M:isGuessLeopardIng()
    return self.mGuessType==Enum.GuessType.Leopard
end

function M:isGuessEggIng()
    return self.mGuessType==Enum.GuessType.Egg
end

function M:openSound(sex)
    local soundStr = SoundSystemManager:getCVSoundStrById(self.mOpenSoundId,sex)
    if soundStr =="" then return end
    SoundSystemManager:playCv(soundStr)
end
function M:qopenSound(sex)
    local soundStr = SoundSystemManager:getCVSoundStrById(self.mQOpenSoundId,sex)
    if soundStr =="" then return end
    SoundSystemManager:playCv(soundStr)
end
function M:playSayDian(number,box,sex)
    local numstr = SoundSystemManager:getCVSoundStrById(self.mNumberSoundId[number],sex)
    local diandtr=SoundSystemManager:getCVSoundStrById(self.mBoxSoundId[box],sex)

    if numstr=="" or diandtr=="" then return end
    SoundSystemManager:playCv(numstr)
    local panel = UIManager:getPanel("UIGameLayer")
    if panel then
        panel:runAction(cc.Sequence:create(cc.DelayTime:create(0.6), cc.CallFunc:create(function ()
            SoundSystemManager:playCv(diandtr)
        end)))
    elseif UIManager:getPanel("UIGameGuideLayer") then
        panel = UIManager:getPanel("UIGameGuideLayer")
        panel:runAction(cc.Sequence:create(cc.DelayTime:create(0.6), cc.CallFunc:create(function ()
            SoundSystemManager:playCv(diandtr)
        end)))
    end
end
function M:guessingSound(sex)
    local soundStr = SoundSystemManager:getCVSoundStrById(self.mGuessingSoundId,sex)
    if soundStr =="" then return end
    SoundSystemManager:playCv(soundStr)
end
function M:getRequestAppPermission()
    Log.info("请求权限")
    if DeviceUtils.isIOS() then
        --local ok, ret = Launcher.callStaticMethod("AppController", "finishTransaction", { transactionIdentifier = productData.transactionIdentifier })
    elseif DeviceUtils.isAndroid() then
        Log.info("请求权限222222222222222222222222")
        local ok, ret = Launcher.callStaticMethod(Launcher.javaClassName, "getRequestAppPermission", {}, nil)
    end
end
function M:AudioPerissimIsOpen()
    
    local ok, ret = Launcher.callStaticMethod(Launcher.javaClassName, "isRequestAppPermission", {}, "()I")
    if ok then
        if ret == 1 then
            return true
        end
    end
    return false
end
function M:getIosVoidPermission()
    
    if DeviceUtils.isIOS() then
        local ok, ret = Launcher.callStaticMethod("AppController", "checkVoiceAuthority")
        if ok then
            return ret
        end
    end

    return 0
end
function M:getAudioIsEnable()
    return self.mAudioIsEnable
end

function M:setAudioIsEnable(isEnable)
    self.mAudioIsEnable = isEnable
end

function M:getAudioIsSound()
    return Preference:getBool("ChuiniuAudioIsSound"..g_UserData:getUserId(),true)
end

function M:setAudioIsSound(isSound)
    Preference:setBool("ChuiniuAudioIsSound"..g_UserData:getUserId(),isSound)
end

function M:setCallInfo(seatId, point, num)

    self.mCallInfo = { seatId = seatId, point = point, num = num }

    if not self.mOneCalled then
        self.mOneCalled = (point == 1)
    end
end

function M:getVoteInfo()
    return self.mVoteInfo
end

function M:MSG_S2C_CansualMatchGameBack(data)
    if data.ok then
        self:leaveRoom()
    end
end

function M:getCallInfo()
    return self.mCallInfo
end
--匹配房间等级返回
function M:S2C_MatchRoomLevel(data)

    DataManager:dispatchMessage(Constant.CustomEvent.GameMachStateChange, data)
end

function M:isOneCalled()
    return self.mOneCalled
end

function M:setCurrSeatInfo(seatId, timeStamp)
    self.mCurrSeatInfo = { seatId = seatId, timeStamp = timeStamp or -1 }
end

function M:getCurrSeatInfo()
    return self.mCurrSeatInfo
end

function M:setOpenDiceBoxInfo(callSeatId, openSeatId, timeStamp, multiple)
    self.mOpenDiceBoxInfo = { callSeatId = callSeatId, openSeatId = openSeatId, timeStamp = timeStamp, multiple = multiple }
end

function M:getOpenDiceBoxInfo()
    return self.mOpenDiceBoxInfo
end

function M:getBetBase()
    return self.mBetBase
end

function M:setBetBase(betBase)
    self.mBetBase=betBase
    self:updateRoomConfigId(self.mBetBase)
end

function M:getRoomType()
    local  roomData=self:getRoomDataByRoomId(g_GameData:getRoomConfigId())
    return roomData[1].RoomType
end

function M:getRoomDataByRoomId(roomId)
    return DataManager:getTbxData("Room","RoomId",roomId)
end

function M:setBetLevel(level)
    self.mBetLevel=level
end

function M:getBetLevel()
    return self.mBetLevel
end

function M:getGameId()
    return self.mGameId
end

function M:getRealGameID()
    local strarr = string.split(g_GameData:getGameId(),":") or {}
    local roomid = strarr[2] or ""
    return roomid
end

function M:getChatRoomName()
    local  roomId=g_GameData:getRoomConfigId()
    local  roomData=DataManager:getTbxData("Room","RoomId",roomId)
    if  2==roomData[1].RoomType  then
        return self:getPersonalInfo().roomName
    else
        local roomid=g_GameData:getRealGameID()
        return Utils.showFormatText(Enum.Text.RoomChannel)..roomid
    end
end

function M:updateRoomConfigId(betBase)
    local  roomId=g_GameData:getRoomConfigId()
    local  roomData=DataManager:getTbxData("Room","RoomId",roomId)

    local roomArr=DataManager:getTbxData("Room","RoomType",roomData[1].RoomType)
    for i=1,#roomArr,1  do
        if  roomArr[i].StakeGold==betBase  then
            self.mRoomConfigId=roomArr[i].RoomId
            break
        end
    end
    
end

function M:getRoomConfigId()
    return self.mRoomConfigId
end

function M:getGameRound()
    return self.mGameRound
end

function M:getGameState()
    return self.mGameState
end

function M:isGamePlaying()
    return self.mGameState == M.GameState.Started
end

function M:getGamePlayers()
    return self.mPlayers
end

function M:getAudiences()
    return self.mAudiences
end

function M:getAudienceDataByUid(uid)
    if not Utils.isEmptyTable(self.mAudiences) then
        for _,v in ipairs(self.mAudiences) do 
            if uid == v.uid then 
                return v
            end
        end
    end

    return nil
end

function M:getBetUserList()
    return self.mBetUserList
end

function M:isUserBet(uid)
    if not Utils.isEmptyTable(self.mBetUserList) then
        for _,v in ipairs(self.mBetUserList) do 
            if uid == v.uid then 
                return true
            end
        end
    end

    return false
end

function M:isAutoLeaveRoom()
    return self.bAutoLeaveRoom
end

function M:setAutoLeaveRoom(isleave)
    self.bAutoLeaveRoom = isleave
end

function M:getMineSeatId()
    return self.mMineSeatId
end

function M:isMineSeatId(seatId)
    return self.mMineSeatId == seatId
end

function M:getMinCallNumber()
    local ret = 2

    local callInfo = self:getCallInfo()
    if callInfo.seatId ~= -1 then
        ret = callInfo.num
    elseif self.mGamingPlayerCount > 0 then
        ret = self.mGamingPlayerCount
    end

    return ret
end

function M:getMaxCallNumber()
    local ret = M.MAX_PLAYERS * 6

    if self.mGamingPlayerCount > 0 then
        ret = self.mGamingPlayerCount * 6
    end

    return ret
end

function M:refreshGamingPlayerCount()
    self.mGamingPlayerCount = 0
    for i = 0, M.MAX_PLAYERS - 1 do
        if self.mPlayers[i]:initGameStart() then
            self.mGamingPlayerCount = self.mGamingPlayerCount + 1
        end
    end
end

--退出时清理数据
function M:clearAllData(notClear)
    for i = 0, M.MAX_PLAYERS - 1 do
        self.mPlayers[i]:initData(nil, 0)
    end

    self.mGamingPlayerCount = 0
    self.mGameId = ""
    self.mGameType = M.GameType.Base
    self.mGameState = M.GameState.Idel
    self.mRoundState = M.RoundState.Wait
    self.mIsQuitMach = false
    self.mNextGameTimeStamp = -1
    self.mGameRound = 0
    self.mMineSeatId = 0
    self.mBetBase = 100
    self.mBetLevel = 1
    self.mIsPlayStart = false
    self.mDealerSeatId = -1
    self.mAudiences = {}
    self.mBetUserList = {}
    self.mOneCalled = false
    self.mCallInfo = { seatId = -1, point = -1, num = -1 }
    self.mCurrSeatInfo = { seatId = -1, timeStamp = -1 }
    self.mOpenDiceBoxInfo = { callSeatId = -1, openSeatId = -1, timeStamp = -1, multiple = 1 }
    self.mRoomConfigId=""
    self.mNeedShowUpbet = false
    self.mUserstatus = Enum.Userstatus.Loking

    if notClear == nil then
        self.mChuiniuMuteList = {}
    end

    self:clearSizeResult()
end
-- ========== 网络相关 ========== --
function M:C2S_JoinGame(gameType)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_JoinGame, { gameType = gameType })
end

function M:S2C_JoinGame(data)
    self.mIsQuitMach = false
    self.misFirstGaming = false
    
    self.mMineSeatId = data.seatId

    -- TODO
    if self.mMineSeatId == nil or self.mMineSeatId < 0 or self.mMineSeatId >= M.MAX_PLAYERS then
        self.mMineSeatId = 0
    end

    local gameInfo = data.gameInfo
    --Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_JoinRoom,{ gameId=gameInfo.gameId })

    

    -- TODO
    self.mVoteInfo = gameInfo.voteInfo
    self.mRoomConfigId=gameInfo.roomConfigId
    self:setBetBase(gameInfo.betBase)
    self.mBetLevel = gameInfo.betBaseLevel

    self:setCurrSeatInfo(gameInfo.currentCallingPlayerSeatId, gameInfo.countdownEndStamp)

    self:setOpenDiceBoxInfo(gameInfo.dealerSeatId, gameInfo.questionerSeatId, gameInfo.countdownEndStamp, gameInfo.multiple)

    local callInfo = gameInfo.currentCallInfo or { seatId = -1, point = -1, num = -1 }
    self:setCallInfo(callInfo.seatId, callInfo.point, callInfo.num)

    self.mOneCalled = gameInfo.isTypeOneDiceUsed

    self.mGameRound = gameInfo.rounds

    self.mGameId = gameInfo.roomId


    self.mGameType = gameInfo.gameType

    if gameInfo.personalInfo  then
        self.personalInfo.masterUid=gameInfo.personalInfo.masterUid
        self.personalInfo.roomName=gameInfo.personalInfo.roomName
    end
    if g_UserData:isSelfUserId(self.personalInfo.masterUid) then
        g_GameData:c2sGetPersonalPasswd()
    end

    local players = {}
    for _, v in ipairs(gameInfo.players or {}) do
        players[v.seatId] = v
        if data.seatId==v.seatId then
            if v.isPlaying then
                self.mGameState = M.GameState.Started
                self.mIsPlayStart = true
            end
        end
    end

    for i = 0, M.MAX_PLAYERS - 1 do
        self.mPlayers[i]:initData(players[i], 0)
    end

    self.mAudiences = gameInfo.audiences or {};
    self.mBetUserList = gameInfo.betUserList or {};

    self.mDealerSeatId = gameInfo.firstOne

    self.mRoundState = gameInfo.gameState

    self.mNextGameTimeStamp = gameInfo.countdownEndStamp

    self:refreshGamingPlayerCount()

    local diceInfo = data.diceInfo
    self.mPlayers[self.mMineSeatId]:setDices(diceInfo.point)

    Log.info("发送进去房间消息")
    local sceneName = SceneManager:getRunScene():getSceneName()
    if sceneName ~= "GameScene" then
        self:initoGameScene(true,data);
    else
        DataManager:dispatchMessage(Constant.CustomEvent.EnterRoom, data)
    end
    
    --Log.info("mRoundState:"..self.mRoundState)
    if self.mRoundState == M.RoundState.FlyBet then
        local leftTime = gameInfo.countdownEndStamp - g_UserData:calcServerTimestamp()
        if leftTime > 0 then
            local panel = UIManager:getPanel("UIGameLayer")
            if panel then
                panel:onGameExtraCompare(leftTime)
            end
            --DataManager:dispatchMessage(Constant.CustomEvent.GameExtraCompare,leftTime)
        end
    elseif self.mRoundState == M.RoundState.Playing then
        --Log.info("111111111111111111111111111111111111111")
        if gameInfo.currentCallingPlayerSeatId~= -1 then

            local leftTime = gameInfo.countdownEndStamp - g_UserData:calcServerTimestamp()
            local panel = UIManager:getPanel("UIGameLayer")
            if panel then
                panel:onGameTurn({ seatId = gameInfo.currentCallingPlayerSeatId, countdownTimeStamp = gameInfo.countdownEndStamp, leftTime = leftTime })
            end
            --DataManager:dispatchMessage(Constant.CustomEvent.GameTurn, { seatId = gameInfo.currentCallingPlayerSeatId, countdownTimeStamp = gameInfo.countdownEndStamp, leftTime = leftTime })       
        end
    end
end

function M:initoGameScene(isNeedRefresh,data)
    local mainPanel=UIManager:getPanel("UIMainLayer")
    if mainPanel then
        mainPanel:closePanel(0)
    end
    
    SceneManager:runScene(require("app.scenes.GameScene").create())
    local panel = UIManager:getOrCreatePanel("UIGameLayer")
    if panel then
        panel:showToScene()
        if isNeedRefresh then
            panel:onEnterRoom(data);
        end
    end
end

function M:S2C_GameStart(data)
    self:setBetBase(data.betBase)
    self.mBetLevel = data.betBaseLv
    self.mGameState = M.GameState.Started
    local players = {}
    for _, v in ipairs(data.players or {}) do
        players[v.seatId] = v
    end

    for i = 0, M.MAX_PLAYERS - 1 do
        self.mPlayers[i]:initData(players[i], 0)
    end

    self.mIsPlayStart = true
    self:refreshGamingPlayerCount()

    self.mBetUserList = {}
    self.mRoundState = M.RoundState.Wait

    self.mGameRound = 0

    self.mOneCalled = false
    self:setCallInfo(-1, -1, -1)

    self:setCurrSeatInfo(-1, -1)
    

    -- self.mDealerSeatId = data.dealerSeatId

    self.misFirstGaming = false
    if 0==g_UserData:getGuideTime() then
        self.misFirstGaming = true
        g_HotData:C2S_guideStepUpdate(3)
    end
    DataManager:dispatchMessage(Constant.CustomEvent.GameStart)
end

function M:S2C_Turn(data)
    self:setCurrSeatInfo(data.seatId, data.countdownTimeStamp)
    --local point = data.callInfo.point
    --if point == 1 then
    --    self.mOneCalled = true
    --end

    local leftTime = data.countdownTimeStamp - g_UserData:calcServerTimestamp()
    Log.info("服务器下发时间:"..data.countdownTimeStamp.." 客户端时间："..g_UserData:calcServerTimestamp())
    DataManager:dispatchMessage(Constant.CustomEvent.GameTurn, { seatId = data.seatId, countdownTimeStamp = data.countdownTimeStamp, leftTime = leftTime })
end

function M:S2C_DiceUpdate(data)
    local diceInfo = data.diceInfo
    Log.info("我的座位号："..self.mMineSeatId)
    self.mPlayers[self.mMineSeatId]:setDices(diceInfo.point)

    local panel = UIManager:getPanel("UIGameLayer")
    if panel then
        panel:onGameDiceUpdate()
    end

    DataManager:dispatchMessage(Constant.CustomEvent.GameDiceUpdate)
end

--玩家更新叫点（用于自动叫点）
function M:C2S_AutoCallUpdate(point, num)
    if self:isWatching() or not (self.mPlayers[self.mMineSeatId] and self.mPlayers[self.mMineSeatId]:isGaming())then
        return
    end
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_AutoCallUpdate, { point = point, num = num })
end

function M:C2S_CallPoint(point, num)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_CallPoint, { point = point, num = num })
end

function M:S2C_CallPoint(data)
    local callInfo = data.callInfo
    self:setCallInfo(callInfo.seatId, callInfo.point, callInfo.num)

    DataManager:dispatchMessage(Constant.CustomEvent.GameCallPoint, callInfo)
end

function M:C2S_OpenDiceBox()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_OpenDiceBox)
end

function M:S2C_OpenDiceBox(data)
    local callInfo = self:getCallInfo()

    local callSeatId = callInfo.seatId
    local openSeatId = data.openSeatId
    local multiple = data.multiple

    self:setOpenDiceBoxInfo(callSeatId, openSeatId, -1, multiple)
    DataManager:dispatchMessage(Constant.CustomEvent.GameOpenDiceBox, { callSeatId = callSeatId, openSeatId = openSeatId, multiple = multiple })
end

function M:S2C_OpenErrorGoldNotEnough(data)
    if data.seatId == self.mMineSeatId then 
        DataManager:dispatchMessage(Constant.CustomEvent.GameOpenErrorGoldNotEnough, {})
    end
end

function M:S2C_ExtraCompare(data)
    local info = self:getOpenDiceBoxInfo()
    self:setOpenDiceBoxInfo(info.callSeatId, info.openSeatId, data.countdownTimeStamp, data.multiple)

    local leftTime = data.countdownTimeStamp - g_UserData:calcServerTimestamp()
    if leftTime > 0 then
        DataManager:dispatchMessage(Constant.CustomEvent.GameExtraCompare,leftTime)
    end
end

function M:C2S_ExtraCompareChoose(trustFlag)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_ExtraCompareChoose, {trustFlag = trustFlag })
end

function M:MSG_S2C_ExtraCompareUpdataPool(data)
    local goldNum = data.totalPrize
    local currentBetUser = data.currentBetUser
    local isbet = self:isUserBet(currentBetUser.uid)

    if self.mBetUserList and not isbet then
        table.insert(self.mBetUserList,currentBetUser);
    end
    DataManager:dispatchMessage(Constant.CustomEvent.GameUpdateComparePool, {goldNum=goldNum,currentBetUser=currentBetUser,isbet=isbet})
end

function M:MDG_S2C_ExtraCallback(data)

    DataManager:dispatchMessage(Constant.CustomEvent.GameExtraCallback, data)
end

function M:S2C_ExtraCompareChoose(data)
    DataManager:dispatchMessage(Constant.CustomEvent.GameExtraCompareChoose, data)
end

function M:C2S_CallSeatChoose(isReverse)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_CallSeatChoose, { isReverse = isReverse })
end

function M:S2C_CallSeatChoose(data)
    DataManager:dispatchMessage(Constant.CustomEvent.GameCallSeatChoose, data)
end
function M:isGamePlayStart()
    return self.mIsPlayStart 
end

function M:isFirstGaming()
    return self.misFirstGaming
end

--若mPlayers中没有本人则判断在观战列表中
function M:isWatching(uid)
    if uid then 
        for i = 0, M.MAX_PLAYERS - 1 do
            local userInfo = self.mPlayers[i]:getUserInfo()
            if userInfo and uid == userInfo:getUserId() then
                return false
            end
        end
    else
        local player = self.mPlayers[self.mMineSeatId];
        if player then 
            local userInfo = player:getUserInfo();
            if userInfo then
                return g_UserData:getUserId() ~= userInfo:getUserId();
            end
        end
    end

    return true;
end

function M:getSeatIdByUid(uid)
    for i = 0, M.MAX_PLAYERS - 1 do
        local userInfo = self.mPlayers[i]:getUserInfo()
        if userInfo and uid == userInfo:getUserId() then
            return i
        end
    end

    return -1
end

function M:S2C_GameOver(data)
    self.mIsPlayStart = false
    self.mGameState = M.GameState.Idel
    self:refreshGamingPlayerCount()
    DataManager:dispatchMessage(Constant.CustomEvent.GameOver, data)
end

function M:S2C_UpdateNextGameTime(data)
    DataManager:dispatchMessage(Constant.CustomEvent.GameUpdateNextGameTime)
end

function M:S2C_UpdatePlayerGold(data)

    local seatid = data.seatId
    local gold = data.gold
    local player = self.mPlayers[seatid]
    if player then
        local beforeGold = player:getUserInfo():getGold()
        player:getUserInfo():setGold(gold)
        DataManager:dispatchMessage(Constant.CustomEvent.GamePlayerGoldChange, {seatid = seatid, gold = gold})
    end
end

function M:C2S_LeaveGame()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_LeaveGame)
    self.mGameState = M.GameState.Idel
end

function M:S2C_GamePlayerLeave(data)
    local userId = data.uid
    local leaveType = data.type
    local seatId = data.seatId
    local isAudience = data.isAudience

    if 5==leaveType and g_UserData:isSelfUserId(userId) then
        UIUtils.popToadtByMessageId(1100036)
    end

    if not isAudience then 
        self.mPlayers[seatId]:initData(nil, 0)
    else
        if not Utils.isEmptyTable(self.mAudiences) then
            for _,v in ipairs(self.mAudiences) do 
                if userId == v.uid then 
                    table.removebyvalue(self.mAudiences, v, false)
                    if not g_UserData:isSelfUserId(userId) then
                        DataManager:dispatchMessage(Constant.CustomEvent.AudienceListUpdate, {isMe = false});
                    end
                end
            end
        end
    end
    DataManager:dispatchMessage(Constant.CustomEvent.GamePlayerLeave, { userId = userId, seatId = seatId, leaveType = leaveType, isAudience = isAudience })
end
--底注提升投票
function M:MSG_C2S_Vote(value)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_Vote,{accept=value})
end
--底注提升投票广播
function M:MSG_S2C_SomeoneVoteResult(data)
    local seatId = data.seatId
    local uid = data.uid
    local accept = data.accept
    DataManager:dispatchMessage(Constant.CustomEvent.GameSomeoneVote,{uid = uid,seatId=seatId,accept=accept})

end
--底注更新成功
function M:onGameBetUpdate(data)
    local nextBetBase = data.nextBetBase
    local nextBetBaseLevel = data.nextBetBaseLevel
    local shouldLevelUp = data.shouldLevelUp
    if shouldLevelUp then
        self.mBetLevel=nextBetBaseLevel
    end
    DataManager:dispatchMessage(Constant.CustomEvent.GameBetBaseUpdateSeccess,{nextBetBase=nextBetBase,nextBetBaseLevel=nextBetBaseLevel,shouldLevelUp=shouldLevelUp})
end
--请求发起头片提升底注
function M:MSG_C2S_LaunchVote()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_LaunchVote)
end
--发起投票提升底注
function M:S2C_LaunchVote(data)
    local leftTime = data.countdownTimeStamp - g_UserData:calcServerTimestamp()
    local seatId = data.seatId
    local betBase = data.betBase
    DataManager:dispatchMessage(Constant.CustomEvent.GameLaunchVote,{leftTime = leftTime,seatId=seatId,betBase=betBase})
end

-- function M:S2C_GamePlayerEnter(data)

--     Log.info("玩家进入")
--     local playerInfo = data.playerInfo
--     local seatId = playerInfo.seatId

--     self.mPlayers[seatId]:initData(playerInfo, 0)

--     DataManager:dispatchMessage(Constant.CustomEvent.GamePlayerEnter, { seatId = seatId })
-- end
-- MSG_C2S_StandUp
-- MSG_C2S_SitDown
-- MSG_C2S_CangeSeat
--请求发起头片提升底注
function M:MSG_C2S_StandUp()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_StandUp)
end

function M:MSG_C2S_SitDown(seatId)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_SitDown, {seatId=seatId})
end

function M:MSG_C2S_CangeSeat(seatId)
    Log.info("切换座位："..tostring(seatId))
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_CangeSeat, {seatId = seatId})
end

function M:S2C_PlayerListUpdate(data)
    Log.info("玩家列表变更")
    local playerInfo = data.playerInfo
    local seatId = playerInfo.seatId
    if playerInfo.uid == g_UserData:getUserId() then
        self.mMineSeatId = seatId
    end

    if data.isAdd then
        self.mPlayers[seatId]:initData(playerInfo, 0)
    else
        for k, v in pairs(g_GameData:getChuiniuMuteList()) do
            if v == playerInfo.uid then
                g_GameData:removeChuiniuMuteMember(v)
            end
        end
        self.mPlayers[seatId]:initData(nil, 0)
    end
    DataManager:dispatchMessage(Constant.CustomEvent.GamePlayerUpdate, { seatId = seatId, isadd = data.isAdd })
end

function M:S2C_AudienceListUpdate(data)
    Log.info("观众列表变更")
    local audience = data.audience

    if data.isAdd then
        local isInAudience = false
        if not Utils.isEmptyTable(self.mAudiences) then
            for _,v in ipairs(self.mAudiences) do
                if audience.uid == v.uid then
                    isInAudience = true
                end
            end
        end
        if not isInAudience then
            table.insert(self.mAudiences,audience)
        end
    else
        if not Utils.isEmptyTable(self.mAudiences) then
            for _,v in ipairs(self.mAudiences) do 
                if audience.uid == v.uid then 
                    table.removebyvalue(self.mAudiences, v, false)
                end
            end
        end
    end
    DataManager:dispatchMessage(Constant.CustomEvent.AudienceListUpdate, {isMe = audience.uid == g_UserData:getUserId()});
end

function M:S2C_SeatChanged(data)
    Log.info("玩家座位变更")
    local beforeSeatId = data.beforeSeatId
    local afterSeatId = data.afterSeatId
    local playerInfo = self.mPlayers[beforeSeatId]:getBaseData()
    if playerInfo.uid == g_UserData:getUserId() then
        self.mMineSeatId = afterSeatId
    end

    self.mPlayers[afterSeatId]:initData(playerInfo, 0)
    self.mPlayers[beforeSeatId]:initData(nil, 0)
    DataManager:dispatchMessage(Constant.CustomEvent.GamePlayerSeatChenged, { beforeSeatId = beforeSeatId, afterSeatId = afterSeatId});
end

function M:S2C_SitDownErrorGoldNotEnough(data)
    -- local panel = UIManager:getOrCreatePanel("UIClientErrorTipsLayer_1")
    -- if panel then 
    --     local TipTitleText = Utils.getTextByTextId(Enum.Text.netTile)
    --     local ConfirmText = Utils.getTextByTextId(Enum.Text.netBtn)
    --     local ContentText = Utils.getTextByTextId(Enum.Text.SitDownErrorGoldNotEnough)
    --     panel:setText(TipTitleText, ContentText, ConfirmText)
    --     panel:showToScene()
    -- end
end

function M:C2S_ReshakeDiceBox()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_ReshakeDiceBox)
end

function M:S2C_ReshakeDiceBox(data)
    DataManager:dispatchMessage(Constant.CustomEvent.GameReshakeDiceBox, data)
end

--魔法表情 吹牛
function M:C2S_SendMagicEmoji(toUid,itemId)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_SendMagicEmoji,{toUid=toUid,itemId=itemId})
end

--魔法表情 骰宝
function M:C2S_ShaibaoSendMagicEmoji(toUid,itemId)
--临时处理
    Net.NET_CMD.MSG_C2S_ShaibaoSendMagicEmoji={ code = 3407, protocolName = "client.c2sShaibaoSendMagicEmoji", methodName = "" }
    Net.NET_CMD.MSG_s2cShaibaoMagicEmojiBroadcast = {code = 4411, protocolName = "server.s2cShaibaoMagicEmojiBroadcast", methodName = "s2cShaibaoMagicEmojiBroadcast"}
    
    local config ={
        MSG_s2cShaibaoMagicEmojiBroadcast = {code = 4411, protocolName = "server.s2cShaibaoMagicEmojiBroadcast", methodName = "s2cShaibaoMagicEmojiBroadcast"},
        MSG_C2S_ShaibaoSendMagicEmoji={ code = 3407, protocolName = "client.c2sShaibaoSendMagicEmoji", methodName = "" }
    }
    for k, v in pairs(config) do
        Net.NET_CMD[k] = v.code
    end
    for _, v in pairs(config) do
        Net.Code2Protobuf[v.code] = { protocolName = v.protocolName, methodName = v.methodName }
    end
--临时处理
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_ShaibaoSendMagicEmoji,{toUid=toUid,itemId=itemId})
end

function M:S2C_SendMagicEmojiAck(data)
    
end

function M:S2C_MagicEmoji(data)
    DataManager:dispatchMessage(Constant.CustomEvent.GameMagicEmoji, data)
end

function M:isQuitMach()
    return self.mIsQuitMach
end

function M:enterChuiNiuRoom(gameLevel)
    --SceneManager:runScene(require("app.scenes.GameScene").create())
    if g_GameData:getmUserstatus() == Enum.Userstatus.ShaibaoGaing then
        UIUtils.popToadtByMessageId(Constant.Define.IsShaibaoGaming)
        return
    end
    if g_UserData:getGold() < GSystem.StartGameMoney then
        UIUtils.popToadtByMessageId(Constant.Define.ErrorGoldNotEnough)
        return 
    end

    local sceneName = SceneManager:getRunScene():getSceneName()
    if sceneName ~= "GameScene" then
        self:initoGameScene(false)
    end

    self.mIsQuitMach = true
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_MatchGame, { gameType = Enum.GameType.Base,gameLevel = gameLevel })

end

function M:S2C_MatchGameSuccess(data)
    Log.info("匹配到房间："..data.gameId)
    self.mIsQuitMach = false
    --Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_JoinRoom,{ gameId=data.gameId })
end

function M:S2C_MatchGameAck(data)
    if data.code == 0 then
        Log.info("匹配到房间")
        --self.mIsQuitMach = false
    else
        Log.info("匹配失败，离开房间")
        self:leaveRoom()
        UIUtils.popToadtByMessageId(data.code)
    end
end

function M:leaveRoom()
    if 0==g_UserData:getGuideTime() then
        g_HotData:C2S_guideStepUpdate(3)
    end

    local gamepanel = UIManager:getPanel("UIGameLayer")
    if gamepanel then
        gamepanel:closePanel(0)
    end
    self.mChuiniuMuteList = {}
    SoundSystemManager:stopAllEffect()
    SoundSystemManager:stopAllVoice()
    SoundSystemManager:setBackMusicVolumeByPercent(1.0)
    SceneManager:runScene(require("app.scenes.MainScene").create())
end
--抢庄
function M:c2sBigSmallBankerOn(cost)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sBigSmallBankerOn,{cost=cost})
end
--下庄
function M:c2sBigSmallBankerOff()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sBigSmallBankerOff)
end
--猜大小
function M:c2sBigSmallBet(betType,gold)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sBigSmallBet,{betType=betType,gold=gold})
end
--庄家查看玩家压住信息
function M:c2sBigSmallBetListReq()
    self.mGuessData.player={}
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sBigSmallBetListReq)
end
--砸鸡蛋
function M:c2sBigSmallRob()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sBigSmallRob)
end
--猜大小结果
function M:s2cBigSmallBet(data)
    local betType=data.betType
    local gold=data.gold
    local diceResult=data.diceResult
    local win=data.win
    DataManager:dispatchMessage(Constant.CustomEvent.UIGuessSizeLayer_s2cBigSmallBet,{betType=betType,gold=gold,diceResult=diceResult,win=win})
end

--猜大小状态变更
function M:s2cBigSmallStateInfo(data)
    local state=data.state
    local baozi=data.baozi
    local goodLuck=data.goodLuck
    self.mGuessType=state
    
    if baozi then
        self.mGuessData.Leopard=baozi
    else
        self.mGuessData.Leopard={}
    end

    if goodLuck then
        self.mGuessData.goodLuck=goodLuck
        DataManager:dispatchMessage(Constant.CustomEvent.UIGuessSizeLayer_updateLuckPlayer)
        DataManager:dispatchMessage(Constant.CustomEvent.UIMainLayer_updateLuckPlayer,{is=false})
        DataManager:dispatchMessage(Constant.CustomEvent.UIGameLayer_updateLuckPlayer,{is=false})
    elseif self.mGuessData.goodLuck then
        self.mGuessData.goodLuck=nil
        DataManager:dispatchMessage(Constant.CustomEvent.UIMainLayer_updateLuckPlayer,{is=true})
        DataManager:dispatchMessage(Constant.CustomEvent.UIGameLayer_updateLuckPlayer,{is=true})
    else
        self.mGuessData.goodLuck=nil
    end

    DataManager:dispatchMessage(Constant.CustomEvent.UIGuessSizeLayer_s2cBigSmallStateInfo)
    DataManager:dispatchMessage(Constant.CustomEvent.UIGameLayer_s2cBigSmallStateInfo)
end

--庄家变更
function M:s2cBigSmallBankerInfo(data)
    local banker=data.banker
    local bankerCost=data.bankerCost
    local leaveType=data.leaveType--1游戏结束  2; //主动站起  3; //金币不足  4; //抢庄
    self.mGuessData.bankerCost=bankerCost
    self.mGuessData.player={}
    local bankerData=g_GameData:getGuessBankerData()
    local isUpdateBnaker=false
    if banker then
        if g_UserData:isSelfUserId(banker.uid) then
            isUpdateBnaker=true
        end

        if g_UserData:isSelfUserId(bankerData.uid) and g_GameData:isGuessSizeIng() and banker.uid~=bankerData.uid then
            isUpdateBnaker=true
            DataManager:dispatchMessage(Constant.CustomEvent.UIMainLayer_GuessSizeHintNode,{leaveType=leaveType})
            DataManager:dispatchMessage(Constant.CustomEvent.UIGameLayer_GuessSizeHintNode,{leaveType=leaveType})
        end
        self.mGuessData.banker=banker
    else
        if bankerData and g_UserData:isSelfUserId(bankerData.uid)  then
            isUpdateBnaker=true
        end

        if g_UserData:isSelfUserId(bankerData.uid) and g_GameData:isGuessSizeIng() then
            if leaveType~=Enum.BankerLeave.Off then
                DataManager:dispatchMessage(Constant.CustomEvent.UIMainLayer_GuessSizeHintNode,{leaveType=leaveType})
            end
            DataManager:dispatchMessage(Constant.CustomEvent.UIGameLayer_GuessSizeHintNode,{leaveType=leaveType})
        end
        self.mGuessData.banker={}
    end

    if isUpdateBnaker then--变更我做庄下庄
        DataManager:dispatchMessage(Constant.CustomEvent.UIGameLayer_s2cBigSmallBankerInfo)
    end

    DataManager:dispatchMessage(Constant.CustomEvent.UIGuessSizeLayer_s2cBigSmallStateInfo)
    DataManager:dispatchMessage(Constant.CustomEvent.UIMainLayer_s2cBigSmallBankerInfo)
    DataManager:dispatchMessage(Constant.CustomEvent.UIGuessSizeMiniTipPopUp_2_updateGold)
end

--
function M:s2cBigSmallPoolUpdate(data)
    local poolNow=data.poolNow
    local bankerGoldNow=data.bankerGoldNow
    self.mGuessData.bankerGold=bankerGoldNow
    self.mGuessData.goldPool=poolNow

    DataManager:dispatchMessage(Constant.CustomEvent.UIGuessSizeLayer_s2cBigSmallPoolUpdate)
    DataManager:dispatchMessage(Constant.CustomEvent.UIBankerGuessSizeLayer_s2cBigSmallPoolUpdate)
    DataManager:dispatchMessage(Constant.CustomEvent.UIGuessSizeMiniTipPopUp_3_updateGold)
    DataManager:dispatchMessage(Constant.CustomEvent.SmashEggCell_updateGold)
end

--产生豹子通知
function M:s2cBigSmallBaozi(data)
    local baozi=data.baozi
    table.insert(self.mGuessData.Leopard,baozi)

    DataManager:dispatchMessage(Constant.CustomEvent.UIGuessSizeLayer_s2cBigSmallBaozi,{baozi=baozi})
end

--砸鸡蛋回复
function M:s2cBigSmallRobResult(data)
    local player=data.player
    local gold=data.gold

    DataManager:dispatchMessage(Constant.CustomEvent.UIGameLayer_s2cBigSmallRobResult,{player=player,gold=gold})
    DataManager:dispatchMessage(Constant.CustomEvent.UIMainLayer_s2cBigSmallRobResult,{player=player,gold=gold})
end

--扔鸡蛋排名
function M:s2cBigSmallRobRank(data)
    local list=data.list or {}
    local goldTotal=data.goldTotal
    local count=data.count
    if #list<1 then return end

    local panel=UIManager:getOrCreatePanel("UIRodGoldRankingLayer")
    if panel then
        panel:showToScene()
        panel:refreshUI(data)
    end
end

--下注信息
function M:s2cBigSmallBetList(data)
    local list=data.list or {}
    self.mGuessData.player={}
    for i,v in ipairs(list) do
        local data={}

        data.betType=v.betType
        data.diceResult=v.diceResult
        data.goldWin=v.goldWin
        data.win=v.win
        data.player={}
        data.player.avatar=v.player.avatar
        data.player.name=v.player.name
        data.player.uid=v.player.uid
        data.player.vipLevel=v.player.vipLevel

        table.insert(self.mGuessData.player,data)
    end
    DataManager:dispatchMessage(Constant.CustomEvent.UIBankerGuessSizeLayer_s2cBigSmallBetList)
end

function M:C2S_GetGamingPlayerNum()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_GetGamingPlayerNum)
end

function M:MSG_S2C_GamingPlayerNum(data)
    if data ~= nil then
        self.GamingPlayerNum = data
        DataManager:dispatchMessage("refreshGamingPlayerNum",data)
    end
end
--创建私房
function M:c2sCreatePersonalRoom(gameType,roomConfigId,roomName,password)
    if g_GameData:getmUserstatus() == Enum.Userstatus.ShaibaoGaing then
        UIUtils.popToadtByMessageId(Constant.Define.IsShaibaoGaming)
        return
    end
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sCreatePersonalRoom,{gameType=gameType,roomConfigId=roomConfigId,roomName=roomName,password=password})
end
--进入私房
function M:c2sEnterPersonalRoom(roomId,password)
    if g_GameData:getmUserstatus() == Enum.Userstatus.ShaibaoGaing then
        UIUtils.popToadtByMessageId(Constant.Define.IsShaibaoGaming)
        return
    end
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sEnterPersonalRoom,{roomId=roomId,password=password})
end
--修改私房设置
function M:c2sModifyPersonalRoomInfo(roomConfigId,roomName,password)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sModifyPersonalRoomInfo,{roomConfigId=roomConfigId,roomName=roomName,password=password})
end
--全服邀请
function M:c2sGameInviteBroadcast()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sGameInviteBroadcast,{})
end
--获取私房密码
function M:c2sGetPersonalPasswd()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sGetPersonalPasswd,{})
end
--踢人
function M:c2sUserKickPlayer(kickUid)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sUserKickPlayer,{kickUid=kickUid})
end
--私房全服广播邀请
function  M:s2cGameInviteBroadcast(data)
    local uid=data.uid
    local nickname=data.nickname
    local roomId=data.roomId
    local password=data.password
    local roomName=data.roomName

    data.templateId=7
    data.param={}
    data.param[1]=nickname
    data.param[2]=roomName

    g_CommonData:S2C_NewMsgArrive(data)
end
--进入私房
function M:s2cEnterPersonalRoom(data)
    if g_GameData:getmUserstatus() == Enum.Userstatus.ShaibaoGaing then
        UIUtils.popToadtByMessageId(Constant.Define.IsShaibaoGaming)
        return
    end
    local code=data.code
    local roomId=data.roomId
    --SeatFull = 51005;
    ---GameStatusError = 56012;
    --GoldNotEnoughToJoinRoom = 60028;
    --PasswordError = 60037;
    --personalInfoNotExist = 60038;
    -- NeedPassword  = 60039;
    if 60039==code or 60037==code then
        local panel=UIManager:getPanel("app.gui.game.private.BoastMiniTipPopUp_3")
        if not roomId then
            if not panel then
                panel=UIManager:getOrCreatePanel("app.gui.game.private.BoastMiniTipPopUp_3")
                panel:showToScene()
            end
        end
        
        UIUtils.popToadtByMessageId(code)
    elseif   60028==code then
        local panel=UIManager:getOrCreatePanel("app.gui.game.private.BoastMiniTipPopUp_1")
        if panel then
            panel:showToScene()
        end
    else
        UIUtils.popToadtByMessageId(code)
    end  
end
--房间信息变更
function  M:s2cPersonalRoomInfoChanged(data)
    local roomName=data.roomName
    local masterUid=data.masterUid

    if masterUid then 
        self.personalInfo.masterUid=masterUid  
    end

    if roomName then  
        self.personalInfo.roomName=roomName 
    end

    if g_UserData:isSelfUserId(self.personalInfo.masterUid) then
        g_GameData:c2sGetPersonalPasswd()
        
    end
    DataManager:dispatchMessage("UpdatePrivateRoomMasterIcon")
    DataManager:dispatchMessage("UpdatePrivateRoomBtn")
end
--私房密码
function  M:s2cPersonalPassword(data)
    local password=data.password
    self.personalInfo.password=password
end

function M:getGamingPlayerNum()
    return self.GamingPlayerNum
end

function M:onUpdate(dt)
    
end

return M