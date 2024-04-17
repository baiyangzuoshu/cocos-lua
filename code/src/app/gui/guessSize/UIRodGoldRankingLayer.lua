local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIRodGoldRankingLayer", UIPanel)

M.GUI_FILE_NAME = "csd.02_02_GuessSize.02_02_RodGoldRankingLayer.lua"

M.BINDGUIDATANODE = {
   ["SumUpGoldNum"]={varname="SumUpGoldNum"},
   ["SumUpEggNum"]={varname="SumUpEggNum"},
   ["RankingPlayerNode_1"]={varname="RankingPlayerNode_1"},
   ["RankingPlayerNode_2"]={varname="RankingPlayerNode_2"},
   ["RankingPlayerNode_3"]={varname="RankingPlayerNode_3"},
   ["RankingPlayerNode_4"]={varname="RankingPlayerNode_4"},
   ["RankingPlayerNode_5"]={varname="RankingPlayerNode_5"},
}

function M:onCloseEvent()
    if self.closeCD>60*7 then return end--最少显示3秒

    self:closePanel()
end

function M:onCreate()
    M.super.onCreate(self)
    self.closeCD=60*10
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.VipIcon))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.VipIconTail))
    self:setShadeShowModel(true,125)
end

function M:refreshUI(rankData)
    self.SumUpEggNum:setString("x"..rankData.count)
    self.SumUpGoldNum:setString(Utils.getFormatNumber_MuitiLanguage(rankData.goldTotal))
    local list={}
    for _,v in ipairs(rankData.list) do
        if v.goldTotal>0 then
            table.insert(list,v)
        end
    end
    table.sort(list,function(a,b)
        if a.goldTotal>b.goldTotal then
            return true
        elseif a.goldTotal==b.goldTotal then
            if a.count<b.count then
                return true
            end
        end

        return false
    end)

    for i=1,5,1 do
        local RankingPlayerNode=self["RankingPlayerNode_"..i]
        RankingPlayerNode:removeAllChildren()

        if not list[i] then return end
        list[i].rank=i
        local panel=UIManager:createPanelOnly("RankingPlayerCell")
        panel:resetCenterPosition()
        RankingPlayerNode:addChild(panel)
        panel:refreshUI(list[i])
    end
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

function M:OnUpdate(dt)
    self.closeCD=self.closeCD-1
    if self.closeCD<0 then
        self:closePanel()
    end
end
return M