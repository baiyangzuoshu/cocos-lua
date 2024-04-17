local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIGuessingCancelLayer", UIPanel)

local UIGuessingResultHeadCell = require("app.gui.game.UIGuessingResultHeadCell")

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_CancelLayer.lua"

M.BINDGUIDATANODE = {
    ["ReturnGoldNum"] = {varname="ReturnGoldNum"},

    ["GuessingNode_1"]={varname="EnoughWinNode"},
    ["GuessingNode_2"]={varname="UnEnoughWinNode"},

    ["LeftHeadPanel"]={varname="EnoughHeadPanel"},
    ["RightHeadPanel"] = {varname="UnEnoughHeadPanel"},
}
function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)
    self.mCountTime = 0
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.MiniItem))
    self.PanelSize = self.EnoughHeadPanel:getContentSize()
end

function M:onEnter()
    M.super.onEnter(self)
    self.mCountTime = 4
end

function M:setData(isEnoughWin,prizeInfoList)
    self.EnoughHeadPanel:removeAllChildren()
    self.UnEnoughHeadPanel:removeAllChildren()

    self.EnoughWinNode:setVisible(isEnoughWin)
    self.UnEnoughWinNode:setVisible(not isEnoughWin)

    for _,v in ipairs(prizeInfoList) do
        if v.betGold ~= 0 then
            local head = UIGuessingResultHeadCell.new() --生成头像,设置数据、坐标
            head:resetCenterPosition()
            if head:initData(v.uid,v.avatar) then
                local headsize = head:getContentSize()
                local _scale = 1
                if head:isMe() then
                    --设置本人头像层级高于其他头像
                    head:setLocalZOrder(2)
                    self.ReturnGoldNum:setString("+"..Utils.getFormatNumber_MuitiLanguage(v.betGold))
                else
                    --其他头像缩放64%
                    _scale = 0.64
                    head:setScale(_scale)
                    head:setLocalZOrder(1)
                end
            
                if v.believeEnough then--确定头像放置区域
                    self.EnoughHeadPanel:addChild(head)
                else
                    self.UnEnoughHeadPanel:addChild(head)
                end

                local posx = math.random(0,self.PanelSize.width-headsize.width*_scale)
                local posy = math.random(0,self.PanelSize.height-headsize.height*_scale)
                head:setPosition(cc.p(posx,posy))
            end
        end
    end
end

function M:OnUpdate(dt)
    if self.mCountTime<=0 then
        self:closePanel()
    end

    self.mCountTime=self.mCountTime-dt
end

return M