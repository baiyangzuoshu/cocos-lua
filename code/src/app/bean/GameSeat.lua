local UserInfo = require("app.bean.UserInfo")

local M = class("GameSeat")

M.PlayerGameState = {
    WATCH = 0, -- 观战
    GAMING = 1, -- 对局
}

M.PlayerNetState = {
    OFFLINE = 0, -- 离线
    ONLINE = 1, -- 在线
}

function M:ctor(seatId)
    self.mSeatId = seatId

    self.mUiSeat = -1

    self.mUserInfo = nil

    self.mUserBaseData = nil

    -- 游戏状态状态
    self.mPlayerGameState = M.PlayerGameState.WATCH

    -- 网络状态
    self.mPlayerNetState = M.PlayerNetState.OFFLINE

    self.mDices = {-1, -1, -1, -1, -1 }
end

function M:initData(data, mineSeatId)
    self.mUiSeat = self.mSeatId - mineSeatId
    if self.mUiSeat < 0 then
        self.mUiSeat = self.mUiSeat + g_GameData.MAX_PLAYERS
    end

    if data then
        self.mUserInfo = UserInfo.new(data.uid)
        self.mUserInfo:initData(data)
        self.mUserBaseData = data

        if  data.isPlaying then
            self.mPlayerGameState = M.PlayerGameState.GAMING
        else
            self.mPlayerGameState = M.PlayerGameState.WATCH
        end

        if data.isOnline then
            self.mPlayerNetState = M.PlayerNetState.ONLINE
        else
            self.mPlayerNetState = M.PlayerNetState.OFFLINE
        end

    else
        self.mUserInfo = nil
        self.mUserBaseData = nil
        self.mPlayerGameState = M.PlayerGameState.WATCH

        self.mPlayerNetState = M.PlayerNetState.OFFLINE

    end
end

function M:initGameStart()
    local ret = false
    if self.mUserInfo then
        --self.mPlayerGameState = M.PlayerGameState.GAMING
        ret = true
    else
        self.mPlayerGameState = M.PlayerGameState.WATCH

        self.mPlayerNetState = M.PlayerNetState.OFFLINE
    end

    self:setDices({-1, -1, -1, -1, -1 })
    return ret
end

function M:isEmptySeat()
    return self.mUserInfo == nil
end

function M:isGaming()
    return self.mPlayerGameState == M.PlayerGameState.GAMING
end

function M:isOnline()
    return self.mPlayerNetState == M.PlayerGameState.ONLINE
end

function M:setDices(dices)
    print("设置座位的点数："..self:getSeatId())
    self.mDices = dices
end

function M:getDices()
    print("获取座位号的点数 ："..self:getSeatId())
    return self.mDices
end

function M:getUiSeatId()
    return self.mUiSeat
end

function M:getSeatId()
    return self.mSeatId
end

function M:getUserInfo()
    return self.mUserInfo
end

function M:isSelfSeatId(seatId)
    return self:getSeatId() == seatId
end

function M:getBaseData()
    return self.mUserBaseData
end

return M