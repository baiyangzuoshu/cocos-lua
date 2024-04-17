local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("ServiceCell", UIPanel)

M.GUI_FILE_NAME = "csd.03_12_Service.03_12_ServiceCell.lua"

M.BINDGUIDATANODE = {
    ["PlayerNameText_O"]={varname="PlayerNameText"},
    ["PlayerNode"]={varname="PlayerNode"},
    ["GameStateText_1_TT"]={varname="GameStateText_1_TT"},
    ["GameStateText_2_TT"]={varname="GameStateText_2_TT"},
    ["GameStateText_3_TT"]={varname="GameStateText_3_TT"},
    ["GameStateText_4_TT"]={varname="GameStateText_4_TT"},
    ["GameStateText_5_TT"]={varname="GameStateText_5_TT"},
    ["PlayerGenderText_1_TT"]={varname="PlayerGenderText_1_TT"},
    ["PlayerGenderText_2_TT"]={varname="PlayerGenderText_2_TT"},
    ["PlayerGenderText_3_TT"]={varname="PlayerGenderText_3_TT"},
    ["PlayerLanguageText_1_TT"]={varname="PlayerLanguageText_1_TT"},
    ["PlayerLanguageText_2_TT"]={varname="PlayerLanguageText_2_TT"},
    ["PlayerLanguageText_3_TT"]={varname="PlayerLanguageText_3_TT"},
    ["PlayerRegisterText"]={varname="PlayerRegisterText"},
    ["PlayerTopUpText"]={varname="PlayerTopUpText"},
    ["PlayerRoomServiceText"]={varname="PlayerRoomServiceText"},
    ["PlayerRoomPlayerText"]={varname="PlayerRoomPlayerText"},
    ["SkipNode"]={varname="SkipNode"},
    ["SkipPanel"]={varname="SkipPanel",onClick="onClickEvent"},
    ["PlayerPanel"]={varname="PlayerPanel",onClick="onHeadEvent"},
}

function M:onHeadEvent()
   SoundSystemManager:playSound004()
   if self.mFriendInfo:getFriendUid() == g_UserData:getUserId() then
       local panel = UIManager:getOrCreatePanel("UIPersonalInfoLayer")
       if panel then
           panel:showToScene()
       end
   else
       local panel = UIManager:getOrCreatePanel("UIOtherPersonInfoLayer")
       if panel then 
           panel:setFriendInfo(self.mFriendInfo)
           panel:showToScene()
       end
   end
end

function M:onClickEvent()
    if self.mType==Enum.OnlineState.Gaming then
        return UIUtils.popToast("房间内不可跳转")
    end
    g_UserData:joinRoom(self.mdata.roomId)
end

function M:onCreate()
    M.super.onCreate(self)
    
end

function M:refreshUI(data,type)
    self.mdata=data
    self.mType=type

    self.mFriendInfo= require("app.bean.FriendInfo").new(data)
    self.PlayerNode:removeAllChildren()
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    avater:InitTexture(string.utf8len(self.mFriendInfo:getAvatar())<7,self.mFriendInfo:getAvatar(),self.mFriendInfo:getFriendUid())
    self.PlayerNode:addChild(avater)
    self.PlayerNameText:setString(data.nickname)
    if 2==data.playerStatus then
        local   roomConfigId=data.roomConfigId
        local   roomData=DataManager:getTbxData("Room","RoomId",roomConfigId)
        
        if  2==roomData[1].RoomType  then
            data.playerStatus=5
        end
    end

    self.GameStateText_1_TT:setVisible(2==data.playerStatus)
    self.GameStateText_2_TT:setVisible(3==data.playerStatus)
    self.GameStateText_3_TT:setVisible(4==data.playerStatus)
    self.GameStateText_4_TT:setVisible(1==data.playerStatus)
    self.GameStateText_5_TT:setVisible(5==data.playerStatus)

    self.PlayerGenderText_1_TT:setVisible(1==data.sex)
    self.PlayerGenderText_2_TT:setVisible(2==data.sex)
    self.PlayerGenderText_3_TT:setVisible(3==data.sex)

    self.PlayerLanguageText_1_TT:setVisible(1==data.language)
    self.PlayerLanguageText_2_TT:setVisible(2==data.language)
    self.PlayerLanguageText_3_TT:setVisible(3==data.language)

    local ServiceText1 = Utils.getTextByTextId(Enum.Text.ServiceText1)
    self.PlayerRegisterText:setString(Utils.getFormatString(ServiceText1,data.day..";"))

    local ServiceText2 = Utils.getTextByTextId(Enum.Text.ServiceText2)
    self.PlayerTopUpText:setString(Utils.getFormatString(ServiceText2,data.vipExp..";"))

    local ServiceText3 = Utils.getTextByTextId(Enum.Text.ServiceText3)
    self.PlayerRoomServiceText:setString(Utils.getFormatString(ServiceText3,#data.currentPlaymateIds..";"))

    local ServiceText4 = Utils.getTextByTextId(Enum.Text.ServiceText4)
    self.PlayerRoomPlayerText:setString(Utils.getFormatString(ServiceText4,"0;"))

    self.SkipNode:setVisible(2==data.playerStatus)
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