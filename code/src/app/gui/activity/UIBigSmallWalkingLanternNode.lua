local UIPanel = require("app.gui.basegui.UIPanel")

local M = class("UIBigSmallWalkingLanternNode", UIPanel)

M.GUI_FILE_NAME = "csd.02_02_GuessSize.02_02_WalkingLanternCell.lua"

M.BINDGUIDATANODE = {
    ["WalkingLanternPanel"] = { varname = "scrollTextPanel" },
    ["Text_1"] = { varname = "walkingText" },
}

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
        local msg,data = g_CommonData:getFirstMsg(languageType)
        g_CommonData:removeMsg()
        if 7==data.templateId then
            DataManager:dispatchMessage(Constant.CustomEvent.RemoveWalkingLantern)
        else
            self:publicMsg(msg)
        end
        
    else
        DataManager:dispatchMessage(Constant.CustomEvent.RemoveWalkingLantern)
    end
end

function M:publicMsg(msg)
    --创建富文本
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
    node:setPosition(cc.p(self.scrollTextPanel:getContentSize().width, self.scrollTextPanel:getContentSize().height / 2))
    self.scrollTextPanel:addChild(node)

    local moveDistance = node:getContentSize().width + self.scrollTextPanel:getContentSize().width
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