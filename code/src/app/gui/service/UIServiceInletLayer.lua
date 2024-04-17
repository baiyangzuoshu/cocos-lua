local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIServiceInletLayer", UIPanel)

M.GUI_FILE_NAME = "csd.03_12_Service.03_12_ServiceInletLayer.lua"

M.BINDGUIDATANODE = {
    ["ServiceInletPanel"]={varname="ServiceInletPanel",onClick="onClickEvent"}
}

function M:onClickEvent()
    if g_UserData:getServiceTag() then
        local   panel=UIManager:getOrCreatePanel("UIServiceLayer")
        if panel then
            panel:setType(self.mType)
            panel:showToScene()
        end
    end
end

function M:setType(type)
    self.mType=type
end

function M:onCreate()
    M.super.onCreate(self)
end

function M:onInit()
    M.super.onInit(self)
    
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
    
end

function M:onCleanup()
    M.super.onCleanup(self)

end

return M