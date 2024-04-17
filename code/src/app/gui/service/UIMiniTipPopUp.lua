local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIMiniTipPopUp", UIPanel)

M.GUI_FILE_NAME = "csd.03_12_Service.03_12_MiniTipPopUp.lua"

M.BINDGUIDATANODE = {
    ["Language"]={varname="Language"},
    ["Gender"]={varname="Gender"},
    ["LanguageCheckBox_1"]={varname="LanguageCheckBox_1"},
    ["LanguageCheckBox_2"]={varname="LanguageCheckBox_2"},
    ["LanguageCheckBox_3"]={varname="LanguageCheckBox_3"},
    ["LanguageCheckBox_4"]={varname="LanguageCheckBox_4"},
    ["GenderCheckBox_1"]={varname="GenderCheckBox_1"},
    ["GenderCheckBox_2"]={varname="GenderCheckBox_2"},
    ["GenderCheckBox_3"]={varname="GenderCheckBox_3"},
    ["GenderCheckBox_4"]={varname="GenderCheckBox_4"},
}

function M:onCreate()
    M.super.onCreate(self)

    self:setShadeShowModel(true,125)
end

function M:onCloseEvent()
    self:closePanel()
end

function M:checkBoxCallback(ref)
    DataManager:dispatchMessage(Constant.CustomEvent.UIServiceLayer_selectButtonEvent,{tag=ref:getTag()})
    self:closePanel()
end

function M:refreshUI(type)
    for i=1,4,1 do
        local checkbox=self["LanguageCheckBox_"..i]
        checkbox:setTag(i)
        checkbox:setSelectedState(false)
        checkbox:addEventListener(handler(self,self.checkBoxCallback))
    end

    for i=1,4,1 do
        local checkbox=self["GenderCheckBox_"..i]
        checkbox:setTag(i+4)
        checkbox:setSelectedState(false)
        checkbox:addEventListener(handler(self,self.checkBoxCallback))
    end

    self.Language:setVisible(Enum.ServicePlayerSort.LanguageButton==type)
    self.Gender:setVisible(Enum.ServicePlayerSort.GenderButton==type)
end

function M:onInit()
    M.super.onInit(self)
    
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
    
end

function M:onCleanup()
    M.super.onCleanup(self)

end

return M