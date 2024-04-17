local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UILoginLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_01_Login.01_01_LoginLayer.lua"

M.BINDGUIDATANODE = {
    ["NoticePanel"] = { varname = "NoticePanel", onEvent = "onNoticePanelTouchEvent" },
    ["NoticeButton"] = { varname = "NoticeButton"},
    ["NoticeTip"] = { varname = "NoticeTip"},

    ["TouristButton"] = { varname = "TouristButton", onClick = "onClickTourist"},
    ["LoginButton"] = { varname = "LoginButton", onClick = "onClickLogin"}, 

    ["UserNameTextField"] = { varname = "UserNameTextField", onClick = "onClickEvent"},
    ["PasswordTextField"] = { varname = "PasswordTextField", onClick = "onClickEvent"},
    ["RegisterButton"] = { varname = "RegisterButton", onClick = "onClickRegister"},
    ["UserNameError"] = { varname = "UserNameError"},
    ["PasswordError"] = { varname = "PasswordError"},

    ["AgreementCheckBox"] = { varname = "AgreementCheckBox", onClick = "onClickEvent"},

    ["AppleNode"] = { varname = "AppleNode"},
    ["GoogleNode"] = { varname = "GoogleNode"},
    ["LineNode"] = { varname = "LineNode"},
    ["SocialLogin"] = { varname = "SocialLogin"},
    ["GooglePanel"] = { varname = "GooglePanel", onClick = "onClickGoogleLogin"},
    ["FacebookPanel"] = { varname = "FacebookPanel", onClick = "onClickFacebookLogin"},
    ["ApplePanel"] = { varname = "ApplePanel", onClick = "onClickAppleLogin"},
    ["LinePanel"] = { varname = "LinePanel", onClick = "onClickLineLogin"},

    ["Agreement"]={varname="Agreement"},

    ["Agreement_CN"] = { varname = "Agreement_CN"},
    ["Agreement_TW"] = { varname = "Agreement_TW"},
    ["Agreement_EN"] = { varname = "Agreement_EN"},

    ["AgreementUserPanel_CN"] = { varname = "AgreementUserPanel_CN", onEvent = "onUserAgreementTouchEvent" },
    ["AgreementPrivacyPanel_CN"] = { varname = "AgreementPrivacyPanel_CN", onEvent = "onPrivacyPolicyTouchEvent" },
    ["AgreementUserPanel_TW"] = { varname = "AgreementUserPanel_TW", onEvent = "onUserAgreementTouchEvent" },
    ["AgreementPrivacyPanel_TW"] = { varname = "AgreementPrivacyPanel_TW", onEvent = "onPrivacyPolicyTouchEvent" },
    ["AgreementUserPanel_EN"] = { varname = "AgreementUserPanel_EN", onEvent = "onUserAgreementTouchEvent" },
    ["AgreementPrivacyPanel_EN"] = { varname = "AgreementPrivacyPanel_EN", onEvent = "onPrivacyPolicyTouchEvent" },

    ["UserNameBg"]={varname="UserNameBg"},
    ["UserName"]={varname="UserName"},
    ["Password"]={varname="Password"},
    ["VersionNum"]={varname="VersionNum"}
}

local TextFieldTag = {
    AreaCode = 1,
    PhoneNumber = 2,
    SMSCode = 3,
}

local Language = {
    zh = "zh",
    tw = "zh_tw",
    en = "en",
}

function M:onClickEvent()
    SoundSystemManager:playSound004()
end

function M:initTextFieldStruct(tag, textField, textFieldErrorNode, errorTipNode)
    textField:setTag(tag)
    return { textFieldErrorNode = textFieldErrorNode, errorTipNode = errorTipNode, textField = textField }
end

