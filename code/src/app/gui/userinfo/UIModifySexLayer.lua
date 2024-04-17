local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIModifySexLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_06_PersonalCenter.01_06_ModifySexLayer.lua"

M.BINDGUIDATANODE = {
    ["ConfirmButton"] = { onClick = "onConfirmButtonClick" },
    ["CancelButton"] = { onClick = "onCancelButtonClick" },

    ["MaleCheckBox"] = { varname = "CheckBox_1"},
    ["FemaleCheckBox"] = { varname = "CheckBox_2"},
    ["NoDisplayedCheckBox"] = { varname = "CheckBox_3"},

    ["FirstText_TT"] = { varname = "FirstText"},
    ["Diamond"] = { varname = "Diamond"},
}

function M:onCreate()
    M.super.onCreate(self)

    self:setShadeShowModel(true)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.ClosePersonalInfoPanel, "onClosePanelEvent")
end

function M:onClosePanelEvent()
    self:closePanel()
end

function M:onInit()
    M.super.onInit(self)
    -- 初始化复选框状态
    self.mAllCheckBox = {}
    for i = 1, 3 do 
        local checkBox = self[string.format("CheckBox_%d", i)]
        checkBox:setTag(i)
        checkBox:setTouchEnabled(true)
        checkBox:addEventListener(handler(self, self.onCheckBoxClick))
        checkBox:setSelected(false)
        self.mAllCheckBox[i] = checkBox
    end

    self.mSelectIndex = g_UserData:getSex()

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

    self.FirstText:setVisible(not g_UserData:getIsChangeSex())
    self.Diamond:setVisible(g_UserData:getIsChangeSex())
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:onCheckBoxClick(sender, eventType)
    SoundSystemManager:playSound004()
    local index = sender:getTag()

    if self.mSelectIndex == index then 
        return
    end

    self.mSelectIndex = index

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

function M:getSelectIndex()
    return self.mSelectIndex
end

function M:setCancelCb(cb)
    self.m_cancelCb = cb
end

function M:setConfirmCb(cb)
    self.m_confirmCb = cb
end

function M:onCancelButtonClick(ref)
    if self.m_cancelCb then
        self.m_cancelCb()
    end
    self:closePanel()
end

function M:onConfirmButtonClick(ref)
    if self.m_confirmCb then
        self.m_confirmCb()
    end
end

return M