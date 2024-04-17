
local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("MainFriendListCell_2", UIPanel)

M.GUI_FILE_NAME = "csd.01_02_Main.01_02_MainFriendListCell_2.lua"

M.BINDGUIDATANODE = {
    ["State_2"]={varname="State_2"},
    ["State_4"]={varname="State_4"},
    ["NameText_2_O"]={varname="NameText_1"},
    ["VipImage_2"]={varname="VipImage"},
    ["GoldNum"]={varname="GoldNum"},
    ["Head_2"]={varname="HeadIcon"},
    ["StateText_10_TT"]={varname="StateText_5"},
    ["StateText_9_TT"]={varname="StateText_4"},
    ["StateText_8_TT"]={varname="StateText_3"},
    ["StateText_7_TT"]={varname="StateText_2"},
    ["FriendsInformationPanel"]={varname="FriendsInformationPanel"},
    ["WatchPanel"]={varname="WatchPanel",onClick="onWatchPanel"},
    ["Gold"]={varname="Gold"},
    ["MatchLevelText"]={varname="MatchLevelText"}
}

function M:onClickHead()
    local friendInfo = require("app.bean.FriendInfo").new(self.data)
    local panel = UIManager:getOrCreatePanel("UIOtherPersonInfoLayer")
    if panel then 
        panel:setFriendInfo(friendInfo)
        panel:showToScene()
    end
end

function M:onWatchPanel()
    SoundSystemManager:playSound004()
    if g_GameData:getmUserstatus() == Enum.Userstatus.ShaibaoGaing then
        UIUtils.popToadtByMessageId(Constant.Define.IsShaibaoGaming)
        return
    end
    local friendInfo = require("app.bean.FriendInfo").new(self.data)
    if friendInfo then
        g_FriendData:requestWatchFriend(friendInfo:getFriendUid())
    end
end

function M:initUI(data)
    self.data=data

    self.NameText_1:setString(data.nickname)
    self.GoldNum:setString(Utils.getFormatNumber_MuitiLanguage(data.gold))
    self.State_2:setVisible(data.type>2)
    self.WatchPanel:setVisible(data.type<=2)
    self.MatchLevelText:setVisible(data.type<=2)

    local friendInfo = require("app.bean.FriendInfo").new(self.data)
    self.mFriendInfo=friendInfo

    if data.type<=2 then
        local room=DataManager:getTbxData("Room",data.roomID)
        self.MatchLevelText:setString(room.ShowName)
    end

    local vipLevel = friendInfo:getVipLevel()
    if vipLevel <= 0 then 
        self.VipImage:setVisible(false)
    else
        self.VipImage:setVisible(true)
        local vipData = DataManager:getTbxData("Vip", vipLevel)
        if g_UserData:isSelfUserId(friendInfo:getFriendUid()) then
            vipLevel = g_UserData:getVipLevel()
            vipData = DataManager:getTbxData("Vip", vipLevel)
        end
        if vipData then 
            self.VipImage:loadTexture(Utils.getIconStr(PlistConfig.Icon.VipIconTail, vipData.VipIcon), ccui.TextureResType.plistType)
        end
    end
    Utils.showFormatVip(self.NameText_1, self.VipImage)
end

function M:refreshUI(data)
    local friend=data.friend
    if self.data.uid~=friend.uid then return end
    self.data=friend
    
    self.NameText_1:setString(friend.nickname)
    self.GoldNum:setString(Utils.getFormatNumber_MuitiLanguage(self.data.gold))
    self.State_2:setVisible(friend.type>2)
    self.WatchPanel:setVisible(friend.type<=2)
    self.MatchLevelText:setVisible(friend.type<=2)

    local friendInfo = require("app.bean.FriendInfo").new(friend)
    self.mFriendInfo=friendInfo

    if friend.type<=2 and friend.roomID then
        local room=DataManager:getTbxData("Room",friend.roomID)
        self.MatchLevelText:setString(room.ShowName)
    end

    local vipLevel = friendInfo:getVipLevel()
    if vipLevel <= 0 then 
        self.VipImage:setVisible(false)
    else
        self.VipImage:setVisible(true)
        local vipData = DataManager:getTbxData("Vip", vipLevel)
        if g_UserData:isSelfUserId(friendInfo:getFriendUid()) then
            vipLevel = g_UserData:getVipLevel()
            vipData = DataManager:getTbxData("Vip", vipLevel)
        end
        if vipData then 
            self.VipImage:loadTexture(Utils.getIconStr(PlistConfig.Icon.VipIconTail, vipData.VipIcon), ccui.TextureResType.plistType)
        end
    end
    Utils.showFormatVip(self.NameText_1, self.VipImage)
end

function M:refreshLanguageHandle()
    if self.data then
        self.GoldNum:setString(Utils.getFormatNumber_MuitiLanguage(self.data.gold))
    end
end

function M:resetAllNode()
    self:reBindingAllNode()
end

function M:onCreate()
    M.super.onCreate(self)
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.VipIconTail))

    self.FriendsInformationPanel:setTouchEnabled(false)
end

function M:onInit()
    M.super.onInit(self)
end

function M:OnUpdate(dt)
    
end

return M