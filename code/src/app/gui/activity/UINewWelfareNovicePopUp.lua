local UIPanel = require("app.gui.basegui.UIPanel")

local M = class("UINewWelfareNovicePopUp", UIPanel)

M.GUI_FILE_NAME = "csd.03_08_NewWelfare.03_08_NewWelfareNovicePopUp.lua"

M.BINDGUIDATANODE = {
    ["ResPanel"]={varname="ResPanel"},
    ["ReceiveButton"]={onClick="onRewardEvent"},
}

function M:onRewardEvent()
    g_HotData:setGuideStep(3)
    g_HotData:C2S_guideStepUpdate(3)
    g_ActivityData:C2S_gainRegisterReward()
    self:closePanel()
end

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)

    local GiftPackage=DataManager:getTbxData("GiftPackage",1)
    local RewardInfo=GiftPackage.RewardInfo
    local len=#RewardInfo
    local offestX=120/2*(len+2)
    for i=1,len,1 do
        local v=RewardInfo[i]
        local item=UIManager:createPanelOnly("OperateGiftBagNoviceCell")
        item:refreshUI(v)
        item:setPosition(cc.p(120*i+self.ResPanel:getContentSize().width/2-offestX,0))
        self.ResPanel:addChild(item)
    end
end

function M:itemCb(item)
    local itemInfo = item.mItemInfo

    local itemTips = UIManager:getOrCreatePanel("UIPackageShowItemTips")
    if itemTips then 
        itemTips:setItemInfo(itemInfo)
        itemTips:showToScene()
    end
end

return M