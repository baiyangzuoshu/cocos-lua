local UIPanel = require("app.gui.basegui.UIPanel")

local M = class("UIReliefLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_18_Relief.01_18_ReliefLayer.lua"

M.BINDGUIDATANODE = {
    ["ReliefText_2_TT"]={varname="ReliefText_2_TT"},
    ["ReliefButtonText_TT"]={varname="ReliefButtonText_TT"},
    ["ReliefButton"]={onClick="onClickEvent"},
}

function M:onClickEvent()
    g_ActivityData:C2S_gainRescueGold()
    self:closePanel()
end

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)
    
    self.ReliefText=self.ReliefText_2_TT:getString()
    self.ReliefButtonText=self.ReliefButtonText_TT:getString()
end

function M:onInit()
    M.super.onInit(self)

    local   ReliefTriggerGoldNumber=GSystem.ReliefTriggerGoldNumber--触发金币数量
    local   ReliefGoldNumber=GSystem.ReliefGoldNumber--每次救济金币数量
    local   ReliefDailyCapNumber=GSystem.ReliefDailyCapNumber--每日上限次数
    local   num=g_UserData:getDailyReliefCount()+1
    self.ReliefButtonText_TT:setString(Utils.getFormatString(self.ReliefButtonText,ReliefGoldNumber..";"))
    self.ReliefText_2_TT:setString(Utils.getFormatString(self.ReliefText,num..";"..ReliefDailyCapNumber..";"))
end

return M