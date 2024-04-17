local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIOtherPersonInfoLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_06_PersonalCenter.01_06_PersonalLayer.lua"

M.BINDGUIDATANODE = {
    ["HeadIcon"] = { varname = "HeadIcon"},
    ["HeadFrame"] = { varname = "HeadFrame" },
    ["NameText_O"] = { varname = "NicknameText" },
    ["SexIcon"] = { varname = "SexIcon"},
    ["IDNum"] = { varname = "UserID"},
    ["ContentText_O"] = { varname = "DescText"},
    ["VipImage"] = { varname = "VipImage"},

    ["ContentText_0_TT"] = { varname = "emptyText"},

    ["AddFriend"] = { varname = "AddFriend"},
    ["AddFriendButton"] = { varname = "AddFriendButton", onClick = "onAddBtnClick"},
    ["CancelButton"] = { varname = "CancelButton", onClick = "onCancelBtnClick" },
    
    ["MoreButton"] = { varname = "MoreButton", onClick = "onMoreBtnClick"},

    ["InteractionPopups"] = { varname = "InteractionPopups"},
    ["ServiceUniqueNode"] = { varname = "ServiceUniqueNode"},
}

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)

    local cell=UIManager:createPanelOnly("UserDetailsCell")
    cell:resetCenterPosition()
    cell:setVisible(false)
    self.ServiceUniqueNode:addChild(cell)
    self.mUserDetailsCell=cell

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.Head))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.HeadBox))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.VipIconTail))

    self:initOutClickableArea()
end

function M:initOutClickableArea()
    local function onOutOfQuickBoxClick()
        self:closePanel()
    end

    UIUtils.addClickableNode(self.InteractionPopups, nil, onOutOfQuickBoxClick)
end

function M:onInit()
    M.super.onInit(self)
end

function M:setFriendInfo(friendInfo)
    if not friendInfo then return end
    self.mFriendInfo = friendInfo
end

function M:onEnter()
    M.super.onEnter(self)

    self:refreshUserInfo()
end

function M:refreshUserInfo()
    if not self.mFriendInfo then return end
    
    local status = self.mFriendInfo:getStatus()

    if g_FriendData:CheckIsMyFriendByUid(self.mFriendInfo:getFriendUid()) then 
        self.AddFriend:setVisible(false)
    else
        self.AddFriend:setVisible(true)
        status = Enum.FriendStatus.none
    end
    
    if g_FriendData:CheckIsMyRequestFriendByUid(self.mFriendInfo:getFriendUid()) then
        status = Enum.FriendStatus.requesting
    elseif g_FriendData:checkIsInBlackList(self.mFriendInfo:getFriendUid()) then
        status = Enum.FriendStatus.block
    end

    if status == Enum.FriendStatus.none then 
        self.AddFriendButton:setVisible(true)
        self.CancelButton:setVisible(false)
    elseif status == Enum.FriendStatus.requesting then
        self.AddFriendButton:setVisible(false)
        self.CancelButton:setVisible(true)
    elseif status == Enum.FriendStatus.friend then
        self.AddFriendButton:setVisible(false)
        self.CancelButton:setVisible(false)
    elseif status == Enum.FriendStatus.block then
        self.AddFriendButton:setVisible(true)
        self.CancelButton:setVisible(false)
    end

    self.HeadIcon:removeAllChildren()
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    avater:InitTexture(string.utf8len(self.mFriendInfo:getAvatar())<7,self.mFriendInfo:getAvatar(),self.mFriendInfo:getFriendUid())
    self.HeadIcon:addChild(avater)

    self.HeadFrame:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(self.mFriendInfo:getAvatarFrame())), ccui.TextureResType.plistType)

    self.NicknameText:setString(self.mFriendInfo:getNickName())
    Utils.setShortName(self.NicknameText, self.mFriendInfo:getNickName(), GSystem.NameLimitNumber)
    
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
    end
    
    self.UserID:setString(self.mFriendInfo:getFriendUid())

    local slogan = self.mFriendInfo:getSlogan()
    if Utils.isEmptyStr(slogan) then 
        self.DescText:setVisible(false)
        self.emptyText:setVisible(true)
    else
        self.DescText:setVisible(true)
        self.emptyText:setVisible(false)
        self.DescText:setString(slogan)
    end

    self:refreshService()
