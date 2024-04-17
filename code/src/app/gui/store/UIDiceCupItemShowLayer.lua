local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIDiceCupItemShowLayer", UIPanel)

M.GUI_FILE_NAME = "csd.03_01_Shop.03_01_DiceBoxShowLayer.lua"

M.BINDGUIDATANODE = {
    ["ConfirmButton"] = {varname = "ConfirmButton", onClick = "onClickConfirmBtn"},
    ["DiceBoxNameText"] = {varname = "DiceBoxNameText"},

    ["DiceBoxImage"] = {varname = "DiceBoxImage"},

    ["DiceBoxDepictText"] = {varname = "DiceBoxDepictText"},

    ["ConfirmNum"] = {varname = "ConfirmNum"},

    ["InteractionPopups"] = {varname = "InteractionPopups"},

    ["DiceBoxNode"] = {varname = "DiceBoxNode"},
    ["PropNode"] = {varname = "PropNode"},

    ["PropImage"] = {varname = "PropImage"},

    ["PropDepictText"] = {varname = "PropDepictText"},

    ["PropNameText"] = {varname = "PropNameText"},
}

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.ShopGoods))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.StaticDiceBox))

    self:initOutClickableArea()

    self.mAllNodes = {
        self.DiceBoxNode,
        self.PropNode,
    }
end

function M:onInit()
    M.super.onInit(self)
end

function M:initOutClickableArea()
    local function onOutOfQuickBoxClick()
        self:closePanel()
    end

    UIUtils.addClickableNode(self.InteractionPopups, nil, onOutOfQuickBoxClick)
end

function M:onlyShowNode(showNode)
    for _ , v in pairs(self.mAllNodes) do 
        if showNode == v then 
            v:setVisible(true)
        else
            v:setVisible(false)
        end
    end
end

function M:getData()
    return self.mdata
end

function M:setItemInfo(cfgData)
    if not cfgData then return end

    self.mdata = cfgData
    local ShopGoodsShowType = cfgData.ShopGoodsShowType
    if ShopGoodsShowType == Enum.ShopGoodsShowType.Goods then 
        local ResData = cfgData.GetResData
        local itemType = ResData[1][1]
        if itemType == Enum.ItemShowType.Gold then
            self:showGold(cfgData)
        end
    elseif ShopGoodsShowType == Enum.ShopGoodsShowType.Items then 
        local ResData = cfgData.GetResData
        local itemType = ResData[1][1]
        if itemType == Enum.ItemShowType.DiceCup then
            local DiceCupData = DataManager:getTbxData("Item", ResData[1][2][1])
            if DiceCupData then 
                self:showDiceCup(DiceCupData)
            end
        end
    end
end

function M:getCost()
    local costNum = self:getData().CostResData[1][2][1]
    local discount = self:getData().Discount
    local cost = costNum
    if discount ~= 100 then
        cost = math.ceil((costNum * discount) / 100)
    end
    return cost
end

function M:showGold(data)
    self:onlyShowNode(self.PropNode)
    self.PropNameText:setString(data.ShowName)
    self.PropDepictText:setString(data.Desc)

    self.ConfirmNum:setString(Utils.getFormatNumber_Special_MuitiLanguage(self:getCost()))
    self.PropImage:loadTexture(Utils.getIconStr(PlistConfig.Icon.ShopGoods, tonumber(self.mdata.ShopGoodsIcon)), ccui.TextureResType.plistType)
end

function M:showDiceCup(data)
    self:onlyShowNode(self.DiceBoxNode)
    self.DiceBoxNameText:setString(data.ShowName)
    self.DiceBoxDepictText:setString(data.Desc)

    self.ConfirmNum:setString(Utils.getFormatNumber_Special_MuitiLanguage(self:getCost()))
    self.DiceBoxImage:loadTexture(Utils.getIconStr(PlistConfig.Icon.StaticDiceBox, tonumber(self.mdata.ShopGoodsIcon)), ccui.TextureResType.plistType)
end

function M:setConfirmCb(cb)
    self.m_confirmCb = cb
end

function M:onClickConfirmBtn(ref)
    if self.m_confirmCb then
        self.m_confirmCb()
    end
    self:closePanel()
end


return M