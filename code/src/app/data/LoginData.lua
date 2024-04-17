local Payment = require("app.native.Payment")

local M = class("LoginData")
local targetPlatform = cc.Application:getInstance():getTargetPlatform()
local luaj=nil
if (cc.PLATFORM_OS_ANDROID == targetPlatform) then
    luaj = require "cocos.cocos2d.luaj"                                   -- 引用库文件
    
end
local className = "bridge/AppController" -- java类名
local googleLogin = "googleLogin"  
local facebookLogin = "facebookLogin"
local lineLogin = "lineLogin"
local lineLogout = "lineLogout"
  


M.LoginAccountType = {
    Unknow = 0,
    Register = 1, -- 手机号
    FaceBook = 4, -- facebook
    Test = 7, -- 测试用账号
    Apple = 8, -- apple
    Google = 9, -- google
}
M.LoginType={
    Test = 0,
    Guest = 1,
    Account = 2,
    FaceBook = 3,
    Google = 4,
    Apple = 5,
    Line = 6,
}

M.LoginResponseCode = {
    UNKNOW = -1,
    SUCCESS = 0,
    TOKEN_INVALID = 1,
    SERVER_SHUTDOWN = 2,
    BLOCK_USER = 3,
    ACCOUNT_NO_EXIST = 60001,
    ACCOUNT_OR_PASSWORD_ERROR = 60004,
    FORMAT_ERROR = 6,
    DB_ERROR = 7,
    NO_IDFA = 8,
    IDFA_LIMIT = 9,
    CONNECT_FAIL = 101,
}

M.RegsiterResponseCode = {
    SUCCESS = 0,
    ACCOUNT_EXIST = 60002,
}

M.ModifyResponseCode = {
    SUCCESS = 0,
    OLDPWD_ERROR = 60009,
}
M.GeiBindListResponseCode = {
    SUCCESS = 0,
    ACCOUNT_EXIST = 60020,
}

M.Language = {
    zh = 1,
    tw = 2,
    en = 3,
}


function M:ctor()
    --self.mLoginAuto = true
    self.mLoginAuto = Preference:getBool("login_auto", false)
    self.mGuestId = Preference:getString("guestId", "")
    self.mConnectToken = Preference:getString("token", "")
    self.mAccount = Preference:getString("account", "")
    self.mPassword = Preference:getString("password","")
    self.mAccountType = Preference:getInt("account_type", M.LoginAccountType.Unknow)

    self.mAreaCode = Preference:getString("area_code", "+886")
    self.mPhoneNumber = Preference:getString("phone_number", "")
    self.mResendSMSTimestamp = Preference:getInt("resend_sms_timestamp", 0)

    self.mShareCode=""
    self.mHost=""
    self.mPort=""
    self.strLoginType = Preference:getString("lastLoginType", Enum.LoginType.Unknow)
    
    self.mIsBindingAccount = false
end

function M:setHost(host)
    self.mHost=host
end

function M:getHost()
    return self.mHost
end

function M:setPort(port)
    self.mPort=port
end

function M:getPort()
    return self.mPort
end

function M:getLoginType()
    return self.strLoginType
end

function M:setLoginType(loginType)
    self.strLoginType = loginType
end

function M:getShareCode()
    return self.mShareCode
end

function M:setShareCode(shareCode)
    self.mShareCode=shareCode
end

function M:getAreaCodeLocalCache()
    return self.mAreaCode
end

function M:getPhoneNumberLocalCache()
    return self.mPhoneNumber
end

function M:getPassword()
    return self.mPassword
end

function M:getAccount()
    return self.mAccount
end

function M:setResendSMSTimestampLocalCache(timestamp)
    self.mResendSMSTimestamp = timestamp
end

function M:getResendSMSTimestampLocalCache()
    return self.mResendSMSTimestamp
end

function M:getIsBindingAccount()
    return self.mIsBindingAccount
end

function M:setIsBindingAccount(isBinding)
    self.mIsBindingAccount = isBinding
end

function M:clearLoginCacheData()
    self.mConnectToken = ""
    self.mAccount = ""
    self.mPassword= ""
    self.mAccountType = M.LoginAccountType.Unknow
    self:writeLoginCacheDataToLocal()
