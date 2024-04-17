local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UISettingLayer", UIPanel)
local targetPlatform = cc.Application:getInstance():getTargetPlatform()

M.GUI_FILE_NAME = "csd.01_07_Sitting.01_07_SittingLayer.lua"

M.BINDGUIDATANODE = {
    ["SittingScrollView"] = { varname = "SittingScrollView"},
    -- 关闭按钮
    ["Return"] = { varname = "Return", onEvent = "onReturnTouch"},
    ["ReturnButton"] = { varname = "ReturnButton"},

    -- 登出按钮
    ["LogoutButton"] = { varname = "LogoutButton", onClick = "onLogoutButtonClick" },

    -- 密码设置
    ["PasswordButton"] = { varname = "PasswordButton", onClick = "onPasswordSettingBtnClick"},
    
    --多语言
    ["LanguageButton"] = { varname = "LanguageButton", onClick = "onLanguageBtnClick"},

    -- 音乐设置按钮
    ["EffectCheckBox_1"] = { varname = "musicCheckBox",onClick="onClickEvent"},
    ["EffectSlider_1"] = { varname = "musicSlider",onClick="onClickEvent"},

    -- 音效设置
    ["EffectCheckBox_2"] = { varname = "soundEffectCheckBox",onClick="onClickEvent"},
    ["EffectSlider_2"] = { varname = "soundEffectSlider",onClick="onClickEvent"},

    -- 语音设置
    ["EffectCheckBox_3"] = { varname = "voiceCheckBox",onClick="onClickEvent"},
    ["EffectSlider_3"] = { varname = "voiceSlider",onClick="onClickEvent"},

    -- 震动设置按钮
    ["ShockPanel"] = { varname = "ShockPanel", onEvent = "onShockPanelTouchEvent"},
    ["TurnOn"] = { varname = "TurnOn"},
    ["TurnOff"] = { varname = "TurnOff"},

    -- 联系客服按钮
    ["CustomServiceButton"] = { varname = "CustomServiceButton", onClick = "onContactUsButtonClick" },

    -- 帮助按钮
    ["HelpButton"] = { varname = "HelpButton", onEvent = "onGameHelpButtonClick" },

    -- 第三方平台
    ["FacebookButton"] = { varname = "FacebookButton", onClick = "onClickFacebookButton"},
    ["WeChatButton"] = { varname = "WeChatButton", onClick = "onClickWeChatButton"},
    ["InsButton"] = { varname = "InsButton", onClick = "onClickInsButton"},

    ["Clause_CN"] = { varname = "Clause_CN" },
    ["Clause_TW"] = { varname = "Clause_TW" },
    ["Clause_EN"] = { varname = "Clause_EN" },
    -- 用户协议
    ["AgreementPanel_CN"] = { varname = "AgreementPanel_CN", onEvent = "onUserAgreementTouchEvent" },
    ["AgreementPanel_TW"] = { varname = "AgreementPanel_TW", onEvent = "onUserAgreementTouchEvent" },
    ["AgreementPanel_EN"] = { varname = "AgreementPanel_EN", onEvent = "onUserAgreementTouchEvent" },
    -- 隐私政策
    ["PrivacyPanel_CN"] = { varname = "PrivacyPanel_CN", onEvent = "onPrivacyPolicyTouchEvent" },
    ["PrivacyPanel_TW"] = { varname = "PrivacyPanel_TW", onEvent = "onPrivacyPolicyTouchEvent" },
    ["PrivacyPanel_EN"] = { varname = "PrivacyPanel_EN", onEvent = "onPrivacyPolicyTouchEvent" },

    --tip
    ["Tip"] = { varname = "Tip"},

    ["PasswordTipDotIcon"]={varname="PasswordTipDotIcon"},
    ["UpLeftBg"] = {varname="UpLeftBg"},
}

function M:onClickEvent()
    SoundSystemManager:playSound004()
end

local Language = {
    zh = "zh",
    tw = "zh_tw",
    en = "en",
}

function M:refreshHot()
    self.PasswordTipDotIcon:setVisible(g_HotData:hasHot(Enum.redPointSubcategory.accont))
end

