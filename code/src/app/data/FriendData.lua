local M = class("FriendData")

function M:ctor()
    self.m_FriendListData = {}
    self.m_FriendRequestData = {}
    self.m_FriendSearchData = {}
    self.m_FriendBlockData = {}
    self.m_FriendRecommendData = {}
    self.m_RequestFriendData = {}

    self.m_FriendAddData={}
end

function M:clearAllData()
    self.m_FriendAddData={}
end

function M:addFriendAddDataItem(uid)
    table.insert(self.m_FriendAddData,uid)
end

function M:isExitFriendAddDataByUid(uid)
    for _,v in ipairs(self.m_FriendAddData) do
        if uid==v then
            return true
        end
    end

    return false
end
--好友列表
function M:getFriendListData()
    return self.m_FriendListData
end
--好友申请列表
function M:getFriendRequestData()
    return self.m_FriendRequestData
end
--搜索添加列表
function M:getFriendSearchData()
    return self.m_FriendSearchData
end
--黑名单列表
function M:getFriendBlockData()
    return self.m_FriendBlockData
end
--推荐列表
function M:getFriendRecommendData()
    return self.m_FriendRecommendData
end

--申请别人
function M:getRequestFriendData()
    return self.m_RequestFriendData
end

function M:getFriendRequestDataByUid(uid)
    for _,v in ipairs(self.m_FriendRequestData) do
        if uid==v.uid then
            return v
        end
    end

    return nil
end

function M:getUnReadMsgNumByUid(uid)
    local   friend=self:getFriendDataByUid(uid)
    if friend then
        return friend.unReadMsgNum
    end

    return 0
end

function M:updateOnlineType(friend)
    if 4==friend.onlineState then-- 游戏中
        friend.type=1
    elseif 5==friend.onlineState then-- 观战中
        friend.type=2
    elseif 3==friend.onlineState then-- 匹配中
        friend.type=3
    elseif 2==friend.onlineState then-- 空闲
        friend.type=4
    elseif 1==friend.onlineState then-- 离线
        friend.type=5
    elseif 6==friend.onlineState then-- 封禁中
        friend.type=6
    end
end

function M:createFriend(v)
    local friend = {}
    friend.uid = v.uid 
    friend.nickname = v.nickname
    friend.sex = v.sex 
    friend.avatar = v.avatar
    friend.isSystemAvatar = v.isSystemAvatar
    friend.onlineState = v.onlineState
    friend.status = v.status
    friend.unReadMsgNum = v.unReadMsgNum or 0
    self:updateOnlineType(friend)

    friend.status = v.status or Enum.FriendStatus.none
    friend.avatarFrame = v.avatarFrame
    friend.vipLevel = v.vipLevel
    friend.fansNum = v.fansNum
    friend.slogan = v.slogan
    friend.gold=v.gold
    friend.roomID=v.roomConfigId
    
    return friend
end

function M:getFriendDataByUid(uid)
    for _,v in ipairs(self.m_FriendListData) do
        if uid == v.uid then 
            return v
        end
    end

    return nil
end

function M:CheckIsMyFriendByUid(uid)
    local isMyFriend = false 
    if not Utils.isEmptyTable(self.m_FriendListData) then 
        for _,v in ipairs(self.m_FriendListData) do
            if uid == v.uid then 
                isMyFriend = true
            end
        end
    end
    return isMyFriend
end

function M:CheckIsMyRequestFriendByUid(uid)
    local isMyRequestFriend = false 
    if not Utils.isEmptyTable(self.m_RequestFriendData) then 
        for _,v in ipairs(self.m_RequestFriendData) do
            if uid == v then 
                isMyRequestFriend = true
            end
        end
    end
    return isMyRequestFriend
end

function M:checkIsInBlackList(uid)
    local isblack = false
    if not Utils.isEmptyTable(self.m_FriendBlockData) then 
        for _,v in ipairs(self.m_FriendBlockData) do
            if uid == v.uid then 
                isblack = true
            end
        end
    end
    return isblack
end

function M:checkIsInRequestList(uid)
    local isblack = false
    if not Utils.isEmptyTable(self.m_FriendRequestData) then 
        for _,v in ipairs(self.m_FriendRequestData) do
            if uid == v.uid then 
                isblack = true
            end
        end
    end
    return isblack
