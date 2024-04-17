local UIFriendItem = require("app.gui.friend.UIFriendItem")

local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIFriendLayer", UIPanel)

local MIN_ROW = 1

M.GUI_FILE_NAME = "csd.04_02_Friends.04_02_FriendsPopUp.lua"

M.BINDGUIDATANODE = {
    ["InteractionPopups"] = { varname = "InteractionPopups" },

    --好友列表
    ["List"] = { varname = "List" },
    ["ListNum"] = { varname = "ListNum" },
    ["ListPanel"] = { varname = "ListPanel" },
    ["EmptyListImage"] = { varname = "emptyBg_1" },
    ["EmptyListText_TT"] = { varname = "EmptyListText_TT" },

    --添加
    ["Add"] = { varname = "Add" },
    ["CancelButton"] = { varname = "CancelButton", onClick = "onCancelBtnClick" },
    ["ConfirmButton"] = { varname = "ConfirmButton", onClick = "onConfirmBtnClick" },
    ["AddPanel"] = { varname = "AddPanel" },
    ["AddTextField_TNT"] = { varname = "AddTextField_TNT" },
    ["EmptyAddImage"] = { varname = "emptyBg_2" },
    ["EmptyAddText_TT"]={varname="EmptyAddText_TT"},
    --申请
    ["Apply"] = { varname = "Apply" },
    ["RefuseButton"] = { varname = "RefuseAllButton", onClick = "onRefuseAllBtnClick" },
    ["AgreeButton"] = { varname = "AgreeAllButton", onClick = "onAgreeAllBtnClick"  },
    ["ApplyPanel"] = { varname = "ApplyPanel" },
    ["EmptyApplyImage"] = { varname = "emptyBg_3" },
    ["EmptyApplyText_TT"]={varname="EmptyApplyText_TT"},
    --黑名单
    ["Black"] = { varname = "Black" },
    ["BlackNum"] = { varname = "BlackNum" },
    ["BlackPanel"] = { varname = "BlackPanel" },
    ["EmptyBlackImage"] = { varname = "emptyBg_4" },
    ["EmptyBlackText_TT"] = { varname = "EmptyBlackText_TT" },

    --tab
    ["ListButton"] = { varname = "ListButton", onClick = "onTabBtnClick" },
    ["ListText_TT"] = { varname = "ListText_TT" },

    ["AddButton"] = { varname = "AddButton", onClick = "onTabBtnClick" },
    ["AddText_TT"] = { varname = "AddText_TT" },

    ["ApplyButton"] = { varname = "ApplyButton", onClick = "onTabBtnClick" },
    ["ApplyText_TT"] = { varname = "ApplyText_TT" },
    ["ApplyTip"] = { varname = "ApplyTip" },
    ["ApplyTipNum"] = { varname = "ApplyTipNum" },

    ["BlackButton"] = { varname = "BlackButton", onClick = "onTabBtnClick" },
    ["BalckText_TT"] = { varname = "BalckText_TT" },

    ["AddTextFieldPanel"]={varname="AddTextFieldPanel",onClick="onClickEvent"},
    ["AddTextFieldBg"]={varname="AddTextFieldBg"},
    --
    ["ListTipDotIcon"]={varname="ListTipDotIcon"},
    ["ListTipDotNum"]={varname="ListTipDotNum"}
}

function M:onClickEvent()
    SoundSystemManager:playSound004()
end

function M:refreshHot()
    local num=g_FriendData:getUnReadMsgNum()
    self.ListTipDotIcon:setVisible(num>0)
    self.ListTipDotNum:setVisible(num>0)
    self.ListTipDotNum:setString(tostring(num))
