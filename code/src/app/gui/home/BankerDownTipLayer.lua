
local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("RobAvillageTipPanel", UIPanel)

M.GUI_FILE_NAME = "csd.02_04_DiceBaby.02_04_DiceBabyMiniTipPopUp_2.lua"

M.BINDGUIDATANODE = {
    ["ConfirmButton"]={varname="ConfirmButton",onClick="onConfirmButton"},
    ["CancelButton"]={varname="CancelButton",onClick="onCancelButton"},
    ["ContentText_1"]={varname="ContentText_1"},
}


function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)
    local bankerNum = g_SieveData:getBankerAllMoney()
    local numStr = Utils.getFormatNumber_MuitiLanguage(bankerNum)
    
    local text=Utils.getFormatString(Utils.getTextByTextId(92), numStr)
    local ret=string.gsub(text,'\\"','"')
    local node = Utils.CreateRichText(ret)
    local textWoldPos = self.ContentText_1:getParent():convertToWorldSpaceAR(cc.p(self.ContentText_1:getPositionX(),self.ContentText_1:getPositionY()))
    node:setPosition(cc.p(textWoldPos.x,textWoldPos.y))
    node:setAnchorPoint(cc.p(0.5,0.5))
    node:setName("ClickText_2")
    self:addChild(node)

    

end

function M:onConfirmButton()
    g_SieveData:MSG_c2sShaibaoBankerOff()
    self:closePanel()
end

function M:onCancelButton()
    self:closePanel()
end



return M