local UIPanel = require("app.gui.basegui.UIPanel")

local M = class("UIWalkingLanternNode", UIPanel)

M.GUI_FILE_NAME = "csd.01_11_ActivitiesBulletin.01_11_WalkingLanternLayer.lua"

M.BINDGUIDATANODE = {
    ["Text_1"] = { varname = "walkingText" },
    ["ConnectText_1"] = { varname = "ConnectText_1" },
    ["WalkingLanternPanel"] = { varname = "WalkingLanternPanel" },
    ["ConnectLanternPanel"] = { varname = "ConnectLanternPanel",onClick="onClickEvent"},
}

function M:onClickEvent()
    if self.mData then
        g_GameData:c2sEnterPersonalRoom(self.mData.roomId,self.mData.password)
    end
end

function M:onCreate()
    M.super.onCreate(self)

    self:resetRootNodePosition(cc.p(0, 0))
    self:resetRootNodeAnchorPoint(cc.p(0, 0))

    self:scrollText()
end

function M:scrollText()
    local msgList = g_CommonData:getMsgList()
    if not Utils.isEmptyTable(msgList) then 
        local languageType = g_UserData:getSystemLanguage()
        local msg,data= g_CommonData:getFirstMsg(languageType)
        g_CommonData:removeMsg()
        if 7==data.templateId then
            self:privateMsg(msg,data.data)
        else
            self:publicMsg(msg)
        end
        
    else
        DataManager:dispatchMessage(Constant.CustomEvent.RemoveWalkingLantern)
    end
end

function M:publicMsg(msg)
    self.mData=nil
    self.WalkingLanternPanel:setVisible(true)
    self.ConnectLanternPanel:setVisible(false)

    local func=Utils.CreateRichText
    local pos=string.find(msg,"style",1)
    if pos then
        func=Utils.CreateRichText2
    end
    --创建富文本
    local node,text = func(msg)
    if Utils.isEmptyStr(text) then
        DataManager:dispatchMessage(Constant.CustomEvent.RemoveWalkingLantern)
        return 
    end

    self.walkingText:setVisible(false)
    self.walkingText:setString(text)
    node:setContentSize(self.walkingText:getContentSize())
    node:setAnchorPoint(cc.p(0, 0.5))
    node:setPosition(cc.p(self.WalkingLanternPanel:getContentSize().width, self.WalkingLanternPanel:getContentSize().height / 2))
    self.WalkingLanternPanel:addChild(node)

    local moveDistance = node:getContentSize().width + self.WalkingLanternPanel:getContentSize().width
    local moveSpeed = GSystem.WalkingLanternSpeed
    local duration = moveDistance / moveSpeed

    local scrollAction = cc.Sequence:create(
    cc.MoveBy:create(duration, cc.p(-moveDistance, 0)), 
    cc.CallFunc:create(
        function()
            node:removeFromParent()
            self:scrollText()
        end
    ))
    node:runAction(scrollAction)
end

function M:privateMsg(msg,data)
    self.mData=data
    self.WalkingLanternPanel:setVisible(false)
    self.ConnectLanternPanel:setVisible(true)

    --创建富文本
    local node,text = Utils.CreateRichText(msg)
    if Utils.isEmptyStr(text) then
        DataManager:dispatchMessage(Constant.CustomEvent.RemoveWalkingLantern)
        return 
    end

    self.ConnectText_1:setVisible(false)
    self.ConnectText_1:setString(text)
    node:setContentSize(self.ConnectText_1:getContentSize())
    node:setAnchorPoint(cc.p(0, 0.5))
    node:setPosition(cc.p(self.ConnectLanternPanel:getContentSize().width, self.ConnectLanternPanel:getContentSize().height / 2))
    self.ConnectLanternPanel:addChild(node)

    local moveDistance = node:getContentSize().width + self.ConnectLanternPanel:getContentSize().width
    local moveSpeed = GSystem.WalkingLanternSpeed
    local duration = moveDistance / moveSpeed

    local scrollAction = cc.Sequence:create(
    cc.MoveBy:create(duration, cc.p(-moveDistance, 0)), 
    cc.CallFunc:create(
        function()
            node:removeFromParent()
            self:scrollText()
        end
    ))
    node:runAction(scrollAction)
end

function M:onCleanup()
    M.super.onCleanup(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
end

return M