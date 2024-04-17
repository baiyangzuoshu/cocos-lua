local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIDiceChooseLayer", UIPanel)

M.GUI_FILE_NAME = "csd.3_combat.3_01_fight.3_01_4_SifterSelectLayer.lua"

M.BINDGUIDATANODE = {
    ["Panel_1"] = { varname = "Dice_1", onTouch = "onDiceTouchEvent" },
    ["Normal_1"] = { varname = "DiceUnselect_1" },
    ["Selected_1"] = { varname = "DiceSelect_1" },

    ["HasBeenCalledBg"] = { varname = "OneCalledNode" },
    ["HasBeenCalledBg_1"] = { varname = "OneDiceImage" },
    ["HasBeenCalledText"] = { varname = "OneDiceCalledText" },

    ["Panel_2"] = { varname = "Dice_2", onTouch = "onDiceTouchEvent" },
    ["Normal_2"] = { varname = "DiceUnselect_2" },
    ["Selected_2"] = { varname = "DiceSelect_2" },

    ["Panel_3"] = { varname = "Dice_3", onTouch = "onDiceTouchEvent" },
    ["Normal_3"] = { varname = "DiceUnselect_3" },
    ["Selected_3"] = { varname = "DiceSelect_3" },

    ["Panel_4"] = { varname = "Dice_4", onTouch = "onDiceTouchEvent" },
    ["Normal_4"] = { varname = "DiceUnselect_4" },
    ["Selected_4"] = { varname = "DiceSelect_4" },

    ["Panel_5"] = { varname = "Dice_5", onTouch = "onDiceTouchEvent" },
    ["Normal_5"] = { varname = "DiceUnselect_5" },
    ["Selected_5"] = { varname = "DiceSelect_5" },

    ["Panel_6"] = { varname = "Dice_6", onTouch = "onDiceTouchEvent" },
    ["Normal_6"] = { varname = "DiceUnselect_6" },
    ["Selected_6"] = { varname = "DiceSelect_6" },

}

local MAX_POINT = 6

function M:onCreate()
    M.super.onCreate(self)

    self:setShadeShowModel(true)

    self.mSelectDice = -1

    self.OneCalledNode:setVisible(false)

    self.mRefreshGameLayerCB = nil

    self.mDices = {}
    for i = 1, MAX_POINT do
        local touchPanel = self[string.format("Dice_%d", i)]
        touchPanel:setTag(i)

        local unselect = self[string.format("DiceUnselect_%d", i)]
        local select = self[string.format("DiceSelect_%d", i)]

        self.mDices[i] = { touchPanel = touchPanel, unselect = unselect, select = select }
    end
end

function M:onEnter()
    M.super.onEnter(self)

    self:refreshOneCalledState()

end

function M:onExit()
    M.super.onExit(self)
end

function M:onScreenTouchEvent(ref, type)
    M.super.onScreenTouchEvent(self, ref, type)

    if type == ccui.TouchEventType.ended then
        self:closePanel()
    end
end

function M:setChooseCallback(cb)
    self.mRefreshGameLayerCB = cb
end

function M:showDiceTouched(diceValue)
    for i, v in ipairs(self.mDices) do
        local state = (i == diceValue)
        v.unselect:setVisible(not state)
        v.select:setVisible(state)
    end
end

function M:setSelectDice(diceValue)
    self.mSelectDice = diceValue
    self:showDiceTouched(diceValue)
end


function M:onDiceTouchEvent(sender, eventType)

    local diceValue = sender:getTag()
    if eventType == ccui.TouchEventType.began then
        self:showDiceTouched(diceValue)
    elseif eventType == ccui.TouchEventType.moved then
        --[[--
        local pos = sender:getTouchMovePosition()
        local posInNode = sender:convertToNodeSpace(pos)

        local size = sender:getContentSize()
        local rect = cc.rect(0, 0, size.width, size.height)
        if not cc.rectContainsPoint(rect, posInNode) then
            self:showDiceTouched(self.mSelectDice)
        else
            self:showDiceTouched(diceValue)
        end
        --]]
    elseif eventType == ccui.TouchEventType.ended then
        self:setSelectDice(diceValue)

        if self.mRefreshGameLayerCB then
            self.mRefreshGameLayerCB(self.mSelectDice)
        end
    elseif eventType == ccui.TouchEventType.canceled then
        self:setSelectDice(self.mSelectDice)
    end
end

function M:refreshOneCalledState()
    self.OneCalledNode:setVisible(g_GameData:isOneCalled())
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.GameCallPoint, "onGameCallPoint")

end

function M:onGameCallPoint(data)
    self:refreshOneCalledState()
end

return M