end

function M:getIsSearchMode()
    return self.mode
end

function M:setIsSearchMode(mode)
    self.mode = mode
end

function M:showFriendHot()
    local num=#self.m_FriendRequestData+self:getUnReadMsgNum()
    
    DataManager:dispatchMessage(Constant.CustomEvent.UpdateHotShow,{type=Enum.mainHotType.friend,num=num})
end

function M:getUnReadMsgNum()
    local num=0
    for _,v in ipairs(self.m_FriendListData) do
        local   friend=self:getFriendDataByUid(v.uid)
        if friend then
            num=num+friend.unReadMsgNum
        end
    end
    return num
end

function M:hasUnReadMessage(uid)
    for _,v in ipairs(self.m_FriendListData) do
        if uid~=v.uid and self:hasUnReadMessageByUid(v.uid) then
            return true
        end
    end
    return false
end

function M:hasUnReadMessageByUid(uid)
    local   friend=self:getFriendDataByUid(uid)
    if friend then
        return friend.unReadMsgNum>0
    end

    return false
end

function M:getFriendUnReadMsgNumByUid(uid)
    local   friend=self:getFriendDataByUid(uid)
    if friend then
        return friend.unReadMsgNum
    end

    return 0
end
----------------------------------------网络消息---------------------------------------------
--请求好友列表数据
function M:requestFriendList()
    UIUtils.showLoadingLayer(5,10)

    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_GetFriendList)
end
function M:S2C_GetFriendList(data)
    UIUtils.closeLoadingLayer()

    if not data then return end 

    self.m_FriendListData = {}
    local list = data.list 
    if not Utils.isEmptyTable(list) then 
        for _,v in ipairs(list) do 
            local friend = self:createFriend(v)
            table.insert(self.m_FriendListData, friend)

            g_ChatData:C2S_getFriendChatMsg(friend.uid)
        end
        DataManager:dispatchMessage(Constant.CustomEvent.refreshFriendList)
    end

    DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendList)
end

--请求好友申请数据
function M:requestFriendRequestList()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_GetFriendRequestList)
end
function M:S2C_GetFriendRequestList(data)
    if not data then return end 

    self.m_FriendRequestData = {}
    local list = data.list 
    if not Utils.isEmptyTable(list) then 
        for _,v in ipairs(list) do 
            local friend = self:createFriend(v)
            table.insert(self.m_FriendRequestData, friend)
        end
    end
    self:showFriendHot()
    DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendRequestList)
    DataManager:dispatchMessage(Constant.CustomEvent.mainRequestAddFriend)
end


--请求好友搜索数据
function M:requestFriendSearchList(str)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_GetFriendSearchList, { search = str })
end
function M:S2C_GetFriendSearchList(data)
    if not data then return end 

    self.m_FriendSearchData = {}
    local list = data.list 
    if not Utils.isEmptyTable(list) then 
        for _,v in ipairs(list) do 
            local friend = self:createFriend(v)
            table.insert(self.m_FriendSearchData, friend)
        end
    end

    DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendSearchList, self.m_FriendSearchData)
end


--请求黑名单数据
function M:requestFriendBlockList()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_GetBlacklist)
end
function M:S2C_GetBlacklist(data)
    if not data then return end 

    self.m_FriendBlockData = {}
    local list = data.list 
    if not Utils.isEmptyTable(list) then 
        for _,v in ipairs(list) do 
            local friend = self:createFriend(v)
            table.insert(self.m_FriendBlockData, friend)
        end
    end

    DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendBlockList)
end


--请求推荐好友列表
function M:requestGetRecommendFriendList()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_GetRecommendFriendList)
end
function M:S2C_GetRecommendFriendList(data)
    if not data then return end 
    
    self.m_FriendRecommendData = {}
    local list = data.list 
    if not Utils.isEmptyTable(list) then 
        for _,v in ipairs(list) do 
            local friend = self:createFriend(v)
            table.insert(self.m_FriendRecommendData, friend)
        end
    end

    DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendSearchList, self.m_FriendRecommendData)
end


