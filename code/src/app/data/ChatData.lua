local M = class("ChatData")

function M:ctor()
    self:init()
end

function M:init()
    self.mFriendChatData = {}
    self.mRoomChatData = {}
    self.mAllChannel = {}
end

function M:getAllFriendData()
    return self.mFriendChatData
end

function M:getFriendChatDataByUid(uid)
    if self.mFriendChatData[uid] then 
        return self.mFriendChatData[uid]
    else
        return {}
    end
end

function M:removeFriendChatDataByUid(uid)
    local   data={}
    for id,v in pairs(self.mFriendChatData) do
        if id~=uid then
            data[id]=v
        end
    end
    self.mFriendChatData=data

    local channels = {}
    for i,v in ipairs(self.mAllChannel) do 
        if v.channelId ~= uid then 
            table.insert(channels,v)
        end
    end
    self.mAllChannel=channels

    DataManager:dispatchMessage(Constant.CustomEvent.refreshChannelTableView)
    DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateChatTip)
    DataManager:dispatchMessage(Constant.CustomEvent.UIFriendLayer_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.UIGameLayer_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.UIMainLayer_refreshChatHot)
    g_FriendData:showFriendHot()
end

function M:getRoomChatDataByChannelId(channelId)
    if self.mRoomChatData[channelId]  then
        local data={}
        for _,v in ipairs(self.mRoomChatData[channelId]) do
            if Enum.ChatText.RoomDefault~=v.content then
                table.insert(data,v)
            end
        end 
        return data
    else
        return {}
    end
end

function M:sortAllChannel(a,b)
    if a == nil or b == nil or a==b then 
        return false 
    end

    if a.onlineState<b.onlineState or a.sendAt>b.sendAt then
        return true
    end

    return false
end

function M:getAllChannelData(channelId)
    local channels = {}

    for i,v in ipairs(self.mAllChannel) do 
        if v.channelId == channelId then 
            table.insert(channels, 1,v)
        elseif v.channelId ~= Enum.ChatChannel.room and v.channelId~=Enum.ChatChannel.world then 
            table.insert(channels,v)
        end
    end
    return channels
end

function M:getChannelDataByChannelId(channelId)
    if not Utils.isEmptyTable(self.mAllChannel) then 
        for i,v in ipairs(self.mAllChannel) do 
            if v.channelId == channelId then 
                return v
            end
        end
    end
    return nil
end

function M:getAllFriendChannelData()
    local channels = {}
    if #self.mAllChannel>1 then
        table.sort(self.mAllChannel,handler(self,self.sortAllChannel))
    end

    if not Utils.isEmptyTable(self.mAllChannel) then 
        for i,v in ipairs(self.mAllChannel) do 
            if v.channelId ~= Enum.ChatChannel.room and v.channelId~=Enum.ChatChannel.world then 
                table.insert(channels, v)
            end
        end
    end
    return channels
end

function M:clearAllData()
    self:init()
end

function M:showChatHot()
    DataManager:dispatchMessage(Constant.CustomEvent.UIFriendLayer_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.UIGameLayer_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.UIMainLayer_refreshChatHot)
    if self:hasUnReadMessage() then
        g_FriendData:showFriendHot()
    end
end

function M:getUnReadMessageByRoom()
    local num=0
    for channel,data in pairs(self.mRoomChatData) do
        for _,v in ipairs(data) do
            if false== v.isRead then
                num=num+1
            end
        end
    end

    return num
end

function M:hasUnReadMessage()
    local num=g_FriendData:getUnReadMsgNum()

    num=num+self:getUnReadMessageByRoom()

    return num
end

function M:clearFriendChatByUid(uid)
    if  self.mFriendChatData[uid] then 
        self.mFriendChatData[uid] = {}
    end

    local channels={}
    for channelId,v in ipairs(self.mAllChannel) do
        if uid~=channelId then
            table.insert(channels,v)
        end
    end
    self.mAllChannel=channels
end

