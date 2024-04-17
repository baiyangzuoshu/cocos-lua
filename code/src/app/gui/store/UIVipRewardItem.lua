local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIVipRewardItem", UIPanel)

M.GUI_FILE_NAME = "csd.03_01_Shop.03_01_ShopVipRewardCell.lua"

M.BINDGUIDATANODE = {
    ["RewardIcon"] = { varname = "itemIcon" },
    ["RewardNum"] = { varname = "itemNum" },
    ["PropPanel"] = { onClick="onClickEvent" },
}

function M:onClickEvent()
    SoundSystemManager:playSound004() 
end

function M:onCreate()
    M.super.onCreate(self)

    self:resetRootNodePosition(cc.p(0, 0))
    self:resetRootNodeAnchorPoint(cc.p(0, 0))

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.BigItem))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.MiniItem))
end

function M:setItemInfo(itemInfo)
    self.mItemInfo = require("app.bean.ItemInfo").new(itemInfo, itemInfo[1])
    self:refreshUI()
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:refreshUI()
    if not self.mItemInfo then return end 

    local netData = self.mItemInfo:getNetData()

    if not netData then return end 
    
    local itemId = 0
    local itemNum = 0
    local itemType = netData[1]
    if itemType == Enum.ItemShowType.Diamond then
        itemId = GSystem.DiamondItemId
        itemNum = netData[2][1]
    elseif itemType == Enum.ItemShowType.Gold then
        itemId = GSystem.GoldItemId
        itemNum = netData[2][1]
    end
    self.itemNum:setString(Utils.getFormatNumber_MuitiLanguage(itemNum))
    self.itemIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.MiniItem, itemId), ccui.TextureResType.plistType)
end

function M:onCleanup()
    M.super.onCleanup(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
end

return M