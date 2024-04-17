local UIPanel = require("app.gui.basegui.UIPanel")

local M = class("NewWelfareNoviceCell", UIPanel)

M.GUI_FILE_NAME = "csd.03_08_NewWelfare.03_08_NewWelfareNoviceCell.lua"

M.BINDGUIDATANODE = {
    ["ResIcon"]={varname="ResIcon"},
    ["ResNum"]={varname="ResNum"},
    ["Bg"]={varname="Bg"}
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
    item:resetIcon(self.ResIcon)
    item:resetIconNum(self.ResNum)
    item:setItemInfo(itemInfo)
    item:setAnchorPoint(cc.p(10,10))
    item:setPosition(cc.p(0,0))
    item:setPropFrameVisible(false)
    item:setTouchCallBack(handler(self,self.itemCb))
    self.Bg:addChild(item)
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