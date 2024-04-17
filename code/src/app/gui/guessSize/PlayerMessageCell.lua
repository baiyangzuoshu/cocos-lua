local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("PlayerMessageCell", UIPanel)

M.GUI_FILE_NAME = "csd.02_02_GuessSize.02_02_PlayerMessageCell.lua"

M.BINDGUIDATANODE = {
   ["MessageHead"]={varname="MessageHead"},
   ["PlayerDiceMessage_1"]={varname="PlayerDiceMessage_1"},
   ["PlayerDiceMessage_2"]={varname="PlayerDiceMessage_2"},
   ["PlayerDiceMessage_3"]={varname="PlayerDiceMessage_3"},
   ["PlayerMessageText"]={varname="PlayerMessageText"}
}

function M:refreshUI(data)
    self.PlayerMessageText:setString("")
    local str = self:parseContent(data)
    
    local node = Utils.CreateRichText(str)
    node:setPosition(cc.p(0,0))
    node:setAnchorPoint(cc.p(0,0.5))
    self.PlayerMessageText:addChild(node)
end

function M:parseContent(data)
    local GuessSizeRichText

    local betType=data.betType
    local win=data.win
    local total=data.player.name..";"
    
    if 1==betType then--大
        if win then
            GuessSizeRichText = Utils.getTextByTextId(Enum.Text.GuessSizeBigWin)
        else
            GuessSizeRichText = Utils.getTextByTextId(Enum.Text.GuessSizeBigLose)
        end
        
    else--小
        if win then
            GuessSizeRichText = Utils.getTextByTextId(Enum.Text.GuessSizeSmallWin)
        else
            GuessSizeRichText = Utils.getTextByTextId(Enum.Text.GuessSizeSmallLose)
        end
    end

    total=total..Utils.getFormatNumber_MuitiLanguage(data.goldWin)..";"
    
    local ret=Utils.getFormatString(GuessSizeRichText, total..';')
    local ret=string.gsub(ret,'\\"','"')--策划导出的表格数据有问题，需要特殊处理
    
    return ret
end

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