
local UIHeadFrameLineCell = require("app.gui.userinfo.UIHeadFrameLineCell")
local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIHeadFrameLayer", UIPanel)

local CELL_WIDTH = UIHeadFrameLineCell.CELL_WIDTH
local CELL_HEIGHT = UIHeadFrameLineCell.CELL_HEIGHT

local MIN_ROW = 1

M.GUI_FILE_NAME = "csd.01_06_PersonalCenter.01_06_HeadSittingLayer.lua"

M.BINDGUIDATANODE = {
    ["ModifyHeadButton"] = { varname = "ModifyHeadButton", onClick = "onTabBtnClick"},
    ["ModifyHeadText_TT"] = { varname = "ModifyHeadText" },

    ["ModifyHeadFrameButton"] = { varname = "ModifyHeadFrameButton", onClick = "onTabBtnClick"},
    ["ModifyHeadFrameText_TT"] = { varname = "ModifyHeadFrameText" },

    ["ConfirmButton"] = { varname = "ConfirmButton", onClick = "onClickConfirmBtn" },
    ["CancelButton"] = { varname = "CancelButton", onClick = "onClickCancelBtn" },

    ["Exhibition"] = { varname = "showNode" },
    ["SelectionPanel"] = { varname = "SelectionPanel" },
    ["HeadFrameSelectionPanel"] = { varname = "HeadFrameSelectionPanel" },

    ["ModifyHeadTipDotIcon"]={varname="ModifyHeadTipDotIcon"},

    ["HeadNode"] = { varname = "HeadNode" },
    ["HeadFrameNode"] = { varname = "HeadFrameNode" },
    ["HeadFrameName"] = { varname = "HeadFrameName" },
    ["HeadFrameTimeNode"] = { varname = "HeadFrameTimeNode" },
    ["HeadFrameTimeText"] = { varname = "HeadFrameTimeText" },
}

function M:refreshHot()
    self.ModifyHeadTipDotIcon:setVisible(g_HotData:hasHot(Enum.redPointSubcategory.avatarList))
