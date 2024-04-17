local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIFriendItem", UIPanel)

M.ITEM_COLUMN = 1

M.CELL_WIDTH = 540
M.CELL_HEIGHT = 130

M.GUI_FILE_NAME = "csd.04_02_Friends.04_02_FriendsCell.lua"

M.BINDGUIDATANODE = {
   ["HeadPanel"] = { varname = "HeadPanel", onEvent = "onHeadPanelTouchEvent" },
   ["HeadFrame"] = { varname = "HeadFrame" },
   ["HeadIcon"] = { varname = "HeadIcon" },
   ["NameText_O"] = { varname = "NameText" },
   ["VipImage"] = { varname = "VipImage" },
   ["SexIcon"] = { varname = "SexIcon" },
   ["IDNum"] = { varname = "IDNum" },

   ["ChatButton"] = { varname = "ChatButton", onClick = "onChatBtnClick" },
   ["WatchButton"] = { varname = "WatchButton", onClick = "onWatchBtnClick" },

   ["OnlineIcon"] = { varname = "OnlineIcon" },
   ["OnlineText"] = { varname = "OnlineText" },
   
   ["FriendesList"] = { varname = "FriendesList" },

   ["AddFriends"] = { varname = "AddFriends" },
   ["AddButton_1"] = { varname = "AddButton", onClick = "onAddBtnClick" },
   ["AddText_TT"] = { varname = "AddText_TT" },

   ["CancelButton_1"] = { varname = "CancelButton_1", onClick = "onCancelBtnClick" },
   ["FriendsAlreadyText_TT"] = { varname = "FriendsAlreadyText" },

   ["ApplyList"] = { varname = "ApplyList" },
   ["AgreeButton_1"] = { varname = "AgreeButton", onClick = "onAgreeBtnClick" },
   ["RefuseButton_1"] = { varname = "RefuseButton", onClick = "onRefuseBtnClick" },

   ["BlackList"] = { varname = "BlackList" },
   ["RemoveButton"] = { varname = "RemoveButton", onClick = "onRemoveBtnClick" },
   ["ChatTipDotIcon"]={varname="ChatTipDotIcon"},
   ["ChatTipDotNum"]={varname="ChatTipDotNum"},
   ["ServiceImage"]={varname="ServiceImage"}
}

function M:refreshHot()
    local num=g_FriendData:getFriendUnReadMsgNumByUid(self.mFriendInfo:getFriendUid())
    self.ChatTipDotIcon:setVisible(num>0)
    self.ChatTipDotNum:setVisible(num>0)
    self.ChatTipDotNum:setString(tostring(num))
end

function M:onCreate()
    M.super.onCreate(self)
    
    self:resetRootNodePosition(cc.p(0, 0))
    self:resetRootNodeAnchorPoint(cc.p(0, 0))

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.Head))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.HeadBox))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.VipIconTail))

    self.mAllNodes = {
        self.FriendesList,
        self.AddFriends,
        self.ApplyList,
        self.BlackList,
    }

    self.mIsCanWatch = false
end

function M:onlyShowNode(showNode)
    for _ , v in pairs(self.mAllNodes) do 
        if showNode == v then 
            v:setVisible(true)
        else
            v:setVisible(false)
        end
    end
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:refreshData(data, idx, tabIndex)
    --dump(data[idx + 1], "description", 3)
    local friend = data[idx + 1]

    self.mFriendInfo = require("app.bean.FriendInfo").new(friend)

    if not self.mFriendInfo then return end

    local showNode = self.FriendesList
    if Enum.FriendTab.FriendList == tabIndex then 
        showNode = self.FriendesList
    elseif Enum.FriendTab.FriendRequest == tabIndex then 
        showNode = self.ApplyList
    elseif Enum.FriendTab.FriendSearch == tabIndex then 
        showNode = self.AddFriends
    elseif Enum.FriendTab.FriendBlock == tabIndex then 
        showNode = self.BlackList
    end
    self:onlyShowNode(showNode)

    local status = self.mFriendInfo:getStatus()
    if status == Enum.FriendStatus.none then 
        self.FriendsAlreadyText:setVisible(false)
        self.AddButton:setVisible(true)
        self.CancelButton_1:setVisible(false)
    elseif status == Enum.FriendStatus.requesting then
        self.FriendsAlreadyText:setVisible(false)
        self.AddButton:setVisible(false)
        self.CancelButton_1:setVisible(true)
    elseif status == Enum.FriendStatus.friend then
        self.FriendsAlreadyText:setVisible(true)
        self.AddButton:setVisible(false)
        self.CancelButton_1:setVisible(false)
    elseif status == Enum.FriendStatus.block then
        self.FriendsAlreadyText:setVisible(false)
        self.AddButton:setVisible(true)
        self.CancelButton_1:setVisible(false)
    end

    self.HeadIcon:removeAllChildren()
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    avater:InitTexture(string.utf8len(self.mFriendInfo:getAvatar())<7,self.mFriendInfo:getAvatar(),self.mFriendInfo:getFriendUid())
    self.HeadIcon:addChild(avater)

    self.HeadFrame:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(self.mFriendInfo:getAvatarFrame())), ccui.TextureResType.plistType)

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

    local OnlineState = self.mFriendInfo:getOnlineState()
    if Enum.FriendTab.FriendList == tabIndex then 
        local EnumerationData = DataManager:getTbxData("Enumeration", string.format("PlayerStateType%d", OnlineState))
        if EnumerationData then 
            self.OnlineIcon:setVisible(true)
            self.OnlineText:setString(EnumerationData.Desc)
            if OnlineState == Enum.OnlineState.Offline then 
                self.OnlineIcon:setVisible(false)
                self.mIsCanWatch = false
            elseif OnlineState == Enum.OnlineState.Idle then 
                self.mIsCanWatch = false
            elseif OnlineState == Enum.OnlineState.Watching then
                self.mIsCanWatch = true
            elseif OnlineState == Enum.OnlineState.Matching then
                self.mIsCanWatch = false
            elseif OnlineState == Enum.OnlineState.Gaming then
                self.mIsCanWatch = true
            end
        end
    end

    if self.mIsCanWatch then
        self.WatchButton:setVisible(true) 
        self.WatchButton:setBright(true)
        self.WatchButton:setTouchEnabled(true)
    else
        self.WatchButton:setVisible(false)
        self.WatchButton:setBright(false)
        self.WatchButton:setTouchEnabled(false)
    end

    self:refreshHot()
    self:refreshService()
