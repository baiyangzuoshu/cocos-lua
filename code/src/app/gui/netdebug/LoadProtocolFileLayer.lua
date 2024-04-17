local ProtobufUtils = require("app.util.ProtobufUtils")

local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("LoadProtocolFileLayer", UIPanel)

M.GUI_FILE_NAME = "csd.99_temp.99_01_net.99_01_1_LoadProtocolFileLayer.lua"


M.BINDGUIDATANODE = {
    ["PasteButton"] = { onClick = "onPasteButtonClick" },
    ["LoadButton"] = { onClick = "onLoadButtonClick" },
    ["BackButton"] = { onClick = "onBackButtonClick" },

    ["ContentText"] = { varname = "ContentText" },
}

function M:onBackButtonClick()
    local panel = UIManager:getOrCreatePanel("app.gui.netdebug.MessageDebugLayer")
    if panel then
        panel:showToScene()
    end
    self:closePanel()
end

function M:onPasteButtonClick()
    self.ContentText:setString(Utils.pasteFromClipboard())
end

function M:onLoadButtonClick()
    if not ProtobufUtils.loadProtocolContentByProtoc(self.ContentText:getString()) then
        --UIUtils.popToast("导入失败")
        self.ContentText:setString("")
    else
        --UIUtils.popToast("导入成功")
        self.ContentText:setString("")
    end
end

return M