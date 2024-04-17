local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UISettingAccountLayer", UIPanel)
local targetPlatform = cc.Application:getInstance():getTargetPlatform()
M.GUI_FILE_NAME = "csd.01_07_Sitting.01_07_SittingAccountLayer.lua"

M.BINDGUIDATANODE = {
    -- 关闭按钮
    ["ReturnPanel"] = { varname = "Return", onEvent = "onReturnTouch"},
    ["ReturnButton"] = { varname = "ReturnButton"},

    -- 账号管理
    ["AccountPanel"] = { varname = "AccountPanel",onEvent = "onAccountPanelTouch"},
    ["AccountSittingText_TT" ]= {varname = "AccountNum"},
    ["AccountIcon"] = {varname = "AccountIcon"},

    ["DeleteAccountPanel"] = { varname = "DeleteAccountPanel",onEvent = "onDeleteAccountPanelTouch"},

    ["PasswordPanel"] = { varname = "PasswordPanel",onEvent = "onPasswordPanelTouch"},
    ["PasswordSitting_1_Text_TT" ]= {varname = "PasswordSittingText_1"},
    ["PasswordSitting_2_Text_TT" ]= {varname = "PasswordSittingText_2"},
    ["PasswordIcon"] = {varname = "PasswordIcon"},
    
    --社交账号绑定
    ["FacebookPanel"] = { varname = "FacebookPanel",onEvent = "onFacebookPanelTouch"},
    ["FacebookBind" ]= {varname = "FacebookBind"},
    ["FacebookUnbind" ]= {varname = "FacebookUnbind"},
    
    ["GooglePanel"] = { varname = "GooglePanel",onEvent = "onGooglePanelTouch"},
    ["GoogleBind" ]= {varname = "GoogleBind"},
    ["GoogleUnbind" ]= {varname = "GoogleUnbind"},

    ["ApplePanel"] = { varname = "ApplePanel",onEvent = "onApplePanelTouch"},
    ["AppleBind" ]= {varname = "AppleBind"},
    ["AppleUnbind" ]= {varname = "AppleUnbind"},

    ["LinePanel"] = { varname = "LinePanel",onEvent = "onLinePanelTouch"},
    ["LineBind" ]= {varname = "LineBind"},
    ["LineUnbind" ]= {varname = "LineUnbind"},

    ["SittingStrip_5"] = {varname = "SittingStrip_5"},
    ["SittingStrip_6"] = {varname = "SittingStrip_6"},
    ["SittingStrip_7"] = {varname = "SittingStrip_7"},

    ["AccountTipDotIcon"]={varname="AccountTipDotIcon"},
}

M.UNBINDERRORCODE = 56013

function M:refreshHot()
    self.AccountTipDotIcon:setVisible(g_HotData:hasHot(Enum.redPointSubcategory.accont))
end

function M:onCreate()
    M.super.onCreate(self)

    self.PasswordSittingText_1:setOpacity(102)
    self:setShadeShowModel(true)
end

function M:onInit()
    M.super.onInit(self)
    self.ReturnButton:setTouchEnabled(false)

    self.bAccountBind = false
    self.bPhoneBind = false
    self.bFacebookBind = false
    self.bGoogleBind = false
    self.bAppleBind = false

    self:setBindState()
    self:refreshHot()
    self.SittingStrip_7:setVisible(false)
    if cc.PLATFORM_OS_ANDROID == targetPlatform then
        self.ApplePanel:setVisible(false)
        self.SittingStrip_6:setVisible(false)
    elseif cc.PLATFORM_OS_IPHONE == targetPlatform then
        self.GooglePanel:setVisible(false)
        self.SittingStrip_5:setVisible(false)
        self.ApplePanel:setPosition(cc.p(self.GooglePanel:getPositionX(),self.GooglePanel:getPositionY()))
        self.SittingStrip_6:setPosition(cc.p(self.SittingStrip_5:getPositionX(),self.SittingStrip_5:getPositionY()))
    else
        self.ApplePanel:setVisible(false)
        self.GooglePanel:setVisible(true)
    end

    -- self.LinePanel:setVisible(false)
end

function M:setBindState()
    if self.bAccountBind then
        local mAccount = g_LoginData:getAccount();
        self.AccountNum:setString(mAccount)
        
        self.AccountIcon:setVisible(false);
        self.AccountPanel:setTouchEnabled(false)
        self.PasswordPanel:setTouchEnabled(true)
        self.PasswordSittingText_1:setVisible(false);
        self.PasswordSittingText_2:setVisible(true);
        self.PasswordIcon:setOpacity(255)
    else
        self.AccountIcon:setVisible(true);
        self.AccountPanel:setTouchEnabled(true)
        self.PasswordPanel:setTouchEnabled(false)
        self.PasswordSittingText_1:setVisible(true);
        self.PasswordSittingText_2:setVisible(false);
        self.PasswordIcon:setOpacity(102)
    end

    self.FacebookBind:setVisible(self.bFacebookBind)
    self.FacebookUnbind:setVisible(not self.bFacebookBind)

    self.GoogleBind:setVisible(self.bGoogleBind)
    self.GoogleUnbind:setVisible(not self.bGoogleBind)

    self.AppleBind:setVisible(self.bAppleBind)
    self.AppleUnbind:setVisible(not self.bAppleBind)

    self.LineBind:setVisible(self.bLineBind)
    self.LineUnbind:setVisible(not self.bLineBind)
end

