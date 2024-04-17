local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UINoviceGuideLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_16_NoviceGuide.01_16_NoviceGuideLayer.lua"

M.BINDGUIDATANODE = {
    ["NoviceGuideText_1_TT"]={varname="NoviceGuideText_1_TT"},
    ["NoviceGuideText_2_TT"]={varname="NoviceGuideText_2_TT"},
    ["InteractionPopups"]={varname="InteractionPopups",onClick="onClickEvent"}
}

function M:onClickEvent()
    if 1==g_HotData:getGuideStep() then
        self:closePanel(0)
        g_HotData:setGuideStep(2)
        local   panel=UIManager:getOrCreatePanel("UINoviceStartGuideLayer")
        if panel then
            panel:showToScene()
        end
    elseif 2==g_HotData:getGuideStep() then
        self:closePanel()
    elseif 3==g_HotData:getGuideStep() then
        g_UserData:setGuideTime(4)
        g_HotData:C2S_guideStepUpdate(4)
        self:closePanel()

        g_ActivityData:clearShowLayer()
        g_ActivityData:pushLayerName("UINewWelfareLoginPopUp")
        g_ActivityData:pushLayerName("UIOperateGiftBagNovicePopUp")

    end
end

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true,255*0.75)

    self.NoviceGuideText_1_TT:setVisible(false)
    self.NoviceGuideText_2_TT:setVisible(false)
end

function M:onInit()
    M.super.onInit(self)
    self.NoviceGuideText_1_TT:setVisible(1==g_HotData:getGuideStep())
    self.NoviceGuideText_2_TT:setVisible(3==g_HotData:getGuideStep())
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
    
end

function M:onCleanup()
    M.super.onCleanup(self)
end

return M