local UIDiceBoxCell = require("app.gui.game.UIDiceBoxCell")
local M = class("UIMineDiceBoxCell", UIDiceBoxCell)

M.GUI_FILE_NAME = "csd.3_combat.3_01_fight.3_01_2_OneselfKTVCell.lua"
local DICE_MAX = 5

M.BINDGUIDATANODE = {
    ["OneselfSifterBg"] = { varname = "DiceBoxImage" },

    ["OneselfSifterNode"] = { varname = "DiceNode" },
    ["OneselfSifter_1"] = { varname = "Dice_1" },
    ["OneselfSifter_2"] = { varname = "Dice_2" },
    ["OneselfSifter_3"] = { varname = "Dice_3" },
    ["OneselfSifter_4"] = { varname = "Dice_4" },
    ["OneselfSifter_5"] = { varname = "Dice_5" },

    ["YourTurn"] = { varname = "YourTurn" },

    ["HeavyShakingButton"] = { varname = "ReshakeButton", onClick = "onReshakeButtonClick" },

    ["OneselfPanel"] = { varname = "OpenTouchPanel", onTouch = "onOpenPanelTouchEvent" },

    ["OnseslfAnimation"] = { varname = "MultipleImage" },

    ["CardTypeNode"] = { varname = "CardTypeNode" },
    ["CardTypeText"] = { varname = "CardTypeText" },

    ["OneselfWinNode"] = { varname = "ResultWinNode" },
    ["OneselfLoseNode"] = { varname = "ResultLoseNode" },

    ["OneselfMakeNode"] = { varname = "ResultMultipleImage" },

    ["AnimationNode"] = { varname = "AnimationNode" },
    ["StraightNode"] = { varname = "StraightNode" },
    ["LeopardNode"] = { varname = "LeopardNode" },
}

function M:onCreate()
    M.super.onCreate(self)

    self.MultipleImage:setVisible(false)
    self.ResultMultipleImage:setVisible(false)

    self.CardTypeNode:setVisible(false)

    self.mOpenedSeatId = Constant.SEAT_INVAILD_ID

    self.mCallSeatId = Constant.SEAT_INVAILD_ID

    self.mOpenMessageSended = false
end

function M:refreshGamingSeat()
    M.super.refreshGamingSeat(self)

    self.DiceNode:setVisible(false)
    self.CardTypeNode:setVisible(false)

    self.YourTurn:setVisible(false)
    self.MultipleImage:setVisible(false)
    self.ResultMultipleImage:setVisible(false)
end

function M:refreshWaitSeat()
    M.super.refreshWaitSeat(self)

    self.DiceNode:setVisible(false)
    self.CardTypeNode:setVisible(false)

    self.YourTurn:setVisible(false)
    self.ReshakeButton:setVisible(false)
end

function M:onReshakeButtonClick(sender)
    g_GameData:C2S_ReshakeDiceBox()
    self:setReshakeButtonVisible(false)
end

function M:setReshakeButtonVisible(visible)
    self.ReshakeButton:setVisible(visible)
end

function M:setOpenedSeatId(seatId)
    self.mOpenedSeatId = seatId
end

function M:setCallSeatId(seatId)
    self.mCallSeatId = seatId
end

function M:checkDiceData()
    self.mShakeTimes = self.mShakeTimes + 1

    if self.mShakeTimes < M.BASE_SHAKE_TIMES then
        return
    end

    if Utils.isEmptyTable(self.mDiceData) then
        return
    end

    self:stopActionByTag(M.RESHAKE_ACTION)

    self.mShakeTimes = 0

    self.mShaking = false

    if self.mCallSeatId == Constant.SEAT_INVAILD_ID and self.mData and self.mData:isGaming() then
        self.ReshakeButton:setVisible(true)
    else
        self.ReshakeButton:setVisible(false)
    end

    self.DiceNode:setVisible(true)

    if self:isStraightType() then
        self.CardTypeText:setString("順子")
        self.CardTypeNode:setVisible(true)
    elseif self:isFullOfAKindType() then
        self.CardTypeText:setString("豹子")
        self.CardTypeNode:setVisible(true)
    else
        self.CardTypeNode:setVisible(false)
    end

end

function M:isStraightType()
    local data = self.mDiceData
    local laizi = 1

    local ret = false
    if Utils.isEmptyTable(data) then
        ret = false
    else
        local kind = 0
        local diceMap = {}
        for k, v in pairs(data) do
            if not diceMap[v] then
                diceMap[v] = 0
                kind = kind + 1
            end
            diceMap[v] = diceMap[v] + 1
        end

        ret = (kind == M.DICE_MAX)

    --[[        if kind == M.DICE_MAX then
            local min = data[1]
            local max = data[1]
            for _, v in ipairs(data) do
                if min > v then
                    min = v
                end

                if max < v then
                    max = v
                end
            end

            if max - min == M.DICE_MAX then
                ret = true
            else
                ret = false
            end
        else
            ret = false
        end
        ]]
    end

    return ret

end

function M:isFullOfAKindType()
    local data = self.mDiceData
    local laizi = 1

    local ret = false
    if Utils.isEmptyTable(data) then
        ret = false
    else
        local kind = 0
        local diceMap = {}
        for k, v in pairs(data) do
            if not diceMap[v] then
                diceMap[v] = 0
                kind = kind + 1
            end
            diceMap[v] = diceMap[v] + 1
        end

        if kind > 2 then
            ret = false
        elseif kind == 2 then
            if diceMap[laizi] and diceMap[laizi] > 0 then
                ret = true
            else
                ret = false
            end
        else
            ret = true
        end
    end

    return ret
