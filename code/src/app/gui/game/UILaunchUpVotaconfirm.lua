local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UILaunchUpVotaconfirm", UIPanel)

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_ReplaceBottomLayer.lua"

M.BINDGUIDATANODE = {
    ["StakeGoldButton"]={varname="StakeGoldButton",onClick = "onClickNo"},
    ["StakeGoldButton_1"]={varname="StakeGoldButton_1",onClick = "onClickYes"},
    ["StakeGoldText"]={varname="StakeGoldText"},

}

function M:onCreate()
    M.super.onCreate(self)

    self.mCallFunc = nil

    self:setShadeShowModel(true)
end

function M:onEnter()
    M.super.onEnter(self)

    self.BelowLeftFit_3:setPositionY(0)
end

function M:setHandleCallback(callFunc)
    self.mCallFunc = callFunc
end

function M:setNowBetLevel(level)
    local level = level
    local _roomdata = DataManager:getTbxData("Room")
    for k,v in pairs(_roomdata) do
        if v.RoomLv == level+1 then
            self.StakeGoldText:setString(Utils.getFormatNumber_MuitiLanguage(tostring(v.StakeGold)))
            break
        end
    end
end

function M:onClickNo(ref)
    if self.mCallFunc then
        self.mCallFunc(false)
    end

    self:removeFromParent()
end

function M:onClickYes(ref)
    if self.mCallFunc then
        self.mCallFunc(true)
    end

    self:removeFromParent()
end

return M