end

function M:writeLoginCacheDataToLocal()
    Preference:setBool(Constant.PreferenceKey.LOGIN_AUTO, self.mLoginAuto)
    Preference:setString(Constant.PreferenceKey.GUESTID, self.mGuestId)
    Preference:setString(Constant.PreferenceKey.TOKEN, self.mConnectToken)
    Preference:setString(Constant.PreferenceKey.ACCOUNT, self.mAccount)
    Preference:setString(Constant.PreferenceKey.PASSWARD, self.mPassword)
    Preference:setInt(Constant.PreferenceKey.ACCOUNT_TYPE, self.mAccountType)

    Preference:setString(Constant.PreferenceKey.AREA_CODE, self.mAreaCode)
    Preference:setString(Constant.PreferenceKey.PHONE_NUMBER, self.mPhoneNumber)
    Preference:setInt(Constant.PreferenceKey.RESEND_SMS_TIMESTAMP, self.mResendSMSTimestamp)
    Preference:setString(Constant.PreferenceKey.LAST_LOGINTYPE, self.strLoginType)
end

function M:setLoginAutoEnable(state)
    self.mLoginAuto = state
    Preference:setBool(Constant.PreferenceKey.LOGIN_AUTO, self.mLoginAuto)
end

function M:isLoginAutoEnable()
    -- if self.mAccountType == M.LoginAccountType.Unknow or Utils.isEmptyStr(self.mConnectToken) then
    --     self.mLoginAuto = false
    -- end

    if Utils.isEmptyStr(self.mConnectToken) then
        self:setLoginAutoEnable(false)
    end

    return self.mLoginAuto
end

function M:loginAuto()
    local data = {}
    local version = g_GameSettingData:getResourceVersion()
    local packageVersion = g_GameSettingData:getVersion()
    local packageversions = string.split(packageVersion,".")
    local versions = string.split(version,".")
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
    data.token = self.mConnectToken

    if self:isLoginAutoEnable()then
        if UIManager:isPanelOpenOrOpening("UILoginLimitPopUp") then
            return
        end

        local panel = UIManager:getOrCreatePanel("UILoginLimitPopUp")
        if panel then
            panel:showToScene()
        end
        
        Client:sendHttpPostRequest(Net.HttpCmd.LoginAuto, data, handler(self, self.onLoginAutoCallback))

    --    self:login(data)
    end
end

function M:loginTourist()
    local data = {}
    data.loginType = self.LoginType.Guest
    data.guestId = self.mGuestId
    self:setLoginType(Enum.LoginType.Guest)
    self:login(data)
    
end
function M:loginUser(user,pass)
    local data = {}
    data.loginType = self.LoginType.Account
    data.account = user
    data.password = pass
    self.mAccount = user
    self.mPassword = pass
    self:setLoginType(Enum.LoginType.User)
    self:login(data)
end
function M:googleLoginCallBack(code,token)
    if code == 1 then
        local data = {}
        data.loginType = self.LoginType.Google
        data.accessToken = token
        self:setLoginType(Enum.LoginType.Google)
        local sceneName = SceneManager:getRunScene():getSceneName()
        if sceneName ~= "LoginScene" then
            self:BindAccount(data);
        else
            self:login(data)
        end
    else
        --登錄失敗處理
    end
    
end
function M:appleLoginCallBack(code,token,authorizationCode)
    if code == 1 then
        local data = {}
        data.loginType = self.LoginType.Apple
        data.accessToken = token
        data.authorizationCode = authorizationCode
        self:setLoginType(Enum.LoginType.Apple)
        local sceneName = SceneManager:getRunScene():getSceneName()
        if sceneName ~= "LoginScene" then
            self:BindAccount(data);
        else
            self:login(data)
        end
    else
        --登錄失敗處理
    end
end
function M:facebookLoginCallBack(code,token)
    if code == 1 then
        local data = {}
        data.loginType = self.LoginType.FaceBook
        data.accessToken = token
        self:setLoginType(Enum.LoginType.Facebook)
        local sceneName = SceneManager:getRunScene():getSceneName()
        if sceneName ~= "LoginScene" then
            self:BindAccount(data);
        else
            self:login(data)
        end
    else
        --登錄失敗處理
    end