function M:adaptationPanelSize()
    local size=cc.Director:getInstance():getWinSize()
    local friangeTop = g_GameSettingData:getFringeScreenTop()
    local dyw = (size.height - 1280) / 2
    
    if dyw > 0 then
        local addHeight=dyw-friangeTop+dyw
        local panelSize=self.SittingScrollView:getContentSize()
        local y=self.SittingScrollView:getPositionY()
        self.SittingScrollView:setContentSize(cc.size(panelSize.width,panelSize.height+addHeight))
        self.SittingScrollView:setPositionY(y-dyw)
    end
end

function M:onCreate()
    M.super.onCreate(self)
    self.SittingScrollView:setContentSize(cc.size(720,1034))
    self:setShadeShowModel(true)
    self:adaptationPanelSize()

    self.musicSlider:addEventListener(handler(self, self.onMusicSliderClick))
    self.soundEffectSlider:addEventListener(handler(self, self.onSoundEffectSliderClick))
    self.voiceSlider:addEventListener(handler(self, self.onVoiceSliderClick))

    self.musicCheckBox:addEventListener(handler(self, self.onMusicCheckBoxClick))
    self.soundEffectCheckBox:addEventListener(handler(self, self.onSoundEffectCheckBoxClick))
    self.voiceCheckBox:addEventListener(handler(self, self.onVoiceCheckBoxClick))

    self.Tip:setVisible(false)

    local size=self.UpLeftBg:getContentSize()
    self.clickpanel = ccui.Layout:create()
    self.clickpanel:setContentSize(200,100)
    self.clickpanel:setTouchEnabled(true)
    self.clickpanel:setAnchorPoint(cc.p(0.5,0.5))
    self.clickpanel:setPosition(cc.p(size.width/2,65))
    self.clickpanel:addTouchEventListener(handler(self,self.onClickShowIP))
    self.UpLeftBg:addChild(self.clickpanel)
end

function M:onInit()
    M.super.onInit(self)

    self.ReturnButton:setTouchEnabled(false)
    self:refreshUserAgreenmentAndPrivacyPolicy()

    self.mMusicVolume = g_GameSettingData:getMusicVolume()
    self.mSoundVolume = g_GameSettingData:getSoundEffectVolume()
    self.mVoiceVolume = g_GameSettingData:getVoiceVolume()
    self.isShakeOpened = g_GameSettingData:getIsShaked()
    self.isMusicCheckBoxSelected = g_GameSettingData:getIsMusicSelected()
    self.isSoundEffectCheckBoxSelected = g_GameSettingData:getIsSoundSelected()
    self.isVoiceCheckBoxSelected = g_GameSettingData:getIsVoiceSelected()

    self.musicSlider:setPercent(self.mMusicVolume)
    self.soundEffectSlider:setPercent(self.mSoundVolume)
    self.voiceSlider:setPercent(self.mVoiceVolume)

    self.TurnOn:setVisible(self.isShakeOpened)
    self.TurnOff:setVisible(not self.isShakeOpened)

    self.musicCheckBox:setSelected(self.isMusicCheckBoxSelected)
    self.soundEffectCheckBox:setSelected(self.isSoundEffectCheckBoxSelected)
    self.voiceCheckBox:setSelected(self.isVoiceCheckBoxSelected)

    self:setMusicSlider()
    self:setSoundSlider()
    self:setVoiceSlider()
    self:refreshHot()
end

function M:refreshUserAgreenmentAndPrivacyPolicy()
    local languageType = g_UserData:getSystemLanguage()
    if languageType == Enum.LanguageType.zh_cn then 
        self.Clause_CN:setVisible(true)
        self.Clause_TW:setVisible(false)
        self.Clause_EN:setVisible(false)
    elseif languageType == Enum.LanguageType.en then
        self.Clause_CN:setVisible(false)
        self.Clause_TW:setVisible(false)
        self.Clause_EN:setVisible(true)
    elseif languageType == Enum.LanguageType.zh_tw then
        self.Clause_CN:setVisible(false)
        self.Clause_TW:setVisible(true)
        self.Clause_EN:setVisible(false) 
    end
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:onLogoutButtonClick(ref)
    --切换账号，数据清空
    UIManager:closeAllPanel()
    g_GameSettingData:saveSettingDataToLocal()
    g_ChatData:clearAllData()
    g_GameData:clearAllData()
    g_FriendData:clearAllData()
    SoundSystemManager:stopAllEffect()
    SoundSystemManager:stopAllVoice()
    SoundSystemManager:playSound004()
    g_LoginData:logout()
    g_LoginData:LineLogout()
    g_SieveData:clearAllData()
    SceneManager:runScene(require("app.scenes.LoginScene").create())