--请求添加好友
function M:requestAddFriend(uid)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_AddFriendRequest, { friendUid = uid })
end
--添加好友回复自己
function M:S2C_AddFriendResponse(data)
    if not data then return end 

    if data.ok then 
        UIUtils.popToadtByMessageId(Constant.Define.AddFriendAleadySend)
        DataManager:dispatchMessage(Constant.CustomEvent.RefreshAddFriendUI, data.friendUid)
        if self:getIsSearchMode() then
            if not Utils.isEmptyTable(self.m_FriendSearchData) then
                for _,v in ipairs(self.m_FriendSearchData) do 
                    if data.friendUid == v.uid then 
                        v.status = Enum.FriendStatus.requesting
                    end
                end
                --DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendSearchList, self.m_FriendSearchData)
            end
        else
            if not Utils.isEmptyTable(self.m_FriendRecommendData) then
                for _,v in ipairs(self.m_FriendRecommendData) do 
                    if data.friendUid == v.uid then 
                        v.status = Enum.FriendStatus.requesting
                    end
                end
                --DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendSearchList, self.m_FriendRecommendData)
            end
        end
        if Utils.isEmptyTable(self.m_RequestFriendData) then 
            table.insert(self.m_RequestFriendData, data.friendUid)
        else
            local isExist = false
            for _,v in ipairs(self.m_RequestFriendData) do 
                if v == data.friendUid then 
                    isExist = true 
                    break 
                end
            end
            if not isExist then
                table.insert(self.m_RequestFriendData, data.friendUid) 
            end
        end
    end
end
--添加好友回复别人
function M:S2C_AddFriendToOther(data)
    if not data then return end 

    local friend = self:createFriend(data.friend)
    table.insert(self.m_FriendRequestData, friend)

    DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendRequestList)
    DataManager:dispatchMessage(Constant.CustomEvent.mainRequestAddFriend, { friendUid = friend.uid })
    self:showFriendHot()
end

--请求取消添加好友
function M:requestCancelAddFriend(uid)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_CancelAddFriend, { friendUid = uid })
end
function M:S2C_CancelAddFriendResponse(data)
    if not data then return end 

    local ok = data.ok 
    if ok then 
        DataManager:dispatchMessage(Constant.CustomEvent.RefreshCancelFriendUI, data.friendUid)
        if self:getIsSearchMode() then
            if not Utils.isEmptyTable(self.m_FriendSearchData) then
                for _,v in ipairs(self.m_FriendSearchData) do 
                    if data.friendUid == v.uid then 
                        v.status = Enum.FriendStatus.none
                    end
                end
                --DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendSearchList, self.m_FriendSearchData)
            end
        else
            if not Utils.isEmptyTable(self.m_FriendRecommendData) then
                for _,v in ipairs(self.m_FriendRecommendData) do 
                    if data.friendUid == v.uid then 
                        v.status = Enum.FriendStatus.none
                    end
                end
                --DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendSearchList, self.m_FriendRecommendData)
            end
        end
        if Utils.isEmptyTable(self.m_RequestFriendData) then 
            return
        else
            for _,v in ipairs(self.m_RequestFriendData) do 
                if v == data.friendUid then 
                    table.removebyvalue(self.m_RequestFriendData, v, false)
                    break 
                end
            end
        end
    end
end
--取消好友回复别人
function M:S2C_CancelAddFriend(data)
    if not data then return end 

    local ok = data.ok 
    if ok then 
        if not Utils.isEmptyTable(self.m_FriendRequestData) then
            for _,v in ipairs(self.m_FriendRequestData) do 
                if data.friendUid == v.uid then 
                    table.removebyvalue(self.m_FriendRequestData, v, false)
                    DataManager:dispatchMessage(Constant.CustomEvent.requestRemoveFriend,{ friendUid = v.uid })
                end
            end
        end
        self:showFriendHot()
        DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendRequestList)
    end
end


