local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIGuessingHeadCell", UIPanel)

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_BoastGuessingHeadCell.lua"

M.BINDGUIDATANODE = {
    ["HeadCell"] = {varname = "HeadCell"},
    ["Head"]={varname="HeadIcon"},
    ["HeadFrame"]={varname="HeadFrame"},
    ["HeadPanel"]={varname="HeadPanel",onClick="onClickEvent"}
}

M.CELL_WIDTH = 120
M.CELL_HEIGHT = 120

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

function M:onCreate()
    M.super.onCreate(self)
    
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.Head))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.HeadBox))
end

function M:onInit()
    M.super.onInit(self)
end

function M:setHeadScale(scale)
    self.HeadCell:setScale(scale)
end

function M:initData(friendinfo)
    self.mFriendInfo = require("app.bean.FriendInfo").new(friendinfo)
    if not self.mFriendInfo then return false end

    self.HeadIcon:removeAllChildren()
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    avater:InitTexture(string.utf8len(self.mFriendInfo:getAvatar())<7,self.mFriendInfo:getAvatar(),self.mFriendInfo:getFriendUid())
    self.HeadIcon:addChild(avater)
    self.HeadFrame:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(self.mFriendInfo:getAvatarFrame())), ccui.TextureResType.plistType)
    return true
end

return M