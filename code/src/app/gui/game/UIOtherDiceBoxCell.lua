local AvatarWidget = require("app.gui.widget.AvatarWidget")

local UIDiceBoxCell = require("app.gui.game.UIDiceBoxCell")
local M = class("UIOtherDiceBoxCell", UIDiceBoxCell)

M.GUI_FILE_NAME = "csd.3_combat.3_01_fight.3_01_3_OtherKTVCell.lua"

M.Direction = {
    RIGHT = 1,
    LEFT = 2,
}

M.BINDGUIDATANODE = {
    ["OtherSifterBg"] = { varname = "DiceBoxImage" },

    ["OtherSifterNode"] = { varname = "DiceNode" },
    ["OtherSifter_1"] = { varname = "Dice_1" },
    ["OtherSifter_2"] = { varname = "Dice_2" },
    ["OtherSifter_3"] = { varname = "Dice_3" },
    ["OtherSifter_4"] = { varname = "Dice_4" },
    ["OtherSifter_5"] = { varname = "Dice_5" },


    ["OtherGoldBg"] = { varname = "GoldBg" },
    ["OtherGoldIcon"] = { varname = "GoldIconImage" },
    ["OtherGoldNum"] = { varname = "GoldNumText" },

    ["Other"] = { varname = "PlayerInfoNode" },
    ["HeadPortraitNode"] = { varname = "AvatarNode" },
    ["HeadPortraitPanel"] = { varname = "AvatarTouchPanel", onTouch = "onAvatarPanelTouchEvent" },
    ["OtherName"] = { varname = "NicknameText" },

    ["DialogBoxNode"] = { varname = "CallInfoNode" },

    ["RightDialog"] = { varname = "RightCallInfoNode" },
    ["RightQuantityText"] = { varname = "RightCallNumText" },
    ["RightText"] = { varname = "RightGeText" },
    ["RightSifterIcon"] = { varname = "RightCallDiceIcon" },
    ["GrabDialog_2"] = { varname = "RightOpenNode" },
    ["GrabDialogText_2"] = { varname = "RightOpenText" },

    ["LeftDialog"] = { varname = "LeftCallInfoNode" },
    ["LeftQuantityText"] = { varname = "LeftCallNumText" },
    ["LeftText"] = { varname = "LeftGeText" },
    ["LeftSifterIcon"] = { varname = "LeftCallDiceIcon" },
    ["GrabDialog_1"] = { varname = "LeftOpenNode" },
    ["GrabDialogText_1"] = { varname = "LeftOpenText" },

    ["OtherAnimation"] = { varname = "MultipleImage" },

    ["TheOpenButton"] = { varname = "DoubleButton" },
    ["OpenButton"] = { varname = "OpenButton" },

    ["OtherMakeNode"] = { varname = "ResultMultipleImage" },

    ["CardTypeNode"] = { varname = "CardTypeNode" },
    ["StraightNode"] = { varname = "StraightNode" },
    ["LeopardNode"] = { varname = "LeopardNode" },
}

function M:onCreate()
    M.super.onCreate(self)
    self:addPlistResourceMap(Utils.generateIconPlistData("0070"))

    self.RightCallInfoNode:setVisible(false)
    self.LeftCallInfoNode:setVisible(false)

    self.RightOpenNode:setVisible(false)
    self.LeftOpenNode:setVisible(false)

    self.DoubleButton:setVisible(false)
    self.OpenButton:setVisible(false)

    self.mDirection = M.Direction.LEFT

    self.mOpenAnimationNode = self.LeftOpenNode

    self.mCallAnimationNode = self.LeftCallInfoNode
    self.mCallNumText = self.LeftCallNumText
    self.mGeText = self.LeftGeText
    self.mCallDiceIcon = self.LeftCallDiceIcon

    self.MultipleImage:setVisible(false)

    self.ResultMultipleImage:setVisible(false)

    self.mAvatar = AvatarWidget.new()
    self.mAvatar:setStyle(AvatarWidget.Style.Gameother)
    self.AvatarNode:addChild(self.mAvatar)
end

