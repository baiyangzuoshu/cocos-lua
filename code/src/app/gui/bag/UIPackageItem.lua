local UIPanel = require("app.gui.basegui.UIPanel")

local M = class("UIPackageItem", UIPanel)

M.GUI_FILE_NAME = "csd.01_03_PropKnapsack.01_03_PropKnapsackCell.lua"

M.BINDGUIDATANODE = {
    ["PropIcon"] = { varname = "itemIcon" },
    ["PropNum"] = { varname = "itemNum" },
    ["PropPanel"] = { varname = "PropPanel", onEvent = "onTouchEvent" },
    ["UsingNode"] = { varname = "UsingIcon" },
    ["InterimTipDotIcon"]={varname="InterimTipDotIcon"}
}

function M:refreshHot()
    if self.mItemInfo then 
        local netData = self.mItemInfo:getNetData()
        self.InterimTipDotIcon:setVisible(netData.isNew)
    end
end

function M:onCreate()
    M.super.onCreate(self)

    self:resetRootNodePosition(cc.p(0, 0))
    self:resetRootNodeAnchorPoint(cc.p(0, 0))

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.Head))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.HeadBox))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.BigItem))

    self.PropPanel:setSwallowTouches(false)
end

function M:getItemInfo()
    return self.mItemInfo
end

function M:setItemInfo(itemInfo)
    self.mItemInfo = itemInfo
    self:refreshItemInfo()
end

function M:refreshItemInfo()
    self.UsingIcon:setVisible(false)
    self:refreshHot()
    local showType = Enum.ItemShowType.Null
    if self.mItemInfo then
        showType = self.mItemInfo:getItemShowType()
    end
    if showType == Enum.ItemShowType.Diamond then 
        self:showDiamond()
    elseif showType == Enum.ItemShowType.Gold then
        self:showGold()
    elseif showType == Enum.ItemShowType.Avatar then
        self:showAvatar()
    elseif showType == Enum.ItemShowType.AvatarFrame then
        self:showAvatarFrame()
    elseif showType == Enum.ItemShowType.DiceCup then
        self:showDiceCup()
    elseif showType == Enum.ItemShowType.BubbleBox then
        self:showBubbleBox()
    elseif showType == Enum.ItemShowType.Material then
        self:showMaterial()
    end
end

function M:showDiamond()
    local netData = self.mItemInfo:getNetData()

    local cfgData = self.mItemInfo:getCfgData()
    self.m_data = cfgData

    if cfgData.IsShowNum then 
        self.itemNum:setVisible(true)
        self.itemNum:setString(netData.itemNum)
    else
        self.itemNum:setVisible(false)
    end
    self.itemIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.BigItem, self.m_data.ItemIcon), ccui.TextureResType.plistType)
end

function M:showGold()
    local netData = self.mItemInfo:getNetData()

    local cfgData = self.mItemInfo:getCfgData()
    self.m_data = cfgData

    if cfgData.IsShowNum then 
        self.itemNum:setVisible(true)
        self.itemNum:setString(netData.itemNum)
    else
        self.itemNum:setVisible(false)
    end
    self.itemIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.BigItem, self.m_data.ItemIcon), ccui.TextureResType.plistType)
end

function M:showAvatar()
    local netData = self.mItemInfo:getNetData()

    local cfgData = self.mItemInfo:getCfgData()
    self.m_data = cfgData

    if cfgData.IsShowNum then 
        self.itemNum:setVisible(true)
        self.itemNum:setString(netData.itemNum)
    else
        self.itemNum:setVisible(false)
    end
    self.itemIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.Head, self.m_data.ItemIcon), ccui.TextureResType.plistType)
end

function M:showAvatarFrame()
    local netData = self.mItemInfo:getNetData()

    local cfgData = self.mItemInfo:getCfgData()
    self.m_data = cfgData

    if cfgData.IsShowNum then 
        self.itemNum:setVisible(true)
        self.itemNum:setString(netData.itemNum)
    else
        self.itemNum:setVisible(false)
    end
    self.itemIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, self.m_data.ItemIcon), ccui.TextureResType.plistType)
end

function M:showDiceCup()
    local netData = self.mItemInfo:getNetData()

    local cfgData = self.mItemInfo:getCfgData()
    self.m_data = cfgData

    if g_UserData:getMyDiceBox() == netData.itemId then 
        self.UsingIcon:setVisible(true)
    else
        self.UsingIcon:setVisible(false)
    end

    if cfgData.IsShowNum then 
        self.itemNum:setVisible(true)
        self.itemNum:setString(netData.itemNum)
    else
        self.itemNum:setVisible(false)
    end
    self.itemIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.BigItem, self.m_data.ItemIcon), ccui.TextureResType.plistType)
end

function M:showBubbleBox()
    local netData = self.mItemInfo:getNetData()

    local cfgData = self.mItemInfo:getCfgData()
    self.m_data = cfgData

    if cfgData.IsShowNum then 
        self.itemNum:setVisible(true)
        self.itemNum:setString(netData.itemNum)
    else
        self.itemNum:setVisible(false)
    end
    self.itemIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.BigItem, self.m_data.ItemIcon), ccui.TextureResType.plistType)
end

function M:showMaterial()
    local netData = self.mItemInfo:getNetData()

    local cfgData = self.mItemInfo:getCfgData()
    self.m_data = cfgData

    if cfgData.IsShowNum then 
        self.itemNum:setVisible(true)
        self.itemNum:setString(netData.itemNum)
    else
        self.itemNum:setVisible(false)
    end
    self.itemIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.BigItem, self.m_data.ItemIcon), ccui.TextureResType.plistType)
end

function M:getData()
    return self.m_data
end

function M:setTouchCallBack(cb)
    self.mTouchCallBack = cb
end

function M:onTouchEvent(data)
    if data.event == "end" then
        SoundSystemManager:playSound004() 
        if self.mTouchCallBack then 
            self:mTouchCallBack()
        end
    end
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
    self:doRegEvent(Constant.CustomEvent.UIPackageItem_refreshHot,"refreshHot")
end
return M