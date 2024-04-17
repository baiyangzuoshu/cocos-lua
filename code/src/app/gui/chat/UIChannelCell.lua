local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIChannelCell", UIPanel)

M.ITEM_COLUMN = 1

M.CELL_WIDTH = 490
M.CELL_HEIGHT = 125

M.GUI_FILE_NAME = "csd.04_01_Chat.04_01_ChatChannelCell.lua"

M.BINDGUIDATANODE = {
   ["HeadFrame"] = { varname = "HeadFrame" },
   ["HeadIcon"] = { varname = "HeadIcon" },

   ["NameText_O"] = { varname = "NameText" },
   ["VipIcon"] = { varname = "VipImage" },

   ["DefaultHeadIcon"] = { varname = "DefaultHeadIcon" },

   ["TipDotIcon"] = { varname = "TipIcon" },
   ["TipDotNum"] = { varname = "TipNum" },

   ["ContentText_S"] = { varname = "ContentText" },
    ["ContentImage"]={varname="ContentImage"},
    ["ContentImageNode"]={varname="ContentImageNode"},
    ["ContentImageText_S"]={varname="ContentImageText_S"},
   ["TimeText_TT"] = { varname = "Time" },
   ["Channel"] = { varname = "Main" },

   ["ChannelPanel"] = { varname = "ChannelPanel", onEvent = "onChannelTouchEvent" },
}

local   MAX_SIZE=3*12

function M:onCreate()
    M.super.onCreate(self)

    self:resetRootNodePosition(cc.p(0, 0))
    self:resetRootNodeAnchorPoint(cc.p(0, 0))

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.Head))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.HeadBox))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.VipIcon))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.VipIconTail))

    self.ChannelPanel:setSwallowTouches(false)
end

function M:refreshHot()
    local   num=0
    
    if self.channelId == Enum.ChatChannel.room then
        num=g_ChatData:getUnReadMessageByRoom()
    elseif self.channelId == Enum.ChatChannel.world then
        num=g_ChatData:getUnReadMessageByRoom()
    else
        num=g_FriendData:getFriendUnReadMsgNumByUid(self.channelId)
    end

    if 0==num then
        self.TipIcon:setVisible(false)
    else
        self.TipIcon:setVisible(true)
    end
    self.TipNum:setString(tostring(num))
    
    self:refreshChat()
end

function M:refreshChat()
    local data=self.data
    if self.channelId == Enum.ChatChannel.room then
        self:showRoomChannel(data.allChat,Enum.ChatChannel.room)
    elseif self.channelId == Enum.ChatChannel.world then
        self:showRoomChannel(data.allChat,Enum.ChatChannel.world)
    else
        self:showFriendChannel(data)
    end
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:refreshData(channelData, index, friendInfo)
    local data = channelData[index]

    if not data then return end

    self.channelId=data.channelId
    self.data=data
    self.index=index
    self:refreshHot()
end

function M:getCheckContent(content)
    self.ContentImageText_S:setVisible(false)
    local   txt=Utils.transformProhibitWord(content)
    local startPos,endPos=string.find(txt, "Emoji", 1)
    if startPos~=nil and endPos~=nil then
        self.ContentText:setVisible(false)
        self.ContentImageNode:setVisible(true)
        local   ItemIcon=string.sub(txt,endPos+1,string.len(txt))
        self.ContentImage:loadTexture(Utils.getIconStr(PlistConfig.Icon.ChatEmoji, ItemIcon), ccui.TextureResType.plistType)
    else
        self.ContentText:setVisible(true)
        self.ContentImageNode:setVisible(false)
        startPos,endPos=string.find(txt, Enum.ChatText.RoomDefault, 1)
        if startPos~=nil and endPos~=nil then
            txt=""
        end
        if string.len(txt)>MAX_SIZE then
            txt=string.sub(txt,1,MAX_SIZE).."......"
        end
        self.ContentText:setString(txt)
    end
    
    return txt
end

