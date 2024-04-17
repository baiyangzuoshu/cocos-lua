local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UISizeResultSpriteCell", UIPanel)

M.GUI_FILE_NAME = "csd.02_02_GuessSize.02_02_SizeResultSpriteCell.lua"

M.BINDGUIDATANODE = {
   ["SizeResultLittleImage_IVT"] = { varname = "SizeResultSpriteSmall" },
   ["SizeResultBigImage_IVT"] = { varname = "SizeResultSpriteBig" },
}

function M:onCreate()
    M.super.onCreate(self)
end

function M:getSpriteSize()
    return self.SizeResultSpriteBig:getContentSize() or self.SizeResultSpriteSmall:getContentSize()
end

function M:getShowImage()
    local image = self.SizeResultSpriteBig
    if not self.SizeResultSpriteBig:isVisible() then 
        image = self.SizeResultSpriteSmall
    end
    return image
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:refreshSpriteByBetType(betType)
    self.SizeResultSpriteBig:setVisible(betType == 1)
    self.SizeResultSpriteSmall:setVisible(betType == 2)
end

function M:onCleanup()
    M.super.onCleanup(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
end

return M