--请求删除好友
function M:requestDeleteFriend(uid)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_DeleteFriend, { friendUid = uid })
end
function M:S2C_DeleteFriend(data)
    if not data then return end

    local ok = data.ok 

    if ok then 
        if not Utils.isEmptyTable(self.m_FriendListData) then
            for _,v in ipairs(self.m_FriendListData) do 
                if data.friendUid == v.uid then 
                    table.removebyvalue(self.m_FriendListData, v, false)

                    g_ChatData:removeFriendChatDataByUid(data.friendUid)
                    DataManager:dispatchMessage(Constant.CustomEvent.requestRemoveFriend,{ friendUid = v.uid })
                end
            end
        end

        if not Utils.isEmptyTable(self.m_RequestFriendData) then
            for _,v in ipairs(self.m_RequestFriendData) do 
                if v == data.friendUid then 
                    table.removebyvalue(self.m_RequestFriendData, v, false)
                    break 
                end
            end
        end
        
        DataManager:dispatchMessage(Constant.CustomEvent.FriendListInitData)
        DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendList)

        -- if UIManager:getPanel("UIOtherPersonInfoLayer") or UIManager:getPanel("UIMagicEmojiPopUp") then 
            DataManager:dispatchMessage(Constant.CustomEvent.RefreshUserInfo)
        -- end
    end
end


--请求拉黑好友
function M:requestBlockFriend(uid)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_BlockFriend, { friendUid = uid })
end
function M:S2C_BlockFriend(data)
    if not data then return end 

    local ok = data.ok 

    if ok then 
        local friend = self:createFriend(data.friend)
        table.insert(self.m_FriendBlockData, friend)

        if not Utils.isEmptyTable(self.m_FriendListData) then
            for _,v in ipairs(self.m_FriendListData) do 
                if friend.uid == v.uid then 
                    table.removebyvalue(self.m_FriendListData, v, false)

                    g_ChatData:removeFriendChatDataByUid(v.uid)
                end
            end
            DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendList)
            DataManager:dispatchMessage(Constant.CustomEvent.FriendListInitData)
        end

        if not Utils.isEmptyTable(self.m_FriendRecommendData) then
            for _,v in ipairs(self.m_FriendRecommendData) do 
                if friend.uid == v.uid then 
                    table.removebyvalue(self.m_FriendRecommendData, v, false)
                end
            end
            DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendSearchList, self.m_FriendRecommendData)
        end
        if self:getIsSearchMode() then
            -- if not Utils.isEmptyTable(self.m_FriendSearchData) then
            --     for _,v in ipairs(self.m_FriendSearchData) do 
            --         if friend.uid == v.uid then 
            --             table.removebyvalue(self.m_FriendSearchData, v, false)
            --         end
            --     end
            --     DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendSearchList, self.m_FriendSearchData)
            -- end
            DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendSearchList, self.m_FriendSearchData)
        else
            if not Utils.isEmptyTable(self.m_FriendRecommendData) then
                for _,v in ipairs(self.m_FriendRecommendData) do 
                    if friend.uid == v.uid then 
                        table.removebyvalue(self.m_FriendRecommendData, v, false)
                    end
                end
                DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendSearchList, self.m_FriendRecommendData)
            end
        end

        if not Utils.isEmptyTable(self.m_RequestFriendData) then
            for _,v in ipairs(self.m_RequestFriendData) do 
                if v == friend.uid then 
                    table.removebyvalue(self.m_RequestFriendData, v, false)
                    break 
                end
            end
        end
    end
    DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendBlockList)
end


--请求移除黑名单
function M:requestCancleBlockFriend(uid)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_CancelBlockFriend, { friendUid = uid })
end
function M:S2C_CancelBlockFriend(data)
    if not data then return end 

    local ok = data.ok

    if ok then 
        if not Utils.isEmptyTable(self.m_FriendBlockData) then
            for _,v in ipairs(self.m_FriendBlockData) do 
                if data.friendUid == v.uid then 
                    table.removebyvalue(self.m_FriendBlockData, v, false)
                end
            end
        end
    end

    --DataManager:dispatchMessage(Constant.CustomEvent.OnClosePanelEvent)

    DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendBlockList, true)
    --DataManager:dispatchMessage(Constant.CustomEvent.RefreshBlockUI, data.friendUid)
end