end
function M:lineLoginCallBack(code,token)
    if code == 1 then
        local data = {}
        data.loginType = self.LoginType.Line
        data.accessToken = token
        self:setLoginType(Enum.LoginType.Line)
        local sceneName = SceneManager:getRunScene():getSceneName()
        if sceneName ~= "LoginScene" then
            self:BindAccount(data);
        else
            self:login(data)
        end
    else
        --登錄失敗處理
    end
end
function M:registerUser(user,pass)
    local data = {}
    data.account = user
    data.password = pass
    self.mAccount = user
    self.mPassword = pass

    Client:sendHttpPostRequest(Net.HttpCmd.Register, data, handler(self, self.onRegisterCallback))

end
function M:onRegisterCallback(response)
    local code, data = Utils.parseResponse(response)
    if code == M.RegsiterResponseCode.SUCCESS then

        self:loginUser(self.mAccount, self.mPassword)

        --注册上报
        Openinstall:reportRegister()
    else
        DataManager:dispatchMessage(Constant.CustomEvent.RegisterResult, {
            code = code,
            data = data
        })
    end

end
function M:requestSmsCode(areaCode, phoneNumber)
    local data = {}
    data.phone = areaCode .. phoneNumber

    self.mAreaCode = areaCode
    self.mPhoneNumber = phoneNumber

    Client:sendHttpPostRequest(Net.HttpCmd.SmsCode, data, handler(self, self.onSmsCodeCallback))
end

function M:onSmsCodeCallback(response)
    local code, data = Utils.parseResponse(response)
    if code == M.LoginResponseCode.SUCCESS then
        self:writeLoginCacheDataToLocal()
    end

    DataManager:dispatchMessage(Constant.CustomEvent.SmsCodeResult, { code = code })
end

function M:loginByPhoneNumber(areaCode, phoneNumber, verificationCode)
    local data = {}
    data.account = areaCode .. phoneNumber
    data.verificationCode = verificationCode
    data.accountType = M.LoginAccountType.Register

    self.mConnectToken = ""
    self.mAccount = areaCode .. phoneNumber
    self.mAccountType = M.LoginAccountType.Register

    self.mAreaCode = areaCode
    self.mPhoneNumber = phoneNumber

    self:login(data)
end

function M:loginByGoogle()
    Log.info("开始google登陆")
    if (cc.PLATFORM_OS_ANDROID == targetPlatform) then
        Log.info("请求google登陆")
        luaj.callStaticMethod(className,googleLogin,{},"()V")
        
    end
    
end
function M:loginByApple()
    Log.info("111111111")
    if(cc.PLATFORM_OS_IPHONE==targetPlatform) then
        local ok, ret = Launcher.callStaticMethod("AppController", "appleLogin")
    end
end

function M:loginByFacebook()
    if (cc.PLATFORM_OS_ANDROID == targetPlatform) then
        Log.info("请求facebook登陆")
        luaj.callStaticMethod(className,facebookLogin,{},"()V")

    elseif cc.PLATFORM_OS_IPHONE==targetPlatform then
        local ok, ret = Launcher.callStaticMethod("AppController", "facebookLogin")
    end
end

function M:loginByLine()
    if (cc.PLATFORM_OS_ANDROID == targetPlatform) then
        Log.info("请求line登陆")
        luaj.callStaticMethod(className,lineLogin,{},"()V")

    elseif cc.PLATFORM_OS_IPHONE==targetPlatform then
        local ok, ret = Launcher.callStaticMethod("AppController", "lineLogin")
    end
end

function M:LineLogout()
    if (cc.PLATFORM_OS_ANDROID == targetPlatform) then
        Log.info("line注销账号")
        luaj.callStaticMethod(className,lineLogout,{},"()V")
    end
end

