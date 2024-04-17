local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIGuessSizeMiniTipPopUp_2", UIPanel)

M.GUI_FILE_NAME = "csd.02_02_GuessSize.02_02_GuessSizeMiniTipPopUp_2.lua"

M.BINDGUIDATANODE = {
   ["ConfirmButton"]={varname="ConfirmButton",onClick="onClickEvent"},
   ["CancelButton"]={varname="CancelButton",onClick="onClickEvent"},
   ["ContentText_2_TT"]={varname="ContentText_2"}
}

function M:onClickEvent(ref)
    local   name=ref:getName()
    if "ConfirmButton"==name then
        self:closePanel()
        if g_UserData:getGold()<g_GameData:getGuessBankerCost()+GSystem.RobBankerFreezeGold then
            return UIUtils.popToadtByMessageId("52001")
        end
        g_GameData:c2sBigSmallBankerOn(g_GameData:getGuessBankerCost())
    elseif "CancelButton"==name then
        self:closePanel()
    end
end

function M:onCreate()
    M.super.onCreate(self)
    self.ContentText_2:setVisible(false)
end

function M:onInit()
    M.super.onInit(self)

    self:UIGuessSizeMiniTipPopUp_2_updateGold()
end

function M:UIGuessSizeMiniTipPopUp_2_updateGold()
    if self.richNode then
        return
    end
    local addBankerGold = g_GameData:getGuessBankerCost()
    local numStr = Utils.getFormatNumber_MuitiLanguage(addBankerGold)
    
    local text=Utils.getFormatString(Utils.getTextByTextId(93), numStr)
    local ret=string.gsub(text,'\\"','"')
    self.richNode = Utils.CreateRichText(ret)
    local textWoldPos = self.ContentText_2:getParent():convertToWorldSpaceAR(cc.p(self.ContentText_2:getPositionX(),self.ContentText_2:getPositionY()))
    self.richNode:setPosition(cc.p(textWoldPos.x,textWoldPos.y))
    self.richNode:setAnchorPoint(cc.p(0.5,0.5))
    self.richNode:setName("ClickText_2")
    self:addChild(self.richNode)
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:onCleanup()
    M.super.onCleanup(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.UIGuessSizeMiniTipPopUp_2_updateGold, "UIGuessSizeMiniTipPopUp_2_updateGold")
end

return M