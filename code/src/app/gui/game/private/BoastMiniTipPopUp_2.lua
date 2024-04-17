local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("BoastMiniTipPopUp_2", UIPanel)

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_BoastMiniTipPopUp_2.lua"

M.BINDGUIDATANODE = {
    ["ConfirmButton"]={varname="ConfirmButton",onClick="clickBtnEvent"},
    ["CancelButton"]={varname="CancelButton",onClick="clickBtnEvent"},
    ["GoldNum"]={varname="GoldNum"}
}

function M:clickBtnEvent(ref)
    local name=ref:getName()
    if "ConfirmButton"==name then
        if g_UserData:getGold() <GSystem.PrivateRoomInvitationGold then
            UIUtils.popToadtByMessageId("52001")
            return
        end
        UIUtils.popToadtByMessageId(1100038)
        g_GameData:c2sGameInviteBroadcast()
        self:closePanel()
    elseif "CancelButton"==name then
        self:closePanel()
    end
end

function M:onCreate()
    M.super.onCreate(self)

    self:setShadeShowModel(true,255*0.7)
    
end

function M:onInit()
    M.super.onInit(self)
   
end

function M:setGold(gold)
    self.GoldNum:setString(Utils.getFormatNumber_MuitiLanguage(gold))
end

function M:onEnter()
    M.super.onEnter(self)

   
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
   
end

return M