function M:onCreate()
    M.super.onCreate(self)

    self.SocialLogin:setVisible(true)

    -- local str = "{\"RichText\": [{\"text\": \"你好\",\"color\": {\"r\": 255,\"g\": 0,\"b\": 0},\"opacity\": 255,\"fontName\": \"Microsoft Yahei\",\"fontSize\": 20,\"outlineColor\": {\"r\": 255,\"g\": 255,\"b\": 255},\"outlineSize\": 1},{\"text\": \"来吧\",\"color\": {\"r\": 114,\"g\": 220,\"b\": 112},\"opacity\": 255,\"fontName\": \"Microsoft Yahei\",\"fontSize\": 32,\"outlineColor\": {\"r\": 255,\"g\": 255,\"b\": 255},\"outlineSize\": 1}]}"
    -- local node = Utils.CreateRichText(str)
    -- node:setPosition(200, 500)
    -- self:addChild(node)
   
    self.VersionNum:setString("Ver:"..g_GameSettingData:getResourceVersion())

    local version = g_GameSettingData:getResourceVersion()
    local packageVersion = g_GameSettingData:getVersion()
    local packageversions = string.split(packageVersion,".")
    local versions = string.split(version,".")
    
    Log.print_table(packageversions)
    Log.print_table(versions)
    if not DeviceUtils.isWindows() then
        if tonumber(packageversions[1])~= tonumber(versions[1]) or tonumber(packageversions[2])~= tonumber(versions[2]) or (tonumber(packageversions[1])==1 and tonumber(packageversions[2])==6)  then
            display.getRunningScene():runAction(cc.Sequence:create(cc.DelayTime:create(0.2),cc.CallFunc:create(function ()
                local panel = UIManager:getOrCreatePanel("UILoadingTipPopUp_2")
                if panel then 
                    panel:showToScene()             
                end
            end)))
            return
        end
    end

    g_LoginData:getPushToken()
    self:initEditBoxUser()
    self:initEditBoxPrd()
    
    if DeviceUtils.isWindows() then
        self:updateSocialLoginBtn(false)
    elseif DeviceUtils.isIOS() then
        self:updateSocialLoginBtn(true)
    elseif DeviceUtils.isAndroid() then
        self:updateSocialLoginBtn(false)
    end
    -- self.LineNode:setVisible(false)

    self.mIsFirstInstall = Preference:getBool(Constant.PreferenceKey.ISFIRSTINSTALL, true)

    local  jsonData={}
    jsonData["eventName"] = "EVENT_ENTER_THE_LOGIN_INTERFACE"
    if DeviceUtils.isIOS() then
        g_UserData:onTFEventCode(jsonData)
    elseif DeviceUtils.isAndroid() then
        g_UserData:onTFEventCode(jsonData)
    end
end

function M:updateSocialLoginBtn(isShow)
    self.AppleNode:setVisible(isShow)
    self.GoogleNode:setVisible(not isShow)
end

function M:initEditBoxUser()
    self.UserNameTextField:setVisible(false)
    local _x,_y=self.UserNameTextField:getPosition()
    local editChat = ccui.EditBox:create(cc.size(474,100),"00_01_Common/picture_057.png","00_01_Common/picture_057.png","00_01_Common/picture_057.png",ccui.TextureResType.plistType)
    self.UserName:addChild(editChat)
    editChat:setPosition( cc.p(_x,_y))
    editChat:setAnchorPoint(cc.p(0,0.5))
    --editChat:setContentSize(cc.size(499,90))
    editChat:setFontSize(28)
    editChat:setFontName("font/DINAlternate-bold.ttf")
    editChat:setInputMode(cc.EDITBOX_INPUT_MODE_SINGLELINE)
    editChat:registerScriptEditBoxHandler(handler(self,self.editboxEventHandler))
    self.editBoxUser=editChat
end

function M:initEditBoxPrd()
    self.PasswordTextField:setVisible(false)
    local _x,_y=self.PasswordTextField:getPosition()
    local editChat = ccui.EditBox:create(cc.size(474,100),"00_01_Common/picture_057.png","00_01_Common/picture_057.png","00_01_Common/picture_057.png",ccui.TextureResType.plistType)
    self.Password:addChild(editChat)
    editChat:setPosition( cc.p(_x,_y))
    editChat:setAnchorPoint(cc.p(0,0.5))
    --editChat:setContentSize(cc.size(499,90))
    editChat:setFontSize(28)
    editChat:setFontName("font/DINAlternate-bold.ttf")
    editChat:setInputMode(cc.EDITBOX_INPUT_MODE_SINGLELINE)
    editChat:setInputFlag(cc.EDITBOX_INPUT_FLAG_PASSWORD)
    editChat:registerScriptEditBoxHandler(handler(self,self.editboxEventHandler))
    self.editBoxPrd=editChat
end