end

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.Head))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.HeadBox))

    self.mHeadFrameCells = {}
    self.m_HeadFrameData = {}
    self.mTabIndex = Enum.HeadFrameTab.UnKnow
    self.mRow = 0

    local headSize = self.SelectionPanel:getContentSize()

    self.mHeadTableView = cc.TableView:create(headSize)

    self.mHeadTableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
    self.mHeadTableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)

    self.mHeadTableView:setBounceable(true)

    self.mHeadTableView:setIgnoreAnchorPointForPosition(false)
    self.mHeadTableView:setAnchorPoint(0, 0)
    self.mHeadTableView:setPosition(0, 0)
    self.SelectionPanel:addChild(self.mHeadTableView)

    self.mHeadTableView:registerScriptHandler(handler(self, self.getNumberOfCellsInTableView), cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
    self.mHeadTableView:registerScriptHandler(handler(self, self.getTableCellSizeForIndex), cc.TABLECELL_SIZE_FOR_INDEX)
    self.mHeadTableView:registerScriptHandler(handler(self, self.getTableCellSizeAtIndex), cc.TABLECELL_SIZE_AT_INDEX)

    local headFrameSize = self.HeadFrameSelectionPanel:getContentSize()

    self.mHeadFrameTableView = cc.TableView:create(headFrameSize)

    self.mHeadFrameTableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
    self.mHeadFrameTableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)

    self.mHeadFrameTableView:setBounceable(true)

    self.mHeadFrameTableView:setIgnoreAnchorPointForPosition(false)
    self.mHeadFrameTableView:setAnchorPoint(0, 0)
    self.mHeadFrameTableView:setPosition(0, 0)
    self.HeadFrameSelectionPanel:addChild(self.mHeadFrameTableView)

    self.mHeadFrameTableView:registerScriptHandler(handler(self, self.getNumberOfCellsInTableView), cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
    self.mHeadFrameTableView:registerScriptHandler(handler(self, self.getTableCellSizeForIndex), cc.TABLECELL_SIZE_FOR_INDEX)
    self.mHeadFrameTableView:registerScriptHandler(handler(self, self.getTableCellSizeAtIndex), cc.TABLECELL_SIZE_AT_INDEX)

    self:bindingAllTab()
end

function M:onClosePanelEvent()
    self:closePanel()
end

function M:bindingAllTab()
    self.mTabs = {}
    self.mTabs[Enum.HeadFrameTab.Head] = self:createTab(
        Enum.HeadFrameTab.Head, 
        self.ModifyHeadButton, 
        self.ModifyHeadText
    )
    self.mTabs[Enum.HeadFrameTab.HeadFrame] = self:createTab(
        Enum.HeadFrameTab.HeadFrame,
        self.ModifyHeadFrameButton,
        self.ModifyHeadFrameText
    )
end

function M:createTab(tag, button, Text, redDot)
    button:setTag(tag)
    return { redDot = redDot, button = button, text = Text }
end

function M:onTabBtnClick(sender)
    self:setTabIndex(sender:getTag())

    g_HotData:C2S_removeRedPoint(Enum.redPointSubcategory.avatarList)
end

function M:onInit()
    M.super.onInit(self)

    self.mTabIndex = Enum.HeadFrameTab.UnKnow
    self.m_SelectHeadId = tonumber(g_UserData:getHead())
    self.m_SelectHeadFrameId = tonumber(g_UserData:getHeadBox())
    self:initShowNode()
    self:refreshHot()
end

function M:initShowNode()
    self.showNode:removeAllChildren()
    
    -- local head = cc.Sprite:createWithSpriteFrameName(Utils.getIconStr(PlistConfig.Icon.Head, self.m_SelectHeadId))
    -- head:setName("head")
    -- self.showNode:addChild(head)
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    avater:setName("head")
    avater:InitTexture(string.utf8len(g_UserData:getUserInfo():getHead())<7,g_UserData:getUserInfo():getHead(),g_UserData:getUserInfo():getUserId())
    self.showNode:addChild(avater)

    local headFrame = cc.Sprite:createWithSpriteFrameName(Utils.getIconStr(PlistConfig.Icon.HeadBox, self.m_SelectHeadFrameId))
    headFrame:setName("headFrame")
    self.showNode:addChild(headFrame)

    local headFrameTbx = DataManager:getTbxData("Item",self.m_SelectHeadFrameId)
    if headFrameTbx then 
        self.HeadFrameName:setVisible(true)
        self.HeadFrameName:setString(tostring(headFrameTbx.ShowName))
    else
        self.HeadFrameName:setVisible(false)
        Log.log("headFrame tbx is not found", netData.id)
    end

    --获取头像框数据初始化
    local headFrameData = g_UserData:getAvatarDataByTab(Enum.HeadFrameTab.HeadFrame)
    --dump(headFrameData, "headFrameData", 3)
    if not Utils.isEmptyTable(headFrameData) then  
        local isNeedShowTime = false
        for _,v in ipairs(headFrameData) do 
            if v.itemId == self.m_SelectHeadFrameId then 
                if v.expireTime ~= -1 then 
                    isNeedShowTime = true
                    self.HeadFrameTimeText:setString(self:getValidTimeText(v.expireTime))
                end
            end
        end
        self.HeadFrameTimeNode:setVisible(isNeedShowTime)
    else
        Log.log("init headFrame failed")
        self.HeadFrameTimeNode:setVisible(false)
    end
end

function M:onEnter()
    M.super.onEnter(self)

    self:setTabIndex(Enum.HeadFrameTab.Head)
end

function M:setTabIndex(tabIndex)
    if self.mTabIndex == tabIndex then
        return
    end

    self.mTabIndex = tabIndex

    for k, v in pairs(self.mTabs) do
        if tabIndex == k then
            v.button:setTouchEnabled(false)
            v.button:setBright(false)
            v.text:setTextColor(cc.c3b(0, 0, 0))
            v.text:setFontSize(24)
        else
            v.button:setTouchEnabled(true)
            v.button:setBright(true)
            v.text:setTextColor(cc.c3b(255, 255, 255))
            v.text:setFontSize(24)
        end
    end

    self:refreshData()

    self:refreshUI(self.m_HeadFrameData)
end

function M:refreshData()
    self.m_SelectHeadItem = nil 
    self.m_SelectHeadFrameItem = nil
    self.m_HeadFrameData = {}
    
    --暂时去除
    -- if self.mTabIndex == Enum.HeadFrameTab.Head then 
    --     --照相机特殊数据
    --     local camera = {}
    --     camera.id = 10000000
    --     camera.isCamera = true
    --     local cameraInfo = require("app.bean.HeadFrameInfo").new(camera, self.mTabIndex)
    --     table.insert(self.m_HeadFrameData, cameraInfo)
    -- end

    local headFrameData = g_UserData:getAvatarDataByTab(self.mTabIndex)
    if not Utils.isEmptyTable(headFrameData) then 
        for _,v in ipairs(headFrameData) do 
            local netData = {}
            if self.mTabIndex == Enum.HeadFrameTab.Head then 
                netData.id = tonumber(v)
                netData.isCamera = false
            elseif self.mTabIndex == Enum.HeadFrameTab.HeadFrame then 
                netData = clone(v)
                netData.id = tonumber(v.itemId)
                netData.isCamera = false
            end
            local itemInfo = require("app.bean.HeadFrameInfo").new(netData, self.mTabIndex)
            table.insert(self.m_HeadFrameData, itemInfo)
        end
    end
    --dump(self.m_HeadFrameData, "HeadFrameInfo", 3)
end

function M:refreshUI(data)
    self.mHeadFrameCells = {}
    self.mRow = math.ceil(table.getn(data) / UIHeadFrameLineCell.ITEM_COLUMN)
    if self.mRow < MIN_ROW then
        self.mRow = MIN_ROW 
    end

    if self.mTabIndex == Enum.HeadFrameTab.Head then 
        self.HeadFrameNode:setVisible(false)
        self.HeadNode:setVisible(true)
        self.mHeadTableView:reloadData()
    elseif self.mTabIndex == Enum.HeadFrameTab.HeadFrame then 
        self.HeadNode:setVisible(false)
        self.HeadFrameNode:setVisible(true)
        self.mHeadFrameTableView:reloadData()
    end
    
end

function M:onSelectItem(item)
    if not item then return end

    local itemInfo = item:getItemInfo()

    if not itemInfo then return end

    local netData = itemInfo:getNetData()

    if self.mTabIndex == Enum.HeadFrameTab.Head then 
        self.m_SelectHeadId = netData.id
        for _, v in pairs(self.mHeadFrameCells) do 
            v:setIsSelect(self.m_SelectHeadId)
        end
    elseif self.mTabIndex == Enum.HeadFrameTab.HeadFrame then 
        self.m_SelectHeadFrameId = netData.id
        local headFrameTbx = DataManager:getTbxData("Item",netData.id)
        if headFrameTbx then 
            self.HeadFrameName:setString(tostring(headFrameTbx.ShowName))
        else
            Log.log("headFrame tbx don't found %s", netData.id)
        end
        for _, v in pairs(self.mHeadFrameCells) do 
            v:setIsSelect(self.m_SelectHeadFrameId)
        end
        if netData.expireTime ~= -1 then 
            self.HeadFrameTimeNode:setVisible(true)
            self.HeadFrameTimeText:setString(self:getValidTimeText(netData.expireTime))
        else
            self.HeadFrameTimeNode:setVisible(false)
        end
    end

    self:refreshShowNode(itemInfo)
end

function M:refreshShowNode(itemInfo)
    local showType = itemInfo:getHeadFrameType()
    local netData = itemInfo:getNetData()
    if showType == Enum.HeadFrameTab.Head then 
        
        local head = self.showNode:getChildByName("head")
        if not head then 
            local avater UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
            avater:setName("head")
            self.showNode:addChild(avater)
        end
    
        head:loadTexture(Utils.getIconStr(PlistConfig.Icon.Head, tonumber(netData.id)), ccui.TextureResType.plistType)
    elseif showType == Enum.HeadFrameTab.HeadFrame then 
        local headFrame = self.showNode:getChildByName("headFrame")
        if not headFrame then 
            local node = cc.Sprite:create()
            node:setName("headFrame")
            node:setSpriteFrame(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(netData.id)))
            self.showNode:addChild(node)
            return
        end
        headFrame:setSpriteFrame(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(netData.id)))
    end
