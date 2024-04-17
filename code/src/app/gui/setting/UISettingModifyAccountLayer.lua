local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UISettingModifyAccountLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_07_Sitting.01_07_SittingModifyAccountLayer.lua"

M.BINDGUIDATANODE = {
     -- 关闭按钮
    ["ReturnPanel"] = { varname = "Return", onEvent = "onReturnTouch"},
    ["ReturnButton"] = { varname = "ReturnButton"},

    ["AccountTextField_TNT" ]= {varname = "AccountTextField"},
    ["AccountError"] = {varname = "AccountError"},

    ["PasswordTextField_TNT" ]= {varname = "PasswordTextField"},
    ["PasswaordError"] = {varname = "PasswordError"},

    ["PasswaordConfirmTextField" ]= {varname = "PasswaordConfirmTextField"},
    ["PasswaordConfirmError"] = {varname = "PasswordConfirmError"},

    ["ConfirmButton"] = { varname = "ConfirmButton",onClick = "onConfirmButtonClick"},

    ["AccountPanel"]={varname = "AccountPanel",onClick="onClickEvent"},
    ["AccountBg"]={varname="AccountBg"},

    ["PasswordPanel"]={varname = "PasswordPanel",onClick="onClickEvent"},
    ["PasswordBg"]={varname="PasswordBg"},

    ["PasswaordConfirmPanel"]={varname = "PasswaordConfirmPanel",onClick="onClickEvent"},
    ["PasswaordConfirmBg"]={varname="PasswaordConfirmBg"},
}

function M:onClickEvent()
    SoundSystemManager:playSound004()
end

function M:onCreate()
    M.super.onCreate(self)
    self:addPlistResourceMap({"ui/01_06_PersonalCenter/01_06_PersonalCenter_1.plist"})
    self:setShadeShowModel(true)

    self:initEditBox()
end

function M:getNewEditBox(TextField,Bg,Panel)
    TextField:setVisible(false)
    --Bg:setVisible(false)
    local _x,_y=TextField:getPosition()
    local editBox = ccui.EditBox:create(cc.size(TextField:getContentSize().width, 100),"00_01_Common/picture_057.png","00_01_Common/picture_057.png","00_01_Common/picture_057.png",ccui.TextureResType.plistType)
    Panel:addChild(editBox)
    editBox:setPosition( cc.p(_x,_y))
    editBox:setAnchorPoint(cc.p(0,0.5))
    editBox:setFontColor(cc.c3b(255, 255, 255))
    editBox:setFontSize(32)
    editBox:setFontName("font/Default.TTF")
    editBox:setPlaceholderFont("font/Default.TTF",TextField:getFontSize())
    editBox:setPlaceholderFontColor({r = 255, g = 255, b = 255, a = 102})
    editBox:setPlaceHolder(TextField:getPlaceHolder())
    editBox:setMaxLength(12)
    editBox:setInputMode(cc.EDITBOX_INPUT_MODE_SINGLELINE)
    editBox:registerScriptEditBoxHandler(handler(self,self.editboxEventHandler))
    return editBox
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

function M:initEditBox()
    self.editBoxAccount = self:getNewEditBox(self.AccountTextField,self.AccountBg,self.AccountPanel)

    self.editBoxPassword = self:getNewEditBox(self.PasswordTextField,self.PasswordBg,self.PasswordPanel)
    self.editBoxPassword:setInputFlag(cc.EDITBOX_INPUT_FLAG_PASSWORD)

    self.editBoxConfirm = self:getNewEditBox(self.PasswaordConfirmTextField,self.PasswaordConfirmBg,self.PasswaordConfirmPanel)
    self.editBoxConfirm:setInputFlag(cc.EDITBOX_INPUT_FLAG_PASSWORD)
end

