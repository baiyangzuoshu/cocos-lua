local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("BoastMiniTipPopUp_1", UIPanel)

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_BoastMiniTipPopUp_1.lua"

M.BINDGUIDATANODE = {
    ["ConfirmButton"] = { varname = "ConfirmButton", onEvent = "onClickConfirmButton" },
    ["CancelButton"] = { varname = "CancelButton", onEvent = "onClickCancelButton" },
}

function M:onCreate()
    M.super.onCreate(self)

    self:setShadeShowModel(true)
end

function M:onInit()
    M.super.onInit(self)

end

function M:onCloseEvent()
end

function M:onClickConfirmButton(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        g_StoreData:requestShopList()
        self:closePanel()
    end
end

function M:onClickCancelButton(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        self:closePanel()
    end
end

return M