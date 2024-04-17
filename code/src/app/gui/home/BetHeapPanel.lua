
local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("BetHeapPanel", UIPanel)

M.GUI_FILE_NAME = "csd.02_04_DiceBaby.02_04_BetChipAndHeadCell.lua"

M.BINDGUIDATANODE = {
    ["Chip_100Node"]={varname="Chip_100Node"},
    ["Chip_1000Node"]={varname="Chip_1000Node"},
    ["Chip_1WNode"]={varname="Chip_1WNode"},
    ["Chip_10WNode"]={varname="Chip_10WNode"},
    ["Chip_100WNode"]={varname="Chip_100WNode"},
    ["AllInHead"]={varname="AllInHead"},
    ["AllInHeadBg"]={varname="AllInHeadBg"},
    ["AllInHeadIcon_IVT"]={varname="AllInHeadIcon_IVT"},
    ["AllInHeadNode"]={varname="AllInHeadNode"},
    ["CommonHead"]={varname="CommonHead"},
    ["CommonHeadBg"]={varname="CommonHeadBg"},
}


function M:onCreate()
    M.super.onCreate(self)
    self.BetTexturePaths_en={
        bai="02_04_DiceBaby/picture_082_en.png",
        qian="02_04_DiceBaby/picture_083_en.png",
        wan="02_04_DiceBaby/picture_084_en.png",
        shiwan="02_04_DiceBaby/picture_085_en.png",
        baiwan="02_04_DiceBaby/picture_086_en.png",
    }
    self.BetTexturePaths_cn={
        bai="02_04_DiceBaby/picture_082_zh_CN.png",
        qian="02_04_DiceBaby/picture_083_zh_CN.png",
        wan="02_04_DiceBaby/picture_084_zh_CN.png",
        shiwan="02_04_DiceBaby/picture_085_zh_CN.png",
        baiwan="02_04_DiceBaby/picture_086_zh_CN.png",
    }
    self.BetTexturePaths_tw={
        bai="02_04_DiceBaby/picture_082_zh_TW.png",
        qian="02_04_DiceBaby/picture_083_zh_TW.png",
        wan="02_04_DiceBaby/picture_084_zh_TW.png",
        shiwan="02_04_DiceBaby/picture_085_zh_TW.png",
        baiwan="02_04_DiceBaby/picture_086_zh_TW.png",
    }

    self.mPlayerData = nil

    self.BetList={
        bai={},
        qian={},
        wan={},
        shiwan={},
        baiwan={},
    }

    self:setAnchorPoint(0.5,0.5)

    self.AllInHeadBg:setVisible(false)
    self.AllInHeadIcon_IVT:setVisible(false)

end

function M:initData(data)
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    local avaterLink = string.lower(data.avatar)
    local  isSystem = false
    if not string.find(avaterLink,"http") then
        isSystem = true
    end
    avater:InitTexture(isSystem,data.avatar,data.uid)
    
    self.AllInHead:addChild(avater)
    self.AllInHead:setScale(0.4)
    self.CommonHeadBg:setVisible(true)
    self.CommonHeadBg:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(data.avatarFrame)), ccui.TextureResType.plistType)
end

function M:refreshLanguage()
    local BetTexturePaths = self.BetTexturePaths_tw
    if g_UserData:getSystemLanguage() == Enum.LanguageType.zh_tw then
        BetTexturePaths = self.BetTexturePaths_tw
    elseif g_UserData:getSystemLanguage() == Enum.LanguageType.en  then
        BetTexturePaths = self.BetTexturePaths_en
    elseif g_UserData:getSystemLanguage() == Enum.LanguageType.zh_cn  then
        BetTexturePaths = self.BetTexturePaths_cn
    end
    for k, v in pairs(self.BetList) do
        if k == "bai" then
            for key, value in pairs(v) do
                value:setSpriteFrame(BetTexturePaths.bai)
            end
        elseif k == "qian" then
            for key, value in pairs(v) do
                value:setSpriteFrame(BetTexturePaths.qian)
            end
        elseif k == "wan" then
            for key, value in pairs(v) do
                value:setSpriteFrame(BetTexturePaths.wan)
            end
        elseif k == "shiwan" then
            for key, value in pairs(v) do
                value:setSpriteFrame(BetTexturePaths.shiwan)
            end
        elseif k == "baiwan" then
            for key, value in pairs(v) do
                value:setSpriteFrame(BetTexturePaths.baiwan)
            end
        end
    end
end

