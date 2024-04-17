local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UISettingHelpLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_07_Sitting.01_07_SittingHelpLayer.lua"

M.BINDGUIDATANODE = {

    ["HelpPanel"] = { varname = "HelpPanel"},

    -- 返回按钮
    ["ReturnPanel"] = { varname = "ReturnPanel", onEvent = "onClickReturn" },

    ["BelowLeftBg"] = { varname = "BelowLeftBg"},

}

local Language = {
    zh = "zh",
    tw = "zh_tw",
    en = "en",
}

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true,125)
end

function M:setData(gameType)
    local languageType = g_UserData:getSystemLanguage()
    local language = Language.zh
    if languageType == Enum.LanguageType.zh_cn then 
        language = Language.zh
    elseif languageType == Enum.LanguageType.en then
        language = Language.en
    elseif languageType == Enum.LanguageType.zh_tw then 
        language = Language.tw
    end
    local url = Net.WebNetHttp.."/help/index.html?lang="..tostring(language).."&typeId="..tostring(gameType)
    -- local url = "https://test-letsroll.yippeekiyay.com.tw".."/help/index.html?lang="..tostring(language).."&typeId="..tostring(gameType)

    local size = self.HelpPanel:getContentSize()
    -- print("============123",self.BelowLeftBg:getContentSize().height)

    self.helpWebView = ccexp.WebView:create()
    self.helpWebView:addTo(self.HelpPanel)
    self.helpWebView:setAnchorPoint(0,0)
    self.helpWebView:setPosition(cc.p(0,0))

    local winsize=cc.Director:getInstance():getWinSize()
    self.helpWebView:setContentSize(size.width,winsize.height - self.BelowLeftBg:getContentSize().height)

    
    self.helpWebView:loadURL(url)
    -- self.helpWebView:setScalesPageToFit(true)

    local panel = UIManager:getOrCreatePanel("UILoginLimitPopUp")
    if panel then
        panel:showToScene()
    end

    local finishCallback = function ()
        -- print("=-=-=-=-=-1111222")
        panel:closePanel()
    end
    
    self.helpWebView:setOnDidFinishLoading(finishCallback)

-- typeId，游戏模式：`吹牛-0` | `牛牛-1` | `豹子梭哈-2` | `单挑-3` | `红黑-4` | `猜大小-5`，此字段默认值为`0`（吹牛）
end

function M:onClickReturn(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        local scaleToStart = cc.ScaleTo:create(0.05, 0.9)
        local scaleToEnd = cc.ScaleTo:create(0.05, 1.0)
        self.ReturnPanel:runAction(cc.Sequence:create(scaleToStart, scaleToEnd, cc.CallFunc:create(
            function ()
                self:closePanel(0)
            end
        )))
    end
end

return M