function M:setDirection(direction)
    self.mDirection = direction

    if direction == M.Direction.LEFT then
        self.mCallAnimationNode = self.LeftCallInfoNode
        self.mCallNumText = self.LeftCallNumText
        self.mGeText = self.LeftGeText
        self.mCallDiceIcon = self.LeftCallDiceIcon

        self.mOpenAnimationNode = self.LeftOpenNode
        self.mOpenText = self.LeftOpenText
    elseif direction == M.Direction.RIGHT then
        self.mCallAnimationNode = self.RightCallInfoNode
        self.mCallNumText = self.RightCallNumText
        self.mGeText = self.RightGeText
        self.mCallDiceIcon = self.RightCallDiceIcon

        self.mOpenAnimationNode = self.RightOpenNode
        self.mOpenText = self.RightOpenText
    end
end

function M:refreshGamingSeat()
    M.super.refreshGamingSeat(self)

    self.DiceNode:setVisible(false)

    self.MultipleImage:setVisible(false)
    self.ResultMultipleImage:setVisible(false)
end

function M:refreshWaitSeat()
    M.super.refreshWaitSeat(self)

    self.DiceNode:setVisible(false)

    self.mCallAnimationNode:setVisible(false)
    self.mOpenAnimationNode:setVisible(false)

    self.MultipleImage:setVisible(false)
    self.ResultMultipleImage:setVisible(false)
end

function M:setPlayerData(data)
    M.super.setPlayerData(self, data)

    self:refreshUserInfo()
end

function M:checkDiceData()
    self.mShakeTimes = self.mShakeTimes + 1
    if self.mShakeTimes < M.BASE_SHAKE_TIMES then
        return
    end

    self:stopActionByTag(M.RESHAKE_ACTION)
    self.mShakeTimes = 0
    self.mShaking = false
end

function M:refreshUserInfo()
    if self.mData:isEmptySeat() then
        return
    end

    local userInfo = self.mData:getUserInfo()

    self.NicknameText:setString(userInfo:getNickName())
    self.GoldNumText:setString(tostring(userInfo:getGold()))

    self.mAvatar:setUserIdAndUrl(userInfo:getUserId(), userInfo:getAvatarUrl())
end

function M:setCallNumAndPoint(num, point)
    self.mCallNumText:setString(tostring(num))

    local iconPath = string.format("Icon/0070/%04d.png", point)
    if cc.SpriteFrameCache:getInstance():getSpriteFrame(iconPath) then
        self.mCallDiceIcon:loadTexture(iconPath, ccui.TextureResType.plistType)
    end
end

function M:refreshCallInfo()

    local callInfo = g_GameData:getCallInfo()

    if not self.mData or not self.mData:isSelfSeatId(callInfo.seatId) then
        self.mCallAnimationNode:setVisible(false)
        return
    end

    self:setCallNumAndPoint(callInfo.num, callInfo.point)
    self.mCallAnimationNode:setVisible(true)
end

function M:refreshOpenDiceBoxInfo()
    local openInfo = g_GameData:getOpenDiceBoxInfo()

    if not self.mData or not self.mData:isSelfSeatId(openInfo.openSeatId) then
        self.mOpenAnimationNode:setVisible(false)
        return
    end

    -- TODO 多语言
    local openTextStr = "開"
    if openInfo.multiple > 1 then
        openTextStr = "搶開"
    end
    self.mOpenText:setString(openTextStr)

    self.mCallAnimationNode:setVisible(false)
    self.mOpenAnimationNode:setVisible(true)

    local iconPath = string.format("Icon/0030/%04d.png", openInfo.multiple)
    if cc.SpriteFrameCache:getInstance():getSpriteFrame(iconPath) then
        self.MultipleImage:ignoreContentAdaptWithSize(true)
        self.MultipleImage:loadTexture(iconPath, ccui.TextureResType.plistType)
        self.MultipleImage:setVisible(true)
    else
        self.MultipleImage:setVisible(false)
    end

    self.DiceBoxImage:stopAllActions()
    self.DiceBoxImage:setPosition(0, Constant.OpenMaxOffset)
    self.DiceBoxImage:setRotation(0)
    self.DiceBoxImage:setVisible(true)