end

function M:getValidTimeText(unixtime)
    local timeStr = ""
    local nowTime = Utils.getFormatNowUnixTimeToDate()
    local validTime = Utils.getFormatUnixTimeToDate(unixtime)
    if tonumber(nowTime.year) == tonumber(validTime.year) then
        local dayDiff = tonumber(validTime.dayAtYear) - tonumber(nowTime.dayAtYear)
        if dayDiff >= 1 then
            --显示天
            timeStr = Utils.showFormatText(Enum.Text.HeadFrameDayTime, dayDiff)
        else
            --显示小时
            local hourDiff = tonumber(validTime.hour) - tonumber(nowTime.hour)
            local minuteDiff = tonumber(validTime.minute) - tonumber(nowTime.minute)
            if minuteDiff >= 0 then 
                hourDiff = hourDiff + 1
            end
            
            timeStr = Utils.showFormatText(Enum.Text.HeadFrameHourTime, hourDiff)
        end
    else
        --只处理一年内得
        local yearDiff = tonumber(validTime.year) - tonumber(nowTime.year) 
        if yearDiff == 1 then 
            local validYearDay = tonumber(validTime.dayAtYear)
            local nowYearDay = tonumber(nowTime.dayAtYear)
            local yearDays = 365
            if tonumber(nowTime.year) % 400 == 0 then 
                yearDays = 366
            else
                if tonumber(nowTime.year) % 4 == 0 and not (tonumber(nowTime.year) % 100 == 0) then
                    yearDays = 366
                else
                    yearDays = 365
                end
            end
            timeStr = Utils.showFormatText(Enum.Text.HeadFrameDayTime, yearDays - nowYearDay + validYearDay)
        end
    end
    return timeStr
