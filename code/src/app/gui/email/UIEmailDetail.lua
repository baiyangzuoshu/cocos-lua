local UIPanel = require("app.gui.basegui.UIPanel")

local M = class("UIEmailDetail", UIPanel)

M.GUI_FILE_NAME = "csd.01_10_Mail.01_10_MailCheckLayer.lua"

M.BINDGUIDATANODE = {
    ["MailTitleText"] = { varname = "titleText" },
    ["TextPanel"] = { varname = "textPanel" },
    ["EnclosurePanel"] = { varname = "resoursePanel" },
    ["Enclosure"] = { varname = "Enclosure" },
    ["ReceiveButton"] = { varname = "ReceiveButton", onClick = "onReciveBtnClick" },
    ["ReceiveText_TT"] = { varname = "ReceiveText" },
    ["ConfirmText_TT"] = { varname = "ConfirmText" },

    ["InteractionPopups"] = { varname = "InteractionPopups" },
}

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)

    self.mRewardList = {}

    local size = self.resoursePanel:getContentSize()
    self.mItemListView = ccui.ListView:create()
    self.mItemListView:setContentSize(size)
    self.mItemListView:setDirection(ccui.ListViewDirection.horizontal)
    self.mItemListView:setBounceEnabled(true)
    self.mItemListView:setScrollBarEnabled(false)
    self.mItemListView:setItemsMargin(10)
    self.mItemListView:setPosition(cc.p(0, 0))
    self.mItemListView:setAnchorPoint(cc.p(0, 0))
    self.resoursePanel:addChild(self.mItemListView)

    local size = self.textPanel:getContentSize()
    self.mMailTextView = ccui.ListView:create()
    self.mMailTextView:setContentSize(size)
    self.mMailTextView:setDirection(ccui.ListViewDirection.vertical)
    self.mMailTextView:setBounceEnabled(true)
    self.mMailTextView:setScrollBarEnabled(false)
    self.mMailTextView:setItemsMargin(30)
    self.mMailTextView:setPosition(cc.p(0, 0))
    self.mMailTextView:setAnchorPoint(cc.p(0, 0))
    self.textPanel:addChild(self.mMailTextView)

    self:initOutClickableArea()
end

function M:initOutClickableArea()
    local function onOutOfQuickBoxClick()
        self:closePanel()
    end

    UIUtils.addClickableNode(self.InteractionPopups, nil, onOutOfQuickBoxClick)
end

function M:onInit()
    M.super.onInit(self)
end

function M:createItem(items)
    self.mItemListView:removeAllChildren()
    for _,v in ipairs(items) do 
        local netData = {}
        netData.itemShowType = v.itemType
        netData.itemId = v.itemId
        netData.itemNum = v.itemNum

        local itemInfo = require("app.bean.ItemInfo").new(netData, v.itemType, (self.mEmailState == Enum.EmailState.received))
        local item = UIManager:createPanelOnly("UIEmailItem2")

        local panel = ccui.Layout:create()
        local size = item:getContentSize()
        panel:setContentSize(size)
        self.mItemListView:pushBackCustomItem(panel)

        item:setTouchCallBack(handler(self, self.onSelectItem))
        item:setAnchorPoint(cc.p(0.5,0.5))
        item:setItemInfo(itemInfo)
        panel:addChild(item)
    end
    self.mItemListView:setTouchEnabled(table.getn(items) > 4)
end

function M:showEmailDetail(item)
    self:setEmailId(item:getEmailDbId())

    local titleText = item:getEmailTitle()
    self.titleText:setString(Utils.getFormatTitle(titleText))

    local desc = item:getEmailContent()
    local pos=string.find(desc,"style",1)
    if pos then
        self:showEmailDesc2(item)
    else
        self:showEmailDesc(item)
    end

    local itemData = item:getEmailItem()
    local isEmptyItem = Utils.isEmptyTable(itemData)
    --Log.info(tostring(item:getEmailDbId()).."打开邮件状态为"..tostring(item:getEmailState()))

    self.mEmailState = item:getEmailState()

    if isEmptyItem then 
        self.ConfirmText:setVisible(true)
        self.ReceiveText:setVisible(false)
    else
        if self.mEmailState == Enum.EmailState.unreceived or self.mEmailState == Enum.EmailState.unread then 
            self.ReceiveText:setVisible(true)
            self.ConfirmText:setVisible(false)
        elseif self.mEmailState == Enum.EmailState.received then
            self.ReceiveText:setVisible(false)
            self.ConfirmText:setVisible(true)
        end
    end

    self.Enclosure:setVisible(true)
    self.resoursePanel:setVisible(true)
    if isEmptyItem then 
        self.resoursePanel:setVisible(false)
        self.Enclosure:setVisible(false)
    else
        self:createItem(itemData)
    end
end