--观战
function M:requestWatchFriend(uid,pwd)
    if g_GameData:getmUserstatus() == Enum.Userstatus.ShaibaoGaing then
        UIUtils.popToadtByMessageId(Constant.Define.IsShaibaoGaming)
        return
    end
    pwd=pwd or ""
    g_GameData:setPrivateFriendUID(uid)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_WatchingByFriends, { friendUid = uid,password=pwd })
end


--同意/拒绝好友请求
function M:requestAddFriendAgree(data)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_AddFriendAgree, { friendUid = data.uid, isAgree = data.isAgree })
end
function M:S2C_AddFriendAgree(data)
    if not data then return end 

    local isAgree = data.isAgree
    local friendData = data.friend
    local applyUid=data.applyUid
    if isAgree then 
        local friend = self:createFriend(friendData)
        table.insert(self.m_FriendListData, friend)
        g_ChatData:C2S_getFriendChatMsg(friend.uid)
        DataManager:dispatchMessage(Constant.CustomEvent.refreshChannelTableView)
        DataManager:dispatchMessage(Constant.CustomEvent.FriendListInitData)
        DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendList)
        DataManager:dispatchMessage(Constant.CustomEvent.refreshFriendList)
        DataManager:dispatchMessage(Constant.CustomEvent.UIGameLayer_AddFriend,{friend=friend,applyUid=applyUid})
        DataManager:dispatchMessage(Constant.CustomEvent.UIMainLayer_AddFriend,{friend=friend,applyUid=applyUid})
        if self:getIsSearchMode() then
            if not Utils.isEmptyTable(self.m_FriendSearchData) then
                for _,v in ipairs(self.m_FriendSearchData) do 
                    if friendData.uid == v.uid then 
                        v.status = Enum.FriendStatus.friend
                    end
                end
                DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendSearchList, self.m_FriendSearchData)
            end
        else
            if not Utils.isEmptyTable(self.m_FriendRecommendData) then
                for _,v in ipairs(self.m_FriendRecommendData) do 
                    if friendData.uid == v.uid then 
                        v.status = Enum.FriendStatus.friend
                    end
                end
                DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendSearchList, self.m_FriendRecommendData)
            end
        end
    else
        if not Utils.isEmptyTable(self.m_RequestFriendData) then
            for _,v in ipairs(self.m_RequestFriendData) do 
                if v == friendData.uid then 
                    table.removebyvalue(self.m_RequestFriendData, v, false)
                    break 
                end
            end
        end
        if self:getIsSearchMode() then
            if not Utils.isEmptyTable(self.m_FriendSearchData) then
                for _,v in ipairs(self.m_FriendSearchData) do 
                    if friendData.uid == v.uid then 
                        v.status = Enum.FriendStatus.none
                    end
                end
                DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendSearchList, self.m_FriendSearchData)
            end
        else
            if not Utils.isEmptyTable(self.m_FriendRecommendData) then
                for _,v in ipairs(self.m_FriendRecommendData) do 
                    if friendData.uid == v.uid then 
                        v.status = Enum.FriendStatus.none
                    end
                end
                DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendSearchList, self.m_FriendRecommendData)
            end
        end
    end

    -- if UIManager:getPanel("UIOtherPersonInfoLayer") or UIManager:getPanel("UIMagicEmojiPopUp") then 
        DataManager:dispatchMessage(Constant.CustomEvent.RefreshUserInfo)
    -- end

    if not Utils.isEmptyTable(self.m_FriendRequestData) then
        for _,v in ipairs(self.m_FriendRequestData) do 
            if friendData.uid == v.uid then 
                table.removebyvalue(self.m_FriendRequestData, v, false)
                DataManager:dispatchMessage(Constant.CustomEvent.requestRemoveFriend,{ friendUid = v.uid })
            end
        end
        self:showFriendHot()
    end

    DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendRequestList)
end
--全部同意/拒绝
function M:requestAddFriendAgreeAll(isAgree)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_AddFriendAgreeAll, { isAgree = isAgree })
end

