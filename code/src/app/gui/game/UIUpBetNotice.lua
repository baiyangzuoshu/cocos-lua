local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIUpBetNotice", UIPanel)

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_ReplaceBottomInjection.lua"

M.BINDGUIDATANODE = {
    ["Text_1_TT"] = {varname="Text_1_TT"},
    ["GoldNumber_3"]={varname="GoldNumber_3"},
    ["NameText_3_O"] = {varname="NameText_3"},
    ["Head_4"] = {varname="Head_4"},
    ["HeadFrame_4"] = {varname="HeadFrame_4"},
    ["AgreeButton"]={varname="AgreeButton",onClick="onClickAgree"},
    ["RefuseButton"]={varname="RefuseButton",onClick="onClickRefuse"},
    ["HeadPanel_4"]={varname="HeadPanel",onClick="onClickEvent"}

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

function M:onCreate()
    M.super.onCreate(self)
    self.mCountTime = 1000
    self.mCallBackFunc = nil
    self.isRemove = false
    self.Head_4:setScale(0.64)
    self.HeadFrame_4:setScale(0.64)

end


function M:setBaseData(seatId,betBase,leftTime)
    self.GoldNumber_3:setString(Utils.getFormatNumber_MuitiLanguage(betBase))
    local players = g_GameData:getGamePlayers()

    local itemData = players[seatId]
    if itemData then
        local friendData={}
        friendData.uid = itemData:getUserInfo():getUserId()
        friendData.nickname = itemData:getUserInfo():getNickName()
        friendData.sex = itemData:getUserInfo():getSex()
        friendData.avatar = itemData:getUserInfo():getHead()
        friendData.vipLevel = itemData:getUserInfo():getVipLevel()
        friendData.mAvatarFrame = itemData:getUserInfo():getHeadBox()

        local friendInfo = require("app.bean.FriendInfo").new(friendData)
        self.mFriendInfo=friendInfo

        self.mCountTime = leftTime/1000
        self.NameText_3:setString(tostring(itemData:getUserInfo():getNickName()))
        self.Text_1_TT:setPositionX(self.NameText_3:getPositionX()+self.NameText_3:getContentSize().width)
        
        self.Head_4:removeAllChildren()
        local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
        avater:InitTexture(string.utf8len(itemData:getUserInfo():getHead())<7,itemData:getUserInfo():getHead(),itemData:getUserInfo():getUserId())
        self.Head_4:addChild(avater)

        self.HeadFrame_4:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(itemData:getUserInfo():getHeadBox())), ccui.TextureResType.plistType)
    end
end

function M:getCountTime()
    return self.mCountTime
end
function M:setContTime(value)
    self.mCountTime = value
end

function M:setHandleCallback(callback)
    self.mCallBackFunc = callback
end

function M:onClickAgree(ref)
    if self.mCallBackFunc then
        self.mCallBackFunc(true)
    end
end
function M:onClickRefuse(ref)
    if self.mCallBackFunc then
        self.mCallBackFunc(false)
    end
end

return M