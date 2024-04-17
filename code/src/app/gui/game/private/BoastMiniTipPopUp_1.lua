local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("BoastMiniTipPopUp_1", UIPanel)

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_BoastMiniTipPopUp_1.lua"

M.BINDGUIDATANODE = {
    ["ConfirmButton"]={varname="ConfirmButton",onClick="clickBtnEvent"},
    ["CancelButton"]={varname="CancelButton",onClick="clickBtnEvent"},
    ["ContentText_TT"]={varname="ContentText1"},
    ["ContentText_1_TT"]={varname="ContentText2"}
}

function M:clickBtnEvent(ref)
    local name=ref:getName()
    if "ConfirmButton"==name then
        g_StoreData:requestShopList()
        self:closePanel()
    elseif "CancelButton"==name then
        self:closePanel()
    end
end

function M:setType(type)
    self.ContentText1:setVisible(type==1)
    self.ContentText2:setVisible(2==type)
end

function M:onCreate()
    M.super.onCreate(self)

    self:setShadeShowModel(true,255*0.7)
    
end

function M:onInit()
    M.super.onInit(self)
   
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
end

return M