function M:refreshBindState()
    local data=g_LoginData:getSettingData()
    self.bAccountBind = data.bAccountBind
    self.bPhoneBind = data.bPhoneBind
    self.bFacebookBind = data.bFacebookBind
    self.bGoogleBind = data.bGoogleBind
    self.bAppleBind = data.bAppleBind
    self.bLineBind = data.bLineBind

    self:setBindState()
end

function M:onEnter()
    M.super.onEnter(self)

    self:refreshBindState()
end

function M:onGetAccountBindListCallback(data)
    self.bAccountBind = false
    self.bPhoneBind = false
    self.bFacebookBind = false
    self.bGoogleBind = false
    self.bAppleBind = false
    self.bLineBind = false
    if data and not Utils.isEmptyTable(data.bindList) then 
        for k,v in ipairs(data.bindList) do
            if v == g_LoginData.LoginType.Account then
                self.bAccountBind = true;
            end

            if v == g_LoginData.LoginType.Phone then
                self.bPhoneBind = true;
            end

            if v == g_LoginData.LoginType.FaceBook then
                self.bFacebookBind = true;
            end

            if v == g_LoginData.LoginType.Google then
                self.bGoogleBind = true;
            end

            if v == g_LoginData.LoginType.Apple then
                self.bAppleBind = true;
            end

            if v == g_LoginData.LoginType.Line then
                self.bLineBind = true;
            end
        end
    end

    self:setBindState()
end

function M:onAccountPanelTouch(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        local panel = UIManager:getOrCreatePanel("UISettingModifyAccountLayer")
        if panel then 
            panel:showToScene()
        end
    end
end

function M:onDeleteAccountPanelTouch(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        local panel = UIManager:getOrCreatePanel("UIClientErrorTipsLayer_2")
        if panel then 
            local TipTitleText = Utils.getTextByTextId(Enum.Text.netTile)
            local ContentText = Utils.getTextByTextId(Enum.Text.ChkDeleteText2)
            local ConfirmText = Utils.getTextByTextId(Enum.Text.ContinueText)
            local CancelText = Utils.getTextByTextId(Enum.Text.BlackCancle)
            panel:setText(TipTitleText, Utils.getFormatString(ContentText,name), ConfirmText, CancelText)
            panel:showToScene()
            panel:setConfirmCb(
                function ()
                    local panel = UIManager:getOrCreatePanel("UISignOutAgreementLayer")
                    if panel then 
                        panel:showToScene()
                    end
                end
            )
        end
    end
end

function M:onPasswordPanelTouch(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        if self.bAccountBind then
            local panel = UIManager:getOrCreatePanel("UISettingModifyPasswordLayer")
            if panel then 
                panel:showToScene()
            end
        -- else
        --     local panel = UIManager:getOrCreatePanel("UISettingModifyAccountLayer")
        --     if panel then 
        --         panel:showToScene()
        --     end
        end
    end
end

function M:onFacebookPanelTouch(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        if self.bFacebookBind then
            self:onUnBindAccount(g_LoginData.LoginType.FaceBook,"FaceBook")
        else
            g_LoginData:loginByFacebook()
        end
    end
end
function M:onGooglePanelTouch(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        if self.bGoogleBind then
            self:onUnBindAccount(g_LoginData.LoginType.Google,"Google")
        else
            g_LoginData:loginByGoogle()
        end
    end
end
function M:onApplePanelTouch(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        if self.bAppleBind then
            self:onUnBindAccount(g_LoginData.LoginType.Apple,"Apple")
        else
            g_LoginData:loginByApple()
        end
    end
end
function M:onLinePanelTouch(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        if self.bLineBind then
            self:onUnBindAccount(g_LoginData.LoginType.Line,"Line")
        else
            g_LoginData:LineLogout()
            g_LoginData:loginByLine()
        end
    end
end

function M:onUnBindAccount(logintype,name)
    if g_LoginData:chkIsOnlyBindOneAccount() then
        local panel = UIManager:getOrCreatePanel("UICommonMediumTipPopUp")
        if panel then 
            local TipTitleText = Utils.getTextByTextId(Enum.Text.netTile)
            local ContentText = Utils.getTextByTextId(Enum.Text.ChkDeleteText)
            local ConfirmText = Utils.getTextByTextId(Enum.Text.ContinueText)
            local CancelText = Utils.getTextByTextId(Enum.Text.BlackCancle)
            panel:setText(TipTitleText, Utils.getFormatString(ContentText,name), ConfirmText, CancelText)
            panel:showToScene()
            panel:setConfirmCb(
                function ()
                    local panel = UIManager:getOrCreatePanel("UISignOutAgreementLayer")
                    if panel then 
                        panel:showToScene()
                    end
                end
            )
        end

        return
    end
    -- if not self.bAccountBind then
    --     UIUtils.popToadtByMessageId(M.UNBINDERRORCODE)
    --     return
    -- end
    
    local panel = UIManager:getOrCreatePanel("UISettingUnbindPopUp")
    if panel then 
        panel:showToScene()
        panel:setTipContentText(name)
        panel:setConfirmCb(
            function ()
                g_LoginData:unBindAccount({loginType = logintype})
            end
        )
    end
end

function M:onReturnTouch(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        local scaleToStart = cc.ScaleTo:create(0.05, 0.9)
        local scaleToEnd = cc.ScaleTo:create(0.05, 1.0)
        self.ReturnButton:runAction(cc.Sequence:create(scaleToStart, scaleToEnd, cc.CallFunc:create(
            function ()
                self:closePanel()
            end
        )))
    end
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.UISettingAccountLayer_refreshHot, "refreshHot")
    self:doRegEvent(Constant.CustomEvent.UISettingAccountLayer_refreshBindState, "refreshBindState")
    
end

return M