local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIGameAnnouncement", UIPanel)

M.GUI_FILE_NAME = "csd.01_01_Login.01_01_NoticeLayer.lua"

M.BINDGUIDATANODE = {
    ["Bg_1"] = { varname = "Bg"},
    ["NoticeText"] = { varname = "NoticeText"},
    ["KnowButton"] = { varname = "KnowButton", onClick = "onClickKnowButton"},
}

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)

    self.NoticeText:ignoreContentAdaptWithSize(false)
end

function M:onInit()
    M.super.onInit(self)

    self.NoticeText:setString("")
end

function M:onEnter()
    M.super.onEnter(self)

    local desc = ""
    local languageType = g_UserData:getSystemLanguage()
    if languageType == Enum.LanguageType.zh_cn then 
        desc = Net.versionNotice["zh-Hans"] or ""
    elseif languageType == Enum.LanguageType.en then
        desc = Net.versionNotice["en"] or ""
    else
        desc = Net.versionNotice["zh-Hant"] or ""
    end
    local pos=string.find(desc,"style",1)
    if pos then
        --创建富文本
        local node,text = Utils.CreateRichText(desc)

        self.NoticeText:setVisible(false)
        self.NoticeText:setString(text)
        node:setContentSize(self.NoticeText:getContentSize())
        node:setAnchorPoint(cc.p(0, 0.5))
        node:setPosition(cc.p(self.Bg:getContentSize().width, self.Bg:getContentSize().height / 2))
        self.Bg:addChild(node)
    else
        self.NoticeText:setString(desc)
    end
end

function M:onClickKnowButton(ref)
    self:closePanel()
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
end


return M