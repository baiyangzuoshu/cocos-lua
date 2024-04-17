local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIModifyDescLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_06_PersonalCenter.01_06_ModifySignatureLayer.lua"

M.BINDGUIDATANODE = {
    ["ConfirmButton"] = { varname = "ConfirmButton", onClick = "onConfirmButtonClick" },
    ["CancelButton"] = { varname = "CancelButton", onClick = "onCancelButtonClick" },

    ["ContentTextField"] = { varname = "DescTextField", onEvent = "onTouchDescTextField"},
    ["ContentBg"]={varname = "ContentBg"},
    ["Content"]={varname = "Content"},
    ["ContentErrorBg"]={varname = "errorBg"},
}

function M:onCreate()
    M.super.onCreate(self)

    self:setShadeShowModel(true)

    self:initEditBox()
    local size = cc.Director:getInstance():getWinSize()
    self:resetRootNodePosition(cc.p(size.width/2, size.height / 2+50))
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.CheckDescError, "isShowErrorBg")
    self:doRegEvent(Constant.CustomEvent.ClosePersonalInfoPanel, "onClosePanelEvent")
end

function M:onClosePanelEvent()
    self:closePanel()
end

function M:initEditBox()
    self.DescTextField:setVisible(false)
    --self.ContentBg:setVisible(false)
    local _x,_y=self.DescTextField:getPosition()
    local editDesc = ccui.EditBox:create(self.DescTextField:getContentSize(),"00_01_Common/picture_057.png","00_01_Common/picture_057.png","00_01_Common/picture_057.png",ccui.TextureResType.plistType)
    self.Content:addChild(editDesc)
    editDesc:setPosition( cc.p(_x+8,_y))
    editDesc:setAnchorPoint(cc.p(0,1))
    editDesc:setFontColor(cc.c3b(255, 255, 255))
    editDesc:setFontSize(24)
    editDesc:setFontName("font/Default.TTF")
    editDesc:setMaxLength(GSystem.SignatureLimitNumber)
    editDesc:setInputMode(cc.EDITBOX_INPUT_MODE_ANY)
    editDesc:registerScriptEditBoxHandler(handler(self,self.editboxEventHandler))
    self.editBoxDesc=editDesc
end

function M:editboxEventHandler(eventType,str)
    if eventType == "began" then
        SoundSystemManager:playSound004()
        -- -- 点击编辑框,输入法显示
        -- local size = cc.Director:getInstance():getWinSize()
        -- self:resetRootNodePosition(cc.p(0, size.height / 3 + 50))
    elseif eventType == "ended" then
        -- 当编辑框失去焦点并且键盘消失的时候被调用
        -- self:runAction(cc.Sequence:create(
        --     cc.DelayTime:create(0.15),
        --     cc.CallFunc:create(
        --         function()
        --             local size = cc.Director:getInstance():getWinSize()
        --             self:resetRootNodePosition(cc.p(0, size.height / 4 + 50))
        --         end
        --     )
        -- ))
    elseif eventType == "changed" then
        -- 输入内容改变时调用
    elseif eventType == "return" then
        -- 用户点击编辑框的键盘以外的区域，或者键盘的Return按钮被点击时所调用
    end
end

function M:onInit()
    --local size = cc.Director:getInstance():getWinSize()
    --self:resetRootNodePosition(cc.p(0, size.height / 4 + 50))
    --self.DescTextField:setString(g_UserData:getSlogan())
    self.delayTime = 0
    self.errorBg:setVisible(false)
    self.editBoxDesc:setText(g_UserData:getSlogan())
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:getTextInput()
    return  Utils.transformInputStr(self.editBoxDesc:getText())
    --return Utils.getInputValue(self.DescTextField)
end

function M:onTouchDescTextField(data)
    -- if data.event == "end" then 
    --     local size = cc.Director:getInstance():getWinSize()
    --     self:resetRootNodePosition(cc.p(0, size.height / 3 + 50))
    -- end
end

function M:OnUpdate(dt)
    self.delayTime = self.delayTime + dt
    if self.delayTime > 2 and self.errorBg:isVisible() then 
        self.errorBg:setVisible(false)
        self.delayTime = 0
    end
end

function M:isShowErrorBg()
    self.delayTime = 0
    self.errorBg:setVisible(true)
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