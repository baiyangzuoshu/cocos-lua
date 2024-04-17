local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIMainFriendsList", UIPanel)

M.GUI_FILE_NAME = "csd.01_02_Main.01_02_MainFriendsList.lua"

M.BINDGUIDATANODE = {
    ["FriendsList_2"]={varname="FriendsList_2"},
    ["ListContentPanel_2"]={varname="ListContentPanel_2",onClick="onClickTo"},
    ["ListContentPanel_3"]={varname="ListContentPanel_3"},
    ["OnlineText_TT"]={varname="OnlineText_TT"},
    ["RetractPanel"]={varname="backPanel",onClick="onClickBack"},
    ["UnfoldPanel"]={varname="toPanel",onClick="onClickTo"},
    ["InteractionPopUp_2"]={varname="InteractionPopUp_2"}
}

function M:onClickBack()
    if self.playTime>0 or 1==self.type then return end
    SoundSystemManager:playSound004()

    self.playTime=60*1
    self.backPanel:setVisible(false)
    self.toPanel:setVisible(true)
    self.type=1
    for _,v in ipairs(self.items) do
        v:playAction(self.type)
    end
    
    self:runTimelineAnimation("ReduceAnimation",false)

    DataManager:dispatchMessage(Constant.CustomEvent.mainIsVisibleFriendPanel,{is=false})

    self.friendListView2:setVisible(true)
    self.friendListView:setVisible(false)
end

function M:onClickTo()
    if self.playTime>0 or 2==self.type or self.scrollActionTime>0 then return end
    SoundSystemManager:playSound004()
    
    self.playTime=60*1
    self.backPanel:setVisible(true)
    self.toPanel:setVisible(false)
    self.type=2
    for _,v in ipairs(self.items) do
        v:playAction(self.type)
    end

    self:runTimelineAnimation("ExtendAnimation",false)
    self.friendListView:setVisible(true)
    self.friendListView2:runAction(cc.Sequence:create(cc.DelayTime:create(0.4),cc.CallFunc:create(function()
        self.friendListView2:setVisible(false)
    end)))
    DataManager:dispatchMessage(Constant.CustomEvent.mainIsVisibleFriendPanel,{is=true})
end

function M:initInteractionPopUpOutClickableArea()
    local function onOutOfQuickBoxClick()
        if 2==self.type then
            self:onClickBack()
        end
    end

    UIUtils.addClickableNode(self.InteractionPopUp_2, nil, onOutOfQuickBoxClick)
end

function M:init()
    self.FriendsList_2:setPositionX(-254)
    self.backPanel:setVisible(false)
    self.toPanel:setVisible(true)
    self.type=1
    self.playTime=0
    self.scrollActionTime=0
end

function M:onCreate()
    M.super.onCreate(self)

    self.ListContentPanel_3:setTouchEnabled(false)

    self:retainResource()
    self.items={}
    self.num=0
    self.OnlineText=self.OnlineText_TT:getString()
    self:init()
    
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.Head))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.HeadBox))

    local size = self.ListContentPanel_2:getContentSize()
    self.friendListView = ccui.ListView:create()
    self.friendListView:setContentSize(size)
    self.friendListView:setDirection(ccui.ListViewDirection.vertical)
    self.friendListView:setBounceEnabled(true)
    self.friendListView:setScrollBarEnabled(false)
    self.friendListView:setItemsMargin(10)
    self.friendListView:setPosition(cc.p(0, 0))
    self.friendListView:setAnchorPoint(cc.p(0, 0))
    self.friendListView:setSwallowTouches(false)
    self.ListContentPanel_2:addChild(self.friendListView)
    self.friendListView:addScrollViewEventListener(handler(self,self.onListviewEvent))
    self.friendListView:setVisible(false)

    local size = self.ListContentPanel_3:getContentSize()
    self.friendListView2 = ccui.ListView:create()
    self.friendListView2:setContentSize(size)
    self.friendListView2:setDirection(ccui.ListViewDirection.vertical)
    self.friendListView2:setBounceEnabled(true)
    self.friendListView2:setScrollBarEnabled(false)
    self.friendListView2:setItemsMargin(10)
    self.friendListView2:setPosition(cc.p(0, 0))
    self.friendListView2:setAnchorPoint(cc.p(0, 0))
    self.friendListView2:setSwallowTouches(false)
    self.friendListView2:addScrollViewEventListener(handler(self,self.onListviewEvent))
    self.ListContentPanel_3:addChild(self.friendListView2)

    self:initInteractionPopUpOutClickableArea()
end

function M:onListviewEvent(ref,type)
    self.scrollActionTime=2
end

function M:initUI(data)
    self.num=0
    self.items={}
    self.friendListView:removeAllChildren()
    self.friendListView2:removeAllChildren()
    for i=1,#data,1 do 
        local item = UIManager:createPanelOnly("MainFriendListCell_1")
        item:initUI(data[i])
        item:refreshHeadIconTime(10)

        local panel = ccui.Layout:create()
        local size = item:getContentSize()
        panel:setContentSize(size)
        self.friendListView2:pushBackCustomItem(panel)
        table.insert(self.items,item)

        item:setAnchorPoint(cc.p(0,0))
        item:setPosition(cc.p(0,0))
        panel:addChild(item)
        --
        item = UIManager:createPanelOnly("MainFriendListCell")
        item:initUI(data[i])

        panel = ccui.Layout:create()
        size = item:getContentSize()
        panel:setContentSize(size)
        self.friendListView:pushBackCustomItem(panel)

        item:setAnchorPoint(cc.p(0,0))
        item:setPosition(cc.p(0,0))
        panel:addChild(item)
        table.insert(self.items,item)

        if data[i].type<5 then
            self.num=self.num+1
        end
    end

    self.OnlineText_TT:setString(Utils.getFormatString(self.OnlineText,self.num..";"))
end

function M:refreshUI(data)
    for i=1,#self.items,1 do
        local item=self.items[i]
        item:refreshUI(data)
    end
end

function M:refreshData()
    local   data=g_FriendData:getFriendListData()
    table.sort(data,function(a,b)
        if a == nil or b == nil then 
            return false 
        end
        
        if a.type<b.type then
            return true
        end
        return false
    end)
    
    self:initUI(data)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.FriendListInitData, "refreshData")
    self:doRegEvent(Constant.CustomEvent.FriendListRefreshData, "refreshUI")
end

function M:resetAllNode()
    self.OnlineText_TT:setString(self.OnlineText)
    self:reBindingAllNode()
    for _,v in ipairs(self.items) do
        v:reBindingAllNode()
        v:resetAllNode()
    end
    self.OnlineText=self.OnlineText_TT:getString()
    self.OnlineText_TT:setString(Utils.getFormatString(self.OnlineText,self.num..";"))
end

function M:onInit()
    M.super.onInit(self)
    
end

function M:OnUpdate(dt)
    self.playTime=self.playTime-1
    if self.playTime<0 then
        self.playTime=0
    end

    self.scrollActionTime=self.scrollActionTime-1
    if self.scrollActionTime<0 then
        self.scrollActionTime=0
    end

    for _,v in ipairs(self.items) do
        v:OnUpdate(dt)
    end
end

function M:onCleanup()
    M.super.onCleanup(self)

    self:releaseResource()
end

return M