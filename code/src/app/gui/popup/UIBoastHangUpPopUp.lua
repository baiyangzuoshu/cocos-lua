local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIBoastHangUpPopUp", UIPanel)
M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_BoastHangUpPopUp.lua"

M.BINDGUIDATANODE = {
    ["InteractionPopups"] = { varname = "InteractionPopup"},
}

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)
    
    self:initOutClickableArea()
end

function M:onInit()
    M.super.onInit(self)
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:initOutClickableArea()
    local function onOutOfQuickBoxClick()
        self:closePanel()
    end

    UIUtils.addClickableNode(self.InteractionPopup, nil, onOutOfQuickBoxClick)
end

return M