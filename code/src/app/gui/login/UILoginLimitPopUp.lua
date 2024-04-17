local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UILoginLimitPopUp", UIPanel)

M.GUI_FILE_NAME = "csd.01_01_Login.01_01_LoginLimitPopUp.lua"

M.BINDGUIDATANODE = {
    ["LimitIcon"] = { varname = "LimitIcon"},
}

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)
    
    self.mAngularSpeed = 45
end

function M:onInit()
    M.super.onInit(self)

end

function M:onEnter()
    M.super.onEnter(self)
    self.mShowTime = 5
    self.LimitIcon:setRotation(0)
end

function M:OnUpdate(dt)
    if self.mShowTime <= 0 then
        self:closePanel()
    end

    self.mShowTime = self.mShowTime - dt
    self.LimitIcon:setRotation((self.LimitIcon:getRotation()+self.mAngularSpeed*dt)%360)
end

return M