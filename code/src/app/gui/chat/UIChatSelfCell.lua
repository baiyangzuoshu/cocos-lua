local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIChatSelfCell", UIPanel)

M.ITEM_COLUMN = 1

M.CELL_WIDTH = 681
M.CELL_HEIGHT = 185

M.GUI_FILE_NAME = "csd.04_01_Chat.04_01_ChatPlayerCell.lua"

M.BINDGUIDATANODE = {
   ["HeadFrame"] = { varname = "HeadFrame" },
   ["HeadIcon"] = { varname = "HeadIcon" },

   ["NameText"] = { varname = "NameText" },
   ["SexIcon"] = { varname = "SexIcon" },
   ["VipIcon"] = { varname = "VipImage" },

   ["Time"] = { varname = "Time" },
   ["TimeNum"] = { varname = "TimeNum" },

   ["Content"] = { varname = "Content" },
   ["ContentText_S"] = { varname = "ContentText" },

   ["ContentBg"] = { varname = "ContentBg",onEvent="onChatEvent"},

   ["ContentErrorButton"] = { varname = "reSendBtn", onClick = "onClickPxBtn"},

   ["ExpressionImage"] = { varname = "ExpressionImage" },
   ["ChatPlayerCell"]={varname="ChatPlayerCell"},
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

function M:onChatEvent(data)
    if data.event =="end" then
        Utils.copyToClipboard(self.ContentText:getString())
        UIUtils.popToadtByMessageId("1100032")
    end
end

function M:onCreate()
    M.super.onCreate(self)
    
    self:resetRootNodePosition(cc.p(0, 0))
    self:resetRootNodeAnchorPoint(cc.p(0, 0))
    local label=self.ContentText:getVirtualRenderer()
    label:setLineSpacing(0)
    label:setAdditionalKerning(3)

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.Head))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.HeadBox))
    self.ContentText:setAnchorPoint(cc.p(0.5,0.5))
    self.ContentText:setPosition(cc.p(138,62))
    self.ContentText:setTextHorizontalAlignment(cc.TEXT_ALIGNMENT_LEFT)
    self.reSendBtn:setVisible(false)

    self.realWidth=M.CELL_WIDTH
    self.realHeight=M.CELL_HEIGHT

    self.ContentBg:setTouchEnabled(true)
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:getRealSize()
    return cc.size(self.realWidth,self.realHeight)
end

function M:refreshData(data, idx,type)
    local chatData = data[idx]
    
    if not chatData then return end

    if false== chatData.isRead and chatData.messageId then
        g_ChatData:C2S_readFriendChatMsgAll(chatData.uid)
    end
    Preference:setString("WorldChatSessageId",chatData.messageId)

    chatData.isRead = true
    g_ChatData:showChatHot()
    g_FriendData:showFriendHot()
    DataManager:dispatchMessage(Constant.CustomEvent.OnUpdateChatTip)
    DataManager:dispatchMessage(Constant.CustomEvent.UIFriendItem_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.UIGameLayer_refreshHot)
    local   txt=Utils.transformProhibitWord(chatData.content)
    local startPos,endPos=string.find(txt, "Emoji", 1)
    if startPos~=nil and endPos~=nil then
        self.Content:setVisible(false)
        self.ExpressionImage:setVisible(true)
        local   ItemIcon=string.sub(txt,endPos+1,string.len(txt))
        self.ExpressionImage:loadTexture(Utils.getIconStr(PlistConfig.Icon.ChatEmoji, ItemIcon), ccui.TextureResType.plistType)
        self.ChatPlayerCell:setPosition(cc.p(0,-5))
    else
        self.ExpressionImage:setVisible(false)
        self.Content:setVisible(true)
        self.ContentText:setString(txt)

        local _h=32
        local renderSize=self.ContentText:getVirtualRendererSize()
        local width=renderSize.width
        local _height=math.floor(width/470)
        local height=_h+_h*_height
        if width>470 then
            width=470
        end
        local addW=22*2
        local addH=15*2
        self.ContentText:setContentSize(cc.size(width,height))
        self.ContentBg:setContentSize(cc.size(width+addW,height+addH))
        self.ContentText:setPosition(cc.p(width/2+addW/2+5/2,height/2+addH/2))
        if height>60 then
            self.realHeight=M.CELL_HEIGHT+(_h*_height-_h+addH)
            self.ChatPlayerCell:setPosition(cc.p(0,_h*_height-_h+addH))
        else
            self.ChatPlayerCell:setPosition(cc.p(0,-5))
        end

    end
    local   data={}
    data.uid=g_UserData:getUserId()
    data.nickname=g_UserData:getNickName()
    data.sex=g_UserData:getSex()
    data.onlineState=0
    data.isSystemAvatar=g_UserData:getIsSystemHead()
    data.slogan=g_UserData:getSlogan()
    data.vipLevel=g_UserData:getVipLevel()
    data.fansNum=g_UserData:getMyFansNum()
    data.avatarFrame=g_UserData:getHeadBox()
    data.avatar=g_UserData:getHead()
    local   friendInfo= require("app.bean.FriendInfo").new(data)
    self.mFriendInfo=friendInfo
    self.HeadIcon:removeAllChildren()
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    avater:InitTexture(string.utf8len(self.mFriendInfo:getAvatar())<7,self.mFriendInfo:getAvatar(),self.mFriendInfo:getFriendUid())
    self.HeadIcon:addChild(avater)

    self.HeadFrame:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(g_UserData:getHeadBox())), ccui.TextureResType.plistType)
    self.sendTime=chatData.sendAt
    self:showtime(chatData.sendAt)
end

function M:refreshTime()
    self:showtime(self.sendTime)
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
        self.TimeNum:setString(timeStr)
    else
        self.Time:setVisible(false)
    end
end

function M:onCleanup()
    M.super.onCleanup(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
end

return M