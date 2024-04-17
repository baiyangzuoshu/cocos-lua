local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("DiceBabyShutupPopUp", UIPanel)

local UIMuteItem = require("app.gui.home.UIMuteItem")
M.GUI_FILE_NAME = "csd.02_04_DiceBaby.02_04_DiceBabyShutupPopUp.lua"

M.BINDGUIDATANODE = {
    ["ShutupPanel"]={varname="ShutupPanel"},
}


function M:onCreate()
    M.super.onCreate(self)

    self:setShadeShowModel(true)

    self.MuteData = {}
    -- for k, v in pairs(g_SieveData:getmMuteList()) do
    --     g_SieveData:getPlayerAvatar(v)
    -- end
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sAvatarInfo, {uids=g_SieveData:getmMuteList()})

    local size = self.ShutupPanel:getContentSize()
    self.mMuteListTableView = cc.TableView:create(size)
    self.mMuteListTableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
    self.mMuteListTableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
    self.mMuteListTableView:setBounceable(true)
    self.mMuteListTableView:setIgnoreAnchorPointForPosition(false)
    self.mMuteListTableView:setAnchorPoint(0, 0)
    self.mMuteListTableView:setPosition(0, 0)

    self.ShutupPanel:addChild(self.mMuteListTableView)

    self.mMuteListTableView:setDelegate()
    self.mMuteListTableView:registerScriptHandler(handler(self, self.getMuteListLength), cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
    self.mMuteListTableView:registerScriptHandler(handler(self, self.getMuteCellSize), cc.TABLECELL_SIZE_FOR_INDEX)
    self.mMuteListTableView:registerScriptHandler(handler(self, self.setMuteCell), cc.TABLECELL_SIZE_AT_INDEX)
end

function M:onScreenTouchEvent(ref, type)
    M.super.onScreenTouchEvent(self, ref, type)

    if type == ccui.TouchEventType.ended then
        self:closePanel(0)
    end
end

function M:refreshMuteList(MuteData)
    if not MuteData or #MuteData.avatarInfo == 0 then
        self:closePanel(0)
        return
    end
    self.MuteData = MuteData.avatarInfo

    self.mMuteListTableView:reloadData()
end

function M:getMuteListLength()
    return #g_SieveData:getmMuteList()
end

function M:getMuteCellSize()
    return UIMuteItem.CELL_WIDTH, UIMuteItem.CELL_HEIGHT
end

function M:setMuteCell(tableview, idx)
    local cell = tableview:dequeueCell()
    if nil == cell then
        cell = cc.TableViewCell:new()
    end

    local panel = cell:getChildByName("UIMuteItem")
    if not panel then
        panel = UIMuteItem.new()
        panel:setName("UIMuteItem")

        local size = panel:getContentSize()
        panel:setPosition(size.width * 0.5, size.height * 0.5)
        cell:addChild(panel)
    end
    panel:setVisible(true)
    panel:refreshData(self.MuteData[idx+1],idx+1)

    return cell
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.DiceBabyShutupPopUp_refreshData, "refreshMuteList")
end

return M