function M:getPushToken()
    --local token1 = self:getAppPushToken()

    local token1 = self:getAppPushToken()
    if (cc.PLATFORM_OS_ANDROID == targetPlatform) then
        local token2 = cc.UserDefault:getInstance():getStringForKey("pushToken", "")
    
        if token1 ~= "" then
            cc.UserDefault:getInstance():setStringForKey("pushToken", token1)
            return token1
        else
            return token2
        end

    elseif cc.PLATFORM_OS_IPHONE==targetPlatform then
        --local ok, ret = Launcher.callStaticMethod("AppController", "facebookLogin")
        return token1
    end
    return ""
end
function M:getAppPushToken()
    local pushToken = ""

    if cc.PLATFORM_OS_ANDROID == targetPlatform then

        local ok, ret = luaj.callStaticMethod(className, "getAppPushToken", {}, "()Ljava/lang/String;")
        
        if ok then
            pushToken = ret
        end

    elseif cc.PLATFORM_OS_IPHONE==targetPlatform then

        local ok, ret = Launcher.callStaticMethod("AppController", "getAppPushToken")

        if ok then
            pushToken = ret
        end
    end
    Log.info("pushToken:"..pushToken)
    return pushToken
end

function M:loginByTest(areaCode, phoneNumber, verificationCode)
    local data = {}
    data.account = areaCode .. phoneNumber
    data.verificationCode = verificationCode
    data.accountType = M.LoginAccountType.Test

    self.mConnectToken = ""
    self.mAccount = areaCode .. phoneNumber
    self.mAccountType = M.LoginAccountType.Test

    self.mAreaCode = areaCode
    self.mPhoneNumber = phoneNumber

    self:login(data)
end

function M:login(data)
    --[[    local data = {}
    data.login_type = openId
    data.open_id = accessToken
    data.access_token = accountType
    data.connect_token = connectToken

    data.platform = DeviceUtils.getPlatform()
    data.version = DeviceUtils.getVersion()
    data.package_name = DeviceUtils.getPackageName()
    data.channel_id = DeviceUtils.getChannelId()
    data.idfa = DeviceUtils.getIDFA()
    data.push_token = DeviceUtils.getAppPushToken()
    data.deviceId = DeviceUtils.getDeviceId()
    ]]
    
    if UIManager:isPanelOpenOrOpening("UILoginLimitPopUp") then 
        return
    end

    local panel = UIManager:getOrCreatePanel("UILoginLimitPopUp")
    if panel then
        panel:showToScene()
    end

    self:setLoginAutoEnable(true)
    Client:sendHttpPostRequest(Net.HttpCmd.Login, data, handler(self, self.onLoginCallback))
end

function M:onLoginCallback(response)
    Log.log("登陆返回处理")
    local code, data = Utils.parseResponse(response)

    if code == M.LoginResponseCode.SUCCESS then
        self.mConnectToken = data.token

        if data.guestId and data.guestId ~= "" then
            self.mGuestId = data.guestId
        end

        if data.account then
            self.mAccount = data.account
        end
        local host, port = Utils.parseServerAddress(data.connector)
        self:setHost(host)
        self:setPort(port)
        Log.log("链接服务器")
        Client:initNet(host, port)

        Client:connect(handler(self, self.onConnectCallback))
    else
        Log.log("登陆失败回调")
        self:closeLoginPopUp()
        if self:getLoginType() == Enum.LoginType.Guest then
            self.mGuestId = ""
        end
        DataManager:dispatchMessage(Constant.CustomEvent.LoginResult, {
            code = code,
            data = data
        })
    end
end

function M:onLoginAutoCallback(response)
    Log.log("自动登陆返回处理")
    local code, data = Utils.parseResponse(response)

    if code == M.LoginResponseCode.SUCCESS then
        local host, port = Utils.parseServerAddress(data.connector)
        self:setHost(host)
        self:setPort(port)
        Log.log("链接服务器")
        Client:initNet(host, port)

        Client:connect(handler(self, self.onConnectCallback))
    else
        Log.log("登陆失败回调")
        self:closeLoginPopUp()
        DataManager:dispatchMessage(Constant.CustomEvent.LoginResult, {
            code = code,
            data = data
        })
    end
end

function M:getConnectToken()
    return self.mConnectToken
end

