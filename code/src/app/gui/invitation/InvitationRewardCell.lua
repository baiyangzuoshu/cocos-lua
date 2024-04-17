
local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("InvitationRewardCell", UIPanel)

M.GUI_FILE_NAME = "csd.03_04_Invitation.03_04_InvitationRewardCell.lua"

M.BINDGUIDATANODE = {
    ["RewardIcon"]={varname="RewardIcon"},
    ["RewardNum"]={varname="RewardNum"},
    ["RewardPanel"]={varname="RewardPanel", onClick="onClickEvent"},
    ["Reward"] = { varname = "Reward"},
}

function M:onClickEvent()
    SoundSystemManager:playSound004()
    local netData = {}
    netData.itemId = self.mRewardCellId or GSystem.DiamondItemId
    netData.itemType = self.mRewardCellType or Enum.ItemShowType.Diamond
    netData.itemNum = self.mRewardCellNum or 0
    local itemInfo = require("app.bean.ItemInfo").new(netData, self.mRewardCellType)
    local itemTips = UIManager:getOrCreatePanel("UIPackageShowItemTips")
    if itemTips then 
        itemTips:setItemInfo(itemInfo)
        itemTips:showToScene()
    end
end

function M:refreshData(type, num)
    self.mRewardCellType = type
    self.mRewardCellNum = num
    local diamondId = GSystem.DiamondItemId
    local goldId = GSystem.GoldItemId
    local diamondIcon = DataManager:getTbxData("Item", diamondId).BigItemIcon
    local goldIcon = DataManager:getTbxData("Item", goldId).BigItemIcon
    if Enum.ItemShowType.Diamond == type then--钻石
        self.mRewardCellId = diamondId
        self.RewardIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.BigItem, diamondIcon), ccui.TextureResType.plistType)
    elseif Enum.ItemShowType.Gold == type then--金币
        self.mRewardCellId = goldId
        self.RewardIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.BigItem, goldIcon), ccui.TextureResType.plistType)
    end
    self.RewardNum:setString(Utils.getFormatNumber_MuitiLanguage(tostring(num)))
    if num <= 0 then 
        self.Reward:setOpacity(125)
    else
        self.Reward:setOpacity(255)
    end
    --self.RewardReceivedPanel:setVisible(num<=0)
end

function M:onCreate()
    M.super.onCreate(self)

    self.mRewardCellType = Enum.ItemShowType.Diamond
    self.mRewardCellId = 1
    self.mRewardCellNum = 0
end

function M:init(type)
    self.mRewardCellType = type
    local diamondId = GSystem.DiamondItemId
    local goldId = GSystem.GoldItemId
    local diamondIcon = DataManager:getTbxData("Item", diamondId).BigItemIcon
    local goldIcon = DataManager:getTbxData("Item", goldId).BigItemIcon
    if Enum.ItemShowType.Diamond == type then
        self.mRewardCellId = diamondId
        self.RewardIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.BigItem, goldIcon), ccui.TextureResType.plistType)
    else
        self.mRewardCellId = goldId
        self.RewardIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.BigItem, diamondIcon), ccui.TextureResType.plistType)
    end
    self.mRewardCellNum = 0
    self.RewardNum:setString(tostring(self.mRewardCellNum))
end

function M:onInit()
    M.super.onInit(self)
end

return M