local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UILanguageChangeLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_07_Sitting.01_07_SIttingLanguagePopUp.lua"

M.BINDGUIDATANODE = {
    ["InteractionPopups"] = { varname = "InteractionPopups" },

    --繁体中文
    ["LanguageCheckBox_1"] = { varname = "LanguageCheckBox_1" },
    --简体中文
    ["LanguageCheckBox_2"] = { varname = "LanguageCheckBox_2" },
    --英文
    ["LanguageCheckBox_3"] = { varname = "LanguageCheckBox_3" },

    ["Language_3"]={varname="Language_3"}
}

local Language = {
    zh = 1,
    tw = 2,
    en = 3,
}

function M:onCreate()
    M.super.onCreate(self)
    self.Language_3:setVisible(true)
    self.LanguageCheckBox_3:setVisible(true)
    self:setShadeShowModel(true)

    self:initOutClickableArea()
end

function M:initOutClickableArea()
    local function onOutOfQuickBoxClick()
        local languageType = g_UserData:getSystemLanguage()
        local language = Language.zh
        if languageType == Enum.LanguageType.zh_cn then 
            language = Language.zh
        elseif languageType == Enum.LanguageType.en then
            language = Language.en
        elseif languageType == Enum.LanguageType.zh_tw then 
            language = Language.tw
        end
        g_UserData:requestSvnMuitiLanguageToServer(language)
        g_UserData:saveDataToLocal()
        --UIManager:reloadAllPanel()
        UIManager:reBindAllNode()
        g_EmailData:requestEmailList()
        DataManager:dispatchMessage(Constant.CustomEvent.RefreshMultiLanguage)
        self:closePanel(0)
        DataManager:dispatchMessage(Constant.CustomEvent.mainReBindAllNode)
    end

    UIUtils.addClickableNode(self.InteractionPopups, nil, onOutOfQuickBoxClick)
end

function M:onInit()
    M.super.onInit(self)

    -- 初始化复选框状态
    self.mAllCheckBox = {}
    for i = 1, 3 do 
        local checkBox = self[string.format("LanguageCheckBox_%d", i)]
        checkBox:setTag(i)
        checkBox:setTouchEnabled(true)
        checkBox:addEventListener(handler(self, self.onCheckBoxClick))
        checkBox:setSelected(false)
        self.mAllCheckBox[i] = checkBox
    end

    local languageType = g_UserData:getSystemLanguage()

    if languageType == Enum.LanguageType.zh_cn then 
        self.mSelectIndex = 2
    elseif languageType == Enum.LanguageType.en then
        self.mSelectIndex = 3
    elseif languageType == Enum.LanguageType.zh_tw then 
        self.mSelectIndex = 1
    end

    for i = 1, 3 do
        local checkBox = self.mAllCheckBox[i]
        if checkBox then
            if self.mSelectIndex == i then 
                checkBox:setTouchEnabled(false)
                checkBox:setSelected(true)
            else
                checkBox:setTouchEnabled(true)
                checkBox:setSelected(false)
            end 
        end
    end
end

function M:onCheckBoxClick(sender, eventType)
    SoundSystemManager:playSound004()
    local index = sender:getTag()

    if self.mSelectIndex == index then 
        return
    end

    self.mSelectIndex = index

    local languageType = Enum.LanguageType.zh_cn
    if  self.mSelectIndex == 1 then 
        languageType = Enum.LanguageType.zh_tw
    elseif  self.mSelectIndex == 2 then
        languageType = Enum.LanguageType.zh_cn
    elseif  self.mSelectIndex == 3 then 
        languageType = Enum.LanguageType.en
    end

    g_UserData:setSystemLanguage(languageType)

    if ccui.CheckBoxEventType.selected == eventType then
        for i = 1, 3 do
            local checkBox = self.mAllCheckBox[i]
            if checkBox then
                if index == i then 
                    checkBox:setTouchEnabled(false)
                    checkBox:setSelected(true)
                else
                    checkBox:setTouchEnabled(true)
                    checkBox:setSelected(false)
                end 
            end
        end
    end
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:getSelectIndex()
    return self.mSelectIndex
end

function M:onCleanup()
    M.super.onCleanup(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
end

return M