local UINumberCell = require("app.gui.game.UINumberCell")

local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UINumberChooseLayer", UIPanel)

local CELL_WIDTH = UINumberCell.CELL_WIDTH
local CELL_HEIGT = UINumberCell.CELL_HEIGT

M.GUI_FILE_NAME = "csd.3_combat.3_01_fight.3_01_5_NumSelectLayer.lua"

M.BINDGUIDATANODE = {
    ["NumPanel"] = { varname = "ContentLayoutNode" },
}

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)

    self.mSelectNumber = 2
    self.mMin = 2
    self.mMax = Constant.MaxPlayers * 6

    local size = self.ContentLayoutNode:getContentSize()

    self.mTableView = cc.TableView:create(size)

    self.mTableView:setDirection(cc.SCROLLVIEW_DIRECTION_HORIZONTAL)
    self.mTableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)

    self.mTableView:setDelegate()

    self.mTableView:setBounceable(true)

    self.mTableView:setIgnoreAnchorPointForPosition(false)
    self.mTableView:setAnchorPoint(0, 0)
    self.mTableView:setPosition(0, 0)
    self.ContentLayoutNode:addChild(self.mTableView)

    self.mTableView:registerScriptHandler(handler(self, self.getNumberOfCellsInTableView), cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
    self.mTableView:registerScriptHandler(handler(self, self.getTableCellSizeForIndex), cc.TABLECELL_SIZE_FOR_INDEX)
    self.mTableView:registerScriptHandler(handler(self, self.getTableCellSizeAtIndex), cc.TABLECELL_SIZE_AT_INDEX)
    self.mTableView:registerScriptHandler(handler(self, self.onTableCellTouched), cc.TABLECELL_TOUCHED)
end

function M:onEnter()
    M.super.onEnter(self)

    self:refreshNumberRange(cc.p(0, 0))
end

function M:onExit()
    M.super.onExit(self)
end

function M:setChooseCallback(cb)
    self.mRefreshGameLayerCB = cb
end

function M:onScreenTouchEvent(ref, type)
    M.super.onScreenTouchEvent(self, ref, type)

    if type == ccui.TouchEventType.ended then
        self:closePanel()
    end
end

function M:setSelectNumber(number)
    self.mSelectNumber = number
end

function M:refreshNumberRange(offset)
    self.mMin = g_GameData:getMinCallNumber()
    self.mMax = g_GameData:getMaxCallNumber()

    self.mCellCount = self.mMax - self.mMin + 1

    self.mTableView:reloadData()

    if offset then
        self.mTableView:setContentOffset(offset, false)
    end
end

function M:getNumberOfCellsInTableView(tableview)
    return self.mCellCount
end

function M:getTableCellSizeForIndex(tableview, idx)
    return CELL_WIDTH, CELL_HEIGT
end

function M:getTableCellSizeAtIndex(tableview, idx)
    local cell = tableview:dequeueCell()
    if nil == cell then
        cell = cc.TableViewCell:new()
    end

    local panel = cell:getChildByName("UINumberCell")
    if not panel then
        panel = UINumberCell.new()
        panel:setName("UINumberCell")

        local size = panel:getContentSize()
        panel:setPosition((CELL_WIDTH - size.width) * 0.5, (CELL_HEIGT - size.height) * 0.5)
        cell:addChild(panel)
    end

    panel:setNumber(self.mMin + idx)

    return cell
end

function M:onTableCellTouched(tableview, cell)
    self.mSelectNumber = self.mMin + cell:getIdx()
    if self.mRefreshGameLayerCB then
        self.mRefreshGameLayerCB(self.mSelectNumber)
    end
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.GameCallPoint, "refreshNumberRange")
    self:doRegEvent(Constant.CustomEvent.GameStart, "refreshNumberRange")

end

return M