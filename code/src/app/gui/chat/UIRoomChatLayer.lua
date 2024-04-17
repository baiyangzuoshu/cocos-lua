local UIChatCell = require("app.gui.chat.UIChatCell")
local UIChatSelfCell = require("app.gui.chat.UIChatSelfCell")
local UIChannelCell = require("app.gui.chat.UIChannelCell")

local UIPanel = require("app.gui.basegui.UIPanel")

local M = class("UIRoomChatLayer", UIPanel)

local MIN_ROW = 1

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_BoastChatPopUp.lua"

M.BINDGUIDATANODE = {
    ["InteractionPopups"] = { varname = "InteractionPopups" },

    ["ChannelButton"] = { varname = "ChannelButton", onClick = "onClickChannelBtn" },
    ["ChannelTipDotIcon"] = { varname = "TipIcon" },
    ["ChannelTipDotNum"] = { varname = "TipNum" },


    ["ChatTitleText"] = { varname = "ChannelNameText" },

    ["ChatSendInteraction"] = { varname = "ChatSendInteraction" },
    ["ChatTextField"] = { varname = "ChatTextField" },
    ["ExpressionButton"] = { varname = "ChatEmojiButton", onClick = "onClickChatEmojiBtn" },
    ["SendButton"] = { varname = "SendButton", onClick = "onClickSendBtn" },

    ["ChatPanel"] = { varname = "ChatPanel"},

    ["Move"] = { varname = "Move" },
    ["Move_1"] = { varname = "Move_2" },

    ["Expression"] = { varname = "Expression" },
    ["ExpressionBg"] = { varname = "ExpressionBg" },
    ["ExpressionPanel"] = { varname = "ExpressionPanel" },
    ["ExpressionListPanel"] = { varname = "ExpressionListPanel" },

    ["Channel"] = { varname = "Channel" },
    ["ChannelPannel"] = { varname = "ChannelPanel" },
    ["ChannelInteraction"] = { varname = "ChannelInteraction" },
    ["ChatTextFieldPanel"]={varname="ChatTextFieldPanel",onClick="onClickEvent"},
    ["ChatTextFieldBg"]={varname="ChatTextFieldBg"},
    ["TextFieldInteractionPanel"]={varname="TextFieldInteractionPanel"}
}
local tag="UIRoomChatLayer"

function M:onClickEvent()
    SoundSystemManager:playSound004()
end

function M:isSleepIng()
    return self.sleeping
end

function M:active()
    self.sleeping=false
    self:setVisible(true)
    if 0==self.type and (not g_FriendData:getFriendDataByUid(self.mChatFriend:getFriendUid())) then
        self.type=1
        self:initChatItem()
    end
    self:refreshChatUI(true)
end

function M:updateTipNum()
    local num=g_ChatData:hasUnReadMessage()
    if self.mChatFriend and 1==self.type and false==self.sleeping then
        --local uid=self.mChatFriend:getFriendUid()
        --num=g_FriendData:getFriendUnReadMsgNumByUid(uid)
    end
    
    self.TipIcon:setVisible(num>0)
    self.TipNum:setVisible(num>0)
    self.TipNum:setString(tostring(num))
end

function M:openIMEAction()
    if not self.Expression:isVisible() then 
        self:chatMove(true)
    end
end

function M:closeIMEAction()
    if self.Expression:isVisible() then 
        self:chatMove(false)
    end
end

function M:initChatItem()
    self.curRow=1
    self.chatItem={}
    self.scrollViewHot=0
    self.refreshTime=0
    self.emojiTime=0
    self.chatScrollView:removeAllChildren()
