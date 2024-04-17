
local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIInvitationSharePopUp", UIPanel)

M.GUI_FILE_NAME = "csd.03_04_Invitation.03_04_InvitationSharePopUp.lua"

M.BINDGUIDATANODE = {

}

function M:onCloseEvent()
    self:closePanel()
end

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)
end

function M:onInit()
    M.super.onInit(self)
    
end

return M