function M:getCheckContentByRoom(data)
    if nil==data then
        self.ContentText:setVisible(true)
        self.ContentImageNode:setVisible(false)
        self.ContentText:setString("")
    else
        local content=data.content
        local   txt=Utils.transformProhibitWord(content)
        local startPos,endPos=string.find(txt, "Emoji", 1)
        if startPos~=nil and endPos~=nil then
            self.ContentText:setVisible(false)
            self.ContentImageNode:setVisible(true)
            local   ItemIcon=string.sub(txt,endPos+1,string.len(txt))
            self.ContentImage:loadTexture(Utils.getIconStr(PlistConfig.Icon.ChatEmoji, ItemIcon), ccui.TextureResType.plistType)
            if not data.isSelf then
                self.ContentImageText_S:setString(data.userInfo.nickname..":")
                local size=self.ContentImageText_S:getVirtualRendererSize()
                self.ContentImage:setPositionX(size.width)
            else
                self.ContentImage:setPositionX(0)
            end
            self.ContentImageText_S:setVisible(not data.isSelf)
        else
            self.ContentText:setVisible(true)
            self.ContentImageNode:setVisible(false)
            if not data.isSelf then
                txt=data.userInfo.nickname..":"..txt
            end
            local len,count=self:parseStringData(txt)
            if len>=MAX_SIZE then
                txt=string.sub(txt,1,count-1)..'......'
            end
            self.ContentText:setString(txt)
        end
    end
end

function M:parseStringData(inputstr)
    if not inputstr or type(inputstr) ~= "string" or #inputstr <= 0 then
        return nil
    end
    local length = 0  -- 字符的个数
    local i = 1
    while true do
        local curByte = string.byte(inputstr, i)
        local byteCount = 1
        if curByte > 239 then
            byteCount = 4  -- 4字节字符
            length = length + byteCount
        elseif curByte > 223 then
            byteCount = 3  -- 汉字
            length = length + byteCount
        elseif curByte > 128 then
            byteCount = 2  -- 双字节字符
            length = length + byteCount
        else
            byteCount = 1  -- 单字节字符
            length = length + 2
        end
        i = i + byteCount
        
        if i > #inputstr or length>=MAX_SIZE then
            break
        end
    end
    return length,i
end

function M:showRoomChannel(roomData,channelId)
    self.type=channelId
    local  data={}
    for _,v in ipairs(roomData) do
        if v.content~=Enum.ChatText.RoomDefault then
            table.insert(data,v)
        end
    end
    local   showData=data[#data]

    if nil==showData then 
        if Enum.ChatChannel.room==channelId then
            self.NameText:setString(g_GameData:getChatRoomName())
        else
            self.NameText:setString(GSystem.DiceBabyChatRoomName)
        end
        self.VipImage:setVisible(false)
        self:showtime(g_UserData:calcServerTimestamp())
        self:getCheckContentByRoom(showData)
        return
    end

    self:showtime(showData.sendAt)
    self:getCheckContentByRoom(showData)

    local   userInfo=showData.userInfo
    local   data={}
    if showData.isSelf then
        data.uid=userInfo:getUserId()
        data.nickname=userInfo:getNickName()
        data.sex=userInfo:getSex()
        data.onlineState=Enum.OnlineState.Idle
        data.isSystemAvatar=userInfo:getIsSystemHead()
        data.slogan=userInfo:getSlogan()
        data.vipLevel=userInfo:getVipLevel()
        data.fansNum=userInfo:getMyFansNum()
        data.avatarFrame=userInfo:getHeadBox()
        data.avatar=userInfo:getHead()
    else
        data=userInfo
        data.onlineState=Enum.OnlineState.Idle
    end
    
    local   friendInfo= require("app.bean.FriendInfo").new(data)

    self.mDataInfo=friendInfo
    self:showFriendInfo(friendInfo)
    self.Main:setOpacity(255*1)
    if Enum.ChatChannel.room==channelId then
        self.NameText:setString(g_GameData:getChatRoomName())
    else
        self.NameText:setString(GSystem.DiceBabyChatRoomName)
    end
    self.DefaultHeadIcon:setVisible(true)
    self.HeadIcon:setVisible(false)
    self.VipImage:setVisible(false)
    self.DefaultHeadIcon:loadTexture(string.format("00_01_Common/%s.png",GSystem.MatchChatChannelHead),ccui.TextureResType.plistType)
end

function M:showFriendChannel(data)
    self.type=Enum.ChatChannel.friend

    local   friendChat=g_ChatData:getFriendChatDataByUid(self.channelId)
    if 0==#friendChat then
        return
    end

    local   showData=friendChat[#friendChat]
    local   uid=showData.uid

    self:showtime(showData.sendAt)
    self:getCheckContent(showData.content)

    local   data=g_FriendData:getFriendDataByUid(uid)
    local   friendInfo= require("app.bean.FriendInfo").new(data)

    self.mDataInfo=friendInfo
    self:showFriendInfo(friendInfo)
end

function M:showFriendInfo(friendInfo)
    self.DefaultHeadIcon:setVisible(false)
    self.HeadIcon:setVisible(true)
    self.HeadFrame:setVisible(true)
    
    self.mFriendInfo=friendInfo
    self.HeadIcon:removeAllChildren()
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    avater:InitTexture(string.utf8len(self.mFriendInfo:getAvatar())<7,self.mFriendInfo:getAvatar(),self.mFriendInfo:getFriendUid())
    self.HeadIcon:addChild(avater)

    self.HeadFrame:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(friendInfo:getAvatarFrame())), ccui.TextureResType.plistType)
    self.NameText:setString(friendInfo:getNickName())
    
    local OnlineState = friendInfo:getOnlineState()
    if Enum.OnlineState.Offline==OnlineState then
        self.Main:setOpacity(255*0.4)
    else
        self.Main:setOpacity(255*1)
    end

    local vipLevel = friendInfo:getVipLevel()
    if vipLevel <= 0 then 
        self.VipImage:setVisible(false)
    else
        self.VipImage:setVisible(true)
        local vipData = DataManager:getTbxData("Vip", vipLevel)
        if g_UserData:isSelfUserId(friendInfo:getFriendUid()) then
            vipLevel = g_UserData:getVipLevel()
            vipData = DataManager:getTbxData("Vip", vipLevel)
        end
        if vipData then 
            self.VipImage:loadTexture(Utils.getIconStr(PlistConfig.Icon.VipIconTail, vipData.VipIcon), ccui.TextureResType.plistType)
        end
    end

    Utils.showFormatVip(self.NameText, self.VipImage)
