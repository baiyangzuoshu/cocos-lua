local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIMoreOperateLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_06_PersonalCenter.01_06_PersonalCenterMorePopUp.lua"

M.BINDGUIDATANODE = {
    ["BalckButton"] = {varname = "BalckButton", onClick = "onBalckBtnClick"},
    ["DeleteButton"] = {varname = "DeleteButton", onClick = "onDeleteBtnClick"},

    ["InteractionPopups"] = { varname = "InteractionPopups"},

    ["BlackText_TT"] = { varname = "BlackText"},
    ["BlackText_1_TT"] = { varname = "BlackText_1"},
}

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)

    self:initOutClickableArea()
end

function M:initOutClickableArea()
    local function onOutOfQuickBoxClick()
        self:closePanel()
    end

    UIUtils.addClickableNode(self.InteractionPopups, nil, onOutOfQuickBoxClick)
end

function M:onInit()
    M.super.onInit(self)
end

function M:setFriendUid(uid)
    self.mFriendUid = uid
end

function M:onEnter()
    M.super.onEnter(self)

    self:refreshUI()
end

function M:refreshUI()
    if g_FriendData:CheckIsMyFriendByUid(self.mFriendUid) then 
        self.DeleteButton:setTouchEnabled(true)
        self.DeleteButton:setBright(true)
    else
        self.DeleteButton:setTouchEnabled(false)
        self.DeleteButton:setBright(false)
    end

    if g_FriendData:checkIsInBlackList(self.mFriendUid) then 
        self.BlackText:setVisible(false)
        self.BlackText_1:setVisible(true)
    else
        self.BlackText_1:setVisible(false)
        self.BlackText:setVisible(true)
    end
end

function M:setBalckCb(cb)
    self.m_BalckCb = cb
end

function M:setDeleteCb(cb)
    self.m_DeleteCb = cb
end

function M:onBalckBtnClick(ref)
    if self.m_BalckCb then
        self.m_BalckCb()
    end
end

function M:onDeleteBtnClick(ref)
    if self.m_DeleteCb then
        self.m_DeleteCb()
    end
end

function M:OnClosePanelEvent()
    self:closePanel()
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
    
    self:doRegEvent(Constant.CustomEvent.OnClosePanelEvent, "OnClosePanelEvent")
end


return M