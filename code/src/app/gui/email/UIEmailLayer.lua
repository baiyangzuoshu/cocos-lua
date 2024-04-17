local UIEmailItem = require("app.gui.email.UIEmailItem")

local UIPanel = require("app.gui.basegui.UIPanel")

local M = class("UIEmailLayer", UIPanel)

local MIN_ROW = 1

M.GUI_FILE_NAME = "csd.01_10_Mail.01_10_MailBoxLayer.lua"

M.BINDGUIDATANODE = {
    ["GoldNum"] = { varname = "PlayerGoldNum" },
    ["DiamondNum"] = { varname = "PlayerJewelNum" },
    ["MailBoxPanel"] = { varname = "EmailPanel" },
    ["DeleteButton"] = { varname = "DeleteButton", onClick = "onClickDeleteAllBtn" },
    ["ReceiveButton"] = { varname = "ReceiveButton", onClick = "onClickReceiveAllBtn" },
    ["ReturnButton"] = { varname = "ReturnButton" },
    ["ReturnPanel"] = { varname = "ReturnPanel", onEvent = "onReturnTouchEvent" },
    ["NothingImage"] = { varname = "NothingImage" },
    ["NothingImageText_TT"] = { varname = "NothingImageText_TT" },
}

function M:adaptationPanelSize()
    local size=cc.Director:getInstance():getWinSize()
    local friangeTop = g_GameSettingData:getFringeScreenTop()
    local dyw = (size.height - 1280) / 2
    
    if dyw > 0 then
        local addHeight=dyw-friangeTop+dyw
        local panelSize=self.EmailPanel:getContentSize()
        local y=self.EmailPanel:getPositionY()
        self.EmailPanel:setContentSize(cc.size(panelSize.width,panelSize.height+addHeight))
        self.EmailPanel:setPositionY(y+dyw)
    end
