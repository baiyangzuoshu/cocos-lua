local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UINewItemLayer", UIPanel)

M.GUI_FILE_NAME = "csd.0_general.0_04_acquire.0_04_1_AcquireLayer.lua"

M.BINDGUIDATANODE = {
    ["ResourceBg"] = { varname = "ItemImage" },
    ["ResourceIcon"] = { varname = "ItemIcon" },
    ["ResourceNum"] = { varname = "ItemNumText" },

    ["DeleteButton"] = { onClick = "onCloseButtonClick" },

}

function M:onCreate()
    M.super.onCreate(self)

    self:addPlistResourceMap(Utils.generateIconPlistData("0050"))
    self:addPlistResourceMap(Utils.generateIconPlistData("0060"))
    self:addPlistResourceMap(Utils.generateIconPlistData("0100"))

    self:setShadeShowModel(true)

    self.ItemImage:ignoreContentAdaptWithSize(true)

    self.mIndex = 1
    self.mItems = {}
end

function M:onEnter()
    M.super.onEnter(self)

    self:refreshUI(false)

end

function M:refreshUI(close)
    if close and self.mIndex > #self.mItems then
        self.mIndex = 1
        self.mItems = {}
        self:closePanel()
        return
    end

    local itemId = self.mItems[self.mIndex].itemId
    local itemNum = self.mItems[self.mIndex].itemNum
    self.mIndex = self.mIndex + 1
    self:setItemInfo(itemId, itemNum)
end

function M:appendItems(items)
    for _, v in ipairs(items) do
        table.insert(self.mItems, v)
    end
end

function M:setItemInfo(itemId, num)

    if Constant.Resource.MONEY == itemId then
        self.ItemImage:setVisible(false)
        self.ItemIcon:setVisible(false)
    elseif Constant.Resource.GOLD == itemId then
        self.ItemImage:loadTexture("Icon/0050/0001.png", ccui.TextureResType.plistType)
        self.ItemImage:setVisible(true)

        self.ItemIcon:loadTexture("Icon/0100/0101.png", ccui.TextureResType.plistType)
        self.ItemIcon:setVisible(true)
    elseif Constant.Resource.DIAMOND == itemId then
        self.ItemImage:loadTexture("Icon/0060/0001.png", ccui.TextureResType.plistType)
        self.ItemImage:setVisible(true)

        self.ItemIcon:loadTexture("Icon/0100/0201.png", ccui.TextureResType.plistType)
        self.ItemIcon:setVisible(true)
    end

    self.ItemNumText:setString(tostring(num))

end

function M:onCloseButtonClick()
    self:refreshUI(true)
end

return M