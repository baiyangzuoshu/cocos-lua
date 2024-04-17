local ProtobufUtils = require("app.util.ProtobufUtils")
local ProtocolChooseCell = require("app.gui.netdebug.ProtocolChooseCell")

local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("MessageDebugLayer", UIPanel)

M.GUI_FILE_NAME = "csd.99_temp.99_01_net.99_01_2_MessageDebugLayer.lua"

M.BINDGUIDATANODE = {

    ["ProtocolPanel"] = { varname = "ProtocolPanel" },
    ["MessageContentText"] = { varname = "MessageContentText" },
    ["OpCodeTextField"] = { varname = "OpCodeTextField" },

    ["OpCodePasteButton"] = { onClick = "onOpCodePasteButtonClick" },
    ["MessagePasteButton"] = { onClick = "onMessagePasteButtonClick" },
    ["SendButton"] = { onClick = "onSendButtonClick" },
    ["BackButton"] = { onClick = "onBackButtonClick" },

}

function M:onCreate()
    M.super.onCreate(self)

    self.mAllTypes = {}

    self.mSelectIndex = 1

    local size = self.ProtocolPanel:getContentSize()
    self.mProtocolsTableView = cc.TableView:create(cc.size(size.width, size.height))
    self.mProtocolsTableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
    self.mProtocolsTableView:setDelegate()
    self.mProtocolsTableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)

    self.mProtocolsTableView:setIgnoreAnchorPointForPosition(false)
    self.mProtocolsTableView:setAnchorPoint(0, 0)
    self.mProtocolsTableView:setPosition(0, 0)
    self.ProtocolPanel:addChild(self.mProtocolsTableView)

    self.mProtocolsTableView:registerScriptHandler(handler(self, self.cellNumForTable), cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
    self.mProtocolsTableView:registerScriptHandler(handler(self, self.cellSizeForTable), cc.TABLECELL_SIZE_FOR_INDEX)
    self.mProtocolsTableView:registerScriptHandler(handler(self, self.tableCellAtIndex), cc.TABLECELL_SIZE_AT_INDEX)
    self.mProtocolsTableView:registerScriptHandler(handler(self, self.tableCellTouched), cc.TABLECELL_TOUCHED)
end

function M:onEnter()
    M.super.onEnter(self)

    self:refresh()
end

function M:refresh()

    self.mAllTypes = {}

    self.mSelectIndex = 1

    for name, basename, type in pb.types() do
        if not self.mAllTypes[type] then
            self.mAllTypes[type] = {}
        end
        if string.find(name, "client") then
            table.insert(self.mAllTypes[type], string.sub(name, 2))
        end
    end

    self.mProtocolsTableView:reloadData()
end

function M:cellNumForTable(tableview)
    return table.getn(self.mAllTypes["message"])
end

function M:cellSizeForTable(tableview, idx)
    return ProtocolChooseCell.ROW_WIDTH, ProtocolChooseCell.ROW_HEIGT
end

function M:tableCellAtIndex(tableview, idx)
    local cell = tableview:dequeueCell()
    if nil == cell then
        cell = cc.TableViewCell:new()
    end

    local panel = cell:getChildByName("ProtocolChooseCell")
    if not panel then
        panel = ProtocolChooseCell.new()
        panel:setName("ProtocolChooseCell")

        local size = panel:getContentSize()
        panel:setPosition((ProtocolChooseCell.ROW_WIDTH - size.width) * 0.5, (ProtocolChooseCell.ROW_HEIGT - size.height) * 0.5)
        cell:addChild(panel)
    end

    panel:initData(self.mAllTypes["message"][idx + 1], self.mSelectIndex == idx + 1)

    return cell
end

function M:tableCellTouched(tableview, cell)
    local new = cell:getIdx() + 1
    if self.mSelectIndex == new then
        return
    end

    local old = self.mSelectIndex
    self.mSelectIndex = new

    self.mProtocolsTableView:updateCellAtIndex(old - 1)
    self.mProtocolsTableView:updateCellAtIndex(new - 1)
end

function M:updateCellAtIndex(index)

    self.mSelectIndex = 0
    return self.mProtocolsTableView:updateCellAtIndex(index)
end

function M:onOpCodePasteButtonClick()
    self.OpCodeTextField:setString(Utils.pasteFromClipboard())
end

function M:onMessagePasteButtonClick()
    self.MessageContentText:setString(Utils.pasteFromClipboard())
end
--[[
{
    "token":"21541"
}
]]
function M:onSendButtonClick()
    local opCodeStr = Utils.trim(self.OpCodeTextField:getString())
    if Utils.isEmptyStr(opCodeStr) then
        --UIUtils.popToast("操作码为空")
        Log.log("操作码为空")
        return
    end

    local protocolName = nil
    if self.mAllTypes["message"] then
        protocolName = self.mAllTypes["message"][self.mSelectIndex]
    end

    local data = nil
    local jsonStr = Utils.trim(self.MessageContentText:getString())
    if not Utils.isEmptyStr(jsonStr) then
        data = cjson.decode(jsonStr)
    end

    Client:sendMessage(tonumber(opCodeStr), protocolName, data)

    self.OpCodeTextField:setString("")
    self.MessageContentText:setString("")
end

function M:onBackButtonClick()
    self:closePanel()
end


return M