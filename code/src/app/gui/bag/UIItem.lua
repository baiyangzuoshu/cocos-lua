local UIPanel = require("app.gui.basegui.UIPanel")

local M = class("UIItem", UIPanel)

M.GUI_FILE_NAME = "csd.01_17_GetRes.01_17_EnclosureLayer.lua"

M.BINDGUIDATANODE = {
    ["PropIcon"] = { varname = "itemIcon" },
    ["PropNum"] = { varname = "itemNum" },
    ["PropPanel"] = { varname = "PropPanel", onEvent = "onTouchEvent" },
    ["PropFrame"]={varname="PropFrame"}
}

function M:onCreate()
    M.super.onCreate(self)

    self:resetRootNodePosition(cc.p(0, 0))
    self:resetRootNodeAnchorPoint(cc.p(0, 0))

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.MiniItem))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.Head))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.HeadBox))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.StaticDiceBox))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.BigItem))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.ChatEmoji))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.MagicEmoji))

    self.PropPanel:setSwallowTouches(false)
end

function M:resetIcon(icon)
    self.itemIcon:setVisible(false)

    self.itemIcon=icon
end

function M:resetIconNum(iconNum)
    self.itemNum:setVisible(false)

    self.itemNum=iconNum
end

function M:setPropFrameVisible(is)
    self.PropFrame:setVisible(is)
end

function M:setItemInfo(itemInfo)
    self.mItemInfo = itemInfo
    self:refreshItemInfo()
end

function M:refreshItemInfo()
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
    elseif showType == Enum.ItemShowType.ChatEmoji then
        self:showChatEmoji()
    elseif showType == Enum.ItemShowType.MagicEmoji then
        self:showMagicEmoji()
    elseif showType == Enum.ItemShowType.Material then
        self:showMaterial()
    end
end

function M:showDiamond()
    local netData = self.mItemInfo:getNetData()

    self.m_data = self.mItemInfo:getCfgData()

    self.itemNum:setString(Utils.getFormatNumber_MuitiLanguage(netData.itemNum))
    self.itemIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.BigItem, self.m_data.ItemIcon), ccui.TextureResType.plistType)
end

function M:showGold()
    local netData = self.mItemInfo:getNetData()

    self.m_data = self.mItemInfo:getCfgData()

    self.itemNum:setString(Utils.getFormatNumber_MuitiLanguage(netData.itemNum))
    self.itemIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.BigItem, self.m_data.ItemIcon), ccui.TextureResType.plistType)
end

function M:showAvatar()
    local netData = self.mItemInfo:getNetData()

    self.m_data = self.mItemInfo:getCfgData()

    self.itemNum:setString(netData.itemNum)
    self.itemIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.BigItem, self.m_data.ItemIcon), ccui.TextureResType.plistType)
end

function M:showAvatarFrame()
    local netData = self.mItemInfo:getNetData()

    self.m_data = self.mItemInfo:getCfgData()

    self.itemNum:setString(netData.itemNum)
    self.itemIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.BigItem, self.m_data.ItemIcon), ccui.TextureResType.plistType)
end

function M:showDiceCup()
    local netData = self.mItemInfo:getNetData()

    self.m_data = self.mItemInfo:getCfgData()

    local isShowNum = self.m_data.IsShowNum
    if isShowNum then 
        self.itemNum:setVisible(true)
        self.itemNum:setString(netData.itemNum)
    else
        self.itemNum:setVisible(false)
    end
    self.itemIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.BigItem, self.m_data.ItemIcon), ccui.TextureResType.plistType)
end

function M:showBubbleBox()
    local netData = self.mItemInfo:getNetData()

    self.m_data = self.mItemInfo:getCfgData()

    self.itemNum:setString(netData.itemNum)
    self.itemIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.BigItem, self.m_data.ItemIcon), ccui.TextureResType.plistType)
end

function M:showMaterial()
    local netData = self.mItemInfo:getNetData()

    self.m_data = self.mItemInfo:getCfgData()

    self.itemNum:setString(netData.itemNum)
    self.itemIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.BigItem, self.m_data.ItemIcon), ccui.TextureResType.plistType)
end

function M:showChatEmoji()
    local netData = self.mItemInfo:getNetData()

    self.m_data = self.mItemInfo:getCfgData()

    self.itemNum:setVisible(false)
    self.itemIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.ChatEmoji, self.m_data.ItemIcon), ccui.TextureResType.plistType)
end

function M:showMagicEmoji()
    local netData = self.mItemInfo:getNetData()

    self.m_data = self.mItemInfo:getCfgData()

    self.itemNum:setVisible(false)
    self.itemIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.MagicEmoji, self.m_data.ItemIcon), ccui.TextureResType.plistType)
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
        else
            self:showInfo()
        end
    end
end

function M:showInfo()
    local itemInfo = self.mItemInfo
    local itemTips = UIManager:getOrCreatePanel("UIPackageShowItemTips")
    if itemTips then 
        itemTips:setItemInfo(itemInfo)
        itemTips:showToScene()
    end
end

return M