function M:onInit()
    M.super.onInit(self)

    self.mAccountErrorDelayTime = 0
    self.mPasswordErrordelayTime = 0
    self.mPasswordConfirmErrordelayTime = 0
    self.AccountError:setVisible(false)
    self.PasswordError:setVisible(false)
    self.PasswordConfirmError:setVisible(false)
    self.ReturnButton:setTouchEnabled(false)

    self.AccountTextField:setPlaceHolder(Utils.getTextByTextId(Enum.Text.AccountInputPlaceHolder))
    self.editBoxAccount:setPlaceHolder(self.AccountTextField:getPlaceHolder())

    self.PasswordTextField:setPlaceHolder(Utils.getTextByTextId(Enum.Text.PasswordInputPlaceHolder))
    self.editBoxPassword:setPlaceHolder(self.PasswordTextField:getPlaceHolder())
end

function M:onEnter()
    M.super.onEnter(self)

    self.editBoxAccount:setText("")
    self.editBoxPassword:setText("")
    self.editBoxConfirm:setText("")
end

function M:OnUpdate(dt)
    self.mAccountErrorDelayTime = self.mAccountErrorDelayTime + dt
    if self.mAccountErrorDelayTime > 2 and self.AccountError:isVisible() then 
        self.AccountError:setVisible(false)
        self.mAccountErrorDelayTime = 0
    end

    self.mPasswordErrordelayTime = self.mPasswordErrordelayTime + dt
    if self.mPasswordErrordelayTime > 2 and self.PasswordError:isVisible() then 
        self.PasswordError:setVisible(false)
        self.mPasswordErrordelayTime = 0
    end

    self.mPasswordConfirmErrordelayTime = self.mPasswordConfirmErrordelayTime + dt
    if self.mPasswordConfirmErrordelayTime > 2 and self.PasswordConfirmError:isVisible() then 
        self.PasswordConfirmError:setVisible(false)
        self.mPasswordConfirmErrordelayTime = 0
    end
end

function M:setAccountError()
    self.mAccountErrorDelayTime = 0
    self.AccountError:setVisible(true)
end

function M:setPasswordError()
    self.mPasswordErrordelayTime = 0
    self.PasswordError:setVisible(true)
end

function M:setPasswordConfirmError()
    self.mPasswordConfirmErrordelayTime = 0
    self.PasswordConfirmError:setVisible(true)
end

function M:getAccountTextField()
    return Utils.transformInputStr(self.editBoxAccount:getText())
end

function M:getPasswordTextField()
    return Utils.transformInputStr(self.editBoxPassword:getText())
end

function M:getPasswordConfirmTextField()
    return Utils.transformInputStr(self.editBoxConfirm:getText())
end

function M:onConfirmButtonClick(ref)
    local PasswordConfirm = self:getPasswordConfirmTextField()
    local AccountText = self:getAccountTextField()
    local Password = self:getPasswordTextField()

    if Utils.isEmptyStr(AccountText) then 
        UIUtils.popToadtByMessageId(Constant.Define.AccountIsNotNull)
        self:setAccountError()
        return;
    end

    if Utils.isEmptyStr(Password) then 
        UIUtils.popToadtByMessageId(Constant.Define.PasswardTextIsNull)
        self:setPasswordError()
        return
    end

    if Utils.isEmptyStr(PasswordConfirm) then 
        UIUtils.popToadtByMessageId(Constant.Define.PasswardTextIsNull)
        self:setPasswordConfirmError()
        return
    end
    
    if not (Utils.isNumberAndAbc_Only(AccountText,true)) or string.len(AccountText)>12 or string.len(AccountText)<4 then 
        UIUtils.popToadtByMessageId(Constant.Define.AccountSpecial)
        self:setAccountError()
        return
    end

    if not (Utils.isNumberAndAbcOnly(Password,true)) or string.len(Password)>12 or string.len(Password)<4 then
        UIUtils.popToadtByMessageId(Constant.Define.PasswardIsLongOrShort)
        self:setPasswordError()
        return;
    end

    if Password ~= PasswordConfirm then
        UIUtils.popToadtByMessageId(Constant.Define.TwicePasswardIsNotSame)
        self:setPasswordConfirmError()
        return 
    end

    local PwdData = {}
    PwdData.loginType = g_LoginData.LoginType.Account
    PwdData.accessToken = AccountText
    PwdData.password = Password

    g_LoginData:setIsBindingAccount(true)
    g_LoginData:BindAccount(PwdData)
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

return M