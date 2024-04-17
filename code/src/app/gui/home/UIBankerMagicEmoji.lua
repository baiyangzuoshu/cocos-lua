local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIBankerMagicEmoji", UIPanel)
local UIMagicEmojiCell = require("app.gui.game.UIMagicEmojiCell")

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_BoastMagicEmojiPopUp.lua"

M.BINDGUIDATANODE = {
    ["InteractionPopUp_3"] = {varname="InteractionPopUp"},

    ["HeadIcon_3"]={varname="HeadIcon"},
    ["HeadFrame_3"] = {varname="HeadFrame"},
    ["NameText_3_O"] = {varname="NameText"},
    ["VipIcon"] = {varname="VipIcon"},
    ["GoldIcon_1"] = {varname="GoldIcon"},
    ["GoldNum_1"]={varname="GoldNum"},

    ["InteractiveButton_1"]={varname="AddFriendButton",onClick="onClickAddFriend"},
    ["InteractiveButton_2"]={varname="InteractiveButton",onClick="onClickInteractiveButton"},
    ["CancelText_TT"]={varname="CancelText"},
    ["ChatText_1_TT"]={varname="ChatText"},

    ["MagicEmojiListPanel"]={varname="ListPanel"},
    ["ServiceUniqueNode"] = { varname = "ServiceUniqueNode"},
    ["MailSpineATNode"]={varname="MailSpineATNode"},
    ["BelowLeftFit_3"]={varname="BelowLeftFit_3"},
    ["MicPanel_3"]={varname="MicPanel_3"},
    ["MicButton_3"]={varname="MicButton_3"},
    ["MicLoadingBar_3"]={varname="MicLoadingBar_3"},
}

