local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIResultPopUp", UIPanel)

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_BoastResultPopUp.lua"

M.BINDGUIDATANODE = {
    ["ResultText_1_TT"]={varname="ResultText"},
    ["ResultNum"]={varname = "ResultNum"},
    ["ResultImage"] = {varname="ResultImage"},
}

function M:onCreate()
    M.super.onCreate(self)
end

function M:refreshLanguageHandle()
    --self.Text = self.ResultText:getString()
end

function M:setCallPointData(num,point)
    self.ResultNum:setString( tostring(num))
    --self.ResultText:setString(Utils.getFormatString(self.Text, tostring(num)))
    self.ResultImage:loadTexture("00_01_Common/2D_Dice_" .. point ..".png", ccui.TextureResType.plistType)

    local function SetAllChildFadeIn()
        local allchailds = self:getChildren()
        for _, v in ipairs(allchailds) do
            v:setOpacity(0)
            v:runAction(cc.FadeIn:create(0.4))
        end
    end

    self:setScale(0.5)
    self:setOpacity(0)
    SetAllChildFadeIn()
    self:runAction(cc.Spawn:create(cc.FadeIn:create(0.4),cc.ScaleTo:create(0.4,1)))
end

return M