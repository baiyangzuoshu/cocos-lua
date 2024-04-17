local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIBoastPlayerItem", UIPanel)

M.ITEM_COLUMN = 1

M.CELL_WIDTH = 540
M.CELL_HEIGHT = 130

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_BoasPlayerListCell.lua"

M.BINDGUIDATANODE = {
   ["HeadIcon"] = { varname = "HeadIcon"},
   ["HeadPanel"] = { varname = "HeadPanel",onEvent = "onHeadPanelTouchEvent"},
   ["NameText_O"] = { varname = "NameText" },
   ["VipImage"] = { varname = "VipImage" },
   ["SexIcon"] = { varname = "SexIcon" },
   ["IDNum"] = { varname = "IDNum" },
   ["StateText_1_TT"] = { varname = "StatePlaying" },
   ["StateText_2_TT"] = { varname = "StateWatching" },
}

function M:onCreate()
    M.super.onCreate(self)

    --self.HeadIcon:setTouchEnabled(true);
    
    self:resetRootNodePosition(cc.p(0, 0))
    self:resetRootNodeAnchorPoint(cc.p(0, 0))

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.Head))
    --self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.HeadBox))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.VipIconTail))
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:refreshData(data)
    self.mFriendInfo = require("app.bean.FriendInfo").new(data)

    if not self.mFriendInfo then return end
    
    self.HeadIcon:removeAllChildren()
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    avater:InitTexture(string.utf8len(self.mFriendInfo:getAvatar())<7,self.mFriendInfo:getAvatar(),self.mFriendInfo:getFriendUid())
    self.HeadIcon:addChild(avater)

    self.NameText:setString(self.mFriendInfo:getNickName())

    local vipLevel = self.mFriendInfo:getVipLevel()
    if vipLevel <= 0 then 
        self.VipImage:setVisible(false)
    else
        self.VipImage:setVisible(true)
        local vipData = DataManager:getTbxData("Vip", vipLevel)
        if vipData then 
            self.VipImage:loadTexture(Utils.getIconStr(PlistConfig.Icon.VipIconTail, vipData.VipIcon), ccui.TextureResType.plistType)
        end
    end
    
    local sex = self.mFriendInfo:getSex()
    self.SexIcon:setVisible(true)
    if sex == Enum.SexShowType.Null then 
        self.SexIcon:setVisible(false)
    elseif sex == Enum.SexShowType.Male then 
        self.SexIcon:loadTexture("01_06_PersonalCenter/icon_030.png", ccui.TextureResType.plistType)
    elseif sex == Enum.SexShowType.FeMale then 
        self.SexIcon:loadTexture("01_06_PersonalCenter/icon_031.png", ccui.TextureResType.plistType)
    else
        self.SexIcon:setVisible(false)
    end

    Utils.showFormatVip(self.NameText, self.VipImage)

    self.IDNum:setString(self.mFriendInfo:getFriendUid())

    if data.isPlaying then 
        self.StatePlaying:setVisible(true)
        self.StateWatching:setVisible(false)
    else
        self.StatePlaying:setVisible(false)
        self.StateWatching:setVisible(true)
    end
end

function M:onHeadPanelTouchEvent(data)
    if data.event == "end" then 
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
end

function M:onCleanup()
    M.super.onCleanup(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
end

return M