function M:createFriendChatData(v)
    --好友聊天数据
    local chat = {}
    chat.content = v.content
    chat.isText = v.isText
    chat.sendAt = v.sendAt
    chat.isSelf = v.isSelf
    chat.isRead = v.isRead
    chat.messageId=v.messageId
    chat.uid=v.uid
    if v.isSelf then 
        chat.userInfo = clone(g_UserData:getUserInfo())
        chat.userInfo.onlineState = Enum.OnlineState.Idle
    else
        chat.userInfo = v.from
        --保持最新状态
        local friendInfo=g_FriendData:getFriendDataByUid(v.uid)
        if friendInfo then
            chat.userInfo.nickname = friendInfo.nickname
            chat.userInfo.sex = friendInfo.sex 
            chat.userInfo.avatar = friendInfo.avatar
            chat.userInfo.isSystemAvatar = friendInfo.isSystemAvatar
            chat.userInfo.onlineState = friendInfo.onlineState
            chat.userInfo.avatarFrame = friendInfo.avatarFrame
            chat.userInfo.vipLevel = friendInfo.vipLevel
        end
    end

    if not self.mFriendChatData[v.uid] then 
        self.mFriendChatData[v.uid] = {}

        DataManager:dispatchMessage(Constant.CustomEvent.refreshChannelTableView)
    end
    table.insert(self.mFriendChatData[v.uid], chat)
    
    --频道是否存在，不存在则创建频道,再把对应聊天数据放进allchat
    local channelData=self:getChannelDataByChannelId(v.uid)
    if not channelData then
        local channel = {}
        channel.sendAt=v.sendAt
        channel.onlineState=chat.userInfo.onlineState
        channel.channelId = v.uid
        channel.allChat = self.mFriendChatData[v.uid]
        table.insert(self.mAllChannel, channel)
    else
        channelData.sendAt=v.sendAt
        channelData.onlineState=chat.userInfo.onlineState
    end
end

function M:createRoomChatData(v)
    --聊天数据
    local chat = {}
    chat.content = v.content
    chat.isText = v.isText
    chat.sendAt = v.sendAt
    chat.isSelf = v.isSelf
    chat.messageId=v.messageId
    chat.isRead =  v.isRead or true
    if v.isSelf then
        chat.userInfo = clone(g_UserData:getUserInfo())
        chat.userInfo.onlineState = Enum.OnlineState.Idle
    else
        chat.userInfo = v.from
        chat.userInfo.onlineState = Enum.OnlineState.Idle
    end

    if Enum.ChatText.RoomDefault==v.content then
        chat.isRead=true
    end

    if not self.mRoomChatData[v.channel] then 
        self.mRoomChatData[v.channel] = {}
    end
    table.insert(self.mRoomChatData[v.channel], chat)
    
    --频道是否存在，不存在则创建频道
    local channelData=self:getChannelDataByChannelId(v.channel)
    if not channelData then 
        local channel = {}
        channel.sendAt=v.sendAt
        channel.onlineState=chat.userInfo.onlineState
        channel.channelId = v.channel
        channel.allChat = self.mRoomChatData[v.channel]
        table.insert(self.mAllChannel, channel)
    else
        channelData.sendAt=v.sendAt
        channelData.onlineState=chat.userInfo.onlineState
    end

    return chat
end

function M:getFriendMessageById(messageId)
    local data=self:getAllFriendChannelData() or {}
    for _,v in ipairs(data) do
        if messageId==v.messageId then
            return v
        end
    end
    return nil
end

function M:isTouBaoChatShowHot()
    local  messageId=Preference:getString("WorldChatSessageId")
    local data=g_ChatData:getRoomChatDataByChannelId(Enum.ChatChannel.world)
    if #data<1 then
        return false
    end

    local  curMessageId=data[#data].messageId
    return not (messageId==curMessageId)
end
----------------------------------------网络消息---------------------------------------------
function M:C2S_getFriendChatMsg(toUid)
    self:clearFriendChatByUid(toUid)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_getFriendChatMsg, { toUid = toUid})
end

function M:C2S_readFriendChatMsgAll(uid)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_readFriendChatMsgAll, { friendUid=uid})
end

