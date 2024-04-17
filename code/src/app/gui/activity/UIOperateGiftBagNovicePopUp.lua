local UIPanel = require("app.gui.basegui.UIPanel")

local M = class("UIOperateGiftBagNovicePopUp", UIPanel)

M.GUI_FILE_NAME = "csd.03_10_OperateGiftBag.03_10_OperateGiftBagNovicePopUp.lua"

M.BINDGUIDATANODE = {
    ["GiftBagPanel"]={varname="ResPanel"},
    ["PriceNum"]={varname="PriceNum"},
    ["Desc"]={varname="Desc"},
    ["DescBg"]={varname="DescBg"},
    ["GiftBagText_TT"]={varname="GiftBagText_TT"},
    ["ContentText"]={varname="ContentText"},
    ["DescPanel"]={varname="DescPanel",onClick="onClickEvent"},
    ["ConfirmButton"]={varname="ConfirmButton",onClick="onClickEvent"},
    ["InteractionPopups"]={varname="InteractionPopups"}
}

function M:onClickEvent(ref)
    local   name=ref:getName()
    if "ConfirmButton"==name then
        self:closePanel()
        Utils.startPay(self.ProductId)
    end
end

function M:onCloseEvent()
    self:closePanel()
end

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)

    local GiftPackage=DataManager:getTbxData("GiftPackage",2)
    local RewardInfo=GiftPackage.RewardInfo
    local CentPrice=GiftPackage.CentPrice
    self.ProductId=GiftPackage.ProductId
    local VipExp=GiftPackage.VipExp

    local payInfo = g_StoreData:getPayInfo()
    if payInfo then
        self.PriceNum:setString(payInfo[self.ProductId])
    else
        self.PriceNum:setString("$"..(CentPrice/100))
    end

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

function M:onInit()
    M.super.onInit(self)
end

return M