local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("BoastMiniTipPopUp_3", UIPanel)

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_BoastMiniTipPopUp_3.lua"

M.BINDGUIDATANODE = {
    ["ConfirmButton"]={varname="ConfirmButton",onClick="clickBtnEvent"},
    ["CancelButton"]={varname="CancelButton",onClick="clickBtnEvent"},
    ["RoomPasswordField"]={varname="RoomPasswordField"},
    ["RoomPasswordNode"]={varname="RoomPasswordNode"},
}

function M:clickBtnEvent(ref)
    local name=ref:getName()
    if "ConfirmButton"==name then
        local password=self.editBoxPassword:getText()
        if (string.len(password)>0) and (string.len(password)>20 or string.len(password)<6) then
            UIUtils.popToadtByMessageId(57010)
            return
        end
        if self.mRoomID then
            self:closePanel(0)
            g_FriendData:c2sEnterPersonalRoom(self.mRoomID,password)
        else
            g_FriendData:requestWatchFriend(g_GameData:getPrivateFriendUID(),password)
        end
    elseif "CancelButton"==name then
        self:closePanel(0)
    end
end

function M:onCreate()
    M.super.onCreate(self)

    self:setShadeShowModel(true,255*0.7)
    self:initEditBoxPassword()
end

function M:initData(roomId)
    self.mRoomID=roomId
end

function M:initEditBoxPassword()
    self.RoomPasswordField:setVisible(false)
    local _x,_y=self.RoomPasswordField:getPosition()
    local editPassword = ccui.EditBox:create(cc.size(280,100),"00_01_Common/picture_057.png","00_01_Common/picture_057.png","00_01_Common/picture_057.png",ccui.TextureResType.plistType)
    self.RoomPasswordNode:addChild(editPassword)
    editPassword:setPosition( cc.p(_x,_y))
    editPassword:setAnchorPoint(cc.p(0,0.5))
    editPassword:setFontSize(28)
    editPassword:setFontName("font/DINAlternate-bold.ttf")
    editPassword:setInputMode(cc.EDITBOX_INPUT_MODE_SINGLELINE)
    editPassword:registerScriptEditBoxHandler(handler(self,self.editboxEventHandler))
    self.editBoxPassword=editPassword
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
end

function M:onEnter()
    M.super.onEnter(self)

   
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
   
end

return M