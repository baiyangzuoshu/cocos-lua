local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("RankingPlayerCell", UIPanel)

M.GUI_FILE_NAME = "csd.02_02_GuessSize.02_02_RankingPlayerCell.lua"

M.BINDGUIDATANODE = {
   ["RankingTrophyIcon"]={varname="RankingTrophyIcon"},
   ["RankingPlayerHead"]={varname="RankingPlayerHead"},
   ["RankingPlayerName_O"]={varname="RankingPlayerName"},
   ["RankingPlayerVipImage"]={varname="RankingPlayerVipImage"},
   ["RankingPlayerEggNum"]={varname="RankingPlayerEggNum"},
   ["RankingPlayerGoldNum"]={varname="RankingPlayerGoldNum"},
   ["RankingNumText"]={varname="RankingNumText"},
   ["RankingPlayerHeadPanel"]={varname="HeadPanel",onClick="onClickEvent"},
}

function M:onClickEvent()
   SoundSystemManager:playSound004()
   if self.mFriendInfo:getFriendUid() == g_UserData:getUserId() then
       local panel = UIManager:getOrCreatePanel("UIPersonalInfoLayer")
       if panel then
           panel:showToScene()
       end
   else
       local panel = UIManager:getOrCreatePanel("UIOtherPersonInfoLayer")
       if panel then 
           panel:setFriendInfo(self.mFriendInfo)
           panel:showToScene()
       end
   end
end

function M:refreshUI(data)
    local   player=data.player

    local   friendInfo= require("app.bean.FriendInfo").new(player)
    self.mFriendInfo=friendInfo

    self.RankingPlayerHead:removeAllChildren()
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    
    avater:InitTexture(string.utf8len(friendInfo:getAvatar())<7,friendInfo:getAvatar(),friendInfo:getFriendUid())
    self.RankingPlayerHead:addChild(avater)

    self.RankingPlayerName:setString(player.name)
    self.RankingPlayerEggNum:setString("x"..data.count)
    self.RankingPlayerGoldNum:setString(Utils.getFormatNumber_MuitiLanguage(data.goldTotal))

    local trophyIcon={}
    table.insert(trophyIcon,"02_02_GuessSize/icon_108.png")
    table.insert(trophyIcon,"02_02_GuessSize/icon_109.png")
    table.insert(trophyIcon,"02_02_GuessSize/icon_110.png")
    if data.rank<=3 then
        self.RankingTrophyIcon:loadTexture(trophyIcon[data.rank],ccui.TextureResType.plistType)
    end
    self.RankingTrophyIcon:setVisible(data.rank<=3)
    self.RankingNumText:setVisible(data.rank>3)
    self.RankingNumText:setString(tostring(data.rank))
    
    local vipLevel = friendInfo:getVipLevel()
    if vipLevel <= 0 then 
        self.RankingPlayerVipImage:setVisible(false)
    else
        self.RankingPlayerVipImage:setVisible(true)
        local vipData = DataManager:getTbxData("Vip", vipLevel)
        if g_UserData:isSelfUserId(friendInfo:getFriendUid()) then
            vipLevel = g_UserData:getVipLevel()
            vipData = DataManager:getTbxData("Vip", vipLevel)
        end
        if vipData then 
            self.RankingPlayerVipImage:loadTexture(Utils.getIconStr(PlistConfig.Icon.VipIconTail, vipData.VipIcon), ccui.TextureResType.plistType)
        end
    end

    Utils.showFormatVip(self.RankingPlayerName, self.RankingPlayerVipImage)
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