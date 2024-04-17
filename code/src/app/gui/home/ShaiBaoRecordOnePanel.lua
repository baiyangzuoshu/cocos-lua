
local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("ShaiBaoRecordOnePanel", UIPanel)

M.GUI_FILE_NAME = "csd.02_04_DiceBaby.02_04_ModelRecordCell.lua"

M.BINDGUIDATANODE = {
    ["NumRecord_1"]={varname="NumRecord_1"},
    ["NumRecord_2"]={varname="NumRecord_2"},
    ["NumRecord_3"]={varname="NumRecord_3"},
    ["ModelRecord_1"]={varname="ModelRecord_1"},
    ["ModelRecord_2"]={varname="ModelRecord_2"},
    ["ModelRecord_3"]={varname="ModelRecord_3"},
}


function M:onCreate()
    M.super.onCreate(self)
    --self:resetRootNodeAnchorPoint(cc.p(0.5, 0.5))
    self:resetCenterPosition()
    self.mAllDices={self.NumRecord_1,self.NumRecord_2,self.NumRecord_3}

    self.mAllDiceTexturePath={
        [1]="02_04_DiceBaby/icon_118.png",
        [2]="02_04_DiceBaby/icon_119.png",
        [3]="02_04_DiceBaby/icon_120.png",
        [4]="02_04_DiceBaby/icon_121.png",
        [5]="02_04_DiceBaby/icon_122.png",
        [6]="02_04_DiceBaby/icon_123.png",
    }

    self.mDiceTypeTexturePath_en={
        [Enum.ShaibaoDiceType.Same]="02_04_DiceBaby/icon_116_en.png",
        [Enum.ShaibaoDiceType.Series]="02_04_DiceBaby/icon_117_en.png",
        [Enum.ShaibaoDiceType.Double]="02_04_DiceBaby/icon_115_en.png",
        [Enum.ShaibaoDiceType.Single]="02_04_DiceBaby/icon_114_en.png",
        [Enum.ShaibaoDiceType.BigDice]="02_04_DiceBaby/icon_113_en.png",
        [Enum.ShaibaoDiceType.SmallDice]="02_04_DiceBaby/icon_113_en.png",
        ["baozi"]="02_04_DiceBaby/icon_136_en.png",
        ["shunzi"]="02_04_DiceBaby/icon_137_en.png",
    }

    self.mDiceTypeTexturePath_cn={
        [Enum.ShaibaoDiceType.Same]="02_04_DiceBaby/icon_116_zh_CN.png",
        [Enum.ShaibaoDiceType.Series]="02_04_DiceBaby/icon_117_zh_CN.png",
        [Enum.ShaibaoDiceType.Double]="02_04_DiceBaby/icon_115_zh_CN.png",
        [Enum.ShaibaoDiceType.Single]="02_04_DiceBaby/icon_114_zh_CN.png",
        [Enum.ShaibaoDiceType.BigDice]="02_04_DiceBaby/icon_112_zh_CN.png",
        [Enum.ShaibaoDiceType.SmallDice]="02_04_DiceBaby/icon_113_zh_CN.png",
        ["baozi"]="02_04_DiceBaby/icon_136_zh_CN.png",
        ["shunzi"]="02_04_DiceBaby/icon_137_zh_CN.png",
    }

    self.mDiceTypeTexturePath_tw={
        [Enum.ShaibaoDiceType.Same]="02_04_DiceBaby/icon_116_zh_TW.png",
        [Enum.ShaibaoDiceType.Series]="02_04_DiceBaby/icon_117_zh_TW.png",
        [Enum.ShaibaoDiceType.Double]="02_04_DiceBaby/icon_115_zh_TW.png",
        [Enum.ShaibaoDiceType.Single]="02_04_DiceBaby/icon_114_zh_TW.png",
        [Enum.ShaibaoDiceType.BigDice]="02_04_DiceBaby/icon_112_zh_TW.png",
        [Enum.ShaibaoDiceType.SmallDice]="02_04_DiceBaby/icon_113_zh_TW.png",
        ["baozi"]="02_04_DiceBaby/icon_136_zh_TW.png",
        ["shunzi"]="02_04_DiceBaby/icon_137_zh_TW.png",
    }
    
    

