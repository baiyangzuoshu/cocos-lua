local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIGuessSizeMiniTipPopUp_3", UIPanel)

M.GUI_FILE_NAME = "csd.02_02_GuessSize.02_02_GuessSizeMiniTipPopUp_3.lua"

M.BINDGUIDATANODE = {
    ["ConfirmButton"]={varname="ConfirmButton",onClick="onClickEvent"},
    ["CancelButton"]={varname="CancelButton",onClick="onClickEvent"},
    ["ContentText_1"]={varname="ContentText_1"}
 }
 
 function M:onClickEvent(ref)
     local   name=ref:getName()
     if "ConfirmButton"==name then
         self:closePanel()

         g_GameData:c2sBigSmallBankerOff()
     elseif "CancelButton"==name then
         self:closePanel()
     end
 end

function M:onCreate()
    M.super.onCreate(self)
    self:UIGuessSizeMiniTipPopUp_3_updateGold()
end

function M:UIGuessSizeMiniTipPopUp_3_updateGold()
    local total=Utils.getFormatNumber_MuitiLanguage(g_GameData:getGuessBankerGold())..";"
    local GuessSizeBankerCost = Utils.getTextByTextId(Enum.Text.GuessSizeBankerCost)
    local ret=Utils.getFormatString(GuessSizeBankerCost, total)
    self.ContentText_1:setString(ret)
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:onCleanup()
    M.super.onCleanup(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.UIGuessSizeMiniTipPopUp_3_updateGold, "UIGuessSizeMiniTipPopUp_3_updateGold")
end

return M