local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIGuideWinAwardLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_16_NoviceGuide.01_16_GuideWinAwardLayer.lua"

M.BINDGUIDATANODE = {
    ["GetButton"]={onClick="onClickEvent"},
    ["AwardContentPanel"]={varname="AwardContentPanel"}
}

function M:onClickEvent()
    local ids={}
    table.insert(ids,self.m_id)

    g_HotData:c2sGetGuideGroupRewards(ids)

    self:closePanel()
end

function M:refreshData(data)
    self.m_id=data.id
    self.AwardContentPanel:removeAllChildren()

    local len=#data.rewards
    local offestX=120/2*(len+1)
    for i,v in ipairs(data.rewards) do
        local Item=DataManager:getTbxData("Item",v.itemId)
        local netData = {}
        netData.itemShowType = Item.ItemType
        netData.itemId = Item.ItemId
        netData.itemNum =v.itemNum
        
        local itemInfo = require("app.bean.ItemInfo").new(netData, Item.ItemType)
        local item = UIManager:createPanelOnly("UIItem")
        item:setItemInfo(itemInfo)
        item:setPropFrameVisible(false)
        item:resetCenterPosition()
        item:setPosition(cc.p(120*i+self.AwardContentPanel:getContentSize().width/2-offestX,60+30))
        self.AwardContentPanel:addChild(item)
    end
end

function M:onCreate()
    M.super.onCreate(self)

    self:setShadeShowModel(true,125)
end

function M:onInit()
    M.super.onInit(self)
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:OnUpdate(dt)
    
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
end

function M:onCleanup()
    M.super.onCleanup(self)
end

return M