function M:onConnectCallback(state)
    local pushToken = self:getPushToken()
    local system=""
    if DeviceUtils.isWindows() then
        system=""
    elseif DeviceUtils.isIOS() then
        system="ios"
    elseif DeviceUtils.isAndroid() then
        system="android"
    end

    if state then
        local languageType = g_UserData:getSystemLanguage()
        local language = M.Language.zh
        if languageType == Enum.LanguageType.zh_cn then 
            language = M.Language.zh
        elseif languageType == Enum.LanguageType.en then
            language = M.Language.en
        elseif languageType == Enum.LanguageType.zh_tw then 
            language = M.Language.tw
        end
        local driverId = g_UserData:getPanamathDriverId()
        Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_Entry, { token = self.mConnectToken, shareCode = g_shareCode, pushToken = pushToken, system = system, language = language,deviceId = driverId})
    else
        self:closeLoginPopUp()
        DataManager:dispatchMessage(Constant.CustomEvent.LoginResult, {
            code = M.LoginResponseCode.CONNECT_FAIL,
        })

        self:logout()
    end
end

--关闭登录点击遮罩
function M:closeLoginPopUp()
    local panel = UIManager:getPanel("UILoginLimitPopUp")
    if panel then
        panel:closePanel()
    end
end

--修改密码
function M:requestModifyPassword(data)
    local PwdData = {}
    PwdData.token = self.mConnectToken
    PwdData.oldPwd = data.oldPwd
    PwdData.pwd = data.pwd
    PwdData.confirmPwd = data.confirmPwd
    Client:sendHttpPostRequest(Net.HttpCmd.ModifyPwd, PwdData, handler(self, self.onModifyPwdCallback))
end

function M:onModifyPwdCallback(response)
    Log.log("改密返回处理")
    local code, data = Utils.parseResponse(response)

    if code == M.ModifyResponseCode.SUCCESS then
        UIUtils.popToadtByMessageId(Constant.Define.ModifyPasswardSuccess)
        local ModifyPasswordpanel = UIManager:getPanel("UISettingModifyPasswordLayer")
        if ModifyPasswordpanel then 
            ModifyPasswordpanel:closePanel()
        end
        
        self.mPassword = data.pwd
        Preference:setString(Constant.PreferenceKey.PASSWARD, self.mPassword)
    else
        Log.log("改密失败")
        UIUtils.popToadtByMessageId(code)
        if code == M.ModifyResponseCode.OLDPWD_ERROR then
            local ModifyPasswordpanel = UIManager:getPanel("UISettingModifyPasswordLayer")
            if ModifyPasswordpanel then 
                ModifyPasswordpanel:setAccountError()
            end
        end
    end
end

--判断是否只绑定了一个账号
function M:chkIsOnlyBindOneAccount()
    local bindnum = 0
    bindnum = bindnum + (self.bAccountBind and 1 or 0)
    bindnum = bindnum + (self.bPhoneBind and 1 or 0)
    bindnum = bindnum + (self.bFacebookBind and 1 or 0)
    bindnum = bindnum + (self.bGoogleBind and 1 or 0)
    bindnum = bindnum + (self.bAppleBind and 1 or 0)
    bindnum = bindnum + (self.bLineBind and 1 or 0)

    return bindnum == 1
end

function M:getSettingData()
    local data={}
    data.bAccountBind = self.bAccountBind
    data.bPhoneBind = self.bPhoneBind
    data.bFacebookBind = self.bFacebookBind
    data.bGoogleBind = self.bGoogleBind
    data.bAppleBind = self.bAppleBind
    data.bLineBind = self.bLineBind

    return data
end

--获取账号绑定信息
function M:requestAccountBindList()
    local data = {}
    data.token = self.mConnectToken
    Log.info("获取绑定信息")
    Client:sendHttpPostRequest(Net.HttpCmd.getAccountBindList, data, handler(self, self.onGetAccountBindListCallback))
end

function M:onGetAccountBindListCallback(response)
    local code, data = Utils.parseResponse(response)
    if code == M.GeiBindListResponseCode.SUCCESS then
        self:refreshBindAccountList(data)
    else
        Log.log("获取账号绑定信息失败")
    end
end

