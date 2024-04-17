local UIPanel = require("app.gui.basegui.UIPanel")

local M = class("UIActivitiesLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_11_ActivitiesBulletin.01_11_ActivitiesLayer.lua"

M.BINDGUIDATANODE = {
    ["ActivitiesPanel"]={varname="contentPanel"},
    ["ActivityImage_IVT"]={varname="ActivityImage_IVT"},
    ["NoticeImage_IVT"]={varname="NoticeImage_IVT"},
    ["ActivityButton"]={varname="ActivityButton",onClick="onClickEvent"},
    ["NoticeButton"]={varname="NoticeButton",onClick="onClickEvent"},
    ["ReturnPanel"] = { varname = "ReturnPanel", onEvent = "onTouchReturnEvent"},
    ["ReturnButton"]={varname="ReturnButton"},
    ["Bg"]={varname="Bg"}
}

function M:onTouchReturnEvent(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        local scaleToStart = cc.ScaleTo:create(0.05, 0.9)
        local scaleToEnd = cc.ScaleTo:create(0.05, 1.0)
        self.ReturnButton:runAction(cc.Sequence:create(scaleToStart, scaleToEnd, cc.CallFunc:create(
            function ()
                self:closePanel()
                DataManager:dispatchMessage("mainlayerEnterAnimation", {})
            end
        )))
    end
end

function M:onClickEvent(ref)
    local   name=ref:getName()
    if "ActivityButton"==name then
        self:switchBtn(0)
    elseif "NoticeButton"==name then
        self:switchBtn(1)
    end
end

function M:switchBtn(type)
    self.type=type
    if 0==type then
        self.ActivityButton:setBrightStyle(ccui.BrightStyle.highlight)
        self.NoticeButton:setBrightStyle(ccui.BrightStyle.normal)
        self:updateActivity()
    elseif 1==type then
        self.ActivityButton:setBrightStyle(ccui.BrightStyle.normal)
        self.NoticeButton:setBrightStyle(ccui.BrightStyle.highlight)
        self:updateNotice()
    end
end

function M:showTip()
    self.ActivityImage_IVT:setVisible(0==self.type)
    self.NoticeImage_IVT:setVisible(1==self.type)
    self.ActivityListView:setVisible(0==self.type)
    self.NoticeListView:setVisible(1==self.type)
end

function M:updateActivity()
    self:showTip()
    self.ActivityListView:removeAllChildren()
    local Activity=DataManager:getTbxData("Activity","ActivityId",1)
    for _,v in pairs(Activity) do
        local item = UIManager:createPanelOnly("ActivitiesCell")
        item:refreshUI(v)
        local panel = ccui.Layout:create()
        self.ActivityListView:pushBackCustomItem(panel)
        local size = item:getContentSize()
        panel:setContentSize(size)

        item:setAnchorPoint(cc.p(0.5,0.5))
        panel:addChild(item)
    end
end

function M:updateNotice()
    self:showTip()
    self.NoticeListView:removeAllChildren()
    for i=1,20,1 do
        local item = UIManager:createPanelOnly("ActivitiesNoiceCell")

        local panel = ccui.Layout:create()
        self.NoticeListView:pushBackCustomItem(panel)
        local size = item:getContentSize()
        panel:setContentSize(size)

        item:setAnchorPoint(cc.p(0.5,0.5))
        panel:addChild(item)
    end
end

function M:adaptationPanelSize()
    local size=cc.Director:getInstance():getWinSize()
    local friangeTop = g_GameSettingData:getFringeScreenTop()
    local dyw = (size.height - 1280) / 2
    
    if dyw > 0 then
        local addHeight=dyw-friangeTop+dyw
        local panelSize=self.contentPanel:getContentSize()
        local y=self.contentPanel:getPositionY()
        self.contentPanel:setContentSize(cc.size(panelSize.width,panelSize.height+addHeight))
        self.contentPanel:setPositionY(y-dyw)
    end
end

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)
    self:adaptationPanelSize()
    self.contentPanel:setTouchEnabled(false)
    -- self.ActivityButton:setVisible(true)
    -- self.ActivityButton:setTouchEnabled(true)
    -- self.NoticeButton:setVisible(true)
    -- self.NoticeButton:setTouchEnabled(true)

    local size = self.contentPanel:getContentSize()
    self.ActivityListView = ccui.ListView:create()
    self.ActivityListView:setContentSize(size)
    self.ActivityListView:setDirection(ccui.ListViewDirection.vertical)
    self.ActivityListView:setBounceEnabled(true)
    self.ActivityListView:setScrollBarEnabled(false)
    self.ActivityListView:setItemsMargin(10)
    self.ActivityListView:setPosition(cc.p(0, 0))
    self.ActivityListView:setAnchorPoint(cc.p(0, 0))
    self.contentPanel:addChild(self.ActivityListView)

    self.NoticeListView = ccui.ListView:create()
    self.NoticeListView:setContentSize(size)
    self.NoticeListView:setDirection(ccui.ListViewDirection.vertical)
    self.NoticeListView:setBounceEnabled(true)
    self.NoticeListView:setScrollBarEnabled(false)
    self.NoticeListView:setItemsMargin(10)
    self.NoticeListView:setPosition(cc.p(0, 0))
    self.NoticeListView:setAnchorPoint(cc.p(0, 0))
    self.contentPanel:addChild(self.NoticeListView)

    self:switchBtn(0)

    self.ReturnButton:setTouchEnabled(false)
end

function M:onInit()
    M.super.onInit(self)
    self:showTip()
end

return M