end

function M:showTimerMask(time, startPercent, endPercent)
    self.mAvatar:showTimerMask(time, startPercent, endPercent)
end

function M:hideTimerMask()
    self.mAvatar:hideTimerMask()
end

function M:onAvatarPanelTouchEvent(sender, eventType)
    if eventType == ccui.TouchEventType.ended then
        --UIUtils.popToast("点击他人头像")
        if self.mData then
            local userInfo = self.mData:getUserInfo()
            local panel = UIManager:getOrCreatePanel("UIMineUserInfoLayer")
            if panel then
                panel:setUserId(userInfo:getUserId())
                panel:showToScene()
            end
        end
    end
end

function M:showGameOverGain(multiple, tax, goldChange)

    local iconPath = ""
    if goldChange < 0 then
        iconPath = string.format("Icon/0040/%04d.png", multiple)
    elseif goldChange > 0 then
        iconPath = string.format("Icon/0010/%04d.png", multiple)
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
    self:hideTimerMask()

    self.mCallAnimationNode:setVisible(false)
    self.mOpenAnimationNode:setVisible(false)

    M.super.onGameStart(self)
end

function M:onGameTurn(data)
    if self.mData and self.mData:isSelfSeatId(data.seatId) then
        self.mCallAnimationNode:setVisible(false)
        self.mOpenAnimationNode:setVisible(false)

        local startPercent = data.leftTime / Constant.TunrnTime * 100
        self:showTimerMask(data.leftTime / 1000, startPercent, 0)
    else
        self:hideTimerMask()
    end
end

function M:onGameCallPoint(data)
    if self.mData and self.mData:isSelfSeatId(data.seatId) then
        self.mOpenAnimationNode:setVisible(false)

        self:setCallNumAndPoint(data.num, data.point)

        -- TODO 执行气泡动画
        self.mCallAnimationNode:setVisible(true)
    else
        self.mCallAnimationNode:setVisible(false)
        self.mOpenAnimationNode:setVisible(false)
    end
end

function M:onGameOpenDiceBox(data)
    if self.mData and self.mData:isSelfSeatId(data.openSeatId) then

        -- TODO 多语言
        local openTextStr = "開"
        if data.multiple > 1 then
            openTextStr = "搶開"
        end
        self.mOpenText:setString(openTextStr)

        -- TODO 执行气泡动画
        self.mCallAnimationNode:setVisible(false)
        self.mOpenAnimationNode:setVisible(true)

        local iconPath = string.format("Icon/0030/%04d.png", data.multiple)
        if cc.SpriteFrameCache:getInstance():getSpriteFrame(iconPath) then
            self.MultipleImage:ignoreContentAdaptWithSize(true)
            self.MultipleImage:loadTexture(iconPath, ccui.TextureResType.plistType)
            self.MultipleImage:setVisible(true)
        else
            self.MultipleImage:setVisible(false)
        end

        -- 骰盅开启动画
        self:runDiceBoxOpenAction()
    end
end

function M:onGameExtraCompareChoose(data)
    if self.mData and self.mData:isSelfSeatId(data.bettor) then
        -- TODO 多语言
        local openTextStr = "跟開"
        self.mOpenText:setString(openTextStr)

        -- TODO 执行气泡动画
        self.mCallAnimationNode:setVisible(false)
        self.mOpenAnimationNode:setVisible(true)

        -- 骰盅开启动画
        self:runDiceBoxOpenAction()
    end
end

function M:onGameCallSeatChoose(data)
    if data.isReverse then
        local openInfo = g_GameData:getOpenDiceBoxInfo()
        if self.mData and self.mData:isSelfSeatId(openInfo.callSeatId) then
            -- TODO 多语言
            self.mOpenText:setString("反開")

            -- TODO 执行气泡动画
            self.mCallAnimationNode:setVisible(false)
            self.mOpenAnimationNode:setVisible(true)

            -- 骰盅开启动画
            self:runDiceBoxOpenAction()
        end
    end
end

function M:onUpdateUserResource(data)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.UpdateUserResource, "onUpdateUserResource")
end

return M