function M:S2C_updateUnreadMsgNum(data)
    local   unReadMsgNum=data.unReadMsgNum
    local   friendUid=data.friendUid
    local   friend=self:getFriendDataByUid(friendUid)
    if friend then
        friend.unReadMsgNum=unReadMsgNum

        DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateChatTip)
        DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateChatList, {isRefreshText = false, isNeedPlaySound = false})
        DataManager:dispatchMessage(Constant.CustomEvent.UIFriendItem_refreshHot)
        DataManager:dispatchMessage(Constant.CustomEvent.UIChannelCell_refreshHot)
        DataManager:dispatchMessage(Constant.CustomEvent.UIGameLayer_refreshHot)
        g_ChatData:showChatHot()
        g_FriendData:showFriendHot()
    else
        Log.info("S2C_updateUnreadMsgNum not friend",friendUid)
    end
end

function M:S2C_GetRequestFriendData(data)
    if not data then return end 
    
    self.m_RequestFriendData = {}
    local list = data.uids 
    if not Utils.isEmptyTable(list) then 
        for _,v in ipairs(list) do 
            table.insert(self.m_RequestFriendData, v)
        end
    end
end
--好友状态通知
function M:S2C_friendNetStatus(data)
    local   friendUid=data.friendUid
    local   friend=self:getFriendDataByUid(friendUid)
    if friend then
        if data.onlineState then
            friend.onlineState=data.onlineState
        end
        if data.nickname then
            friend.nickname = data.nickname
        end
        if data.sex then
            friend.sex = data.sex 
        end
        if data.avatar then
            friend.avatar = data.avatar
        end
        if data.isSystemAvatar then
            friend.isSystemAvatar = data.isSystemAvatar
        end
        if data.avatarFrame then
            friend.avatarFrame = data.avatarFrame
        end
        if data.vipLevel then
            friend.vipLevel = data.vipLevel
        end
        if data.fansNum then
            friend.fansNum = data.fansNum
        end
        if data.slogan then
            friend.slogan = data.slogan
        end
        if data.gold then
            friend.gold=data.gold
        end
        if data.roomConfigId then
            friend.roomID=data.roomConfigId
        end
        
        self:updateOnlineType(friend)
        DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendList)
        DataManager:dispatchMessage(Constant.CustomEvent.FriendListRefreshData,{friend=friend})
        DataManager:dispatchMessage(Constant.CustomEvent.refreshChannelTableView)
    else
        Log.info("not find friend",friendUid)
    end
end

function M:S2C_friendGoldUpdate(data)
    local   uid=data.uid
    local   friend=self:getFriendDataByUid(uid)
    if friend then
        if data.gold then
            friend.gold=data.gold
        end
        
        DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendList)
        DataManager:dispatchMessage(Constant.CustomEvent.FriendListRefreshData,{friend=friend})
    else
        Log.info("not find friend",uid)
    end
end

function M:S2C_friendInfoUpdate(data)
    local   uid=data.uid
    local   friend=self:getFriendDataByUid(uid)
    if friend then
        if data.nickname then
            friend.nickname = data.nickname
        end
        if data.sex then
            friend.sex = data.sex 
        end
        if data.avatar then
            friend.avatar = data.avatar
        end
        if data.isSystemAvatar then
            friend.isSystemAvatar = data.isSystemAvatar
        end
        if data.avatarFrame then
            friend.avatarFrame = data.avatarFrame
        end
        if data.vipLevel then
            friend.vipLevel = data.vipLevel
        end
        if data.fansNum then
            friend.fansNum = data.fansNum
        end
        if data.slogan then
            friend.slogan = data.slogan
        end
        
        DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateFriendList)
        DataManager:dispatchMessage(Constant.CustomEvent.FriendListRefreshData,{friend=friend})
    else
        Log.info("not find friend",uid)
    end
end

function M:S2C_friendAddRequestBroadcast(data)
    local fromUid=data.fromUid
    local toUid=data.toUid
    DataManager:dispatchMessage(Constant.CustomEvent.UIGameLayer_S2C_friendAddRequestBroadcast,{fromUid=fromUid,toUid=toUid})
end

function M:S2C_friendAddAgreeBroadcast(data)
    local fromUid=data.fromUid
    local toUid=data.toUid
    local isAgree=data.isAgree
    DataManager:dispatchMessage(Constant.CustomEvent.UIGameLayer_S2C_friendAddAgreeBroadcast,{fromUid=fromUid,toUid=toUid,isAgree=isAgree})
end

return M    