function M:showEmailDesc(item)
    self.mMailTextView:removeAllChildren()
    local size = self.textPanel:getContentSize()

    local contentText = ccui.Text:create()
    contentText:setFontSize(24)
    contentText:setFontName("font/Default.TTF")

    local desc = item:getEmailContent()
    desc = string.gsub(desc,'\\n','\n')
    
    local values = item:getEmailParam()
    local MailContentConfig
    local valuesType
    if item:getEmailId() ~= 0 then
        MailContentConfig = DataManager:getTbxData("MailContent", item:getEmailId())
        valuesType = string.split(MailContentConfig.MailContentValueArray, ",")
    end
    
    if not Utils.isEmptyTable(values) then
        local len = table.getn(values)
        local str = ""
        for i = 1,len do 
            if valuesType and valuesType[i] and tonumber(valuesType[i]) == Enum.ParmType.number then
                str = str.. Utils.getFormatNumber_MuitiLanguage(values[i]) ..";"
            else
                str = str..values[i]..";"
            end
        end
        contentText:setString(Utils.getFormatString(tostring(desc), str))
    else
        contentText:setString(tostring(desc))
    end
    local testSize = contentText:getContentSize()

    contentText:setSize(cc.size(size.width,testSize.height * math.ceil(testSize.width / size .width)))
    contentText:ignoreContentAdaptWithSize(false)

    self.mMailTextView:pushBackCustomItem(contentText)

    local senderPanel = ccui.Layout:create()
    local senderText = ccui.Text:create()
    senderText:setFontSize(24)
    senderText:setFontName("font/Default.TTF")
    senderText:setAnchorPoint(cc.p(1,0.5))
    senderPanel:setContentSize(size.width,senderText:getContentSize().height)
    senderPanel:addChild(senderText)
    senderText:setPositionX(size.width)

    local timePanel = ccui.Layout:create()
    local timeText = ccui.Text:create()
    timeText:setFontSize(24)
    timeText:setFontName("font/Default.TTF")
    timeText:setAnchorPoint(cc.p(1,0.5))
    timePanel:setContentSize(size.width,timeText:getContentSize().height)
    timePanel:addChild(timeText)
    timeText:setPositionX(size.width)

    senderText:setString(item:getEmailSign())
    timeText:setString(item:getValidTimeText())
    self.mMailTextView:pushBackCustomItem(senderPanel)
    self.mMailTextView:pushBackCustomItem(timePanel)
end

function M:showEmailDesc2(item)
    self.mMailTextView:removeAllChildren()
    local size = self.textPanel:getContentSize()

    local desc = item:getEmailContent()
    
    --创建富文本
    local contentText,_,totalRow = Utils.CreateRichText2(desc)
    contentText:setAnchorPoint(cc.p(0,1))
    contentText:setPosition(cc.p(0,totalRow*30))
    
    local contentPanel = ccui.Layout:create()
    contentPanel:setContentSize(cc.size(560,totalRow*30))
    contentPanel:addChild(contentText)
    self.mMailTextView:pushBackCustomItem(contentPanel)

    local senderPanel = ccui.Layout:create()
    local senderText = ccui.Text:create()
    senderText:setFontSize(24)
    senderText:setFontName("font/Default.TTF")
    senderText:setAnchorPoint(cc.p(1,0.5))
    senderPanel:setContentSize(size.width,senderText:getContentSize().height)
    senderPanel:addChild(senderText)
    senderText:setPositionX(size.width)

    local timePanel = ccui.Layout:create()
    local timeText = ccui.Text:create()
    timeText:setFontSize(24)
    timeText:setFontName("font/Default.TTF")
    timeText:setAnchorPoint(cc.p(1,0.5))
    timePanel:setContentSize(size.width,timeText:getContentSize().height)
    timePanel:addChild(timeText)
    timeText:setPositionX(size.width)

    senderText:setString(item:getEmailSign())
    timeText:setString(item:getValidTimeText())
    self.mMailTextView:pushBackCustomItem(senderPanel)
    self.mMailTextView:pushBackCustomItem(timePanel)
end

function M:onSelectItem(item)
    if not item then return end

    local itemInfo = item:getItemInfo()

    if not itemInfo then return end 

    local itemTips = UIManager:getOrCreatePanel("UIPackageShowItemTips")
    if itemTips then 
        itemTips:setItemInfo(itemInfo)
        itemTips:showToScene()
    end
end

function M:onReciveBtnClick(ref)
    --Log.info(tostring(self.mEmailId).."点击领取邮件状态为"..tostring(self.mEmailState))
    if self.mEmailState == Enum.EmailState.unreceived or self.mEmailState == Enum.EmailState.unread then 
        g_EmailData:requestReciveEmail(self.mEmailId)
    elseif self.mEmailState == Enum.EmailState.received then
        self:closePanel()
    end 
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:refreshData(data)
    if not data then return end 
    --Log.info(tostring(self.mEmailId).."刷新邮件状态为"..tostring(data))
    local items = data.items
    local isEmptyItem = Utils.isEmptyTable(items)
    self.mEmailState = data.state
    if isEmptyItem then 
        self.ConfirmText:setVisible(true)
        self.ReceiveText:setVisible(false)
    else
        if self.mEmailState == Enum.EmailState.unreceived or self.mEmailState == Enum.EmailState.unread then 
            self.ReceiveText:setVisible(true)
            self.ConfirmText:setVisible(false)
        elseif self.mEmailState == Enum.EmailState.received then
            self.ReceiveText:setVisible(false)
            self.ConfirmText:setVisible(true)
        end
    end

    self.Enclosure:setVisible(true)
    self.resoursePanel:setVisible(true)
    if isEmptyItem then 
        self.resoursePanel:setVisible(false)
        self.Enclosure:setVisible(false)
    else
        self:createItem(items)
    end
end

function M:setEmailId(EmailId)
    self.mEmailId = EmailId
end

function M:onCleanup()
    M.super.onCleanup(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
    
    self:doRegEvent(Constant.CustomEvent.RefreshEmailUI, "refreshData")
end

return M