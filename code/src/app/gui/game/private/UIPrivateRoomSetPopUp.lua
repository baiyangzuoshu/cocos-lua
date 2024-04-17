local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIPrivateRoomSetPopUp", UIPanel)

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_PrivateRoomSetPopUp.lua"

M.BINDGUIDATANODE = {
    ["PrivateRoomNameField"]={varname="PrivateRoomNameField"},
    ["RoomPasswordField"]={varname="RoomPasswordField"},
    ["RoomPasswordNode"]={varname="RoomPasswordNode"},
    ["PrivateRoomNameNode"]={varname="PrivateRoomNameNode"},
    ["RoomAnteBox_1"]={varname="RoomAnteBox_1"},
    ["RoomAnteBox_2"]={varname="RoomAnteBox_2"},
    ["RoomAnteBox_3"]={varname="RoomAnteBox_3"},
    ["RoomAnteBox_4"]={varname="RoomAnteBox_4"},
    ["RoomAnteBox_5"]={varname="RoomAnteBox_5"},
    ["RoomAnteBox_6"]={varname="RoomAnteBox_6"}, 
    ["RoomAntePanel_1"]={varname="RoomAntePanel_1"},
    ["RoomAntePanel_2"]={varname="RoomAntePanel_2"},
    ["RoomAntePanel_3"]={varname="RoomAntePanel_3"},
    ["RoomAntePanel_4"]={varname="RoomAntePanel_4"},
    ["RoomAntePanel_5"]={varname="RoomAntePanel_5"},
    ["RoomAntePanel_6"]={varname="RoomAntePanel_6"}, 
    ["SelectButton_1"]={varname="SelectButton_1",onClick="clickBtnEvent"},
    ["SelectButton_2"]={varname="SelectButton_2",onClick="clickBtnEvent"},
    ["RoomPasswordCopyPanel"]={varname="RoomPasswordCopyPanel",onClick="clickBtnEvent"},
    ["RoomPasswordCopyIcon"]={varname="RoomPasswordCopyIcon"}
}

function M:clickBtnEvent(ref)
    local name=ref:getName()
    if "SelectButton_1"==name then
        self:closePanel()
    elseif  "RoomPasswordCopyPanel"==name  then
        local password=self.editBoxPassword:getText()
        Utils.copyToClipboard(password)
        UIUtils.popToadtByMessageId("1100032")
    elseif "SelectButton_2"==name then
        local name=self.editBoxUser:getText()
        local password=self.editBoxPassword:getText()
        
        if string.len(name)>40 or string.len(name)<1 then
            UIUtils.popToadtByMessageId(1100034)
            return
        end
    
        if (string.len(password)>0) and (string.len(password)>20 or string.len(password)<6) then
            UIUtils.popToadtByMessageId(1100035)
            return
        end
        local roomData=DataManager:getTbxData("Room","RoomType",2)
        local GameType=1
        for i=1,#roomData,1  do
            if  roomData[i].RoomLv==self.RoomLv and GameType==roomData[i].GameType then
                if g_UserData:getGold()<roomData[i].ChipGold then
                    local panel=UIManager:getOrCreatePanel("app.gui.game.private.BoastMiniTipPopUp_1")
                    if panel then
                        panel:setType(2)
                        panel:showToScene()
                    end
                    return
                end

                if self.RoomPasswordNode:isVisible() then
                    UIUtils.popToadtByMessageId(1100037)
                    g_GameData:c2sModifyPersonalRoomInfo(roomData[i]["RoomId"],name,password)
                else
                    g_GameData:c2sCreatePersonalRoom(roomData[i]["RoomType"],roomData[i]["RoomId"],name,password)
                end
                break
            end
        end

        self:closePanel()
    end
end

function M:onCreate()
    M.super.onCreate(self)
    
    self:setShadeShowModel(true,255*0.7)
    self:initEditBoxUser()
    self:initEditBoxPassword()
end

function M:initEditBoxUser()
    self.PrivateRoomNameField:setVisible(false)
    local _x,_y=self.PrivateRoomNameField:getPosition()
    local size=self.PrivateRoomNameField:getContentSize()
    local editName = ccui.EditBox:create(size,"00_01_Common/picture_057.png","00_01_Common/picture_057.png","00_01_Common/picture_057.png",ccui.TextureResType.plistType)
    self.PrivateRoomNameNode:addChild(editName)
    editName:setPosition( cc.p(_x,_y))
    editName:setAnchorPoint(cc.p(0,0.5))
    editName:setFontSize(28)
    editName:setFontName("font/DINAlternate-bold.ttf")
    editName:setInputMode(cc.EDITBOX_INPUT_MODE_SINGLELINE)
    editName:registerScriptEditBoxHandler(handler(self,self.editboxEventHandler))
    self.editBoxUser=editName
end

function M:initEditBoxPassword()
    self.RoomPasswordField:setVisible(false)
    local _x,_y=self.RoomPasswordField:getPosition()
    local size=self.RoomPasswordField:getContentSize()
    local editPassword = ccui.EditBox:create(size,"00_01_Common/picture_057.png","00_01_Common/picture_057.png","00_01_Common/picture_057.png",ccui.TextureResType.plistType)
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
        local password=self.editBoxPassword:getText()
        self.RoomPasswordCopyIcon:setVisible(string.len(password)>0)
        -- 当编辑框失去焦点并且键盘消失的时候被调用
    elseif eventType == "changed" then
        -- 输入内容改变时调用
    elseif eventType == "return" then
        -- 用户点击编辑框的键盘以外的区域，或者键盘的Return按钮被点击时所调用
    end
end

function M:onInit()
    M.super.onInit(self)
    self.editBoxPassword:setText("")
    self.RoomPasswordNode:setVisible(false)
    for i=1,6,1 do
        local node=self[string.format("RoomAnteBox_%d",i)]
        node:setSelected(false)
        node:setTag(i)
    end
    for i=1,6,1 do
        local node=self[string.format("RoomAntePanel_%d",i)]
        node:setTag(i)
        node:addClickEventListener(handler(self,self.clickBoxEvent))
    end
    self.RoomLv=1
    self["RoomAnteBox_1"]:setSelected(true)
    self.editBoxUser:setText(g_UserData:getNickName()..GSystem.PrivateRoomNameTrail)
end

function M:initData(roomName,password,roomId)
    self.RoomPasswordNode:setVisible(true)
    self.editBoxUser:setText(roomName)
    self.editBoxPassword:setText(password)
    local roomData=DataManager:getTbxData("Room","RoomId",roomId)
    local RoomLv=roomData[1].RoomLv
    self:clickBoxEvent(self[string.format("RoomAnteBox_%d",RoomLv)])

    local text=self.editBoxPassword:getText()
    self.RoomPasswordCopyIcon:setVisible(string.len(text)>0)
end

function M:clickBoxEvent(ref)
    local name=ref:getName()
    local tag=ref:getTag()
    
    for i=1,6,1 do
        local node=self[string.format("RoomAnteBox_%d",i)]
        node:setSelected(false)
    end
    self.RoomLv=tag
    self[string.format("RoomAnteBox_%d",tag)]:setSelected(true)
end
function M:onEnter()
    M.super.onEnter(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
   
end

return M