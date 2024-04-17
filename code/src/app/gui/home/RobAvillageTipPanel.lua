
local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("RobAvillageTipPanel", UIPanel)

M.GUI_FILE_NAME = "csd.02_04_DiceBaby.02_04_DiceBabyMiniTipPopUp_3.lua"

M.BINDGUIDATANODE = {
    ["ConfirmButton_1"]={varname="ConfirmButton_1",onClick = "onClick1000W"},
    ["ConfirmButton_2"]={varname="ConfirmButton_2",onClick = "onClick3000W"},
    ["ConfirmButton_3"]={varname="ConfirmButton_3",onClick = "onClick5000W"},
    ["ContentText_2"]={varname="ContentText_2"},
}


function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)
    
    local addBankerGold = g_SieveData:getRobBankerMoney()
    local numStr = Utils.getFormatNumber_MuitiLanguage(addBankerGold)
    
    local text=Utils.getFormatString(Utils.getTextByTextId(93), numStr)
    local ret=string.gsub(text,'\\"','"')
    local node = Utils.CreateRichText(ret)
    local textWoldPos = self.ContentText_2:getParent():convertToWorldSpaceAR(cc.p(self.ContentText_2:getPositionX(),self.ContentText_2:getPositionY()))
    node:setPosition(cc.p(textWoldPos.x,textWoldPos.y))
    node:setAnchorPoint(cc.p(0.5,0.5))
    node:setName("ClickText_2")
    self:addChild(node)

    

end

function M:onScreenTouchEvent(ref, type)
    M.super.onScreenTouchEvent(self, ref, type)

    if type == ccui.TouchEventType.ended then
        self:closePanel(0)
    end
end

function M:onClick1000W(ref)
    g_SieveData:MSG_c2sShaibaoRobBanker(GSystem.DiceBabyBankerFreezeGold[1])
    self:closePanel(0)
end

function M:onClick3000W(ref)
    g_SieveData:MSG_c2sShaibaoRobBanker(GSystem.DiceBabyBankerFreezeGold[2])
    self:closePanel(0)
end

function M:onClick5000W(ref)
    g_SieveData:MSG_c2sShaibaoRobBanker(GSystem.DiceBabyBankerFreezeGold[3])
    self:closePanel(0)
end

function M:onInit()
    M.super.onInit(self)

end


return M