function M:refreshBindAccountList(data)
    self.bAccountBind = false
    self.bPhoneBind = false
    self.bFacebookBind = false
    self.bGoogleBind = false
    self.bAppleBind = false
    self.bLineBind = false

    if data and not Utils.isEmptyTable(data.bindList) then 
        for k,v in ipairs(data.bindList) do
            if v == g_LoginData.LoginType.Account then
                self.bAccountBind = true
            end

            if v == g_LoginData.LoginType.Phone then
                self.bPhoneBind = true
            end

            if v == g_LoginData.LoginType.FaceBook then
                self.bFacebookBind = true
            end

            if v == g_LoginData.LoginType.Google then
                self.bGoogleBind = true
            end

            if v == g_LoginData.LoginType.Apple then
                self.bAppleBind = true
            end

            if v == g_LoginData.LoginType.Line then
                self.bLineBind = true
            end
        end
    end
    
    if self.bAccountBind then
        g_HotData:removeHot(Enum.redPointSubcategory.accont)
    else
        g_HotData:addHot(Enum.redPointSubcategory.accont)
    end
    g_LoginData:isShotMainHot()
    DataManager:dispatchMessage(Constant.CustomEvent.UISettingAccountLayer_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.UISettingLayer_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.UISettingAccountLayer_refreshBindState)

    if self:getIsBindingAccount() then 
        local panel = UIManager:getPanel("UISettingModifyAccountLayer")
        if panel then
            panel:closePanel()
        end

        local panel = UIManager:getOrCreatePanel("UIClientErrorTipsLayer_0")
        if panel then 
            local TipTitleText = Utils.getTextByTextId(Enum.Text.LoginTitleText)
            local ContentText = Utils.getTextByTextId(Enum.Text.LoginContentText)
            panel:setText(TipTitleText, ContentText)
            panel:showToScene()
        end
        self:setIsBindingAccount(false)
    end
end

--绑定第三方账号
function M:BindAccount(data)
    local binddata = {}
    binddata.token = self.mConnectToken
    binddata.loginType = data.loginType
    binddata.accessToken =data.accessToken
    if data.password then
        binddata.password = data.password
        self.mAccount = binddata.accessToken
        self.mPassword = binddata.password
    end
  
    Client:sendHttpPostRequest(Net.HttpCmd.bindAccount , binddata, handler(self, self.onBindAccountCallBack))
end

--解绑第三方账号
function M:unBindAccount(data)
    local binddata = {}
    binddata.token = self.mConnectToken
    binddata.loginType = data.loginType
  
    Client:sendHttpPostRequest(Net.HttpCmd.unbindAccount , binddata, handler(self, self.onUnBindAccountCallback))
end

--绑定账号回调
function M:onBindAccountCallBack(response)
    local code, data = Utils.parseResponse(response)
    if code == M.GeiBindListResponseCode.SUCCESS then
        self:refreshBindAccountList(data)
    else
        self:setIsBindingAccount(false)
        UIUtils.popToadtByMessageId(code)
        if code == M.RegsiterResponseCode.ACCOUNT_EXIST or code == M.GeiBindListResponseCode.ACCOUNT_EXIST then
            local panel = UIManager:getPanel("UISettingModifyAccountLayer")
            if panel then
                panel:setAccountError()
            end
        end
    end
end

--解绑账号回调
function M:onUnBindAccountCallback(response)
    local code, data = Utils.parseResponse(response)
    if code == 0 then
        self:logoutAndOpenLoginLayer()
        UIUtils.popToadtByMessageId(Constant.Define.UnBindAccountSuccess)
    else
        UIUtils.popToadtByMessageId(code)
    end
end

--删除账号
function M:removeAccount()
    local binddata = {}
    binddata.token = self.mConnectToken
  
    Client:sendHttpPostRequest(Net.HttpCmd.removeAccount , binddata, handler(self, self.onRemoveAccountCallback))
end

--删除账号回调
function M:onRemoveAccountCallback(response)
    local code, data = Utils.parseResponse(response)
    if code == 0 then
        self:clearLoginCacheData()
        self:logoutAndOpenLoginLayer()
        UIUtils.popToadtByMessageId(Constant.Define.RemoveAccountSuccess)
    else
        UIUtils.popToadtByMessageId(code)
    end