end

function M:onPasswordSettingBtnClick(ref)
    local panel = UIManager:getOrCreatePanel("UISettingAccountLayer")
    if panel then 
        panel:showToScene()
    end
end

function M:onLanguageBtnClick(ref)
    local panel = UIManager:getOrCreatePanel("UILanguageChangeLayer")
    if panel then 
        panel:showToScene()
    end
end

function M:onShockPanelTouchEvent(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        self.isShakeOpened = (not self.isShakeOpened)
        self.TurnOn:setVisible(self.isShakeOpened)
        self.TurnOff:setVisible(not self.isShakeOpened)
        -- Preference:setBool(Constant.PreferenceKey.SHAKE_SWITCH, self.isShakeOpened)
        g_GameSettingData:setShaked(self.isShakeOpened)
        if self.isShakeOpened then
            SoundSystemManager:vibrate()
        end
    end
end

function M:setMusicSlider()
    if self.isMusicCheckBoxSelected then 
        self.musicSlider:setEnabled(true)
        self.musicSlider:setBright(true)
        self.musicSlider:loadProgressBarTexture("01_07_Sitting/strip_005.png", ccui.TextureResType.plistType)
    else
        self.musicSlider:setEnabled(false)
        self.musicSlider:setBright(false)
        self.musicSlider:loadProgressBarTexture("01_07_Sitting/strip_007.png", ccui.TextureResType.plistType)
    end
end

function M:setSoundSlider()
    if self.isSoundEffectCheckBoxSelected then 
        self.soundEffectSlider:setEnabled(true)
        self.soundEffectSlider:setBright(true)
        self.soundEffectSlider:loadProgressBarTexture("01_07_Sitting/strip_005.png", ccui.TextureResType.plistType)
    else
        self.soundEffectSlider:setEnabled(false)
        self.soundEffectSlider:setBright(false)
        self.soundEffectSlider:loadProgressBarTexture("01_07_Sitting/strip_007.png", ccui.TextureResType.plistType)
    end
end

function M:setVoiceSlider()
    if self.isVoiceCheckBoxSelected then 
        self.voiceSlider:setEnabled(true)
        self.voiceSlider:setBright(true)
        self.voiceSlider:loadProgressBarTexture("01_07_Sitting/strip_005.png", ccui.TextureResType.plistType)
    else
        self.voiceSlider:setEnabled(false)
        self.voiceSlider:setBright(false)
        self.voiceSlider:loadProgressBarTexture("01_07_Sitting/strip_007.png", ccui.TextureResType.plistType)
    end
end

function M:onMusicCheckBoxClick(sender, eventType)
    self.isMusicCheckBoxSelected = sender:isSelected()
    self:setMusicSlider()
    g_GameSettingData:setIsMusicSelected(self.isMusicCheckBoxSelected)
end

function M:onSoundEffectCheckBoxClick(sender, eventType)
    self.isSoundEffectCheckBoxSelected = sender:isSelected()
    self:setSoundSlider()
    g_GameSettingData:setIsSoundSelected(self.isSoundEffectCheckBoxSelected)
end

function M:onVoiceCheckBoxClick(sender, eventType)
    self.isVoiceCheckBoxSelected = sender:isSelected()
    self:setVoiceSlider()
    g_GameSettingData:setIsVoiceSelected(self.isVoiceCheckBoxSelected)
end

function M:onMusicSliderClick(sender, eventType)
    self.mMusicVolume = sender:getPercent()
    g_GameSettingData:setMusicVolume(self.mMusicVolume)
end

function M:onSoundEffectSliderClick(sender, eventType)
    self.mSoundVolume = sender:getPercent()
    g_GameSettingData:setSoundEffectVolume(self.mSoundVolume)
end

function M:onVoiceSliderClick(sender, eventType)
    self.mVoiceVolume = sender:getPercent()
    g_GameSettingData:setVoiceVolume(self.mVoiceVolume)
end

function M:onContactUsButtonClick(ref)
    DeviceUtils.openURL(GSystem.ContactServiceSkipTarget)
end

function M:onGameHelpButtonClick(data)
    if data.event == "end" then
        if cc.PLATFORM_OS_ANDROID ~= targetPlatform and cc.PLATFORM_OS_IPHONE ~= targetPlatform then
            print("windows无法使用webview")
           return 
        end
        SoundSystemManager:playSound004()
        
        local scaleToStart = cc.ScaleTo:create(0.05, 0.9)
        local scaleToEnd = cc.ScaleTo:create(0.05, 1.0)
        self.HelpButton:runAction(cc.Sequence:create(scaleToStart, scaleToEnd, cc.CallFunc:create(
            function ()
                local panel = UIManager:getOrCreatePanel("UISettingHelpLayer")
                if panel then
                    panel:setData(0)
                    panel:showToScene()
                end
            end
        )))
    end
    -- DeviceUtils.openURL(GSystem.HelpSkipTarget)
end

function M:onClickFacebookButton(ref)
    DeviceUtils.openURL(GSystem.FaceBookSkipTarget)
end

function M:onClickWeChatButton(ref)
    --UIUtils.popToast("WeChat")
    Log.log("暂未开放")
end

function M:onClickInsButton(ref)
    --UIUtils.popToast("Ins")
    Log.log("暂未开放")
end

function M:onUserAgreementTouchEvent(data)
    if data.event == "end" then
        local languageType = g_UserData:getSystemLanguage()
        local language = Language.zh
        if languageType == Enum.LanguageType.zh_cn then 
            language = Language.zh
        elseif languageType == Enum.LanguageType.en then
            language = Language.en
        elseif languageType == Enum.LanguageType.zh_tw then 
            language = Language.tw
        end
        local url = Net.WebNetHttp.."/user_agreement/index.html?lang="..tostring(language)
        DeviceUtils.openURL(url)
    end
end

function M:onPrivacyPolicyTouchEvent(data)
    if data.event == "end" then
        local languageType = g_UserData:getSystemLanguage()
        local language = Language.zh
        if languageType == Enum.LanguageType.zh_cn then 
            language = Language.zh
        elseif languageType == Enum.LanguageType.en then
            language = Language.en
        elseif languageType == Enum.LanguageType.zh_tw then 
            language = Language.tw
        end
        local url = Net.WebNetHttp.."/privacy_agreement/index.html?lang="..tostring(language)
        DeviceUtils.openURL(url)
    end
end

function M:onReturnTouch(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        local scaleToStart = cc.ScaleTo:create(0.05, 0.9)
        local scaleToEnd = cc.ScaleTo:create(0.05, 1.0)
        self.ReturnButton:runAction(cc.Sequence:create(scaleToStart, scaleToEnd, cc.CallFunc:create(
            function ()
                g_GameSettingData:saveSettingDataToLocal()
                local sceneName = SceneManager:getRunScene():getSceneName()
                if sceneName == "MainScene" then
                    DataManager:dispatchMessage(Constant.CustomEvent.UpdateUserInfo)
                elseif sceneName == "GameScene" then
                    DataManager:dispatchMessage(Constant.CustomEvent.UpdateUserResource)
                end
                self:closePanel()
                DataManager:dispatchMessage("mainlayerEnterAnimation", {})
            end
        )))
    end
end

function M:onClickShowIP(ref, event)
    if event == 0 then
        if Utils.isBtnClickNeedDelay(ref,2000) then
            if self.clicktimes == nil then
                self.clicktimes = 1
            else
                self.clicktimes = self.clicktimes + 1
            end
        else
            self.clicktimes = 1
        end

        if self.clicktimes > 4 then
            UIUtils.popToast(Net.LoginSeverIp)
            self.clicktimes = 0
        end
    end
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.UISettingLayer_refreshHot, "refreshHot")
    self:doRegEvent(Constant.CustomEvent.RefreshMultiLanguage, "refreshUserAgreenmentAndPrivacyPolicy")
end

return M