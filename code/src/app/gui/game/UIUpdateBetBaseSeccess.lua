local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIUpdateBetBaseSeccess", UIPanel)

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_ReplaceBottomInjectionSuccess.lua"

M.BINDGUIDATANODE = {
    ["PromotionSuccessNum"]={varname="PromotionSuccessNum"},
    ["PromotionSuccess_TT"]={varname="PromotionSuccess"},
}


function M:onCreate()
    M.super.onCreate(self)
end

function M:setBetNumber(num)
    self.PromotionSuccessNum:setString(Utils.getFormatNumber_MuitiLanguage(tostring(num)))
end

function M:privateShowText()
    local text116 = Utils.getTextByTextId(116)
    self.PromotionSuccess:setString(text116)
    self.PromotionSuccessNum:setVisible(false)
end


return M