end

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)
    self:adaptationPanelSize()

    self.m_EmailData = {}

    self.mRow = 0

    local size = self.EmailPanel:getContentSize()
    self.mTableView = cc.TableView:create(size)
    self.mTableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
    self.mTableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
    self.mTableView:setBounceable(true)
    self.mTableView:setIgnoreAnchorPointForPosition(false)
    self.mTableView:setAnchorPoint(0, 0)
    self.mTableView:setPosition(0, 0)

    self.EmailPanel:addChild(self.mTableView)

    self.mTableView:setDelegate()
    self.mTableView:registerScriptHandler(handler(self, self.getNumberOfCellsInTableView), cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
    self.mTableView:registerScriptHandler(handler(self, self.getTableCellSizeForIndex), cc.TABLECELL_SIZE_FOR_INDEX)
    self.mTableView:registerScriptHandler(handler(self, self.getTableCellSizeAtIndex), cc.TABLECELL_SIZE_AT_INDEX)
end

function M:onInit()
    M.super.onInit(self)

    self.ReturnButton:setTouchEnabled(false)
end

function M:showEmptyUI(isShow)
    self.NothingImageText_TT:setVisible(isShow)
    self.NothingImage:setVisible(isShow)
end

function M:onSelectItem(item)
    if not item then return end
    
    local state = item:getEmailState()
    if state == Enum.EmailState.unread then 
        g_EmailData:requestReadEmail(item:getEmailDbId())
    end

    local panel = UIManager:getOrCreatePanel("UIEmailDetail")
    if panel then 
        panel:showToScene()
        panel:showEmailDetail(item)
    end
end

function M:sortAllEmail(a, b)
    --排序规则
    --已完成未领取 > 未完成(未领取) > (已完成)已领取
    --a.emailInfo.emailCreatedTime
    local aState = a.emailState
    local bState = b.emailState

    local isAunRead = aState == Enum.EmailState.unread
    local isAReceived = aState == Enum.EmailState.received

    local isBunRead = bState == Enum.EmailState.unread
    local isBReceived = bState == Enum.EmailState.received

    if isAunRead and isBunRead then 
        --时间
        local cretaTimeA = a.emailInfo.emailCreatedTime
        local cretaTimeB = b.emailInfo.emailCreatedTime
        if cretaTimeA > cretaTimeB then
            return true
        else
            return false
        end
    elseif isAunRead and not isBunRead then 
        return true
    elseif not isAunRead and isBunRead then 
        return false
    else
        if isAReceived == isBReceived then 
            --
            local cretaTimeA = a.emailInfo.emailCreatedTime
            local cretaTimeB = b.emailInfo.emailCreatedTime
            if cretaTimeA > cretaTimeB then
                return true
            else
                return false
            end
        elseif isAReceived and not isBReceived then 
            return false
        elseif not isAReceived and isBReceived then 
            return true
        else
            return false
        end
    end
end

--刷新界面数据
function M:refreshAllData()
    self.m_EmailData = g_EmailData:getEmailList()
    --dump(self.m_EmailData, "self.m_EmailData", 3)
    if not Utils.isEmptyTable(self.m_EmailData) then 
        self.mTableView:setVisible(true)
        local emailNum = table.getn(self.m_EmailData)
        self.mRow = math.ceil(emailNum / UIEmailItem.ITEM_COLUMN)
        if self.mRow < MIN_ROW then
            self.mRow = MIN_ROW 
        end

        table.sort(self.m_EmailData, handler(self, self.sortAllEmail))

        self.mTableView:reloadData()

        self:showEmptyUI(false)
    else
        self.mTableView:setVisible(false)
        self:showEmptyUI(true)
    end

    self:onUpdateUserResource()
end

function M:onUpdateUserResource(data)
    self.PlayerJewelNum:setString(Utils.getFormatNumber_MuitiLanguage(g_UserData:getDiamond()))
    self.PlayerGoldNum:setString(Utils.getFormatNumber_MuitiLanguage(g_UserData:getGold()))
end

function M:onEnter()
    M.super.onEnter(self)

    self:refreshAllData()
end

function M:OnUpdate(dt)
    --if not self.m_EmailData then return end 

    --local emailNum = table.getn(self.m_EmailData)
    --self:updateUIButton(emailNum > 0)
end

-- function M:updateUIButton(isShow)
--     self.ReceiveButton:setTouchEnabled(isShow)
--     self.ReceiveButton:setBright(isShow)
--     self.DeleteButton:setTouchEnabled(isShow)
--     self.DeleteButton:setBright(isShow)
-- end

function M:onClickDeleteAllBtn(ref)
    if not Utils.isEmptyTable(self.m_EmailData) then 
        local isCanDelete = false
        for _,v in ipairs(self.m_EmailData) do 
            if v.emailState == Enum.EmailState.received then 
                isCanDelete = true
            end
        end
        if isCanDelete then 
            local panel = UIManager:getOrCreatePanel("UIDeleteAllEmailConfirm")
            if panel then 
                panel:showToScene()
                panel:setConfirmCb(
                    function()
                        g_EmailData:requestDeleteEmailAll()
                    end
                )
            end
        else
            UIUtils.popToadtByMessageId(Constant.Define.NoCanDeleteEmail)
        end
    else
        UIUtils.popToadtByMessageId(Constant.Define.NoCanDeleteEmail)
    end
end

function M:onClickReceiveAllBtn(ref)
    g_EmailData:requestReciveEmailAll()
end

function M:onReturnTouchEvent(data)
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

function M:getNumberOfCellsInTableView(tableview)
    return self.mRow
end

function M:getTableCellSizeForIndex(tableview, idx)
    return UIEmailItem.CELL_WIDTH, UIEmailItem.CELL_HEIGHT
end

function M:getTableCellSizeAtIndex(tableview, idx)
    local cell = tableview:dequeueCell()
    if nil == cell then
        cell = cc.TableViewCell:new()
    end

    local panel = cell:getChildByName("UIEmailItem")
    if not panel then
        panel = UIEmailItem.new()
        panel:setName("UIEmailItem")

        local size = panel:getContentSize()
        panel:setTouchCallBack(handler(self, self.onSelectItem))
        panel:setPosition((UIEmailItem.CELL_WIDTH - size.width) * 0.5, (UIEmailItem.CELL_HEIGHT - size.height) * 0.5)
        cell:addChild(panel)
    end

    panel:refreshData(self.m_EmailData, idx)

    return cell
end

function M:onCleanup()
    M.super.onCleanup(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
    
    self:doRegEvent(Constant.CustomEvent.UpdateUserResource, "onUpdateUserResource")
    self:doRegEvent(Constant.CustomEvent.RefreshEmailData, "refreshAllData")
end

return M