function M:editboxEventHandler(eventType,str)
    if eventType == "began" then
        -- 点击编辑框,输入法显示
        SoundSystemManager:playSound004()
    elseif eventType == "ended" then
        -- 当编辑框失去焦点并且键盘消失的时候被调用
    elseif eventType == "changed" then
        -- 输入内容改变时调用
    elseif eventType == "return" then
        -- 用户点击编辑框的键盘以外的区域，或者键盘的Return按钮被点击时所调用
    end
end

function M:onInit()
    M.super.onInit(self)
    SoundSystemManager:playBackMusic(SoundSystemManager:getRandomDefaultBGMPath())
    Utils.copyToClipboard("1111111111111")
    g_HotData:init()
    g_ActivityData:init()

    self:updateUserAgreenmentAndPrivacyPolicy()
    self.btnDelayTime=0
    self.delayTime = 0
    self.mUserErrorDelayTime = 0
    self.UserNameError:setVisible(false)
    self.PasswordError:setVisible(false)

    local desc = ""
    local languageType = g_UserData:getSystemLanguage()
    if languageType == Enum.LanguageType.zh_cn then 
        desc = Net.versionNotice["zh-Hans"] or ""
    elseif languageType == Enum.LanguageType.en then
        desc = Net.versionNotice["en"] or ""
    else
        desc = Net.versionNotice["zh-Hant"] or ""
    end

    if desc == "" then
        Log.info("该版本暂未配置公告")
        g_CommonData:setAutoPopUp(false)
    elseif self.mIsFirstInstall then
        print("Net.versionNotice",Net.versionNotice)
        g_CommonData:setAutoPopUp(true)
    end

    if g_CommonData:getAutoPopUp() then 
        local panel = UIManager:getOrCreatePanel("UIGameAnnouncement")
        if panel then
            panel:showToScene()
        end
        g_CommonData:setAutoPopUp(false)
        self.mIsFirstInstall = false
        Preference:setBool(Constant.PreferenceKey.ISFIRSTINSTALL, self.mIsFirstInstall)
    end

    self.m_username = g_LoginData.mAccount
    self.m_password = g_LoginData.mPassword


    local loginType = g_LoginData:getLoginType()
    
    if loginType == Enum.LoginType.Unknow then
        self.editBoxUser:setText(self.m_username)
        self.editBoxPrd:setText(self.m_password)
    elseif  loginType == Enum.LoginType.User then 
        self.editBoxUser:setText(self.m_username)
        self.editBoxPrd:setText(self.m_password)
    else
        self.editBoxUser:setText("")
        self.editBoxPrd:setText("")
    end
    
    g_LoginData:loginAuto()

    local driverId = g_UserData:getPanamathDriverId()
end

