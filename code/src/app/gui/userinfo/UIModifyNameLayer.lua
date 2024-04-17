local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIModifyNameLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_06_PersonalCenter.01_06_ModifyNameLayer.lua"

M.BINDGUIDATANODE = {
    ["ConfirmButton"] = { onClick = "onConfirmButtonClick" },
    ["CancelButton"] = { onClick = "onCancelButtonClick" },
    ["NameTextField"] = { varname = "NameTextField", onEvent = "onTextFieldEvent" },
    ["NamePanel"]={varname = "NamePanel"},
    ["NameBg"]={varname="NameBg"},

    ["Error"] = { varname = "ErrorTip"},

    ["FirstText_TT"] = { varname = "FirstText"},
    ["Diamond"] = { varname = "Diamond"},
}

function M:onCreate()
    M.super.onCreate(self)

    self:setShadeShowModel(true)
    self:initEditBox()
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.CheckUserNameExist, "IsUserNameExist")
    self:doRegEvent(Constant.CustomEvent.ClosePersonalInfoPanel, "onClosePanelEvent")
end

function M:onClosePanelEvent()
    self:closePanel()
end

function M:initEditBox()
    self.NameTextField:setVisible(false)
    local _x,_y=self.NameTextField:getPosition()
    local editName = ccui.EditBox:create(cc.size(396,100),"00_01_Common/picture_057.png","00_01_Common/picture_057.png","00_01_Common/picture_057.png",ccui.TextureResType.plistType)
    self.NamePanel:addChild(editName)
    editName:setPosition( cc.p(_x,_y))
    editName:setAnchorPoint(cc.p(0,0.5))
    editName:setFontColor(cc.c3b(255, 255, 255))
    editName:setFontSize(32)
    editName:setFontName("font/Default.TTF")
    editName:setInputMode(cc.EDITBOX_INPUT_MODE_SINGLELINE)
    editName:registerScriptEditBoxHandler(handler(self,self.editboxEventHandler))
    self.editBoxName=editName
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
    self.editBoxName:setText("")
    self.ErrorTip:setVisible(false)
    self.delayTime = 0
    self.FirstText:setVisible(not g_UserData:getIsChangeNickName())
    self.Diamond:setVisible(g_UserData:getIsChangeNickName())
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:getTextInput()
    return Utils.transformInputStr(self.editBoxName:getText())
end

function M:IsUserNameExist()
    self.delayTime = 0
    self.ErrorTip:setVisible(true)
    self.editBoxName:setText(self:getTextInput())
end

function M:OnUpdate(dt)
    self.delayTime = self.delayTime + dt
    if self.delayTime > 2 and self.ErrorTip:isVisible() then 
        self.ErrorTip:setVisible(false)
        self.delayTime = 0
    end
end

function M:onTextFieldEvent(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
    end
end

function M:setCancelCb(cb)
    self.m_cancelCb = cb
end

function M:setConfirmCb(cb)
    self.m_confirmCb = cb
end

function M:onCancelButtonClick(ref)
    if self.m_cancelCb then
        self.m_cancelCb()
    end
    self:closePanel()
end

function M:onConfirmButtonClick(ref)
    if self.m_confirmCb then
        self.m_confirmCb()
    end
end

return M