end

function M:RefreshAddFriendUI()
    self.CancelButton:setVisible(true)
    self.AddFriendButton:setVisible(false)
end

function M:RefreshCancelFriendUI()
    self.CancelButton:setVisible(false)
    self.AddFriendButton:setVisible(true)
end

function M:onAddBtnClick(ref)
    if self.mFriendInfo then
        g_FriendData:requestAddFriend(self.mFriendInfo:getFriendUid()) 
    end
end

function M:onCancelBtnClick(ref)
    if self.mFriendInfo then
        g_FriendData:requestCancelAddFriend(self.mFriendInfo:getFriendUid()) 
    end
end

function M:onMoreBtnClick(ref)
    local panel = UIManager:getOrCreatePanel("UIMoreOperateLayer")
    if panel then 
        if self.mFriendInfo then 
            panel:setFriendUid(self.mFriendInfo:getFriendUid())
        end
        panel:setBalckCb(
            function()
                if g_FriendData:checkIsInBlackList(self.mFriendInfo:getFriendUid()) then 
                    g_FriendData:requestCancleBlockFriend(self.mFriendInfo:getFriendUid()) 
                    DataManager:dispatchMessage(Constant.CustomEvent.OnClosePanelEvent)
                else
                    local comfirm = UIManager:getOrCreatePanel("UIBlockFriendConfirmDialog")
                    if comfirm then 
                        comfirm:setConfirmCb(
                            function()
                                if self.mFriendInfo then
                                    g_FriendData:requestBlockFriend(self.mFriendInfo:getFriendUid()) 
                                end
                                DataManager:dispatchMessage(Constant.CustomEvent.OnClosePanelEvent)
                            end
                        )
                        comfirm:showToScene()
                    end
                end
            end
        )
        panel:setDeleteCb(
            function()
                local comfirm = UIManager:getOrCreatePanel("UIDeleteFriendConfirmDialog")
                if comfirm then 
                    comfirm:setConfirmCb(
                        function()
                            if self.mFriendInfo then 
                                g_FriendData:requestDeleteFriend(self.mFriendInfo:getFriendUid()) 
                            end
                            DataManager:dispatchMessage(Constant.CustomEvent.OnClosePanelEvent)
                        end
                    )
                    comfirm:showToScene()
                end
            end
        )
        panel:showToScene()
    end
end

function M:OnClosePanelEvent()
    self:closePanel()
end

function M:refreshService()
    if not g_UserData:getServiceTag() then return end

    local data=g_UserData:getPlayerOnlineDataByUid(self.mFriendInfo:getFriendUid())
    if data then
        self.mUserDetailsCell:refreshUI(data)
        self.mUserDetailsCell:setVisible(true)
    else
        local arr={}
        table.insert(arr,self.mFriendInfo:getFriendUid())
        g_UserData:c2sGetPlayerInfosForPlaymate(arr)
        self.mUserDetailsCell:setVisible(false)
    end
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
    
    self:doRegEvent(Constant.CustomEvent.RefreshAddFriendUI, "RefreshAddFriendUI")
    self:doRegEvent(Constant.CustomEvent.RefreshCancelFriendUI, "RefreshCancelFriendUI")
    self:doRegEvent(Constant.CustomEvent.RefreshUserInfo, "refreshUserInfo")
    self:doRegEvent(Constant.CustomEvent.OnClosePanelEvent, "OnClosePanelEvent")
    self:doRegEvent(Constant.CustomEvent.UIOtherPersonInfoLayer_refreshService, "refreshService")
end

return M