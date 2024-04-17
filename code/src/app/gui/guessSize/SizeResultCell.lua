local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("SizeResultCell", UIPanel)

M.GUI_FILE_NAME = "csd.02_02_GuessSize.02_02_SizeResultCell.lua"

M.BINDGUIDATANODE = {
   ["SizeResultNode"]={varname="SizeResultNode_2"},
   ["SizeResultNode_1"]={varname="SizeResultNode_1"},
   ["SizeResult_1_0"]={varname="SizeResult_1_1"},
   ["SizeResult_2_0"]={varname="SizeResult_1_2"},
   ["SizeResult_3_0"]={varname="SizeResult_1_3"},
   ["SizeResult_4_0"]={varname="SizeResult_1_4"},
   ["SizeResult_5_0"]={varname="SizeResult_1_5"},
   ["SizeResult_6_0"]={varname="SizeResult_1_6"},
   ["SizeResult_7_0"]={varname="SizeResult_1_7"},
   ["SizeResult_8_0"]={varname="SizeResult_1_8"},
   ["SizeResult_9_0"]={varname="SizeResult_1_9"},
   ["SizeResult_10_0"]={varname="SizeResult_1_10"},
   ["SizeResult_11_0"]={varname="SizeResult_1_11"},
   ["SizeResult_1"]={varname="SizeResult_2_1"},
   ["SizeResult_2"]={varname="SizeResult_2_2"},
   ["SizeResult_3"]={varname="SizeResult_2_3"},
   ["SizeResult_4"]={varname="SizeResult_2_4"},
   ["SizeResult_5"]={varname="SizeResult_2_5"},
   ["SizeResult_6"]={varname="SizeResult_2_6"},
   ["SizeResult_7"]={varname="SizeResult_2_7"},
   ["SizeResult_8"]={varname="SizeResult_2_8"},
   ["SizeResult_9"]={varname="SizeResult_2_9"},
   ["SizeResult_10"]={varname="SizeResult_2_10"},
   ["SizeResult_11"]={varname="SizeResult_2_11"},
}

local betType = {
    BIG = 1,
    SMALL = 2,
}

function M:onCreate()
    M.super.onCreate(self)

    self.state = betType.SMALL
    self.SizeResultNode_1:setVisible(false)

    for i=1, 11, 1 do
        local sizeResultSprite = UIManager:createPanelOnly("app.gui.guessSize.UISizeResultSpriteCell")
        local sizeResultSmallNode = self["SizeResult_"..betType.SMALL.."_"..i]
        sizeResultSmallNode:addChild(sizeResultSprite)
        sizeResultSprite:resetCenterPosition()
    end

    for i=1, 11, 1 do
        local sizeResultSprite = UIManager:createPanelOnly("app.gui.guessSize.UISizeResultSpriteCell")
        local sizeResultBigNode = self["SizeResult_"..betType.BIG.."_"..i]
        sizeResultBigNode:addChild(sizeResultSprite)
        sizeResultSprite:resetCenterPosition()
    end
end

function M:setData(data)
    self.SizeResultNode_2:setVisible(false)
    self.SizeResultNode_1:setVisible(false)

    local SizeResultNode=self["SizeResultNode_"..self.state]
    SizeResultNode:setVisible(true)

    for i=1,11,1 do
        local   SizeResult=self["SizeResult_"..self.state.."_"..i]
        SizeResult:setVisible(false)
        SizeResult:setOpacity(255)
    end

    for i=1,#data,1 do
        if i>11 then
            break
        end

        local SizeResult = self["SizeResult_"..self.state.."_"..i]
        SizeResult:setVisible(true)

        local betType = data[#data - i + 1]
        local child = SizeResult:getChildByName("app.gui.guessSize.UISizeResultSpriteCell")
        if child then
            child:refreshSpriteByBetType(betType)
        end
    end

    local spriteSize = { width = 32, height = 32 }
    local SizeResult_1 = self["SizeResult_"..self.state.."_"..1]
    local firstCell = SizeResult_1:getChildByName("app.gui.guessSize.UISizeResultSpriteCell")
    if firstCell then 
        spriteSize = firstCell:getSpriteSize()
        local firstImage = firstCell:getShowImage()
        if firstImage then 
            firstImage:setOpacity(0)
            firstImage:runAction(cc.FadeIn:create(0.5))
        end
    end

    for i = GSystem.ShowResultNum, #data, 1 do
        if i > 11 then break end
        local SizeResult = self["SizeResult_"..self.state.."_"..i]
        SizeResult:setVisible(GSystem.ShowResultNum == i)
        if GSystem.ShowResultNum +  1== i then
            SizeResult:setVisible(true)
            local lastCell = SizeResult:getChildByName("app.gui.guessSize.UISizeResultSpriteCell")
            if lastCell then
                local lastImage = lastCell:getShowImage()
                if lastImage then 
                    lastImage:setOpacity(255)
                    lastImage:runAction(cc.FadeOut:create(0.5))
                end
            end
        end
    end

    SizeResultNode:runAction(cc.MoveTo:create(0.5,cc.p(spriteSize.width, 0)))

    self:reset()
end

function M:reset()
    if betType.SMALL == self.state then
        self.state = betType.BIG
    else
        self.state = betType.SMALL
    end

    local SizeResultNode = self["SizeResultNode_"..self.state]
    SizeResultNode:setPositionX(0)
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:onCleanup()
    M.super.onCleanup(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
end

return M