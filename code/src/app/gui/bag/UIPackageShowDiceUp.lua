local UIPanel = require("app.gui.basegui.UIPanel")

local M = class("UIPackageShowDiceUp", UIPanel)

M.GUI_FILE_NAME = "csd.01_03_PropKnapsack.01_03_PropKnapsackDiceCupPopUp.lua"

M.BINDGUIDATANODE = {
    ["InteractionPopups"] = { varname = "InteractionPopups" },
    ["TitleText"] = { varname = "TitleText" },
    ["PropIcon"] = { varname = "PropIcon" },
    ["UsingNode"] = { varname = "UsingIcon" },
    ["UseButton"] = { varname = "UseButton", onClick = "onClickUseDiceUp" },
    ["TitleDepictText"] = { varname = "TitleDepictText" },
}

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.StaticDiceBox))

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
    
    self.isCanUse = true
end

function M:setItemInfo(itemInfo)
    self.mItemInfo = itemInfo
end

function M:setIsCanUse(isCanUse)
    self.isCanUse = isCanUse
end

function M:onEnter()
    M.super.onEnter(self)

    self:refreshUI()
end

function M:refreshUI()
    if not self.mItemInfo then return end

    local cfgData = self.mItemInfo:getCfgData()

    if not cfgData then return end

    self.TitleText:setString(cfgData.ShowName)
    self.PropIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.StaticDiceBox, cfgData.ItemIcon), ccui.TextureResType.plistType)
    self.TitleDepictText:setString(cfgData.Desc)

    local netData = self.mItemInfo:getNetData()

    if not netData then return end

    if self.isCanUse then 
        if g_UserData:getMyDiceBox() == netData.itemId then 
            self.UsingIcon:setVisible(true)
            self.UseButton:setVisible(false)
        else
            self.UsingIcon:setVisible(false)
            self.UseButton:setVisible(true)
        end
    else
        self.UsingIcon:setVisible(false)
        self.UseButton:setVisible(false)
    end
end

function M:onClickUseDiceUp(ref)
    if not self.mItemInfo then return end

    local netData = self.mItemInfo:getNetData()

    if not netData then return end

    g_UserData:requestUseDiceBox(netData.itemId)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.UpdateUserInfo, "refreshUI")
end

return M