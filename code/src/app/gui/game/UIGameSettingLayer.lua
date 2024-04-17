local AvatarWidget = require("app.gui.widget.AvatarWidget")

local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIGameSettingLayer", UIPanel)

M.GUI_FILE_NAME = "csd.1_basic.1_02_set.1_02_3_FightSetLayerLayer.lua"

M.BINDGUIDATANODE = {
    -- 离开房间按钮
    ["LeaveButton"] = { varname = "LeaveButton", onClick = "onLeaveButtonClick" },
    -- 关闭按钮
    ["ExitButton"] = { onClick = "onCloseButtonClick" },

    -- 登出按钮
    ["LogOutButton"] = { onClick = "onLogoutButtonClick" },

    ["IDNum"] = { varname = "IDText" },
    ["HeadPortraitNode"] = { varname = "AvatarNode" },
    ["HeadPortraitPanel"] = { varname = "AvatarTouchPanel", onTouch = "onAvatarPanelTouchEvent" },
    ["OneselfName"] = { varname = "NicknameText" },

    ["EditNameButton"] = { varname = "EditNameButton", onClick = "onEditNameButtonClick" },
    ["HeadSetButton"] = { onClick = "onHeadSetButtonClick" },

    -- 音乐设置按钮
    ["MusicPanel"] = { varname = "MusicPanel", onTouch = "onSystemSwitchTouchEvent" },
    ["OpenNode_1"] = { varname = "MusicOpenNode" },
    ["CloseNode_1"] = { varname = "MusicCloseNode" },

    -- 音效设置按钮
    ["SoundPanel"] = { varname = "SoundPanel", onTouch = "onSystemSwitchTouchEvent" },
    ["OpenNode_2"] = { varname = "SoundOpenNode" },
    ["CloseNode_2"] = { varname = "SoundCloseNode" },

    -- 震动设置按钮
    ["ShakePanel"] = { varname = "ShakePanel", onTouch = "onSystemSwitchTouchEvent" },
    ["OpenNode_3"] = { varname = "ShakeOpenNode" },
    ["CloseNode_3"] = { varname = "ShakeCloseNode" },

    -- 联系客服按钮
    ["NotescontactButton"] = { onClick = "onContactUsButtonClick" },

    -- 帮助按钮
    ["GameHelpButton"] = { onClick = "onGameHelpButtonClick" },

    -- 用户协议
    ["CheckTextPanel_1"] = { onTouch = "onUserAgreementTouchEvent" },
    -- 隐私政策
    ["CheckTextPanel_2"] = { onTouch = "onPrivacyPolicyTouchEvent" },

}

local SystemSettings = {
    MUSIC_SWITCH = 1,
    SOUND_SWITCH = 2,
    SHAKE_SWITCH = 3,
}

function M:createSwitchData(tag, touch, open, close, key)
    touch:setTag(tag)
    return { touch = touch, open = open, close = close, state = Preference:getBool(key, true), key = key }
end

function M:onCreate()
    M.super.onCreate(self)

    self:setShadeShowModel(true)

    self.mAvatar = AvatarWidget.new()
    self.mAvatar:setStyle(AvatarWidget.Style.GameMine)
    self.AvatarNode:addChild(self.mAvatar)

    self.mSwitchs = {}
    self.mSwitchs[SystemSettings.MUSIC_SWITCH] = self:createSwitchData(SystemSettings.MUSIC_SWITCH, self.MusicPanel, self.MusicOpenNode, self.MusicCloseNode, Constant.PreferenceKey.MUSIC_SWITCH)
    self.mSwitchs[SystemSettings.SOUND_SWITCH] = self:createSwitchData(SystemSettings.SOUND_SWITCH, self.SoundPanel, self.SoundOpenNode, self.SoundCloseNode, Constant.PreferenceKey.SOUND_SWITCH)
    self.mSwitchs[SystemSettings.SHAKE_SWITCH] = self:createSwitchData(SystemSettings.SHAKE_SWITCH, self.ShakePanel, self.ShakeOpenNode, self.ShakeCloseNode, Constant.PreferenceKey.SHAKE_SWITCH)
end


function M:onEnter()
    M.super.onEnter(self)

    for _, v in pairs(self.mSwitchs) do
        v.state = Preference:getBool(v.key, true)

        v.open:setVisible(v.state)
        v.close:setVisible(not v.state)
    end

    self.IDText:setString(string.format("ID:%s", g_UserData:getUserId()))
    self.NicknameText:setString(g_UserData:getNickName())
    self.mAvatar:setUserIdAndUrl(g_UserData:getUserId(), g_UserData:getHead())

    self.EditNameButton:setPositionX(self.NicknameText:getPositionX() + self.NicknameText:getContentSize().width)
end

function M:setLeaveButtonVisible(visible)
    self.LeaveButton:setVisible(visible)
end

function M:saveToLocal()
    for _, v in pairs(self.mSwitchs) do
        Preference:setBool(v.key, v.state)
    end
end

function M:onLeaveButtonClick()
    g_GameData:C2S_LeaveGame()
end

function M:onCloseButtonClick()
    self:saveToLocal()
    self:closePanel()
end

function M:onLogoutButtonClick()
    local panel = UIManager:getOrCreatePanel("UILogoutLayer")
    if panel then
        panel:showToScene()
    end
end

function M:onAvatarPanelTouchEvent(sender, eventType)

end

function M:onEditNameButtonClick()
    local panel = UIManager:getOrCreatePanel("UIModifyNameLayer")
    if panel then
        panel:showToScene()
    end
end

function M:onHeadSetButtonClick()
    --UIUtils.popToast("头像设置按钮")
    Log.log("暂未开放,敬请期待")
end

function M:onContactUsButtonClick()
    --UIUtils.popToast("联系客服按钮")
    Log.log("暂未开放,敬请期待")
end

function M:onGameHelpButtonClick()
    local panel = UIManager:getOrCreatePanel("UIGameRulesLayer")
    if panel then
        panel:showToScene()
    end
end

function M:onSystemSwitchTouchEvent(sender, eventType)
    if eventType == ccui.TouchEventType.ended then
        local tag = sender:getTag()

        local isOpen = (not self.mSwitchs[tag].state)
        self.mSwitchs[tag].state = isOpen

        self.mSwitchs[tag].open:setVisible(isOpen)
        self.mSwitchs[tag].close:setVisible(not isOpen)
    end
end

function M:onUserAgreementTouchEvent(sender, eventType)
    if eventType == ccui.TouchEventType.ended then
        DeviceUtils.openURL(Net.UserAgreement)
    end
end

function M:onPrivacyPolicyTouchEvent(sender, eventType)
    if eventType == ccui.TouchEventType.ended then
        DeviceUtils.openURL(Net.PrivacyPolicy)
    end
end

return M