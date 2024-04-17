local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIInvitationRulesPopUp", UIPanel)

M.GUI_FILE_NAME = "csd.03_04_Invitation.03_04_InvitationRulesPopUp.lua"

M.BINDGUIDATANODE = {
    ["ContentText"]={varname="ContentText"}
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
    
    local textData = DataManager:getTbxData("Text", Enum.Text.ShareRules)
    local desc = string.gsub(textData.Desc,"\\n","\n")
    self["ContentText"]:setString(desc)
end

return M