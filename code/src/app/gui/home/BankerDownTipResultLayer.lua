
local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("BankerDownTipResultLayer", UIPanel)

M.GUI_FILE_NAME = "csd.02_04_DiceBaby.02_04_MainDiceBabyHintCell.lua"

M.BINDGUIDATANODE = {
    ["MainDiceBabyHintText_1_TT"]={varname="MainDiceBabyHintText_1_TT"},
    ["MainDiceBabyHintText_2_TT"]={varname="MainDiceBabyHintText_2_TT"},
    ["MainDiceBabyHintText_3_TT"]={varname="MainDiceBabyHintText_3_TT"},
}


function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)

    Log.info("BankerDownTipResultLayer")

    

end

function M:initDataByType(type)
    if type ==Enum.ShaiBaoOffReason.TimeOver then
        self.MainDiceBabyHintText_1_TT:setVisible(false)
        self.MainDiceBabyHintText_3_TT:setVisible(true)
        self.MainDiceBabyHintText_2_TT:setVisible(false)
    elseif type ==Enum.ShaiBaoOffReason.ReqOff then

    elseif type ==Enum.ShaiBaoOffReason.ChipNotEnough then
        self.MainDiceBabyHintText_1_TT:setVisible(false)
        self.MainDiceBabyHintText_3_TT:setVisible(false)
        self.MainDiceBabyHintText_2_TT:setVisible(true)
    elseif type ==Enum.ShaiBaoOffReason.BeKicked then
        self.MainDiceBabyHintText_1_TT:setVisible(true)
        self.MainDiceBabyHintText_3_TT:setVisible(false)
        self.MainDiceBabyHintText_2_TT:setVisible(false)
    end
end




return M