local UIBoastPlayerItem = require("app.gui.game.UIBoastPlayerItem")
local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIBoastPlayerListLayer", UIPanel)

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_BoasPlayertListPopUp.lua"

M.BINDGUIDATANODE = {
    ["InteractionPopup"] = { varname = "InteractionPopup" },

    --对局玩家列表
    ["BoastListPanel"] = { varname = "ListPanel" },
    ["TitleText_TT"] = { varname = "TitleText"}
}

function M:onCreate()
    M.super.onCreate(self)

    self.mBoastPlayerListRow = 0

    local size = self.ListPanel:getContentSize()
    self.mBoastPlayerListTableView = cc.TableView:create(size)
    self.mBoastPlayerListTableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
    self.mBoastPlayerListTableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
    self.mBoastPlayerListTableView:setBounceable(true)
    self.mBoastPlayerListTableView:setIgnoreAnchorPointForPosition(false)
    self.mBoastPlayerListTableView:setAnchorPoint(0, 0)
    self.mBoastPlayerListTableView:setPosition(0, 0)

    self.ListPanel:addChild(self.mBoastPlayerListTableView)

    self.mBoastPlayerListTableView:setDelegate()
    self.mBoastPlayerListTableView:registerScriptHandler(handler(self, self.getListCellNumber), cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
    self.mBoastPlayerListTableView:registerScriptHandler(handler(self, self.getListCellSize), cc.TABLECELL_SIZE_FOR_INDEX)
    self.mBoastPlayerListTableView:registerScriptHandler(handler(self, self.getListCell), cc.TABLECELL_SIZE_AT_INDEX)

    self:initOutClickableArea()
end

function M:initOutClickableArea()
    local function onOutOfQuickBoxClick()
        self:closePanel()
    end

    UIUtils.addClickableNode(self.InteractionPopup, nil, onOutOfQuickBoxClick)
end

function M:OnUpdateBoastPlayerList()
    -- local mPlayers = g_GameData:getGamePlayers()
    local mAudiences = g_GameData:getAudiences()
    self.mBoastPlayerListData={}
    -- for i = 0, 5 do
    --     if not mPlayers[i]:isEmptySeat() then
    --         local basedata = mPlayers[i]:getBaseData()
    --         if basedata then
    --             table.insert(self.mBoastPlayerListData,basedata)
    --         end
    --     end
    -- end

    if not Utils.isEmptyTable(mAudiences) then 
        for k,v in ipairs(mAudiences) do
            table.insert(self.mBoastPlayerListData,v)
        end
    end
    
    local listNum = table.getn(self.mBoastPlayerListData)
    self.mBoastPlayerListRow = math.ceil(listNum / UIBoastPlayerItem.ITEM_COLUMN)

    self.mBoastPlayerListTableView:reloadData()
end

function M:getListCellNumber(tableview)
    return self.mBoastPlayerListRow
end

function M:getListCellSize(tableview, idx)
    return UIBoastPlayerItem.CELL_WIDTH, UIBoastPlayerItem.CELL_HEIGHT
end

function M:getListCell(tableview, idx)
    local cell = tableview:dequeueCell()
    if nil == cell then
        cell = cc.TableViewCell:new()
    end

    local panel = cell:getChildByName("UIBoastPlayerItem")
    if not panel then
        panel = UIBoastPlayerItem.new()
        panel:setName("UIBoastPlayerItem")

        local size = panel:getContentSize()
        panel:setPosition((UIBoastPlayerItem.CELL_WIDTH - size.width) * 0.5, (UIBoastPlayerItem.CELL_HEIGHT - size.height) * 0.5)
        cell:addChild(panel)
    end

    panel:refreshData(self.mBoastPlayerListData[idx+1])

    return cell
end

function M:onInit()
    M.super.onInit(self)
end

function M:onEnter()
    M.super.onEnter(self)
    
    local roomid=g_GameData:getRealGameID()
    -- self.TitleText:setString("房间 "..roomid)
    self.TitleText:setString(Utils.getFormatString(self.mTitleText, tostring(roomid)))
    self:OnUpdateBoastPlayerList()
end

function M:refreshLanguageHandle()
    self.mTitleText = self.TitleText:getString()

    local roomid=g_GameData:getRealGameID()
    self.TitleText:setString(Utils.getFormatString(self.mTitleText, tostring(roomid)))
end

function M:OnUpdate(dt)
    
end

function M:onCleanup()
    M.super.onCleanup(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
end

return M