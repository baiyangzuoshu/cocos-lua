local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("SelectedLeopardCell", UIPanel)

M.GUI_FILE_NAME = "csd.02_02_GuessSize.02_02_SelectedLeopardCell.lua"

M.BINDGUIDATANODE = {
   ["LeopardHeadNode"]={varname="LeopardHeadNode"}
}

function M:onCreate()
    M.super.onCreate(self)
    
end

function M:refreshUI(data)
    local   player=data.player
    local   friendInfo= require("app.bean.FriendInfo").new(player)
    self.LeopardHeadNode:removeAllChildren()
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    avater:InitTexture(string.utf8len(friendInfo:getAvatar())<7,friendInfo:getAvatar(),friendInfo:getFriendUid())
    self.LeopardHeadNode:addChild(avater)
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