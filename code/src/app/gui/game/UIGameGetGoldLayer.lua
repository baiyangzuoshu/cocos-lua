local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIGameGetGoldLayer", UIPanel)

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_ReapProfitLayer.lua"

M.BINDGUIDATANODE = {


}



function M:onCreate()
    M.super.onCreate(self)

end

function M:onInit()
    M.super.onInit(self)
    SoundSystemManager:playSound0013()
end

return M