local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UINetLimitPopUp", UIPanel)

M.GUI_FILE_NAME = "csd.01_01_Login.01_01_LoginLimitPopUp.lua"

M.BINDGUIDATANODE = {
    ["LimitIcon"] = { varname = "LimitIcon"},
}

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)

    local   action1=cc.RotateTo:create(1.0,180)
    local   action2=cc.RotateTo:create(1.0,360)
    local   seq=cc.Sequence:create(action1,action2)
    self.LimitIcon:runAction(cc.RepeatForever:create(seq))
end

function M:onInit()
    M.super.onInit(self)

    self.time_out=60*3
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:OnUpdate()
    self.time_out=self.time_out-1
    
    if self.time_out<=0 then
        self:closePanel()
    end
end
return M