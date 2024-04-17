local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UserDetailsCell", UIPanel)

M.GUI_FILE_NAME = "csd.03_12_Service.03_12_UserDetailsCell.lua"

M.BINDGUIDATANODE = {
    ["IDNum"]={varname="IDNum"},
    ["PlayerLanguageText_1_TT"]={varname="PlayerLanguageText_1_TT"},
    ["PlayerLanguageText_2_TT"]={varname="PlayerLanguageText_2_TT"},
    ["PlayerLanguageText_3_TT"]={varname="PlayerLanguageText_3_TT"},
    ["PlayerRegisterText"]={varname="PlayerRegisterText"},
    ["EnterNode"]={varname="EnterNode"},
    ["PlayerTopUpText"]={varname="PlayerTopUpText"},
    ["EnterButton"]={varname="EnterButton",onClick="onClickEvent"}
}

function M:onClickEvent()
    if 2==self.mdata.playerStatus then
        g_UserData:joinRoom(self.mdata.roomId)
    end
end

function M:refreshUI(data)
    self.mdata=data
    
    self.EnterNode:setVisible(2==self.mdata.playerStatus)
    self.IDNum:setString(data.uid)
    self.PlayerLanguageText_1_TT:setVisible(1==data.language)
    self.PlayerLanguageText_2_TT:setVisible(2==data.language)
    self.PlayerLanguageText_3_TT:setVisible(3==data.language)

    local ServiceText1 = Utils.getTextByTextId(Enum.Text.ServiceText1)
    self.PlayerRegisterText:setString(Utils.getFormatString(ServiceText1,data.day..";"))

    local ServiceText2 = Utils.getTextByTextId(Enum.Text.ServiceText2)
    self.PlayerTopUpText:setString(Utils.getFormatString(ServiceText2,data.vipExp..";"))
end

function M:onCreate()
    M.super.onCreate(self)
end

function M:onInit()
    M.super.onInit(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
    
end

function M:onCleanup()
    M.super.onCleanup(self)

end

return M