end

function M:logout()

    self:setLoginAutoEnable(false)

    -- self:clearLoginCacheData()
    g_UserData:initData()

    Client:close()
end

function M:logoutAndOpenLoginLayer()
    UIManager:closeAllPanel()
    g_GameSettingData:saveSettingDataToLocal()
    g_ChatData:clearAllData()
    g_GameData:clearAllData()
    g_HotData:clearAllData()
    SoundSystemManager:stopAllEffect()
    SoundSystemManager:stopAllVoice()
    self:logout()
    g_SieveData:clearAllData()
    SceneManager:runScene(require("app.scenes.LoginScene").create())
end

function M:isShotMainHot()
    local is=false
    if g_HotData:hasHot(Enum.redPointSubcategory.accont)  then
        is=true
    end

    DataManager:dispatchMessage(Constant.CustomEvent.UpdateHotShow,{type=Enum.mainHotType.set,is=is})
end
-- ========== 网络相关 ========== --
function M:S2C_Entry(data)
    self:writeLoginCacheDataToLocal()

    g_UserData:initData(data)
    if data.userInfo.isFirstLogin then
        --Log.info("111111111111111111111111111")
        g_UserData:AFTrackEvent(Constant.AFEventCompleteRegistration, { { key = Constant.AFEventParamRegistrationMethod, value = self:getLoginType(), type = "string" } })
    end

    Client:setHeartbeat(data.heartbeat)

    -- SceneManager:runScene(require("app.scenes.MainScene").create())

    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_EnterHome, {})

    g_UserData:AFSetCustomerUserID()
    
end

function M:S2C_EnterHome(data)
    self:closeLoginPopUp()
    if not data.inRoom then
        SceneManager:runScene(require("app.scenes.MainScene").create())
    end
end

function M:S2C_Disconnect()
    self:logout()

    local sceneName = SceneManager:getRunScene():getSceneName()
    if sceneName == "LoginScene" then
        self:closeLoginPopUp()
        return
    end

    UIManager:closeAllPanel()

    --UIUtils.popToast("网络连接断开")
    if self.bKick then
        self.bKick = false
    else
        self:setLoginAutoEnable(true)
    end
    

    SceneManager:runScene(require("app.scenes.LoginScene").create())
    -- 隐藏网络连接断开
    -- local panel = UIManager:getOrCreatePanel("UIConnectionErrorLayer")
    -- if panel then
    --     panel:showToScene()
    -- end
end

function M:closeBKick()
    self.bKick = true
end

function M:S2C_kick(data)
    self:closeBKick()
    Client:kickTagIng()
    local   reasonId=data.reasonId
    local   expireTime=data.expireTime
    local TipTitleText = Utils.getTextByTextId(Enum.Text.TitleText)
    local ConfirmText = Utils.getTextByTextId(Enum.Text.ButtonText)
    local ContentText1 = Utils.getTextByTextId(Enum.Text.KICKText1)
    local ContentText2 = Utils.getTextByTextId(Enum.Text.KICKText2)
    local ContentText3 = Utils.getTextByTextId(Enum.Text.KICKText3)
    local nowTime = Utils.getFormatUnixTimeToDate(expireTime)
    local time=nowTime.year.."-"..nowTime.month.."-"..nowTime.day.." "..nowTime.hour..":"..nowTime.minute..";"
    local EnumerationData = DataManager:getTbxData("Enumeration", string.format("BanType%d", reasonId))
    local panel=UIManager:getOrCreatePanel("UIKickPopup")
    if panel then
        panel:setConfirmText(ConfirmText)
        panel:setContentText(ContentText1,Utils.getFormatString(ContentText2,time),Utils.getFormatString(ContentText3,EnumerationData.Desc..";"))
        panel:setTitleText(TipTitleText)
        panel:setConfirmCb(function()
                kz.IAgoraRoomManager:instance():leaveRoom()
                DataManager:dispatchNetMessage("S2C_Disconnect")
            end)
        panel:showToScene()
    end
end

function M:S2C_Heartbeat(data)
    Client:resetHeartbeatTime()
    g_UserData:upDateServerTimesTamp(data.now)
end

return M