end

function M:onClickConfirmBtn(ref)
    local userInfo = {}
    if self.m_SelectHeadId ~= nil then 
        userInfo.avatar = tostring(self.m_SelectHeadId)
    end
    userInfo.avatarFrame = tonumber(self.m_SelectHeadFrameId)
    g_UserData:requestModifyUserInfo(userInfo)
end

function M:onClickCancelBtn(ref)
    self:closePanel()
end

function M:getNumberOfCellsInTableView(tableview)
    return self.mRow
end

function M:getTableCellSizeForIndex(tableview, idx)
    return CELL_WIDTH, CELL_HEIGHT
end

function M:getTableCellSizeAtIndex(tableview, idx)
    local cell = tableview:dequeueCell()
    if nil == cell then
        cell = cc.TableViewCell:new()
    end

    local panel = cell:getChildByName("UIHeadFrameLineCell")
    if not panel then
        panel = UIHeadFrameLineCell.new()
        panel:setName("UIHeadFrameLineCell")
        panel:setTouchCallBack(handler(self, self.onSelectItem))

        local size = panel:getContentSize()
        panel:setPosition((CELL_WIDTH - size.width) * 0.5, (CELL_HEIGHT - size.height) * 0.5)
        cell:addChild(panel)
    end

    local selectId = self.m_SelectHeadId
    if self.mTabIndex == Enum.HeadFrameTab.Head then 
        selectId = self.m_SelectHeadId
    elseif self.mTabIndex == Enum.HeadFrameTab.HeadFrame then 
        selectId = self.m_SelectHeadFrameId 
    end

    table.insert(self.mHeadFrameCells, panel)

    panel:refreshData(self.m_HeadFrameData, idx, selectId)

    return cell
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.UpdateUserInfo, "refreshData")
    self:doRegEvent(Constant.CustomEvent.UIHeadFrameLayer_refreshHot, "refreshHot")
    self:doRegEvent(Constant.CustomEvent.ClosePersonalInfoPanel, "onClosePanelEvent")
end

return M