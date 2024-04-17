

local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("MainFriendListCell_1", UIPanel)

M.GUI_FILE_NAME = "csd.01_02_Main.01_02_MainFriendListCell_1.lua"

M.BINDGUIDATANODE = {
    ["State_1"]={varname="State_1"},
    ["State_1_1"]={varname="State_2"},
    ["Head_1"]={varname="HeadIcon"},
    ["HeadFrame_1"]={varname="HeadFrame"},
    ["FriendsCellPanel_1"]={varname="FriendsCellPanel_1",onClick="onClickHead"},
    ["StateText_5_TT"]={varname="StateText_5"},
    ["StateText_4_TT"]={varname="StateText_4"},
    ["StateText_3_TT"]={varname="StateText_3"},
    ["StateText_2_TT"]={varname="StateText_2"},
    ["MatchLevelText"]={varname="MatchLevelText"},
    ["Gold"]={varname="Gold"},
    ["HeadPanel_1"]={varname="HeadPanel_1"},
    ["WatchPanel"]={varname="WatchPanel",onClick="onWatchPanel"},
    ["StateFrame_1"]={varname="StateFrame_3"}
}

function M:onClickHead()
    SoundSystemManager:playSound004()
    local friendInfo = require("app.bean.FriendInfo").new(self.data)
    local panel = UIManager:getOrCreatePanel("UIOtherPersonInfoLayer")
    if panel then 
        panel:setFriendInfo(friendInfo)
        panel:showToScene()
    end
end

function M:resetAllNode()
    self:reBindingAllNode()
end

function M:playAction()

end

function M:openHeadEvent()
    self.FriendsCellPanel_1:setTouchEnabled(true)
end

function M:initUI(data)
    self.data=data

    local friendInfo = require("app.bean.FriendInfo").new(self.data)
    self.mFriendInfo=friendInfo

    for i=2,5,1 do
        self["StateText_"..i]:setVisible(i==data.type)
    end
    self.StateFrame_3:setVisible(1==data.type)
    self.State_1:setVisible(data.type<=2)
    self.State_2:setVisible(data.type>=2)
end

function M:refreshUI(data)
    local friend=data.friend
    if self.data.uid~=friend.uid then return end

    local friendInfo = require("app.bean.FriendInfo").new(friend)
    self.mFriendInfo=friendInfo

    for i=2,5,1 do
        self["StateText_"..i]:setVisible(i==friend.type)
    end
    self.StateFrame_3:setVisible(1==friend.type)
    self.State_1:setVisible(friend.type<=2)
    self.State_2:setVisible(friend.type>=2)
end

function M:refreshHeadIconTime(time)
    self.time=time
end

function M:onCreate()
    M.super.onCreate(self)

    self.time=0
    self.FriendsCellPanel_1:setTouchEnabled(false)
    self.HeadPanel_1:setTouchEnabled(false)
end

function M:onInit()
    M.super.onInit(self)

    self.time=0
    self.FriendsCellPanel_1:setTouchEnabled(false)
end

function M:OnUpdate(dt)
    self.time=self.time-1
    if 0==self.time then
        self.HeadIcon:removeAllChildren()
        local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
        avater:InitTexture(string.utf8len(self.mFriendInfo:getAvatar())<7,self.mFriendInfo:getAvatar(),self.mFriendInfo:getFriendUid())
        self.HeadIcon:addChild(avater)
        self.HeadFrame:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(self.data.avatarFrame)), ccui.TextureResType.plistType)
    end
end

return M