end

function M:runShakeDiceBox()
    M.super.runShakeDiceBox(self)

    self.DiceBoxImage:setPositionY(0)
    self:setReshakeButtonVisible(false)

    self.CardTypeNode:setVisible(false)
end

function M:hideYourTurn()
    self.YourTurn:stopAllActions()

    self.YourTurn:setVisible(false)
end

function M:showYourTurn()
    self.YourTurn:stopAllActions()

    local acts = {}
    acts[#acts + 1] = cc.Show:create()
    acts[#acts + 1] = cc.DelayTime:create(0.8)
    acts[#acts + 1] = cc.Hide:create()
    self.YourTurn:runAction(cc.Sequence:create(acts))
end

function M:checkOffsetOver(offsetY)
    local ret = false

    if self.mData and self.mData:isSelfSeatId(self.mCallSeatId) then
        ret = false
    elseif self.mCallSeatId == Constant.SEAT_INVAILD_ID then
        ret = false
    elseif self.mOpenedSeatId == Constant.SEAT_INVAILD_ID and offsetY >= Constant.OpenMaxOffset then
        ret = true
    end

    return ret
end

function M:onOpenPanelTouchEvent(sender, eventType)
    if self.mShaking then
        return
    end

    if self.mOpenedSeatId ~= Constant.SEAT_INVAILD_ID then
        return
    end

    if eventType == ccui.TouchEventType.began then
        self.mOpenMessageSended = false
    elseif eventType == ccui.TouchEventType.moved then
        local posBegan = sender:getTouchBeganPosition()
        local posMoved = sender:getTouchMovePosition()

        local offsetY = math.max(posMoved.y - posBegan.y, 0)
        if self:checkOffsetOver(offsetY) then
            if not self.mOpenMessageSended then
                g_GameData:C2S_OpenDiceBox()
                self.mOpenMessageSended = true
            end
        end

        self.DiceBoxImage:setPositionY(offsetY)

    elseif eventType == ccui.TouchEventType.ended or eventType == ccui.TouchEventType.canceled then
        local posBegan = sender:getTouchBeganPosition()
        local posEnded = sender:getTouchEndPosition()

        local offsetY = math.max(posEnded.y - posBegan.y, 0)
        if not self:checkOffsetOver(offsetY) then

            if not self.mOpenMessageSended then
                g_GameData:C2S_OpenDiceBox()
                self.mOpenMessageSended = true
            end

            if not self.mData or not self.mData:isSelfSeatId(self.mOpenedSeatId) then
                self.DiceBoxImage:setPositionY(0)
            end
        end

    end
end

function M:showGameOverGain(multiple, tax, goldChange)

    local iconPath = ""
    if goldChange > 0 then
        iconPath = string.format("Icon/0010/%04d.png", multiple)

        local magicAni = UIUtils.getMagicNodeInNode(self.StraightNode)
        magicAni:createMagic("1005", 0.1, false)
    elseif goldChange < 0 then
        iconPath = string.format("Icon/0040/%04d.png", multiple)

        local magicAni = UIUtils.getMagicNodeInNode(self.StraightNode)
        magicAni:createMagic("1006", 0.1, false)
    end

    if cc.SpriteFrameCache:getInstance():getSpriteFrame(iconPath) then
        self.ResultMultipleImage:ignoreContentAdaptWithSize(true)
        self.ResultMultipleImage:loadTexture(iconPath, ccui.TextureResType.plistType)
        self.ResultMultipleImage:setVisible(true)
    else
        self.ResultMultipleImage:setVisible(false)
    end
end

function M:onGameStart(data)
    self.CardTypeNode:setVisible(false)

    self.YourTurn:setVisible(false)
    self.ReshakeButton:setVisible(false)

    self:setOpenedSeatId(Constant.SEAT_INVAILD_ID)
    self:setCallSeatId(Constant.SEAT_INVAILD_ID)

    M.super.onGameStart(self)
end

function M:onGameTurn(data)
    if self.mData and self.mData:isSelfSeatId(data.seatId) then
        self:showYourTurn()
    else
        self:hideYourTurn()
    end
end

function M:onGameCallPoint(data)
    self:setCallSeatId(data.seatId)
    self.ReshakeButton:setVisible(false)
end

function M:onGameOpenDiceBox(data)
    self:setOpenedSeatId(data.openSeatId)

    if self.mData and self.mData:isSelfSeatId(data.openSeatId) then

        local iconPath = string.format("Icon/0030/%04d.png", data.multiple)
        if cc.SpriteFrameCache:getInstance():getSpriteFrame(iconPath) then
            self.MultipleImage:ignoreContentAdaptWithSize(true)
            self.MultipleImage:loadTexture(iconPath, ccui.TextureResType.plistType)
            self.MultipleImage:setVisible(true)
        else
            self.MultipleImage:setVisible(false)
        end

        if self.DiceBoxImage:getPositionY() <= Constant.OpenMaxOffset then
            -- 骰盅开启动画
            self:runDiceBoxOpenAction()
        end
    end

end

function M:onGameExtraCompareChoose(data)
    if self.mData and self.mData:isSelfSeatId(data.bettor) then

        -- 骰盅开启动画
        self:runDiceBoxOpenAction()
    end
end

function M:onGameCallSeatChoose(data)
    if data.isReverse then
        local openInfo = g_GameData:getOpenDiceBoxInfo()
        if self.mData and self.mData:isSelfSeatId(openInfo.callSeatId) then
            -- 骰盅开启动画
            self:runDiceBoxOpenAction()
        end
    end
end

return M