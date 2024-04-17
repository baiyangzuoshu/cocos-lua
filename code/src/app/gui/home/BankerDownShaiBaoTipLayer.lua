
local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("BankerDownShaiBaoTipLayer", UIPanel)

M.GUI_FILE_NAME = "csd.02_04_DiceBaby.02_04_DiceBabyMiniTipPopUp_1.lua"

M.BINDGUIDATANODE = {
    ["ContentText_1_2_TT"]={varname="ContentText_1_2_TT"},
    ["ContentText_1_1_TT"]={varname="ContentText_1_1_TT"},
    ["ContentText_1_TT"]={varname="ContentText_1_TT"},
    ["ConfirmButton"]={varname="ConfirmButton",onClick="onConfirmButton"},
}


function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)

    

end

function M:initDataByType(type)
    if type ==Enum.ShaiBaoOffReason.TimeOver then
        self.ContentText_1_2_TT:setVisible(false)
        self.ContentText_1_1_TT:setVisible(true)
        self.ContentText_1_TT:setVisible(false)
    elseif type ==Enum.ShaiBaoOffReason.ReqOff then

    elseif type ==Enum.ShaiBaoOffReason.ChipNotEnough then
        self.ContentText_1_2_TT:setVisible(false)
        self.ContentText_1_1_TT:setVisible(false)
        self.ContentText_1_TT:setVisible(true)
    elseif type ==Enum.ShaiBaoOffReason.BeKicked then
        self.ContentText_1_2_TT:setVisible(true)
        self.ContentText_1_1_TT:setVisible(false)
        self.ContentText_1_TT:setVisible(false)
    end
end

function M:onConfirmButton(ref)
    self:closePanel()
end



return M