end
function M:initData(data)
    if not data then return end
    local shaBaoDiceTypePath = self.mDiceTypeTexturePath_tw
    if g_UserData:getSystemLanguage() == Enum.LanguageType.zh_tw then
        shaBaoDiceTypePath = self.mDiceTypeTexturePath_tw
    elseif g_UserData:getSystemLanguage() == Enum.LanguageType.en  then
        shaBaoDiceTypePath = self.mDiceTypeTexturePath_en
    elseif g_UserData:getSystemLanguage() == Enum.LanguageType.zh_cn  then
        shaBaoDiceTypePath = self.mDiceTypeTexturePath_cn
    end
    for i,v in ipairs(self.mAllDices) do
        local num = data[i]
        if num > 0 then
            v:loadTexture(self.mAllDiceTexturePath[num], ccui.TextureResType.plistType)
        end
    end
    local diceType = g_SieveData:getShaiZiResult(data)
    local isBaoZi = false

    self.ModelRecord_3:setVisible(false)
    self.ModelRecord_1:setVisible(true)
    self.ModelRecord_2:setVisible(true)

    for i,v in ipairs(diceType) do
        if v==Enum.ShaibaoDiceType.Same then
            --显示豹子
            -- self.ModelRecord_3:loadTexture(shaBaoDiceTypePath[Enum.ShaibaoDiceType.Same], ccui.TextureResType.plistType)
            -- self.ModelRecord_3:setVisible(true)
            self.ModelRecord_1:loadTexture(shaBaoDiceTypePath[Enum.ShaibaoDiceType.Same], ccui.TextureResType.plistType)
            self.ModelRecord_2:loadTexture(shaBaoDiceTypePath["baozi"], ccui.TextureResType.plistType)
            return
        end
        if v==Enum.ShaibaoDiceType.Series then
            --显示顺子
            -- self.ModelRecord_3:loadTexture(shaBaoDiceTypePath[Enum.ShaibaoDiceType.Series], ccui.TextureResType.plistType)
            -- self.ModelRecord_3:setVisible(true)
            self.ModelRecord_1:loadTexture(shaBaoDiceTypePath[Enum.ShaibaoDiceType.Series], ccui.TextureResType.plistType)
            self.ModelRecord_2:loadTexture(shaBaoDiceTypePath["shunzi"], ccui.TextureResType.plistType)
            return
        end
        if v==Enum.ShaibaoDiceType.BigDice then
            --大
            self.ModelRecord_1:loadTexture(shaBaoDiceTypePath[Enum.ShaibaoDiceType.BigDice], ccui.TextureResType.plistType)
        elseif v==Enum.ShaibaoDiceType.SmallDice then
            --小
            self.ModelRecord_1:loadTexture(shaBaoDiceTypePath[Enum.ShaibaoDiceType.SmallDice], ccui.TextureResType.plistType)
        end

        if v==Enum.ShaibaoDiceType.Single then
            --单
            self.ModelRecord_2:loadTexture(shaBaoDiceTypePath[Enum.ShaibaoDiceType.Single], ccui.TextureResType.plistType)
        elseif v==Enum.ShaibaoDiceType.Double then
            --双
            self.ModelRecord_2:loadTexture(shaBaoDiceTypePath[Enum.ShaibaoDiceType.Double], ccui.TextureResType.plistType)
        end
    end
end

function M:flashOne()
    self:setPositionX(200)
    self:runAction(cc.MoveTo:create(0.3,cc.p(0,0)))
end
function M:onInit()
    M.super.onInit(self)

end

function M:refreshData(data)
    
end


return M