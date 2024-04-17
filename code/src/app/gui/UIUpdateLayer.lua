local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIUpdateLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_01_Login.01_01_LoadingLayer_0.lua"

M.BINDGUIDATANODE = {
    ["LoadingStrip"] = { varname = "ProgressBar" },
    ["VersionNum"] = { varname = "VerText"},
    ["Text_2"] = {varname = "ProgressText"}
}

function M:onCreate()
    M.super.onCreate(self)

    self:setShadeShowModel(true)
    
    SoundSystemManager:playBackMusic(SoundSystemManager:getRandomDefaultBGMPath())

    self.mPercent = 0
    self.mActive = false
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
    self:doRegEvent("UIUpdateLayer_UpdatePrass","UpdatePrass")
    self:doRegEvent("UIUpdateLayer_UpdateSessess", "UpdateSessess")
    self:doRegEvent("UIUpdateLayer_UpdateFail", "UpdateFail")
    self:doRegEvent("UIUpdateLayer_UpdateVerisonShow", "updateVerisonShow")

end
function M:UpdatePrass(data)
    
    self.ProgressText:setString(string.format("%d",data.percent).."%")
    self.ProgressBar:setPercent(data.percent)
end

function M:UpdateSessess(data)
    self:gotoNextScene()
end

function M:UpdateFail(data)
    --更新失败处理
end

function M:updateVerisonShow(data)
    local   resourceVersion=data.resourceVersion
    
    self.VerText:setString("Ver:"..resourceVersion)
    self.VerText:setVisible(true)
end

function M:onEnter()
    M.super.onEnter(self)
    self.mPercent = 0
    self.mActive = true
    self.ProgressText:setString("")
    self.ProgressBar:setPercent(0)
    self.VerText:setVisible(false)
    
    if DeviceUtils.isWindows() then
        self.VerText:setString("Ver:1.4.2")
        HodUpdateManager:getInitData("1.4.2",Enum.requestServerHodType.InternalTest)
    else
        self.VerText:setString("Ver:"..g_GameSettingData:getVersion())
        HodUpdateManager:getInitData(g_GameSettingData:getVersion(),Net.requestServerHodType)
    end
end

function M:OnUpdate(dt)
    -- if not self.mActive then
    --     return
    -- end

    -- if self.mPercent < 100 then
    --     self.mPercent = self.mPercent + 1
    -- elseif self.mPercent >= 100 then
    --     self.mPercent = 100
    --     self:gotoNextScene()
    -- end

    -- self.ProgressBar:setPercent(self.mPercent)
end

function M:gotoNextScene()
    self.mActive = false
    --Log.info("1111111111111111111111111111111")
    
end

return M