function M:onCreate()
    M.super.onCreate(self)

    local cell=UIManager:createPanelOnly("UserDetailsCell")
    cell:setVisible(false)
    cell:resetCenterPosition()
    self.ServiceUniqueNode:addChild(cell)
    self.mUserDetailsCell=cell
    self.mMagicEmojiListRow = 0
    self.CellList = {}
    self.MicLoadingBar_3:setPercent(0)
    self.MicPanel_3:setVisible(false)
    self.MicButton_3:setVisible(false)

    self:setShadeShowModel(true,0)

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.MiniItem))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.HeadBox))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.VipIconTail))

    local size = self.ListPanel:getContentSize()
    self.mMagicEmojiListTableView = cc.TableView:create(size)
    self.mMagicEmojiListTableView:setDirection(cc.SCROLLVIEW_DIRECTION_HORIZONTAL)
    self.mMagicEmojiListTableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
    self.mMagicEmojiListTableView:setBounceable(true)
    self.mMagicEmojiListTableView:setIgnoreAnchorPointForPosition(false)
    self.mMagicEmojiListTableView:setAnchorPoint(0, 0)
    self.mMagicEmojiListTableView:setPosition(0, 0)

    self.ListPanel:addChild(self.mMagicEmojiListTableView)

    self.mMagicEmojiListTableView:setDelegate()
    self.mMagicEmojiListTableView:registerScriptHandler(handler(self, self.getListCellNumber), cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
    self.mMagicEmojiListTableView:registerScriptHandler(handler(self, self.getListCellSize), cc.TABLECELL_SIZE_FOR_INDEX)
    self.mMagicEmojiListTableView:registerScriptHandler(handler(self, self.getListCell), cc.TABLECELL_SIZE_AT_INDEX)

    self:initOutClickableArea()
end

function M:onCloseEvent()
    self.MailSpineATNode:removeAllChildren()
end

function M:onPlayerSayAgoraMessageChange(data)
    if not Utils.isEmptyTable(data) then
        for _,v in ipairs(data) do 
            if v.uid == tonumber(self.uid) then
                self.MicLoadingBar_3:setPercent(v.volume/255*100)
            end
        end
    end
end

function M:initOutClickableArea()
    local function onOutOfQuickBoxClick()
        self:closePanel()
    end

    UIUtils.addClickableNode(self.InteractionPopUp, nil, onOutOfQuickBoxClick)
end

function M:onInit()
    M.super.onInit(self)
end

function M:setPlayerData(playerData,worldPos)
    self.uid = playerData.uid
    self.mWorldPos=worldPos
    self.mPlayerData = playerData
    if playerData then
        self.mFriendInfo = require("app.bean.FriendInfo").new(playerData)
    end

    self:refreshUserInfo()
    self:OnUpdateMagicEmojiList()
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:refreshUserInfo()
    if not self.mFriendInfo then return end
    
    local status = Enum.FriendStatus.none
    
    if g_FriendData:CheckIsMyFriendByUid(self.mFriendInfo:getFriendUid()) then
        status = Enum.FriendStatus.friend
    elseif g_FriendData:CheckIsMyRequestFriendByUid(self.mFriendInfo:getFriendUid()) then
        status = Enum.FriendStatus.requesting
    elseif g_FriendData:checkIsInBlackList(self.mFriendInfo:getFriendUid()) then
        status = Enum.FriendStatus.block
    end

    if status == Enum.FriendStatus.none then
        self.AddFriendButton:setVisible(true)
        self.InteractiveButton:setVisible(false)
    elseif status == Enum.FriendStatus.requesting then
        self.AddFriendButton:setVisible(false)
        self.InteractiveButton:setVisible(true)
        self.CancelText:setVisible(true)
        self.ChatText:setVisible(false)
    elseif status == Enum.FriendStatus.friend then
        self.AddFriendButton:setVisible(false)
        self.InteractiveButton:setVisible(true)
        self.CancelText:setVisible(false)
        self.ChatText:setVisible(true)
    elseif status == Enum.FriendStatus.block then
        self.AddFriendButton:setVisible(true)
        self.InteractiveButton:setVisible(false)
    end

    self.HeadIcon:removeAllChildren()
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    avater:InitTexture(string.utf8len(self.mFriendInfo:getAvatar())<7,self.mFriendInfo:getAvatar(),self.mFriendInfo:getFriendUid())
    self.HeadIcon:addChild(avater)

    self.HeadFrame:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(self.mFriendInfo:getAvatarFrame())), ccui.TextureResType.plistType)

    self.NameText:setString(self.mFriendInfo:getNickName())
    Utils.setShortName(self.NameText, self.mFriendInfo:getNickName(), GSystem.NameLimitNumber)
    
    local vipLevel = self.mFriendInfo:getVipLevel()
    if vipLevel <= 0 then 
        self.VipIcon:setVisible(false)
    else
        self.VipIcon:setVisible(true)
        local vipData = DataManager:getTbxData("Vip", vipLevel)
        if vipData then 
            self.VipIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.VipIconTail, vipData.VipIcon), ccui.TextureResType.plistType)
        end
    end
    Utils.showFormatVip(self.NameText, self.VipIcon)
    
    local goldId = GSystem.GoldItemId
    local goldIcon = DataManager:getTbxData("Item",goldId).MiniItemIcon
    self.GoldIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.MiniItem,goldIcon), ccui.TextureResType.plistType)
    self.GoldNum:setString(Utils.getFormatNumber_MuitiLanguage(g_SieveData:getBankerAllMoney()))

    self:refreshService()
end

function M:OnUpdateMagicEmojiList()
    local function sortdata(data1,data2)
        return data1.Index<data2.Index
    end
    self.mMagicEmojiListData=DataManager:getTbxData("Item","ItemType",Enum.ItemShowType.MagicEmoji)

    table.sort(self.mMagicEmojiListData,sortdata)
    local listNum = #(self.mMagicEmojiListData)
    self.mMagicEmojiListRow = math.ceil(listNum / UIMagicEmojiCell.ITEM_COLUMN)

    self.CellList = {}
    self.mMagicEmojiListTableView:reloadData()
end

function M:getListCellNumber(tableview)
    return self.mMagicEmojiListRow
end

function M:getListCellSize(tableview, idx)
    return UIMagicEmojiCell.CELL_WIDTH, UIMagicEmojiCell.CELL_HEIGHT
end

function M:getListCell(tableview, idx)
    local cell = tableview:dequeueCell()
    if nil == cell then
        cell = cc.TableViewCell:new()
    end

    local panel = cell:getChildByName("UIMagicEmojiCell")
    if not panel then
        panel = UIMagicEmojiCell.new()
        panel:setName("UIMagicEmojiCell")

        local size = panel:getContentSize()
        panel:setPosition((UIMagicEmojiCell.CELL_WIDTH - size.width) * 0.5, (UIMagicEmojiCell.CELL_HEIGHT - size.height) * 0.5)
        cell:addChild(panel)
    end

    panel:refreshData(self.mFriendInfo:getFriendUid(),self.mMagicEmojiListData[idx+1],true)
    self.CellList[idx+1] = cell

    return cell
