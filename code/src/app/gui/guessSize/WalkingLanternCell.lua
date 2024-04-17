local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("WalkingLanternCell", UIPanel)

M.GUI_FILE_NAME = "csd.02_02_GuessSize.02_02_WalkingLanternCell.lua"

M.BINDGUIDATANODE = {
   
}

function M:onCreate()
    M.super.onCreate(self)
    
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:onCleanup()
    M.super.onCleanup(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
end

return M