function M:updateUserAgreenmentAndPrivacyPolicy()
    local languageType = g_UserData:getSystemLanguage()
    if languageType == Enum.LanguageType.zh_cn then 
        self.Agreement_CN:setVisible(true)
        self.Agreement_TW:setVisible(false)
        self.Agreement_EN:setVisible(false)
    elseif languageType == Enum.LanguageType.en then
        self.Agreement_CN:setVisible(false)
        self.Agreement_TW:setVisible(false)
        self.Agreement_EN:setVisible(true)
    elseif languageType == Enum.LanguageType.zh_tw then
        self.Agreement_CN:setVisible(false)
        self.Agreement_TW:setVisible(true)
        self.Agreement_EN:setVisible(false) 
    end
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:onNoticePanelTouchEvent(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        
        local scaleToStart = cc.ScaleTo:create(0.05, 0.9)
        local scaleToEnd = cc.ScaleTo:create(0.05, 1.0)
        self.NoticeButton:runAction(cc.Sequence:create(scaleToStart, scaleToEnd, cc.CallFunc:create(
            function ()
                local panel = UIManager:getOrCreatePanel("UIGameAnnouncement")
                if panel then
                    panel:showToScene()
                end
            end
        )))
    end
end

function M:onClickTourist(ref)
    if not self.AgreementCheckBox:isSelected() then 
        local panel = UIManager:getOrCreatePanel("UIClientErrorTipsLayer_1")
        if panel then 
            local TipTitleText = Utils.getTextByTextId(Enum.Text.TitleText)
            local ConfirmText = Utils.getTextByTextId(Enum.Text.ButtonText)
            local ContentText = Utils.getTextByTextId(Enum.Text.ContentText)
            panel:setText(TipTitleText, ContentText, ConfirmText)
            panel:showToScene()
        end
        return
    end
    g_LoginData:loginTourist()
end

function M:onClickLogin()
    self.m_username = self.editBoxUser:getText()

    self.m_password = self.editBoxPrd:getText()
    if not self.AgreementCheckBox:isSelected() then
        local panel = UIManager:getOrCreatePanel("UIClientErrorTipsLayer_1")
        if panel then 
            local TipTitleText = Utils.getTextByTextId(Enum.Text.TitleText)
            local ConfirmText = Utils.getTextByTextId(Enum.Text.ButtonText)
            local ContentText = Utils.getTextByTextId(Enum.Text.ContentText)
            panel:setText(TipTitleText, ContentText, ConfirmText)
            panel:showToScene()
        end
        return
    end

    if Utils.isEmptyStr(self.m_username) then 
        UIUtils.popToadtByMessageId(Constant.Define.AccountIsNotNull)
        self:setUserNameError()
        return
    end

    if Utils.isEmptyStr(self.m_password) then 
        UIUtils.popToadtByMessageId(Constant.Define.PasswardIsNotNull)
        self:setPasswordError()
        return
    end

    if not (Utils.isNumberAndAbc_Only(self.m_username,true)) then 
        UIUtils.popToadtByMessageId(Constant.Define.AccountSpecial)
        self:setUserNameError()
        return
    end

    if string.len(self.m_username)>12 or string.len(self.m_username)<4 then
        UIUtils.popToadtByMessageId(Constant.Define.AccountSpecial)
        self:setUserNameError()
        return
    end

    if not (Utils.isNumberAndAbcOnly(self.m_password,true)) then 
        UIUtils.popToadtByMessageId(Constant.Define.PasswardIsLongOrShort)
        self:setPasswordError()
        return
    end

    if string.len(self.m_password)>12 or string.len(self.m_password)<4 then
        UIUtils.popToadtByMessageId(Constant.Define.PasswardIsLongOrShort)
        self:setPasswordError()
        return
    end

    g_LoginData:loginUser(self.m_username,self.m_password)
end

function M:onClickGoogleLogin()
    if not self.AgreementCheckBox:isSelected() then 
        local panel = UIManager:getOrCreatePanel("UIClientErrorTipsLayer_1")
        if panel then 
            local TipTitleText = Utils.getTextByTextId(Enum.Text.TitleText)
            local ConfirmText = Utils.getTextByTextId(Enum.Text.ButtonText)
            local ContentText = Utils.getTextByTextId(Enum.Text.ContentText)
            panel:setText(TipTitleText, ContentText, ConfirmText)
            panel:showToScene()
        end
        return
    end
    g_LoginData:loginByGoogle()
end
--loginByApple
function M:onClickAppleLogin()
    if not self.AgreementCheckBox:isSelected() then 
        local panel = UIManager:getOrCreatePanel("UIClientErrorTipsLayer_1")
        if panel then 
            local TipTitleText = Utils.getTextByTextId(Enum.Text.TitleText)
            local ConfirmText = Utils.getTextByTextId(Enum.Text.ButtonText)
            local ContentText = Utils.getTextByTextId(Enum.Text.ContentText)
            panel:setText(TipTitleText, ContentText, ConfirmText)
            panel:showToScene()
        end
        return
    end
    g_LoginData:loginByApple()
end
function M:onClickFacebookLogin()
    if not self.AgreementCheckBox:isSelected() then 
        local panel = UIManager:getOrCreatePanel("UIClientErrorTipsLayer_1")
        if panel then 
            local TipTitleText = Utils.getTextByTextId(Enum.Text.TitleText)
            local ConfirmText = Utils.getTextByTextId(Enum.Text.ButtonText)
            local ContentText = Utils.getTextByTextId(Enum.Text.ContentText)
            panel:setText(TipTitleText, ContentText, ConfirmText)
            panel:showToScene()
        end
        return
    end
    g_LoginData:loginByFacebook()
end

function M:onClickLineLogin()
    if not self.AgreementCheckBox:isSelected() then 
        local panel = UIManager:getOrCreatePanel("UIClientErrorTipsLayer_1")
        if panel then 
            local TipTitleText = Utils.getTextByTextId(Enum.Text.TitleText)
            local ConfirmText = Utils.getTextByTextId(Enum.Text.ButtonText)
            local ContentText = Utils.getTextByTextId(Enum.Text.ContentText)
            panel:setText(TipTitleText, ContentText, ConfirmText)
            panel:showToScene()
        end
        return
    end
    g_LoginData:loginByLine()
end

function M:onClickRegister(ref)
    if self.btnDelayTime>0 then return end
    self.btnDelayTime=60*1

    self.m_username = self.editBoxUser:getText()

    self.m_password = self.editBoxPrd:getText()

    if not self.AgreementCheckBox:isSelected() then
        local panel = UIManager:getOrCreatePanel("UIClientErrorTipsLayer_1")
        if panel then 
            local TipTitleText = Utils.getTextByTextId(Enum.Text.TitleText)
            local ConfirmText = Utils.getTextByTextId(Enum.Text.ButtonText)
            local ContentText = Utils.getTextByTextId(Enum.Text.ContentText)
            panel:setText(TipTitleText, ContentText, ConfirmText)
            panel:showToScene()
        end
        return
    end

    if Utils.isEmptyStr(self.m_username) then 
        UIUtils.popToadtByMessageId(Constant.Define.AccountIsNotNull)
        self:setUserNameError()
        return
    end

    if Utils.isEmptyStr(self.m_password) then 
        UIUtils.popToadtByMessageId(Constant.Define.PasswardIsNotNull)
        self:setPasswordError()
        return
    end

    if not (Utils.isNumberAndAbc_Only(self.m_username,true)) then 
        UIUtils.popToadtByMessageId(Constant.Define.AccountSpecial)
        self:setUserNameError()
        return
    end

    if string.len(self.m_username)>12 or string.len(self.m_username)<4 then
        UIUtils.popToadtByMessageId(Constant.Define.AccountSpecial)
        self:setUserNameError()
        return
    end

    if not (Utils.isNumberAndAbcOnly(self.m_password,true)) then 
        UIUtils.popToadtByMessageId(Constant.Define.PasswardIsLongOrShort)
        self:setPasswordError()
        return
    end

    if string.len(self.m_password)>12 or string.len(self.m_password)<4 then
        UIUtils.popToadtByMessageId(Constant.Define.PasswardIsLongOrShort)
        self:setPasswordError()
        return
    end

    g_LoginData:registerUser(self.m_username,self.m_password)
end

function M:OnUpdate(dt)
    self.mUserErrorDelayTime = self.mUserErrorDelayTime + dt
    if self.mUserErrorDelayTime > 2 and self.UserNameError:isVisible() then 
        self.UserNameError:setVisible(false)
        self.mUserErrorDelayTime = 0
    end

    self.delayTime = self.delayTime + dt
    if self.delayTime > 2 and self.PasswordError:isVisible() then 
        self.PasswordError:setVisible(false)
        self.delayTime = 0
    end

    self.btnDelayTime=self.btnDelayTime-1
    if self.btnDelayTime<0 then
        self.btnDelayTime=0
    end
end

function M:setUserNameError()
    self.mUserErrorDelayTime = 0
    self.UserNameError:setVisible(true)
end

function M:setPasswordError()
    self.delayTime = 0
    self.PasswordError:setVisible(true)
end

function M:isValidPhoneNumber(phoneNumber)
    if Utils.isEmptyStr(phoneNumber) then
        return false
    end

    return true
end

function M:isValidSMSCodeStr(smsCode)
    if Utils.isEmptyStr(smsCode) then
        return false
    end

    if self.SMSCodeTextField:getMaxLength() ~= string.len(smsCode) then
        return false
    end
    
    return true
end

function M:onSendSmsCodeTouchEvent(sender, eventType)
    local time = g_LoginData:getResendSMSTimestampLocalCache() - os.time()
    if time > 0 then
        return
    end

    local areaCodeStr = Utils.trim(self.AreaCodeTextField:getString())
    local phoneNumberStr = Utils.trim(self.PhoneNumberTextField:getString())

    if eventType == ccui.TouchEventType.ended then

        local ret = -1
        for _, v in pairs(self.mTextFields) do
            if v.textFieldErrorNode:isVisible() then
                ret = v.textField:getTag()
                break
            end
        end

        if ret ~= -1 then
            --UIUtils.popToast("请检查输入信息")
        elseif not self:isValidPhoneNumber(areaCodeStr .. phoneNumberStr) then
            --UIUtils.popToast("手机号码错误")
        elseif not self.AgreeCheckBox:isSelected() then
            UIUtils.popToadtByMessageId(Constant.Define.CheckAgreeSelected)
        else
            g_LoginData:setResendSMSTimestampLocalCache(os.time() + 60)
            g_LoginData:requestSmsCode(areaCodeStr, phoneNumberStr)
        end
    end
end

function M:onPhoneNumberButtonClick()
    local areaCodeStr = Utils.trim(self.AreaCodeTextField:getString())
    local phoneNumberStr = Utils.trim(self.PhoneNumberTextField:getString())
    local smsCodeStr = Utils.trim(self.SMSCodeTextField:getString())

    local ret = -1
    for _, v in pairs(self.mTextFields) do
        if v.textFieldErrorNode:isVisible() then
            ret = v.textField:getTag()
            break
        end
    end

    if ret ~= -1 then
        --UIUtils.popToast("请检查输入信息")
    elseif not self:isValidPhoneNumber(areaCodeStr .. phoneNumberStr) then
        self.mTextFields[TextFieldTag.PhoneNumber].textFieldErrorNode:setVisible(true)
        self.mTextFields[TextFieldTag.PhoneNumber].errorTipNode:setVisible(true)
    elseif not self:isValidSMSCodeStr(smsCodeStr) then
        self.mTextFields[TextFieldTag.SMSCode].textFieldErrorNode:setVisible(true)
        self.mTextFields[TextFieldTag.SMSCode].errorTipNode:setVisible(true)
    elseif not self.AgreeCheckBox:isSelected() then
        UIUtils.popToadtByMessageId(Constant.Define.CheckAgreeSelected)
    else
        UIUtils.showLoadingLayer(5, 10)
        g_LoginData:loginByPhoneNumber(areaCodeStr, phoneNumberStr, smsCodeStr)
    end
end

function M:onTextFieldEvent(sender, eventType)
    local tag = sender:getTag()

    if eventType == ccui.TextFiledEventType.delete_backward or eventType == ccui.TextFiledEventType.insert_text then
        self.mTextFields[tag].textFieldErrorNode:setVisible(false)
        self.mTextFields[tag].errorTipNode:setVisible(false)
    end

    local str = Utils.getNumberOnly(Utils.trim(sender:getString()))
    if tag == TextFieldTag.AreaCode then
        sender:setString("+" .. str)
    else
        sender:setString(str)
    end
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

function M:onLoginHostChangeButtonClick()
    if DeviceUtils.isWindows() then
        Net.LoginSeverIp = Utils.trim(Utils.pasteFromClipboard())
        self.LoginHostIPTitle:setString(Net.LoginSeverIp)
    end
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.RegisterResult, "onRegisterResult")
    self:doRegEvent(Constant.CustomEvent.LoginResult, "onLoginResult")
    self:doRegEvent(Constant.CustomEvent.SmsCodeResult, "onSmsCodeResult")
end

function M:onRegisterResult(data)
    if data.code == g_LoginData.RegsiterResponseCode.SUCCESS then
    else
        --Log.info("111111111111111111111111111:"..data.code)
        UIUtils.popToadtByMessageId(data.code)

        if data.code == g_LoginData.RegsiterResponseCode.ACCOUNT_EXIST then
            self:setUserNameError()
        end
    end
end

function M:onLoginResult(data)
    if data.code == g_LoginData.LoginResponseCode.SUCCESS then
    else
        --Log.info("111111111111111111111111111:"..data.code)
        UIUtils.popToadtByMessageId(data.code)

        if data.code == g_LoginData.LoginResponseCode.ACCOUNT_NO_EXIST then
            self:setUserNameError()
        elseif data.code == g_LoginData.LoginResponseCode.ACCOUNT_OR_PASSWORD_ERROR then
            self:setPasswordError()
        end
    end

end

function M:onSmsCodeResult(data)
    if data.code == g_LoginData.LoginResponseCode.SUCCESS then
        --UIUtils.popToast("验证码已发送")
    else
        --Log.info("111111111111111111111111111:"..data.code)
        UIUtils.popToadtByMessageId(data.code)
    end
end

return M