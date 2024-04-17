
local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("ShaiBaoShaiZiPanel", UIPanel)

M.GUI_FILE_NAME = "csd.02_04_DiceBaby.02_04_OpenAnimationCell.lua"

M.BINDGUIDATANODE = {
    ["BankerDiceBox"]={varname="BankerDiceBox"},
    ["DiceBabyDice_1"]={varname="DiceBabyDice_1"},
    ["DiceBabyDice_2"]={varname="DiceBabyDice_2"},
    ["DiceBabyDice_3"]={varname="DiceBabyDice_3"},
}


function M:onCreate()
    M.super.onCreate(self)
    --self:resetRootNodeAnchorPoint(cc.p(0.5, 0.5))
    self:resetCenterPosition()
    self.mAllDicesTexturePaths={
        [1]="00_01_Common/3D_Dice_1.png",
        [2]="00_01_Common/3D_Dice_2.png",
        [3]="00_01_Common/3D_Dice_3.png",
        [4]="00_01_Common/3D_Dice_4.png",
        [5]="00_01_Common/3D_Dice_5.png",
        [6]="00_01_Common/3D_Dice_6.png",
    }
    
    self.mAllDiceNodes={self.DiceBabyDice_1,self.DiceBabyDice_2,self.DiceBabyDice_3}

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.StaticDiceBox))

end
function M:initDices(data)
    Log.info("initDices")
    Log.print_table(data)
    for i,v in ipairs(self.mAllDiceNodes) do
        v:loadTexture(self.mAllDicesTexturePaths[data.dice.dice[i]], ccui.TextureResType.plistType)
    end
end

function M:setDiceBox(boxID)
    if boxID == nil then
        boxID = 103001
    end
    self.BankerDiceBox:loadTexture(Utils.getIconStr(PlistConfig.Icon.StaticDiceBox,tonumber(boxID)), ccui.TextureResType.plistType)
end

function M:openSieveCup()
    self.BankerDiceBox:runAction(cc.Sequence:create(cc.MoveTo:create(0.5,cc.p(0,300))) )
end

function M:setDiceBoxPos(pos)
    self.BankerDiceBox:setPosition(pos.x, pos.y)
end

function M:onInit()
    M.super.onInit(self)

end


return M