end

function M:getMagicEmojiPosition(itemid)
    Log.info("celllistnum:"..tostring(#self.CellList))
    for _,cell in ipairs(self.CellList) do
        local panel = cell:getChildByName("UIMagicEmojiCell")
        if panel:getItemId() == itemid then
            return panel:getMagicIconWorldPosition()
            -- local posx = self.mMagicEmojiListTableView:getContentOffset().x+cell:getPositionX()+self.ListPanel:getPositionX()+UIMagicEmojiCell.CELL_WIDTH/2
            -- local posy = self.mMagicEmojiListTableView:getContentOffset().y+cell:getPositionY()+self.ListPanel:getPositionY()+UIMagicEmojiCell.CELL_HEIGHT/2
            --return cc.p(posx,posy)
        end
    end

    return nil
end

function M:onClickAddFriend(ref)
    if Utils.isBtnClickNeedDelay(ref,1000) then return end

    if self.mFriendInfo then
        g_FriendData:requestAddFriend(self.mFriendInfo:getFriendUid()) 
    end
    
    local nodePos=self.MailSpineATNode:convertToNodeSpace(self.mWorldPos)
    self.MailSpineATNode:removeAllChildren()
    local effect = Utils.onlyCreateEffect(GSystem.GameAddFriendSpine,cc.p(0,0),false)
    self.MailSpineATNode:addChild(effect)

    local delayTime=cc.DelayTime:create(1.4)
    local moveTo=cc.MoveTo:create(0.7,nodePos)
    local delayTim2=cc.DelayTime:create(0.7)

    effect:runAction(cc.Sequence:create(delayTime,moveTo,delayTim2,cc.CallFunc:create(function()
        self.MailSpineATNode:removeAllChildren()
    end)))
end

function M:onClickInteractiveButton(ref)
    if Utils.isBtnClickNeedDelay(ref,1000) then return end
    if self.CancelText:isVisible() then
        if self.mFriendInfo then
            g_FriendData:requestCancelAddFriend(self.mFriendInfo:getFriendUid()) 
        end
    end
    
    if self.ChatText:isVisible() then
        local panel = UIManager:getOrCreatePanel("UIFriendChatLayer")
        if panel then 
            panel:setFriendInfo(self.mFriendInfo)
            panel:showToScene()
        end
    end
end

function M:RefreshAddFriendUI()
    self.AddFriendButton:setVisible(false)
    self.InteractiveButton:setVisible(true)
    self.CancelText:setVisible(true)
    self.ChatText:setVisible(false)
end

function M:RefreshCancelFriendUI()
    self.AddFriendButton:setVisible(true)
    self.InteractiveButton:setVisible(false)
end

function M:refreshService()
    if not g_UserData:getServiceTag() then return end

    local data=g_UserData:getPlayerOnlineDataByUid(self.mFriendInfo:getFriendUid())
    if data then
        self.mUserDetailsCell:setVisible(true)
        self.mUserDetailsCell:refreshUI(data)
    else
        local arr={}
        table.insert(arr,self.mFriendInfo:getFriendUid())
        g_UserData:c2sGetPlayerInfosForPlaymate(arr)
        self.mUserDetailsCell:setVisible(false)
    end
end

function M:onShaiBao_RefreshBankerInfo()
    self.GoldNum:setString(Utils.getFormatNumber_MuitiLanguage(g_SieveData:getBankerAllMoney()))
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.RefreshAddFriendUI, "RefreshAddFriendUI")
    self:doRegEvent(Constant.CustomEvent.RefreshCancelFriendUI, "RefreshCancelFriendUI")
    self:doRegEvent(Constant.CustomEvent.RefreshUserInfo, "refreshUserInfo")
    self:doRegEvent(Constant.CustomEvent.UIMagicEmojiPopUp_refreshService, "refreshService")
    self:doRegEvent(Constant.CustomEvent.ShaiBao_RefreshBankerInfo, "onShaiBao_RefreshBankerInfo")
end

return M