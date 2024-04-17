local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIChatCell", UIPanel)

M.ITEM_COLUMN = 1

M.CELL_WIDTH = 681
M.CELL_HEIGHT = 185

M.GUI_FILE_NAME = "csd.04_01_Chat.04_01_ChatCell.lua"

M.BINDGUIDATANODE = {
   ["ChatNode"] = { varname = "ChatNode" },
   ["HeadIcon"] = { varname = "HeadIcon" },

   ["NameText_O"] = { varname = "NameText" },
   ["SexIcon"] = { varname = "SexIcon" },
   ["VipIcon"] = { varname = "VipImage" },

   ["Time"] = { varname = "Time" },
   ["TimeNum"] = { varname = "TimeNum" },

   ["Content"] = { varname = "Content" },
   ["ContentText_S"] = { varname = "ContentText" },
   ["ContentBg"] = { varname = "ContentBg",onEvent="onChatEvent"},

   ["ExpressionImage"] = { varname = "ExpressionImage" },
   ["HeadFrame"]={varname="HeadFrame",onClick="clickHeadEvent"}
}

function M:onChatEvent(data)
    if data.event =="end" then
        Utils.copyToClipboard(self.ContentText:getString())
        UIUtils.popToadtByMessageId("1100032")
    end
end

function M:clickHeadEvent()
    if not self.mFriendInfo then return end
    local panel = UIManager:getOrCreatePanel("UIOtherPersonInfoLayer")
    if panel then 
        panel:setFriendInfo(self.mFriendInfo)
        panel:showToScene()
    end
end

function M:onCreate()
    M.super.onCreate(self)
    local label=self.ContentText:getVirtualRenderer()
    label:setLineSpacing(0)
    label:setAdditionalKerning(3)
    
    self:resetRootNodePosition(cc.p(0, 0))
    self:resetRootNodeAnchorPoint(cc.p(0, 0))

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.Head))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.HeadBox))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.VipIconTail))
    self.ContentText:setAnchorPoint(cc.p(0.5,0.5))
    self.ContentText:setPosition(cc.p(243,32))
    self.ContentText:setTextHorizontalAlignment(cc.TEXT_ALIGNMENT_LEFT)
    self.realWidth=M.CELL_WIDTH
    self.realHeight=M.CELL_HEIGHT

    self.ContentBg:setTouchEnabled(true)
end

function M:activeHeadEvent()
    self.HeadFrame:setTouchEnabled(true)
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:getRealSize()
    return cc.size(self.realWidth,self.realHeight)
end

function M:refreshData(data, idx,type)

    if 1==type then
        self.NameText:setColor(cc.c4b(255,255,255,255))
    else
        self.NameText:setColor(cc.c4b(255,255,255,255))
    end

    local chatData = data[idx]
    
    if not chatData then return end
    if false==chatData.isRead and chatData.messageId then
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
        self.ChatNode:setPosition(cc.p(0,-5))
    else
        self.ExpressionImage:setVisible(false)
        self.Content:setVisible(true)
        self.ContentText:setString(txt)
        local renderSize=self.ContentText:getVirtualRendererSize()
        local width=renderSize.width
        local _height=math.floor(width/470)
        local _h=32

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
            self.ChatNode:setPosition(cc.p(0,_h*_height-_h+addH))
        else
            self.ChatNode:setPosition(cc.p(0,-5))
        end
    end

    local friend = chatData.userInfo

    if not friend then return end

    self.mFriendInfo = require("app.bean.FriendInfo").new(friend)

    if not self.mFriendInfo then return end

    self.NameText:setString(self.mFriendInfo:getNickName())
    
    self.HeadIcon:removeAllChildren()
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    avater:InitTexture(string.utf8len(self.mFriendInfo:getAvatar())<7,self.mFriendInfo:getAvatar(),self.mFriendInfo:getFriendUid())
    self.HeadIcon:addChild(avater)
    self.HeadFrame:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(self.mFriendInfo:getAvatarFrame())), ccui.TextureResType.plistType)
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

    Utils.showFormatVip(self.NameText, self.VipImage, self.SexIcon)

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