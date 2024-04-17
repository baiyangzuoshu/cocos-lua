local UIPanel = require("app.gui.basegui.UIPanel")

local M = class("ActivitiesCell", UIPanel)

M.GUI_FILE_NAME = "csd.01_11_ActivitiesBulletin.01_11_ActivitiesCell.lua"

M.BINDGUIDATANODE = {
    ["ActivitiesPanel"]={varname="ActivitiesPanel",onClick="onClickEvent"},
    ["ActivitiesImage"]={varname="ActivitiesImage"},
    ["ActivitiesTitleImage_IVT"]={varname="ActivitiesTitleImage_IVT"},
    ["TimeText_TT"]={varname="TimeText_TT"},
    ["ActivitiesTipDotIcon"]={varname="ActivitiesTipDotIcon"}
}

function M:onClickEvent(ref)
    if 1==self.data.ActivityId then
        SoundSystemManager:playSound004()
        local panel=UIManager:getOrCreatePanel("UINewWelfareLoginPopUp")
        if panel then
            panel:showToScene()
        end
    end
end

function M:refreshHot()
    self.ActivitiesTipDotIcon:setVisible(g_TaskData:isShowSevenLogin())
end

function M:refreshUI(data)
    self.data=data
    local endDate=Utils.getFormatStringToDate(data.EndDate,"-")
    local curDate=Utils.getFormatNowUnixTimeToDate()
    local y=endDate.year-curDate.year
    local m=endDate.month-curDate.month
    local d=endDate.day-curDate.day
    local h=endDate.hour-curDate.hour
    local num1=y*356+m*30+d
    local num2=h
    if num2<0 then
        num1=num1-1
        num2=num2+24
    end
    local str=string.format("%d;%d;",num1,num2)
    self.TimeText_TT:setString(Utils.getFormatString(self.timeStr,str))
    self.TimeText_TT:setVisible(data.IsShowCountdown)
    self:refreshHot()
end

function M:onCreate()
    M.super.onCreate(self)
    self.ActivitiesPanel:setSwallowTouches(false)
    self.timeStr=self.TimeText_TT:getString()
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
    
    self:doRegEvent(Constant.CustomEvent.refreshHotActivity, "refreshHot")
    
end

return M