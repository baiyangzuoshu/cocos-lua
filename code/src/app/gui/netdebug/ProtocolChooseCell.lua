local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("ProtocolChooseCell", UIPanel)

M.GUI_FILE_NAME = "csd.99_temp.99_01_net.99_01_3_ProtocolChooseCell.lua"

M.ROW_WIDTH = 600
M.ROW_HEIGT = 60

M.BINDGUIDATANODE = {
    ["CheckBox"] = { varname = "CheckBox" },
    ["ProtocolName"] = { varname = "ProtocolName" },
}

function M:onCreate()
    M.super.onCreate(self)

    self:resetRootNodePosition(cc.p(0, 0))
    self:resetRootNodeAnchorPoint(cc.p(0, 0))

    self.CheckBox:setSelected(false)
    self.CheckBox:setTouchEnabled(false)
end

function M:initData(name, select)
    Log.log("name %s, select %s", name, tostring(select))
    self.ProtocolName:setString(name)
    self.CheckBox:setSelected(select)
end

return M