function M:addBet(numtype,isAllin)
    local BetTexturePaths = self.BetTexturePaths_tw
    if g_UserData:getSystemLanguage() == Enum.LanguageType.zh_tw then
        BetTexturePaths = self.BetTexturePaths_tw
    elseif g_UserData:getSystemLanguage() == Enum.LanguageType.en  then
        BetTexturePaths = self.BetTexturePaths_en
    elseif g_UserData:getSystemLanguage() == Enum.LanguageType.zh_cn  then
        BetTexturePaths = self.BetTexturePaths_cn
    end

    if isAllin then
        self.AllInHead:setScale(0.65)
        self.CommonHeadBg:setVisible(false)
        self.AllInHeadBg:setVisible(true)
        self.AllInHeadIcon_IVT:setVisible(true)
    end
    if numtype == Enum.ShaiBaoBetTye.Bai then 
        if #(self.BetList.bai)+1 >= GSystem.ChipStackLimit then
            local newItems = {}
            for i,v in ipairs(self.BetList.bai) do
                if i>GSystem.ChipStackLimit-10 then
                    v:removeFromParent()
                else
                    table.insert(newItems,v)
                end
            end
            self.BetList.bai = newItems
            self:addBet(Enum.ShaiBaoBetTye.Qian)
            return
        else
            local sprite = cc.Sprite:createWithSpriteFrameName(BetTexturePaths.bai)
            if sprite then
                sprite:setPositionY(#(self.BetList.bai)*10)
                self.Chip_100Node:addChild(sprite)
                table.insert(self.BetList.bai, sprite)
            end
        end

    elseif numtype == Enum.ShaiBaoBetTye.Qian  then
        if #(self.BetList.qian)+1 >= GSystem.ChipStackLimit then
            local newItems = {}
            for i,v in ipairs(self.BetList.qian) do
                if i>GSystem.ChipStackLimit-10 then
                    v:removeFromParent()
                else
                    table.insert(newItems,v)
                end
            end
            self.BetList.qian = newItems
            self:addBet(Enum.ShaiBaoBetTye.Wan)
            return
        else
            local sprite = cc.Sprite:createWithSpriteFrameName(BetTexturePaths.qian)
            if sprite then
                sprite:setPositionY(#(self.BetList.qian)*10)
                self.Chip_1000Node:addChild(sprite)
                table.insert(self.BetList.qian, sprite)
            end
        end
    elseif numtype == Enum.ShaiBaoBetTye.Wan  then
        if #(self.BetList.wan)+1 >= GSystem.ChipStackLimit then
            local newItems = {}
            for i,v in ipairs(self.BetList.wan) do
                if i>GSystem.ChipStackLimit-10 then
                    v:removeFromParent()
                else
                    table.insert(newItems,v)
                end
            end
            self.BetList.wan = newItems
            self:addBet(Enum.ShaiBaoBetTye.ShiWan)
            return
        else
            local sprite = cc.Sprite:createWithSpriteFrameName(BetTexturePaths.wan)
            if sprite then
                sprite:setPositionY(#(self.BetList.wan)*10)
                self.Chip_1WNode:addChild(sprite)
                table.insert(self.BetList.wan, sprite)
            end
        end
    elseif numtype == Enum.ShaiBaoBetTye.ShiWan  then
        if #(self.BetList.shiwan)+1 >= GSystem.ChipStackLimit then
            local newItems = {}
            for i,v in ipairs(self.BetList.shiwan) do
                if i>GSystem.ChipStackLimit-10 then
                    v:removeFromParent()
                else
                    table.insert(newItems,v)
                end
            end
            self.BetList.shiwan = newItems
            self:addBet(Enum.ShaiBaoBetTye.BaiWan)
            return
        else
            local sprite = cc.Sprite:createWithSpriteFrameName(BetTexturePaths.shiwan)
            if sprite then
                sprite:setPositionY(#(self.BetList.shiwan)*10)
                self.Chip_10WNode:addChild(sprite)
                table.insert(self.BetList.shiwan, sprite)
            end
        end
    elseif numtype == Enum.ShaiBaoBetTye.BaiWan  then
        local sprite = cc.Sprite:createWithSpriteFrameName(BetTexturePaths.baiwan)
        if sprite then
            sprite:setPositionY(#(self.BetList.baiwan)*10)
            self.Chip_100WNode:addChild(sprite)
            table.insert(self.BetList.baiwan, sprite)
        end
    end
end

function M:setHeadNode(show)
    self.AllInHeadNode:setVisible(show)
    self.CommonHeadBg:setVisible(show)
    self.AllInHeadBg:setVisible(show)
    self.AllInHeadIcon_IVT:setVisible(show)
end

function M:getBetAtPosition(numtype)
    local pos = {}
    if numtype == Enum.ShaiBaoBetTye.Bai then
        pos = self.Chip_100Node:getParent():convertToWorldSpaceAR(cc.p(self.Chip_100Node:getPositionX(),self.Chip_100Node:getPositionY()))
    elseif numtype == Enum.ShaiBaoBetTye.Qian  then
        pos = self.Chip_1000Node:getParent():convertToWorldSpaceAR(cc.p(self.Chip_1000Node:getPositionX(),self.Chip_1000Node:getPositionY()))
    elseif numtype == Enum.ShaiBaoBetTye.Wan  then
        pos = self.Chip_1WNode:getParent():convertToWorldSpaceAR(cc.p(self.Chip_1WNode:getPositionX(),self.Chip_1WNode:getPositionY()))
    elseif numtype == Enum.ShaiBaoBetTye.ShiWan  then
        pos = self.Chip_10WNode:getParent():convertToWorldSpaceAR(cc.p(self.Chip_10WNode:getPositionX(),self.Chip_10WNode:getPositionY()))
    elseif numtype == Enum.ShaiBaoBetTye.BaiWan  then
        pos = self.Chip_100WNode:getParent():convertToWorldSpaceAR(cc.p(self.Chip_100WNode:getPositionX(),self.Chip_100WNode:getPositionY()))
    end
    return pos
end


function M:onInit()
    M.super.onInit(self)

end


return M