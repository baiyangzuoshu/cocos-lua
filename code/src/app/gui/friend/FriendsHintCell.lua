local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("FriendsHintCell", UIPanel)

M.GUI_FILE_NAME = "csd.04_02_Friends.04_02_FriendsHintCell.lua"

M.BINDGUIDATANODE = {
   ["HeadIcon"]={varname="HeadIcon"},
   ["HeadBg"]={varname="HeadFrame"},
   ["PlayerName_O"]={varname="NameText"},
   ["HintNode"]={varname="HintNode"}
}

function M:onCreate()
    M.super.onCreate(self)
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:refreshData(data)
    local friend = data
    self.mFriendInfo = require("app.bean.FriendInfo").new(friend)
    if not self.mFriendInfo then return end

    self.HeadIcon:removeAllChildren()
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    avater:InitTexture(string.utf8len(self.mFriendInfo:getAvatar())<7,self.mFriendInfo:getAvatar(),self.mFriendInfo:getFriendUid())
    self.HeadIcon:addChild(avater)

    self.HeadFrame:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(self.mFriendInfo:getAvatarFrame())), ccui.TextureResType.plistType)

    self.NameText:setString(self.mFriendInfo:getNickName())
end

function M:onCleanup()
    M.super.onCleanup(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

end

return M