function M:requestFriendChat(msg)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_FriendChatMessage, { content = msg.content, isText = msg.isText, toUid = msg.friendUid})
end

function M:S2C_FriendChatMsgAck(data)
    if not data then return end

    data.isSelf = true
    data.uid = data.toUid
    self:createFriendChatData(data)

    DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateChatTip)
    DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateChatList, {isRefreshText = false, isNeedPlaySound = false})
    DataManager:dispatchMessage(Constant.CustomEvent.UIFriendItem_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.UIChannelCell_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.UIGameLayer_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.UIMainLayer_refreshChatHot)
    self:showChatHot()

end

function M:S2C_FriendChatMessage(message)
    if not message then return end

    local list=message.list or {}
    for _,data in ipairs(list) do
        data.isSelf =g_UserData:isSelfUserId(data.from.uid)
        data.uid = data.from.uid
        if data.isSelf then
            data.uid = data.toUid
        end
        
        self:createFriendChatData(data)
    end

    DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateChatTip)
    DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateChatList, {isRefreshText = false, isNeedPlaySound = true})
    DataManager:dispatchMessage(Constant.CustomEvent.UIFriendItem_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.UIChannelCell_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.UIGameLayer_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.UIMainLayer_refreshChatHot)
    self:showChatHot()
end

function M:S2C_receiveFriendChatMessageOne(data)
    local message=data.message
    message.isSelf =false
    message.uid = message.from.uid
    
    self:createFriendChatData(message)

    SoundSystemManager:playSound007()
    
    DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateChatTip)
    DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateChatList, {isRefreshText = false, isNeedPlaySound = true})
    DataManager:dispatchMessage(Constant.CustomEvent.UIFriendItem_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.UIChannelCell_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.UIGameLayer_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.UIMainLayer_refreshChatHot)
    self:showChatHot()
end

function M:S2C_readFriendChatMsgAck(message)
    local messageIds=message.messageIds or {}
    for _,messageId in ipairs(messageIds) do
        local data=self:getFriendMessageById(messageId)
        if data then
            data.isRead=true
        end
    end

    DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateChatTip)
    DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateChatList, {isRefreshText = false, isNeedPlaySound = false})
    DataManager:dispatchMessage(Constant.CustomEvent.UIFriendItem_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.UIChannelCell_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.UIGameLayer_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.UIMainLayer_refreshChatHot)
    self:showChatHot()
end

function M:requestRoomChat(msg)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_RoomChatMessage, { content = msg.content, isText = msg.isText, channel = msg.channel })
end

function M:S2C_RoomChatMsgAck(data)
    -- if not data then return end
    
    -- data.isSelf = true
    -- self:createRoomChatData(data)

    -- DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateRoomChatList, false)
    -- DataManager:dispatchMessage(Constant.CustomEvent.UIGameLayer_refreshHot)
    -- DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateChatTip)
    DataManager:dispatchMessage(Constant.CustomEvent.UIMainLayer_refreshChatHot)
end

function M:clearRoomChatData(channel)
    self.mRoomChatData[channel] = {}
    local   allChannel={}
    for _,v in ipairs(self.mAllChannel) do
        if channel==v.channelId then
            
        else
            table.insert(allChannel,v)
        end
    end
    self.mAllChannel=allChannel
end

function M:S2C_RoomChatMessage(message)
    if not message then return end
    local channel=message.channel--频道
    
    local isRead=true
    local list=message.list or {}--聊天记录列表
    for _,data in ipairs(list) do
        data.isSelf =g_UserData:isSelfUserId(data.from.uid)
        data.channel=channel
        local chat=self:createRoomChatData(data)
        if not chat.isRead then
            isRead=false
        end
        if data.isSelf then
            chat.isRead=true
        end
    end

    if not isRead then
        SoundSystemManager:playSound007()
    end
    
    DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateRoomChatList, false)
    DataManager:dispatchMessage(Constant.CustomEvent.UIGameLayer_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.UIMainLayer_refreshChatHot)
    DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateChatTip)
    DataManager:dispatchMessage(Constant.CustomEvent.UIChannelCell_refreshHot)
end

return M