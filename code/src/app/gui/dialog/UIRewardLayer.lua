local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIRewardLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_17_GetRes.01_17_GetResLayer.lua"

M.BINDGUIDATANODE = {
    ["GetDiamondNum"] = {varname = "itemNum"},

    ["CloseButton"] = {varname = "CloseButton", onClick = "onClickCloseBtn"},

    ["Diamond"] = {varname = "Diamond"},

    ["Gold"] = {varname = "Gold"},
}

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)
end

function M:onInit()
    M.super.onInit(self)
end

function M:showReward(data)
    if Utils.isEmptyTable(data) then return end

    if table.getn(data) == 1 then
        local rewardData = data[1]
        local id = rewardData.id
        -- local num = rewardData.num
        -- local type = rewardData.type
        local itemData = DataManager:getTbxData("Item", tonumber(id))
        if itemData then 
            local showType = itemData.ItemType
            if showType == Enum.ItemShowType.Diamond then 
                self:showDiamond(rewardData)
            elseif showType == Enum.ItemShowType.Gold then
                self:showGold(rewardData)
            elseif showType == Enum.ItemShowType.Avatar then
            elseif showType == Enum.ItemShowType.AvatarFrame then
            elseif showType == Enum.ItemShowType.DiceCup then
            elseif showType == Enum.ItemShowType.BubbleBox then
            elseif showType == Enum.ItemShowType.Material then
            else
            end
        else
            
        end
    end
end

function M:showDiamond(rewardData)
    self.Diamond:setVisible(true)
    self.Gold:setVisible(false)
    self.itemNum:setString(Utils.getFormatNumber_MuitiLanguage(rewardData.num))
end

function M:showGold(rewardData)
    self.Diamond:setVisible(false)
    self.Gold:setVisible(true)
    self.itemNum:setString(Utils.getFormatNumber_MuitiLanguage(rewardData.num))
end

function M:onClickCloseBtn(ref)
    self:closePanel()
end


return M