end

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true, 0)
   
    self.sleeping=false
    self.closeTime=0
    self.m_ChatData = {}
    --
    local size = self.ChatPanel:getContentSize()
    self.chatScrollView = ccui.ScrollView:create()
    self.chatScrollView:setTouchEnabled(true)
    self.chatScrollView:setBounceEnabled(true)
    self.chatScrollView:setDirection(ccui.ScrollViewDir.vertical)
    self.chatScrollView:setScrollBarEnabled(false)
    self.chatScrollView:setContentSize(size)
    self.chatScrollView:setPosition(cc.p(0,-10))
    self.chatScrollView:setAnchorPoint(cc.p(0,0))
    self.chatScrollView:addEventListener(handler(self,self.scrollViewEventListener))
    self.ChatPanel:addChild(self.chatScrollView)
    
    --
    self.m_ChannelData = {}
    self.mChannelRow = 0

    local size = self.ChannelPanel:getContentSize()
    self.mChannelTableView = cc.TableView:create(size)
    self.mChannelTableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
    self.mChannelTableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
    self.mChannelTableView:setBounceable(true)
    self.mChannelTableView:setIgnoreAnchorPointForPosition(false)
    self.mChannelTableView:setAnchorPoint(0, 0)
    self.mChannelTableView:setPosition(0, 0)

    self.ChannelPanel:addChild(self.mChannelTableView)

    self.mChannelTableView:setDelegate()
    self.mChannelTableView:registerScriptHandler(handler(self, self.getNumberOfCellsInChannelTableView), cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
    self.mChannelTableView:registerScriptHandler(handler(self, self.getTableCellSizeForChannelIndex), cc.TABLECELL_SIZE_FOR_INDEX)
    self.mChannelTableView:registerScriptHandler(handler(self, self.getTableCellSizeAtChannelIndex), cc.TABLECELL_SIZE_AT_INDEX)

    self.Channel:setVisible(false)
    self.Expression:setVisible(false)

    self:initEditBox()
    self:initChatEmoji()
    self:initOutClickableArea()
    self:initChannelOutClickableArea()
    self:initChatOutClickableArea()
end

function M:scrollViewEventListener(ref,type)
    if 4==type then
        self.scrollViewHot=60*1
    end
end

function M:initListItem(idx)
    local v=self.m_ChatData[idx]
    if v.isSelf then
        local chatSelfPanel=UIChatSelfCell.new()
        chatSelfPanel:refreshData(self.m_ChatData, idx,self.type) 
        return chatSelfPanel
    else
        local   chatPanel=UIChatCell.new()
        chatPanel:refreshData(self.m_ChatData, idx,self.type)
        chatPanel:activeHeadEvent()
        if 1==self.type then
            chatPanel:activeHeadEvent()
        end
        return chatPanel
    end 
end

function M:refreshChatItemTime()
    for _,item in ipairs(self.chatItem) do
        item:refreshTime()
    end
end

function M:addChatItem()
    self.m_ChatData = self:getChatData()
    for i=self.curRow,#self.m_ChatData,1 do 
        local item = self:initListItem(i)
        local panel = ccui.Layout:create()
        local size = item:getRealSize()
        panel:setContentSize(size)
        self.chatScrollView:addChild(panel)
        panel:addChild(item)
        item:setAnchorPoint(cc.p(0,0))
        item:setPosition(cc.p(0,0))
        panel:setAnchorPoint(cc.p(0,0))

        table.insert(self.chatItem,item)
    end
    self.curRow=#self.m_ChatData+1

    local curHeight=0
    local showHeight=self.ChatPanel:getContentSize().height
    for _,v in ipairs(self.chatItem) do
        local size=v:getRealSize()
        curHeight=curHeight+size.height
    end

    if curHeight<showHeight then
        curHeight=showHeight
    end

    local height=0
    for _,v in ipairs(self.chatItem) do
        local size=v:getRealSize()
        height=height+size.height
        v:setPosition(cc.p(0,curHeight-height))
    end
    
    self.chatScrollView:setInnerContainerSize(cc.size(self.ChatPanel:getContentSize().width,curHeight))
    if 0==self.scrollViewHot then
        self.chatScrollView:jumpToPercentVertical(100)
    end
end

function M:editboxEventHandler(eventType,str)
    if eventType == "began" then
        -- 点击编辑框,输入法显示
        SoundSystemManager:playSound004()
        self.closeTime=60*1
    elseif eventType == "ended" then
        -- 当编辑框失去焦点并且键盘消失的时候被调用
        self.closeTime=60*1
    elseif eventType == "changed" then
        -- 输入内容改变时调用
    elseif eventType == "return" then
        -- 用户点击编辑框的键盘以外的区域，或者键盘的Return按钮被点击时所调用
        self:onClickSendBtn()
        self.closeTime=60*1
    end
end

function M:initEditBox()
    self.ChatTextField:setVisible(false)
    self.ChatTextFieldBg:setVisible(true)
    local _x,_y=self.ChatTextField:getPosition()
    local editChat = ccui.EditBox:create(self.TextFieldInteractionPanel:getContentSize(),"00_01_Common/picture_057.png","00_01_Common/picture_057.png","00_01_Common/picture_057.png",ccui.TextureResType.plistType)
    self.ChatTextFieldPanel:addChild(editChat)
    editChat:setPosition( cc.p(_x,_y))
    editChat:setAnchorPoint(cc.p(0,0.5))
    editChat:setFontColor(cc.vec3(67,67,67))
    editChat:setFontName("font/Default.TTF")
    editChat:setFontSize(24)
    editChat:registerScriptEditBoxHandler(handler(self,self.editboxEventHandler))
    editChat:setInputMode(cc.EDITBOX_INPUT_MODE_SINGLELINE)
    editChat:setReturnType(cc.KEYBOARD_RETURNTYPE_SEND)
    self.editBoxChat=editChat
end

function M:initChatEmoji()
    local   ChatEmojiTypeValueArray=GSystem.ChatEmojiTypeValueArray
    self.ExpressionPanel:setSwallowTouches(false)
    local size = self.ExpressionPanel:getContentSize()
    self.mItemListView = ccui.ListView:create()
    self.mItemListView:setContentSize(cc.size(size.width+60,size.height))
    self.mItemListView:setDirection(ccui.ListViewDirection.vertical)
    self.mItemListView:setBounceEnabled(true)
    self.mItemListView:setScrollBarEnabled(false)
    self.mItemListView:setItemsMargin(0)
    self.mItemListView:setPosition(cc.p(-30, 0))
    self.mItemListView:setAnchorPoint(cc.p(0, 0))
    self.ExpressionPanel:addChild(self.mItemListView)

    local   data=DataManager:getTbxData("Item","ItemType",ChatEmojiTypeValueArray[1])
    table.sort(data,function(a,b)
        if a == nil or b == nil then 
            return false 
        end
        
        if a.ItemId<b.ItemId then
            return true
        end

        return false
    end)

    local panel
    local row=10
    for i=1,#data,1 do
        if 1==i%row then
            panel = ccui.Layout:create()
            panel:setContentSize(cc.size(670,150*0.5))
            self.mItemListView:pushBackCustomItem(panel)
        end

        local v=data[i]
        local netData = {}
        netData.itemShowType = v.ItemType
        netData.itemId = v.ItemId
        netData.itemNum = 1

        local itemInfo = require("app.bean.ItemInfo").new(netData, v.ItemType)
        local item = UIManager:createPanelOnly("UIEmailItem2")
        item:setAnchorPoint(cc.p(0,0))
        item:setPropFrameVisible(false)
        item:setItemInfo(itemInfo)
        item:setScale(0.5)
        item:setPosition(cc.p(i%row*150*0.5-150*0.5,0))
        item:setTouchCallBack(handler(self,self.itemCb))
        panel:addChild(item)
    end
end

function M:itemCb(item)
    if self.emojiTime>0 then return end
    self.emojiTime=60*1
    local netData = item.mItemInfo:getNetData()
    local m_data = item.mItemInfo:getCfgData()
    self:sendMessage("Emoji"..m_data.ItemIcon)
end

function M:initOutClickableArea()
    local function onOutOfQuickBoxClick()
        if 0==self.closeTime then
            self.sleeping=true
            self:closeIMEAction()
            self:setVisible(false)
        end
    end

    UIUtils.addClickableNode(self.InteractionPopups, nil, onOutOfQuickBoxClick)
end

function M:initChannelOutClickableArea()
    local function onOutOfQuickBoxClick()
        if self.Channel:isVisible() then 
            self:channelMove(false)
        end
    end

    UIUtils.addClickableNode(self.ChannelInteraction, nil, onOutOfQuickBoxClick)
end

function M:initChatOutClickableArea()
    local function onOutOfQuickBoxClick()
        if self.Expression:isVisible()  then 
            if self.Channel:isVisible() then
                self:chatMove(false)
            else
                self:chatMove(false)
            end
        end
    end
    
    UIUtils.addClickableNode(self.ExpressionBg, nil, onOutOfQuickBoxClick)
end

function M:onInit()
    M.super.onInit(self)
    self:initChatItem()
    self.editBoxChat:setText("")
    if self.Channel:isVisible() then
        self:channelMove(false)
    end
    if self.Expression:isVisible() then
        self:chatMove(false)
    end
end

function M:setChannelID(id)
    self.channelID=id
    self.type=id
    self:sendMessage(Enum.ChatText.RoomDefault)
    self:updateTipNum()
end

function M:onEnter()
    M.super.onEnter(self)

    self:refreshChatUI(true)
end

function M:getChatData()
    if Enum.ChatChannel.room==self.type then
        return g_ChatData:getRoomChatDataByChannelId(Enum.ChatChannel.room)
    elseif Enum.ChatChannel.world==self.type then
        return g_ChatData:getRoomChatDataByChannelId(Enum.ChatChannel.world)
    elseif Enum.ChatChannel.friend==self.type then
        return g_ChatData:getFriendChatDataByUid(self.mChatFriend:getFriendUid())
    end
end

function M:refreshChatUI(isRefreshText)
    if self:isSleepIng() then return end

    if isRefreshText then 
        self.editBoxChat:setText("")
    end
    
    if Enum.ChatChannel.room==self.type then
        self.ChannelNameText:setString(g_GameData:getChatRoomName())
    elseif Enum.ChatChannel.world==self.type then
        self.ChannelNameText:setString(GSystem.DiceBabyChatRoomName)
    elseif Enum.ChatChannel.friend==self.type then
        self.ChannelNameText:setString(self.mChatFriend:getNickName())
    end
    
    self:addChatItem()
end

function M:sendMessage(str)
    local msg = {}
    msg.content = str
    msg.isText = true
    if Enum.ChatChannel.room==self.type then
        msg.channel = Enum.ChatChannel.room
        g_ChatData:requestRoomChat(msg)
    elseif Enum.ChatChannel.world==self.type then
        msg.channel = Enum.ChatChannel.world
        g_ChatData:requestRoomChat(msg)
    elseif Enum.ChatChannel.friend==self.type then
        msg.friendUid = self.mChatFriend:getFriendUid()
        g_ChatData:requestFriendChat(msg)
    end
    self:closeIMEAction()
end

function M:onClickSendBtn(ref)
    local str = Utils.transformInputStr(self.editBoxChat:getText())
    if Utils.isEmptyStr(str) then 
        UIUtils.popToadtByMessageId(Constant.Define.ChatSendNull)
        return
    end
    if string.len(str) > GSystem.ChatMaxWordNumber then 
        UIUtils.popToadtByMessageId(Constant.Define.ChatNumIsTooLong)
        return
    end
    self.editBoxChat:setText("")
    self:sendMessage(str)
end

function M:onClickChannelBtn(ref)
    if self.Expression:isVisible() then 
        self:chatMove(false)
    end
    if not self.Channel:isVisible() then 
        self:channelMove(true)
    end

    self:refreshChannelTableView()
end

function M:refreshChannelTableView()
    --刷新列表
    self.m_ChannelData = g_ChatData:getAllChannelData(self.channelID)
    if not Utils.isEmptyTable(self.m_ChannelData) then 
        self.mChannelTableView:setVisible(true)

        self.mChannelRow = math.ceil(table.getn(self.m_ChannelData) / UIChannelCell.ITEM_COLUMN)
        if self.mChannelRow < MIN_ROW then
            self.mChannelRow = MIN_ROW 
        end
        
        self.mChannelTableView:reloadData()
    else
        self.mChannelTableView:setVisible(false)
    end
end

function M:onSelectItem(item)
    if not item then return end

    if self.Channel:isVisible() then
        self:channelMove(false)
    end

    self.type=item:getType()
    local friendInfo = item:getData()
    self:setFriendInfo(friendInfo)
    self:initChatItem()
    self:refreshChatUI(true)
end

function M:setFriendInfo(friendInfo)
    self.mChatFriend = friendInfo
end

function M:onClickChatEmojiBtn(ref)
    if not self.Expression:isVisible() then 
        self:chatMove(true)
    elseif self.Expression:isVisible() then 
        self:chatMove(false)
    end
end

function M:channelMove(right)
    if self.channelMoveIng then
        return
    end
    local size =  self.ChannelInteraction:getContentSize()
    self.channelMoveIng=true
    local distance = 0
    if right then 
        distance = size.width
    else
        distance = -size.width
    end
    local scrollAction = cc.Sequence:create(
        cc.MoveBy:create(0.1, cc.p(distance, 0)), 
        cc.CallFunc:create(
            function()
                self.channelMoveIng=false
                if right then 
                    self.Channel:setVisible(true)
                else
                    self.Channel:setVisible(false)
                end
            end
        ))
    self.Move:runAction(scrollAction)
end

function M:chatMove(top)
    if self.chatMoveIng then
        return
    end
    local size =  self.ExpressionBg:getContentSize()
    self.chatMoveIng=true
    local distance = 0
    if top then 
        distance = size.height
    else
        distance = -size.height
    end
    local scrollAction = cc.Sequence:create(
        cc.MoveBy:create(0.1, cc.p(0, distance)), 
        cc.CallFunc:create(
            function()
                self.chatMoveIng=false
                if top then 
                    self.Expression:setVisible(true)
                else
                    self.Expression:setVisible(false)
                end
            end
        ))
    self.Move_2:runAction(scrollAction)
end

function M:getNumberOfCellsInChannelTableView(tableview)
    return self.mChannelRow
end

function M:getTableCellSizeForChannelIndex(tableview, idx)
    return UIChannelCell.CELL_WIDTH, UIChannelCell.CELL_HEIGHT
end

function M:getTableCellSizeAtChannelIndex(tableview, idx)
    local cell = tableview:dequeueCell()
    if nil == cell then
        cell = cc.TableViewCell:new()
    end

    local panel = cell:getChildByName("UIChannelCell")
    if not panel then
        panel = UIChannelCell.new()
        panel:setName("UIChannelCell")

        local size = panel:getContentSize()
        panel:setPosition((UIChannelCell.CELL_WIDTH - size.width) * 0.5, (UIChannelCell.CELL_HEIGHT - size.height) * 0.5)
        panel:setTouchCallBack(handler(self, self.onSelectItem))
        cell:addChild(panel)
    end

    panel:refreshData(self.m_ChannelData, idx + 1)

    return cell
end

function M:onCleanup()
    M.super.onCleanup(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
    
    self:doRegEvent(Constant.CustomEvent.OnUpdateChatList, "refreshChatUI")--好友聊天信息
    self:doRegEvent(Constant.CustomEvent.OnUpdateRoomChatList, "refreshChatUI")--房间聊天信息
    self:doRegEvent(Constant.CustomEvent.OnUpdateChatTip, "updateTipNum")
    self:doRegEvent(Constant.CustomEvent.refreshChannelTableView, "refreshChannelTableView")
end

function M:OnUpdate(dt)
    self.scrollViewHot=self.scrollViewHot-1
    if self.scrollViewHot<0 then
        self.scrollViewHot=0
    end
    self.closeTime=self.closeTime-1
    if self.closeTime<0 then
        self.closeTime=0
    end

    self.refreshTime=self.refreshTime+1
    if 0==self.refreshTime%60 then
        self:refreshChatItemTime()
    end

    self.emojiTime=self.emojiTime-1
    if self.emojiTime<0 then
        self.emojiTime=0
    end
end

return M