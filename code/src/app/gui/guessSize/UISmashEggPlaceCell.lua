local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UISmashEggPlaceCell", UIPanel)

M.GUI_FILE_NAME = "csd.02_02_GuessSize.02_02_SmashEggPlaceCell.lua"

M.BINDGUIDATANODE = {
   ["SmashEggNode"]={varname="SmashEggNode"}
}

function M:onCreate()
    M.super.onCreate(self)
end

function M:refreshUI(data)
    
end

function M:playClick()
    
end

function M:playNormalAnimation()
    
end

function M:playGoldAniamtion(gold)
    
end

function M:playHeadAnimation()
    
end

function M:getWorldPosition()
    local pos=self.SmashEggPlayerHead:convertToWorldSpaceAR(cc.p(0,0))

    return pos
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