end

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)

    self.mTabIndex = Enum.FriendTab.UnKnow

    self.mFriendListData = {}
    self.mFriendRequestData = {}
    self.mFriendSearchData = {}
    self.mFriendBlockData = {}

    self.mFriendListRow = 0
    self.mFriendRequestRow = 0
    self.mFriendSearchRow = 0
    self.mFriendBlockRow = 0

    --好友列表
    local size = self.ListPanel:getContentSize()
    self.mFriendListTableView = cc.TableView:create(size)
    self.mFriendListTableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
    self.mFriendListTableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
    self.mFriendListTableView:setBounceable(true)
    self.mFriendListTableView:setIgnoreAnchorPointForPosition(false)
    self.mFriendListTableView:setAnchorPoint(0, 0)
    self.mFriendListTableView:setPosition(0, 0)

    self.ListPanel:addChild(self.mFriendListTableView)

    self.mFriendListTableView:setDelegate()
    self.mFriendListTableView:registerScriptHandler(handler(self, self.getListCellNumber), cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
    self.mFriendListTableView:registerScriptHandler(handler(self, self.getListCellSize), cc.TABLECELL_SIZE_FOR_INDEX)
    self.mFriendListTableView:registerScriptHandler(handler(self, self.getListCell), cc.TABLECELL_SIZE_AT_INDEX)

    --添加搜索好友列表
    local size = self.AddPanel:getContentSize()
    self.mFriendSearchTableView = cc.TableView:create(size)
    self.mFriendSearchTableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
    self.mFriendSearchTableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
    self.mFriendSearchTableView:setBounceable(true)
    self.mFriendSearchTableView:setIgnoreAnchorPointForPosition(false)
    self.mFriendSearchTableView:setAnchorPoint(0, 0)
    self.mFriendSearchTableView:setPosition(0, 0)

    self.AddPanel:addChild(self.mFriendSearchTableView)

    self.mFriendSearchTableView:setDelegate()
    self.mFriendSearchTableView:registerScriptHandler(handler(self, self.getSearchCellNumber), cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
    self.mFriendSearchTableView:registerScriptHandler(handler(self, self.getSearchCellSize), cc.TABLECELL_SIZE_FOR_INDEX)
    self.mFriendSearchTableView:registerScriptHandler(handler(self, self.getSearchCell), cc.TABLECELL_SIZE_AT_INDEX)

    --申请好友列表
    local size = self.ApplyPanel:getContentSize()
    self.mFriendRequestTableView = cc.TableView:create(size)
    self.mFriendRequestTableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
    self.mFriendRequestTableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
    self.mFriendRequestTableView:setBounceable(true)
    self.mFriendRequestTableView:setIgnoreAnchorPointForPosition(false)
    self.mFriendRequestTableView:setAnchorPoint(0, 0)
    self.mFriendRequestTableView:setPosition(0, 0)

    self.ApplyPanel:addChild(self.mFriendRequestTableView)

    self.mFriendRequestTableView:setDelegate()
    self.mFriendRequestTableView:registerScriptHandler(handler(self, self.getRequestCellNumber), cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
    self.mFriendRequestTableView:registerScriptHandler(handler(self, self.getRequestCellSize), cc.TABLECELL_SIZE_FOR_INDEX)
    self.mFriendRequestTableView:registerScriptHandler(handler(self, self.getRequestCell), cc.TABLECELL_SIZE_AT_INDEX)

    --黑名单列表
    local size = self.BlackPanel:getContentSize()
    self.mFriendBlockTableView = cc.TableView:create(size)
    self.mFriendBlockTableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
    self.mFriendBlockTableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
    self.mFriendBlockTableView:setBounceable(true)
    self.mFriendBlockTableView:setIgnoreAnchorPointForPosition(false)
    self.mFriendBlockTableView:setAnchorPoint(0, 0)
    self.mFriendBlockTableView:setPosition(0, 0)

    self.BlackPanel:addChild(self.mFriendBlockTableView)

    self.mFriendBlockTableView:setDelegate()
    self.mFriendBlockTableView:registerScriptHandler(handler(self, self.getBlockCellNumber), cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
    self.mFriendBlockTableView:registerScriptHandler(handler(self, self.getBlockCellSize), cc.TABLECELL_SIZE_FOR_INDEX)
    self.mFriendBlockTableView:registerScriptHandler(handler(self, self.getBlockCell), cc.TABLECELL_SIZE_AT_INDEX)

    self:initOutClickableArea()

    self:bindingAllFriendTab()

    self.mAllNodes = {
        self.List,
        self.Add,
        self.Apply,
        self.Black,
    }

    self:initEditBox()
    self:onlyShowNode(self.List)
end

function M:initOutClickableArea()
    local function onOutOfQuickBoxClick()
        self.mTabIndex = Enum.FriendTab.UnKnow
        self:closePanel()
    end

    UIUtils.addClickableNode(self.InteractionPopups, nil, onOutOfQuickBoxClick)
end

function M:initEditBox()
    self.AddTextField_TNT:setVisible(false)
    --self.AddTextFieldBg:setVisible(false)
    local _x,_y=self.AddTextField_TNT:getPosition()
    local editAdd = ccui.EditBox:create(cc.size(380,100),"00_01_Common/picture_057.png","00_01_Common/picture_057.png","00_01_Common/picture_057.png",ccui.TextureResType.plistType)
    self.AddTextFieldPanel:addChild(editAdd)
    editAdd:setPosition( cc.p(_x,_y))
    editAdd:setAnchorPoint(cc.p(0,0.5))
    editAdd:setFontColor(cc.c3b(255, 255, 255))
    editAdd:setFontSize(24)
    editAdd:setFontName("font/Default.TTF")
    editAdd:setPlaceholderFontName("font/Default.TTF")
    editAdd:setPlaceholderFontSize(24)
    editAdd:setPlaceholderFontColor(cc.c3b(255, 255, 255))
    editAdd:setPlaceHolder(self.AddTextField_TNT:getPlaceHolder())
    editAdd:setInputMode(cc.EDITBOX_INPUT_MODE_SINGLELINE)
    editAdd:registerScriptEditBoxHandler(handler(self,self.editboxEventHandler))
    self.editBoxAdd=editAdd
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

function M:bindingAllFriendTab()
    self.mTabs = {}
    self.mTabs[Enum.FriendTab.FriendList] = self:createTab(
        Enum.FriendTab.FriendList, 
        self.List,
        self.ListButton, 
        self.ListText_TT,
        true
    )
    self.mTabs[Enum.FriendTab.FriendSearch] = self:createTab(
        Enum.FriendTab.FriendSearch,
        self.Add,
        self.AddButton,
        self.AddText_TT,
        true
    )
    self.mTabs[Enum.FriendTab.FriendRequest] = self:createTab(
        Enum.FriendTab.FriendRequest, 
        self.Apply,
        self.ApplyButton, 
        self.ApplyText_TT,
        true
    )
    self.mTabs[Enum.FriendTab.FriendBlock] = self:createTab(
        Enum.FriendTab.FriendBlock, 
        self.Black,
        self.BlackButton, 
        self.BalckText_TT,
        true
    )
end

function M:createTab(tag, showNode, button, Text, redDot)
    button:setTag(tag)
    return { redDot = redDot, showNode = showNode, button = button, text = Text}
end

function M:setNewTabIndexAndShowNode(tabIndex)
    self.mNewTabIndex = tabIndex
    local showNode = self.List
    if Enum.FriendTab.FriendList == tabIndex then 
        showNode = self.List
    elseif Enum.FriendTab.FriendRequest == tabIndex then 
        showNode = self.Apply
    elseif Enum.FriendTab.FriendSearch == tabIndex then 
        showNode = self.Add
    elseif Enum.FriendTab.FriendBlock == tabIndex then 
        showNode = self.Black
    end
    self:onlyShowNode(showNode)
end

function M:onTabBtnClick(sender)
    self:setTabIndex(sender:getTag())
end

function M:onInit()
    M.super.onInit(self)

    self:refreshHot()
    self.ApplyTip:setVisible(false)
    self.AddTextField_TNT:setPlaceHolder(Utils.getTextByTextId(Enum.Text.InputPlaceHolder))
    self.editBoxAdd:setPlaceHolder(self.AddTextField_TNT:getPlaceHolder())
end

function M:setTabIndex(tabIndex)
    --Log.info("newIndex: ", tabIndex, "old: ",  self.mTabIndex)
    if self.mTabIndex == tabIndex then
        return
    end

    self.mTabIndex = tabIndex

    for k, v in pairs(self.mTabs) do
        if tabIndex == k then
            self:onlyShowNode(v.showNode)
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
    
    if Enum.FriendTab.FriendSearch ~= tabIndex then 
        g_FriendData:setIsSearchMode(false)
    end

    self:requestFriendData(tabIndex)
end

function M:onlyShowNode(showNode)
    for _ , v in pairs(self.mAllNodes) do 
        if showNode == v then 
            v:setVisible(true)
        else
            v:setVisible(false)
        end
    end
end

function M:onEnter()
    M.super.onEnter(self)
    
    self:setTabIndex(self.mNewTabIndex)
end

function M:requestFriendData(tabIndex)
    if Enum.FriendTab.FriendList == tabIndex then
        g_FriendData:requestFriendList()
    elseif Enum.FriendTab.FriendSearch == tabIndex then 
        --self.AddTextField_TNT:setString("")
        self.editBoxAdd:setText("")
        g_FriendData:requestGetRecommendFriendList()
    elseif Enum.FriendTab.FriendRequest == tabIndex then 
        g_FriendData:requestFriendRequestList()
    elseif Enum.FriendTab.FriendBlock == tabIndex then
        g_FriendData:requestFriendBlockList()
    end
end

--参数相同时应返回false
function M:sortAllFriends(a,b)
    local isAOnline = not (a.onlineState == Enum.OnlineState.Offline)
    local isBOnline = not (b.onlineState == Enum.OnlineState.Offline)
    --a在线b不在线
    if isAOnline and not isBOnline then
        return true
    elseif isAOnline and isBOnline then
        --a在线b在线
        local isAGameing = a.onlineState == Enum.OnlineState.Gaming
        local isBGameing = b.onlineState == Enum.OnlineState.Gaming
        if isAGameing and isBGameing then
            return false
        elseif isAGameing and not isBGameing then
            return true  
        elseif not isAGameing and not isBGameing then 
            local isAWatching = a.onlineState == Enum.OnlineState.Watching
            local isBWatching = b.onlineState == Enum.OnlineState.Watching
            if isAWatching and isBWatching then
                return false
            elseif isAWatching and not isBWatching then
                return true
            elseif not isAWatching and not isBWatching then 
                local isAMatching = a.onlineState == Enum.OnlineState.Matching
                local isBMatching = b.onlineState == Enum.OnlineState.Matching
                if isAMatching and isBMatching then
                    return false
                elseif isAMatching and not isBMatching then 
                    return true
                elseif not isAMatching and not isBMatching then 
                    -- local isAIdle = a.onlineState == Enum.OnlineState.Idle
                    -- local isBIdle = b.onlineState == Enum.OnlineState.Idle
                    --都是空闲
                    return false
                else
                    return false
                end
            else
                return false
            end
        else
            return false
        end
    else
        return false
    end
end

function M:OnUpdateFriendList()
    self.mFriendListData = g_FriendData:getFriendListData()
    --dump(self.mFriendListData, "friend", 3)
    self.mFriendListTableView:setVisible(true)
    if not Utils.isEmptyTable(self.mFriendListData) then 
        local listNum = table.getn(self.mFriendListData)
        self.mFriendListRow = math.ceil(listNum / UIFriendItem.ITEM_COLUMN)
        if self.mFriendListRow < MIN_ROW then
            self.mFriendListRow = MIN_ROW 
        end

        table.sort(self.mFriendListData, handler(self, self.sortAllFriends))

        self.mFriendListTableView:reloadData()

        self.emptyBg_1:setVisible(false)
        self.EmptyListText_TT:setVisible(false)
        self.ListNum:setString(string.format("%d/%d", listNum, GSystem.FriendsUpperLimitNumber))
    else
        self.mFriendListTableView:setVisible(false)
        self.emptyBg_1:setVisible(true)
        self.EmptyListText_TT:setVisible(true)
        self.ListNum:setString(string.format("0/%d", GSystem.FriendsUpperLimitNumber))
    end
end

function M:OnUpdateFriendSearchList(data)
    self.mFriendSearchData = data
    --dump(self.mFriendSearchData, "friend", 3)
    self.mFriendSearchTableView:setVisible(true)
    if not Utils.isEmptyTable(self.mFriendSearchData) then 
        local listNum = table.getn(self.mFriendSearchData)
        self.mFriendSearchRow = math.ceil(listNum / UIFriendItem.ITEM_COLUMN)
        if self.mFriendSearchRow < MIN_ROW then
            self.mFriendSearchRow = MIN_ROW 
        end

        self.mFriendSearchTableView:reloadData()

        self.emptyBg_2:setVisible(false)
        self.EmptyAddText_TT:setVisible(false)
    else
        self.mFriendSearchTableView:setVisible(false)
        self.emptyBg_2:setVisible(true)
        self.EmptyAddText_TT:setVisible(true)
    end
end

function M:OnUpdateFriendRequestList()
    self.mFriendRequestData = g_FriendData:getFriendRequestData()
    --dump(self.mFriendRequestData, "friend", 3)
    self.mFriendRequestTableView:setVisible(true)
    if not Utils.isEmptyTable(self.mFriendRequestData) then 
        local requestNum = table.getn(self.mFriendRequestData)
        self.mFriendRequestRow = math.ceil(requestNum / UIFriendItem.ITEM_COLUMN)
        if self.mFriendRequestRow < MIN_ROW then
            self.mFriendRequestRow = MIN_ROW 
        end

        self.mFriendRequestTableView:reloadData()

        self.emptyBg_3:setVisible(false)
        self.EmptyApplyText_TT:setVisible(false)
        self.ApplyTip:setVisible(true)
        self.ApplyTipNum:setString(tostring(requestNum))
    else
        self.mFriendRequestTableView:setVisible(false)
        self.emptyBg_3:setVisible(true)
        self.EmptyApplyText_TT:setVisible(true)
        self.ApplyTip:setVisible(false)
    end
end

function M:OnUpdateFriendBlockList(isNeedAdpatPos)
    self.mFriendBlockData = g_FriendData:getFriendBlockData()
    --dump(self.mFriendBlockData, "mFriendBlockData", 3)
    self.mFriendBlockTableView:setVisible(true)
    if not Utils.isEmptyTable(self.mFriendBlockData) then 
        local blockNum = table.getn(self.mFriendBlockData)
        self.mFriendBlockRow = math.ceil(blockNum / UIFriendItem.ITEM_COLUMN)
        if self.mFriendBlockRow < MIN_ROW then
            self.mFriendBlockRow = MIN_ROW 
        end

        local oldPos = self.mFriendBlockTableView:getContentOffset()

        self.mFriendBlockTableView:reloadData()

        if isNeedAdpatPos then 
            local newPos = self.mFriendBlockTableView:minContainerOffset()
            local offset = oldPos
            if oldPos.y > newPos.y then 
                offset = oldPos
            else
                offset = newPos
            end
            self.mFriendBlockTableView:setContentOffset(offset)
        end

        self.emptyBg_4:setVisible(false)
        self.EmptyBlackText_TT:setVisible(false)
        self.BlackNum:setString(string.format("%d/%d", blockNum, GSystem.BlackListLimitNumber))
    else
        self.mFriendBlockTableView:setVisible(false)
        self.emptyBg_4:setVisible(true)
        self.EmptyBlackText_TT:setVisible(true)
        self.BlackNum:setString(string.format("0/%d", GSystem.BlackListLimitNumber))
    end
end

function M:OnUpdate(dt)
    local str=Utils.transformInputStr(self.editBoxAdd:getText())
    --local str = Utils.getInputValue(self.AddTextField_TNT)
    if not Utils.isEmptyStr(str) then 
        self.CancelButton:setVisible(true)
    else
        self.CancelButton:setVisible(false)
    end
    local requestData = g_FriendData:getFriendRequestData()
    if not Utils.isEmptyTable(requestData) then 
        local requestNum = table.getn(requestData) 
        self.ApplyTip:setVisible(true)
        self.ApplyTipNum:setString(tostring(requestNum))
    else
        self.ApplyTip:setVisible(false)
    end
end

function M:onCancelBtnClick(ref)
    --self.AddTextField_TNT:setString("")
    self.editBoxAdd:setText("")
    self:OnUpdateFriendSearchList(g_FriendData:getFriendRecommendData())
end

function M:onConfirmBtnClick(ref)
    local str = Utils.transformInputStr(self.editBoxAdd:getText())
    --local str = Utils.getInputValue(self.AddTextField_TNT)
    if not Utils.isEmptyStr(str) then 
        if Utils.isProhibitWord(str) then 
            UIUtils.popToadtByMessageId(Constant.Define.UserNameIsIllegal)
            return
        end
        g_FriendData:setIsSearchMode(true)
        g_FriendData:requestFriendSearchList(str)
    else
        UIUtils.popToadtByMessageId(Constant.Define.UseUserId)
    end
end

function M:onRefuseAllBtnClick(ref)
    local requestData = g_FriendData:getFriendRequestData()
    if Utils.isEmptyTable(requestData) then 
        UIUtils.popToadtByMessageId(Constant.Define.NoCanCancelRequest)
        return
    end
    g_FriendData:requestAddFriendAgreeAll(false)
end

function M:onAgreeAllBtnClick(ref)
    local requestData = g_FriendData:getFriendRequestData()
    if Utils.isEmptyTable(requestData) then 
        UIUtils.popToadtByMessageId(Constant.Define.NoCanAgreeRequest)
        return
    end
    g_FriendData:requestAddFriendAgreeAll(true)
end

function M:onCleanup()
    M.super.onCleanup(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.OnUpdateFriendList, "OnUpdateFriendList")
    self:doRegEvent(Constant.CustomEvent.OnUpdateFriendRequestList, "OnUpdateFriendRequestList")
    self:doRegEvent(Constant.CustomEvent.OnUpdateFriendSearchList, "OnUpdateFriendSearchList")
    self:doRegEvent(Constant.CustomEvent.OnUpdateFriendBlockList, "OnUpdateFriendBlockList")
    self:doRegEvent(Constant.CustomEvent.UIFriendLayer_refreshHot, "refreshHot")
end

--好友列表
function M:getListCellNumber(tableview)
    return self.mFriendListRow
end

function M:getListCellSize(tableview, idx)
    return UIFriendItem.CELL_WIDTH, UIFriendItem.CELL_HEIGHT
end

function M:getListCell(tableview, idx)
    local cell = tableview:dequeueCell()
    if nil == cell then
        cell = cc.TableViewCell:new()
    end

    local panel = cell:getChildByName("UIFriendItem")
    if not panel then
        panel = UIFriendItem.new()
        panel:setName("UIFriendItem")

        local size = panel:getContentSize()
        panel:setPosition((UIFriendItem.CELL_WIDTH - size.width) * 0.5, (UIFriendItem.CELL_HEIGHT - size.height) * 0.5)
        cell:addChild(panel)
    end

    panel:reBindingAllNode()
    panel:refreshData(self.mFriendListData, idx, self.mTabIndex)

    return cell
end

--搜索添加好友
function M:getSearchCellNumber(tableview)
    return self.mFriendSearchRow
end

function M:getSearchCellSize(tableview, idx)
    return UIFriendItem.CELL_WIDTH, UIFriendItem.CELL_HEIGHT
end

function M:getSearchCell(tableview, idx)
    local cell = tableview:dequeueCell()
    if nil == cell then
        cell = cc.TableViewCell:new()
    end

    local panel = cell:getChildByName("UIFriendItem")
    if not panel then
        panel = UIFriendItem.new()
        panel:setName("UIFriendItem")

        local size = panel:getContentSize()
        panel:setPosition((UIFriendItem.CELL_WIDTH - size.width) * 0.5, (UIFriendItem.CELL_HEIGHT - size.height) * 0.5)
        cell:addChild(panel)
    end

    panel:reBindingAllNode()
    panel:refreshData(self.mFriendSearchData, idx, self.mTabIndex)

    return cell
end

--申请好友列表
function M:getRequestCellNumber(tableview)
    return self.mFriendRequestRow
end

function M:getRequestCellSize(tableview, idx)
    return UIFriendItem.CELL_WIDTH, UIFriendItem.CELL_HEIGHT
end

function M:getRequestCell(tableview, idx)
    local cell = tableview:dequeueCell()
    if nil == cell then
        cell = cc.TableViewCell:new()
    end

    local panel = cell:getChildByName("UIFriendItem")
    if not panel then
        panel = UIFriendItem.new()
        panel:setName("UIFriendItem")

        local size = panel:getContentSize()
        panel:setPosition((UIFriendItem.CELL_WIDTH - size.width) * 0.5, (UIFriendItem.CELL_HEIGHT - size.height) * 0.5)
        cell:addChild(panel)
    end

    panel:reBindingAllNode()
    panel:refreshData(self.mFriendRequestData, idx, self.mTabIndex)

    return cell
end

--黑名单列表
function M:getBlockCellNumber(tableview)
    return self.mFriendBlockRow
end

function M:getBlockCellSize(tableview, idx)
    return UIFriendItem.CELL_WIDTH, UIFriendItem.CELL_HEIGHT
end

function M:getBlockCell(tableview, idx)
    local cell = tableview:dequeueCell()
    if nil == cell then
        cell = cc.TableViewCell:new()
    end

    local panel = cell:getChildByName("UIFriendItem")
    if not panel then
        panel = UIFriendItem.new()
        panel:setName("UIFriendItem")

        local size = panel:getContentSize()
        panel:setPosition((UIFriendItem.CELL_WIDTH - size.width) * 0.5, (UIFriendItem.CELL_HEIGHT - size.height) * 0.5)
        cell:addChild(panel)
    end

    panel:reBindingAllNode()
    panel:refreshData(self.mFriendBlockData, idx, self.mTabIndex)

    return cell
end

return M