end

function M:RefreshAddFriendUI(uid)
    if self.mFriendInfo then
        if self.mFriendInfo:getFriendUid() == uid then 
            self.AddButton:setVisible(false)
            self.CancelButton_1:setVisible(true)
        end
    end
end

function M:RefreshCancelFriendUI(uid)
    if self.mFriendInfo then
        if self.mFriendInfo:getFriendUid() == uid then 
            self.AddButton:setVisible(true)
            self.CancelButton_1:setVisible(false)
        end
    end
end

function M:onHeadPanelTouchEvent(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        local panel = UIManager:getOrCreatePanel("UIOtherPersonInfoLayer")
        if panel then 
            panel:setFriendInfo(self.mFriendInfo)
            panel:showToScene()
        end
    end
end

function M:onChatBtnClick(ref)
    local panel = UIManager:getOrCreatePanel("UIFriendChatLayer")
    if panel then 
        panel:setFriendInfo(self.mFriendInfo)
        panel:showToScene()
    end
end

function M:onWatchBtnClick(ref)
    if self.mFriendInfo then
        g_FriendData:requestWatchFriend(self.mFriendInfo:getFriendUid())
    end
end

--申请添加好友
function M:onAddBtnClick(ref)
    if Utils.isBtnClickNeedDelay(ref,1000) then return end    

    if self.mFriendInfo then
        if g_FriendData:checkIsInBlackList(self.mFriendInfo:getFriendUid()) then 
            UIUtils.popToadtByMessageId(Constant.Define.InBlackList)
            return 
        end
        g_FriendData:requestAddFriend(self.mFriendInfo:getFriendUid()) 
    end
end

function M:onCancelBtnClick(ref)
    if Utils.isBtnClickNeedDelay(ref,1000) then return end    
    
    if self.mFriendInfo then
        g_FriendData:requestCancelAddFriend(self.mFriendInfo:getFriendUid()) 
    end
end

--同意
function M:onAgreeBtnClick(ref)
    if self.mFriendInfo then
        local data = {}
        data.uid = self.mFriendInfo:getFriendUid()
        data.isAgree = true
        g_FriendData:requestAddFriendAgree(data) 
    end
end

--拒绝
function M:onRefuseBtnClick(ref)
    if self.mFriendInfo then
        local data = {}
        data.uid = self.mFriendInfo:getFriendUid()
        data.isAgree = false
        g_FriendData:requestAddFriendAgree(data) 
    end
end

--移除黑名单
function M:onRemoveBtnClick(ref)
    local panel = UIManager:getOrCreatePanel("UIClientErrorTipsLayer_2")
    if panel then 
        local TipTitleText = Utils.getTextByTextId(Enum.Text.BlackTitleText)
        local ContentText = Utils.getTextByTextId(Enum.Text.BlackContentText)
        local ConfirmText = Utils.getTextByTextId(Enum.Text.BlackRemove)
        local CancelText = Utils.getTextByTextId(Enum.Text.BlackCancle)
        panel:setText(TipTitleText, ContentText, ConfirmText, CancelText)
        panel:showToScene()
        panel:setConfirmCb(
            function ()
                if self.mFriendInfo then 
                    g_FriendData:requestCancleBlockFriend(self.mFriendInfo:getFriendUid())
                end
            end
        )
    end
end

function M:refreshService()
    if not g_UserData:getServiceTag() then return end

    local data=g_UserData:getPlayerOnlineDataByUid(self.mFriendInfo:getFriendUid())
    if data then
        self.ServiceImage:setVisible(true)
        if data.isPlaymate then
            self.ServiceImage:loadTexture("00_01_Common/icon_129.png",ccui.TextureResType.plistType)
        elseif data.isOperator then
            self.ServiceImage:loadTexture("00_01_Common/icon_154.png",ccui.TextureResType.plistType)
        elseif data.isBot then
            self.ServiceImage:loadTexture("00_01_Common/icon_130.png",ccui.TextureResType.plistType)
        else
            self.ServiceImage:loadTexture("00_01_Common/icon_131.png",ccui.TextureResType.plistType)
        end
    else
        local arr={}
        table.insert(arr,self.mFriendInfo:getFriendUid())
        g_UserData:c2sGetPlayerInfosForPlaymate(arr)
        self.ServiceImage:setVisible(false)
    end
end

function M:onCleanup()
    M.super.onCleanup(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.RefreshAddFriendUI, "RefreshAddFriendUI")
    self:doRegEvent(Constant.CustomEvent.RefreshCancelFriendUI, "RefreshCancelFriendUI")
    self:doRegEvent(Constant.CustomEvent.UIFriendItem_refreshHot, "refreshHot")
    self:doRegEvent(Constant.CustomEvent.UIFriendItem_refreshService, "refreshService")
end

return M