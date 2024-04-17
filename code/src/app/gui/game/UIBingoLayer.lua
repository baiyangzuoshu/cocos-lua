local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIBingoLayer", UIPanel)

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_BingoLayer.lua"

M.BINDGUIDATANODE = {
    ["LanguageNode_CN"]={varname="LanguageNode_CN"},
    ["LanguageNode_en"] = {varname="LanguageNode_en"},
    ["LanguageNode_TW"]={varname="LanguageNode_TW"},

    ["AwardGainNum_1"]={varname="AwardGainNum_1"},
    ["AwardGainNum_2"] = {varname="AwardGainNum_2"},
    ["AwardGainNum_3"]={varname="AwardGainNum_3"},
}
function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)
    self.mCountTime = 0
end

function M:setNum(num)
    self.mCountTime = 2

    local languageType = g_UserData:getSystemLanguage()
    self.LanguageNode_CN:setVisible(languageType == Enum.LanguageType.zh_cn)
    self.LanguageNode_en:setVisible(languageType == Enum.LanguageType.en)
    self.LanguageNode_TW:setVisible(languageType == Enum.LanguageType.zh_tw)

    if languageType == Enum.LanguageType.zh_cn then 
        self.AwardGainNum_1:setString(Utils.getFormatNumber_MuitiLanguage(tostring(num)))
    elseif languageType == Enum.LanguageType.en then
        self.AwardGainNum_2:setString(Utils.getFormatNumber_MuitiLanguage(tostring(num)))
    elseif languageType == Enum.LanguageType.zh_tw then
        self.AwardGainNum_3:setString(Utils.getFormatNumber_MuitiLanguage(tostring(num)))
    end
end

function M:OnUpdate(dt)
    if self.mCountTime<=0 then
        self:closePanel()
    end

    self.mCountTime=self.mCountTime-dt
end

return M