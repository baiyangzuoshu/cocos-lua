local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("InvitationCheckCell", UIPanel)

M.GUI_FILE_NAME = "csd.03_04_Invitation.03_04_InvitationCheckCell.lua"

M.BINDGUIDATANODE = {
    ["NameText_O"]={varname="NameText"},
    ["HeadIcon"]={varname="HeadIcon"},
    ["IDNum"]={varname="IDNum"},
    ["TimeText_TT"]={varname="TimeText_TT"},
    ["SexIcon"]={varname="SexIcon"},
    ["VipImage"] = { varname = "VipImage"},
    ["ResIcon"]={varname="ResIcon"},
    ["ResNum"]={varname="ResNum"},
    ["Click"]={varname="Click"},
    ["ClickText_TT"]={varname="ClickText_TT"},
    ["RegisterRecharge"]={varname="RegisterRecharge"},
    ["HeadPanel"]={varname="HeadPanel",onClick="onClickEvent"},
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

function M:onCreate()
    M.super.onCreate(self)
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.VipIconTail))
end

function M:init(playerInfo,kind)
    local   friendInfo= require("app.bean.FriendInfo").new(playerInfo)
    self.mFriendInfo=friendInfo
    self.HeadIcon:removeAllChildren()
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    avater:InitTexture(string.utf8len(self.mFriendInfo:getAvatar())<7,self.mFriendInfo:getAvatar(),self.mFriendInfo:getFriendUid())
    self.HeadIcon:addChild(avater)

    self.NameText:setString(playerInfo.nickname)

    if 0==playerInfo.sex then
        self.SexIcon:setVisible(false)
    elseif 1==playerInfo.sex then
        self.SexIcon:setVisible(true)
        self.SexIcon:loadTexture("01_06_PersonalCenter/icon_030.png",ccui.TextureResType.plistType)
    elseif 2==playerInfo.sex then
        self.SexIcon:setVisible(true)
        self.SexIcon:loadTexture("01_06_PersonalCenter/icon_031.png",ccui.TextureResType.plistType)
    end

    local   itemId=playerInfo.itemInfo.itemId
    local   itemNum=playerInfo.itemInfo.itemNum

    local diamondId = GSystem.DiamondItemId
    local goldId = GSystem.GoldItemId
    local diamondIcon = DataManager:getTbxData("Item", diamondId).MiniItemIcon
    local goldIcon = DataManager:getTbxData("Item", goldId).MiniItemIcon

    self.ResNum:setString(tostring(itemNum))
    self.Click:setVisible(false)
    self.RegisterRecharge:setVisible(false)
    
    self.TimeText_TT:setString(Utils.getCreateTimeText(playerInfo.createdTime))
    self.IDNum:setString(playerInfo.uid)

    if 1==kind then
        playerInfo.vipLevel=0
        self.Click:setVisible(true)
        self.ResIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.MiniItem, goldIcon), ccui.TextureResType.plistType)
    elseif 2==kind then
        self.RegisterRecharge:setVisible(true)
        self.ResIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.MiniItem, goldIcon), ccui.TextureResType.plistType)
    elseif 3==kind then
        self.RegisterRecharge:setVisible(true)
        self.ResIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.MiniItem, diamondIcon), ccui.TextureResType.plistType)
    end
    
    if 0==itemNum then
        local   data=DataManager:getTbxData("Text",Enum.Text.invitation3)
        self.ClickText_TT:setString(data.Desc)
    end

    local vipLevel = playerInfo.vipLevel
    if vipLevel <= 0 then 
        self.VipImage:setVisible(false)
    else
        self.VipImage:setVisible(true)
        local vipData = DataManager:getTbxData("Vip", vipLevel)
        
        if vipData then 
            self.VipImage:loadTexture(Utils.getIconStr(PlistConfig.Icon.VipIconTail, vipData.VipIcon), ccui.TextureResType.plistType)
        end
    end
    Utils.showFormatVip(self.NameText, self.VipImage)
end

function M:onInit()
    M.super.onInit(self)
end

return M