end

function M:showtime(unixTime)
    local timeStr = ""
    local nowTime = Utils.getFormatNowUnixTimeToDate()
    local sendTime = Utils.getFormatUnixTimeToDate(unixTime)
    if tonumber(nowTime.year) == tonumber(sendTime.year) then 
        local dayDiff = tonumber(nowTime.dayAtYear) - tonumber(sendTime.dayAtYear)
        if dayDiff > 7 then 
            --显示几月几日
            timeStr = Utils.showFormatText(Enum.Text.Date, tostring(sendTime.month)..";"..tostring(sendTime.day))
        elseif dayDiff <=7 and dayDiff > 1 then 
            --显示星期几
            local textData = DataManager:getTbxData("Text", Utils.getWeekByUnixTime(unixTime))
            if textData then 
                timeStr = textData.Desc
            end 
        elseif dayDiff == 1 then 
            --显示昨天
            local hour = tonumber(sendTime.hour)
            local textData = DataManager:getTbxData("Text", Enum.Text.YesterdayMoring)
            
            if hour <=12 then
                timeStr = textData.Desc
            else
                timeStr = textData.Desc
            end
        elseif dayDiff < 1 then 
            local hourDiff = tonumber(nowTime.hour) - tonumber(sendTime.hour)
            local minuteDiff = tonumber(nowTime.minute) - tonumber(sendTime.minute)
            local minuteTotal=hourDiff*60+minuteDiff
            if minuteTotal >= 60 then 
                local hour = tonumber(sendTime.hour)
                if hour <=12 then 
                    --显示今天上午
                    timeStr = Utils.showFormatText(Enum.Text.TodayMoring, Utils.getDateByUnixTime(unixTime))
                else
                    timeStr = Utils.showFormatText(Enum.Text.TodayAfternoon, Utils.getDateByUnixTime(unixTime))
                end
            else
                if minuteTotal > 5 then 
                    --几分钟前
                    timeStr = Utils.showFormatText(Enum.Text.MinuteBefore, minuteTotal)
                else
                    --显示刚刚
                    local textData = DataManager:getTbxData("Text", Enum.Text.Just)
                    if textData then 
                        timeStr = textData.Desc
                    end 
                end
            end
        end
    end
    
    self.Time:setVisible(true)
    if not Utils.isEmptyStr(timeStr) then 
        self.Time:setString(timeStr)
    else
        self.Time:setVisible(false)
    end
end

function M:getData()
    return self.mDataInfo
end

function M:getType()
    return self.type
end

function M:setTouchCallBack(cb)
    self.mTouchCallBack = cb
end

function M:onChannelTouchEvent(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        if self.mTouchCallBack then
            self:mTouchCallBack()
        end
    end
end

function M:onCleanup()
    M.super.onCleanup(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.UIChannelCell_refreshHot, "refreshHot")
end

return M