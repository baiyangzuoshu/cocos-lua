local UIPanel = require("app.gui.basegui.UIPanel")

local M = class("UIPackageShowItemTips", UIPanel)

M.GUI_FILE_NAME = "csd.01_03_PropKnapsack.01_03_PropKnapsackTipPopUp.lua"

M.BINDGUIDATANODE = {
    ["InteractionPopups"] = { varname = "InteractionPopups" },
    ["TitleText"] = { varname = "TitleText" },
    ["PropIcon"] = { varname = "PropIcon" },
    ["PropNum"] = { varname = "PropNum" },
}

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.BigItemIcon))

    self:initOutClickableArea()
end

function M:initOutClickableArea()
    local function onOutOfQuickBoxClick()
        self:closePanel()
    end

    UIUtils.addClickableNode(self.InteractionPopups, nil, onOutOfQuickBoxClick)
end

function M:onInit()
    M.super.onInit(self)
end

function M:setItemInfo(itemInfo)
    self.mItemInfo = itemInfo
end

function M:onEnter()
    M.super.onEnter(self)

    self:refreshUI()
end

function M:refreshUI()
    if not self.mItemInfo then return end

    local cfgData = self.mItemInfo:getCfgData()

    if not cfgData then return end

    if cfgData.IsShowNum then 
        self.PropNum:setVisible(true)
        self.PropNum:setString(Utils.getFormatNumber_MuitiLanguage(self.mItemInfo:getNetData().itemNum))
    else
        self.PropNum:setVisible(false)
    end

    self.TitleText:setString(cfgData.ShowName)
    self.PropIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.BigItemIcon, cfgData.BigItemIcon), ccui.TextureResType.plistType)
end

return M