local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("MainAddFriendsPopUp", UIPanel)

M.GUI_FILE_NAME = "csd.01_02_Main.01_02_MainAddFriendsPopUp.lua"

M.BINDGUIDATANODE = {
    ["NameText_3_O"]={varname="NameText_1"},
    ["HeadIcon_3"]={varname="HeadIcon"},
    ["HeadFrame_3"]={varname="HeadFrame"},
    ["RefuseButton"]={varname="RefuseButton",onClick="onRefuseButton"},
    ["AgreeButton"]={varname="AgreeButton",onClick="onAgreeButton"},
    ["AddFriendPopUp"]={varname="AddFriendPopUp"},
    ["Bg"]={varname="Bg"},
    ["HeadPanel_3"]={varname="HeadPanel",onClick="onClickEvent"},
}

function M:onClickEvent()
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

function M:onRefuseButton()
    if self.mFriendInfo then
        local data = {}
        data.uid = self.mFriendInfo:getFriendUid()
        data.isAgree = false
        g_FriendData:requestAddFriendAgree(data) 
    end
    
end

function M:onAgreeButton()
    if self.mFriendInfo then
        local data = {}
        data.uid = self.mFriendInfo:getFriendUid()
        data.isAgree = true
        g_FriendData:requestAddFriendAgree(data) 
    end
end

function M:isActionIng()
    return self.isAction
end

function M:playExitAction()
    if self.isAction then return end

    self.isAction=true
    self.AddFriendPopUp:runAction(cc.Sequence:create(cc.MoveBy:create(0.5,cc.p(-self.Bg:getContentSize().width,0)),cc.CallFunc:create(function()
        self.isAction=false
        self:exitResetTime()
    end)))
end

function M:playEnteryAction()
    if self.isAction then return end
    SoundSystemManager:playSound024()
    self:setVisible(true)
    self.isAction=true
    self.AddFriendPopUp:runAction(cc.Sequence:create(cc.MoveBy:create(0.5,cc.p(self.Bg:getContentSize().width,0)),cc.CallFunc:create(function()
        self.isAction=false
        self.time=60*15
    end)))
end

function M:isExistByUid(uid)
    if self.data and uid==self.data.uid then
        return true
    end
    return false
end

function M:refreshUI(data)
    self.data=data
    self.NameText_1:setString(data.nickname)

    local friendInfo = require("app.bean.FriendInfo").new(self.data)
    self.mFriendInfo=friendInfo
    self.HeadIcon:removeAllChildren()
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    avater:InitTexture(string.utf8len(self.mFriendInfo:getAvatar())<7,self.mFriendInfo:getAvatar(),self.mFriendInfo:getFriendUid())
    self.HeadIcon:addChild(avater)

    self.HeadFrame:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(data.avatarFrame)), ccui.TextureResType.plistType)
end

function M:onCreate()
    M.super.onCreate(self)
    self.isAction=false
    self.time=60*15
    self.HeadIcon:setScale(0.64)
    self.HeadFrame:setScale(0.64)
    self.AddFriendPopUp:setPositionX(-self.Bg:getContentSize().width)
end

function M:onInit()
    M.super.onInit(self)
end

function M:exitResetTime()
    self.time=60*15
    local _parent=self:getParent()
    local tag=_parent:getTag()
    _parent:setTag(tag-1)
    
    _parent:removeChild(self)
end

function M:OnUpdate(dt)
    local _parent=self:getParent()
    local tag=_parent:getTag()
    local curTag=self:getTag()
    if curTag<tag then return end

    self.time=self.time-1
    if self.time<=0 and self:isVisible() then
        self:playExitAction()
    end
end
return M