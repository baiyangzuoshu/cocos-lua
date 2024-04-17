local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIGuessingResultHeadCell", UIPanel)

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_GuessingHeadLayer.lua"

M.BINDGUIDATANODE = {
    ["GuessingHeadBg"]={varname="GuessingHeadBg"},
    ["GuessingHeadPlayersMark_SVT"]={varname="GuessingHeadPlayersMark"},
    ["GuessingHead"]={varname="HeadIcon"},
    ["HeadBg_1"] = {varname="TextNode"},
    ["GuessingNum"]={varname="GuessingNumText"},
    ["FlyGoldNode"]={varname="FlyGoldNode"},
    ["GuessingHeadPanel"]={varname="GuessingHeadPanel",onClick="onClickEvent"}
}

function M:onClickEvent(ref)
    SoundSystemManager:playSound004()
    if self.leftFriendInfo:getFriendUid() == g_UserData:getUserId() then
        local panel = UIManager:getOrCreatePanel("UIPersonalInfoLayer")
        if panel then
            panel:showToScene()
        end
    else
        local panel = UIManager:getOrCreatePanel("UIOtherPersonInfoLayer")
        if panel then 
            panel:setFriendInfo(self.leftFriendInfo)
            panel:showToScene()
        end
    end
end

function M:onCreate()
    M.super.onCreate(self)

    self.bIsMe = false
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.Head))
end

function M:onInit()
    M.super.onInit(self)
    self.GuessingNum = 0
end

function M:initData(uid,avatar,GuessingNum)
    local friendData={}
    friendData.uid = uid
    friendData.nickname = ""
    friendData.avatar = avatar
    friendData.vipLevel = 0
    friendData.mAvatarFrame = 1

    local friendInfo = require("app.bean.FriendInfo").new(friendData)
    self.leftFriendInfo=friendInfo

    self.HeadIcon:removeAllChildren()
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")

    avater:InitTexture(string.utf8len(avatar)<7,avatar,uid)
    self.HeadIcon:addChild(avater)
   
    self.GuessingNum = GuessingNum
    if GuessingNum<0 then
        self.GuessingNumText:setTextColor(cc.c3b(255,255,255))
        self.GuessingNumText:setString("-"..Utils.getFormatNumber_MuitiLanguage(-self.GuessingNum))
        self.GuessingNumText:setOpacity(0)
        self.GuessingNumText:runAction(cc.Sequence:create(cc.FadeIn:create(0.5)))
    else
        self.GuessingNumText:setTextColor(cc.c3b(252,255,0))
        self.TextNode:setVisible(false)
    end

    if g_UserData:isSelfUserId(uid) then
        self.bIsMe = true
        self:refreshEffect()
    else
        -- self._rootNode:setScale(0.64)
    end

    self.GuessingHeadBg:setVisible(self.bIsMe)
    self.GuessingHeadPlayersMark:setVisible(self.bIsMe)
    return true
end

function M:refreshEffect()
    self:runTimelineAnimation("PlayersAnimation",true)
end

function M:showGoldNumAni(goldchgtime)
    self.TextNode:setVisible(true)
    local chgtimes = math.ceil(goldchgtime/0.1)
    local act = {}
    for i=1,chgtimes do
        act[#act+1] = cc.CallFunc:create(function ()
            self.GuessingNumText:setString("+"..Utils.getFormatNumber_MuitiLanguage(math.floor(self.GuessingNum*i/chgtimes)))
        end)
        if i<chgtimes then
            act[#act+1] = cc.DelayTime:create(0.1)
        end
    end
    self.GuessingNumText:runAction(cc.Sequence:create(act))
end

function M:isMe()
    return self.bIsMe
end

function M:getHeadWorldPosition()
    return Utils.getNodeWordPosition(self.HeadIcon)
end

function M:getGoldWorldPosition()
    return Utils.getNodeWordPosition(self.FlyGoldNode)
end

return M