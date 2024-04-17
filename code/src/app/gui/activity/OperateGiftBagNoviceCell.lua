local UIPanel = require("app.gui.basegui.UIPanel")

local M = class("OperateGiftBagNoviceCell", UIPanel)

M.GUI_FILE_NAME = "csd.03_10_OperateGiftBag.03_10_OperateGiftBagNoviceCell.lua"

M.BINDGUIDATANODE = {
    ["GiftResIcon"]={varname="GiftResIcon"},
    ["GiftResNum"]={varname="GiftResNum"},
    ["GiftRes"]={varname="GiftRes"}
}

function M:onCreate()
    M.super.onCreate(self)
end

function M:refreshUI(v)
    local itemId,itemNum=Utils.parseItemData(v)
    local item=DataManager:getTbxData("Item",itemId)
    local netData = {}
    netData.itemShowType = item.ItemType
    netData.itemId = item.ItemId
    netData.itemNum = itemNum

    local itemInfo = require("app.bean.ItemInfo").new(netData, item.ItemType)
    local item = UIManager:createPanelOnly("UIItem")
    item:resetIcon(self.GiftResIcon)
    item:resetIconNum(self.GiftResNum)
    item:setItemInfo(itemInfo)
    item:setAnchorPoint(cc.p(0,0))
    item:setPosition(cc.p(-45,-45))
    item:setPropFrameVisible(false)
    item:setTouchCallBack(handler(self,self.itemCb))
    self.GiftRes:addChild(item)
end

function M:itemCb(item)
    local itemInfo = item.mItemInfo

    local itemShowType = itemInfo:getItemShowType()

    if itemShowType == Enum.ItemShowType.DiceCup then 
        local diceUpTips = UIManager:getOrCreatePanel("UIPackageShowDiceUp")
        if diceUpTips then 
            diceUpTips:setItemInfo(itemInfo)
            diceUpTips:showToScene()
            diceUpTips:setIsCanUse(false)
        end
    else
        local itemTips = UIManager:getOrCreatePanel("UIPackageShowItemTips")
        if itemTips then 
            itemTips:setItemInfo(itemInfo)
            itemTips:showToScene()
        end
    end
end

function M:onInit()
    M.super.onInit(self)
end

return M