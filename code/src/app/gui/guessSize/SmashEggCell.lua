local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("SmashEggCell", UIPanel)

M.GUI_FILE_NAME = "csd.02_02_GuessSize.02_02_SmashEggCell.lua"

M.BINDGUIDATANODE = {
   ["SmashEggSpineATNode"]={varname="SmashEggSpineATNode"},
   ["SmashEggPlayerHead"]={varname="SmashEggPlayerHead"},
   ["SmashEggNum"]={varname="SmashEggNum"},
   ["SmashEggPanel"]={varname="SmashEggPanel",onClick="onClickEvent"},
   ["SmashEggNode"]={varname="SmashEggNode"},
   ["SmashEggNumSpineATNode"]={varname="SmashEggNumSpineATNode"},
   ["SmashEggAnimation_1"]={varname="SmashEggAnimation_1"}
}

function M:onClickEvent()
    local data=g_GameData:getGuessLuckData()
    if data then
        if g_UserData:isSelfUserId(data.uid) then
            UIUtils.popToadtByMessageId("1100029")
        elseif g_UserData:getGold()<GSystem.ThrowEggExpendGold then
            UIUtils.popToadtByMessageId("52001")
        else
            g_GameData:c2sBigSmallRob()
        end
    end
end

function M:onCreate()
    M.super.onCreate(self)
end

function M:refreshUI(data)
    if not data or not data.player then return end

    local player=data.player
    self.mGold=data.gold

    local   friendInfo= require("app.bean.FriendInfo").new(player)
    self.SmashEggPlayerHead:removeAllChildren()
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    avater:InitTexture(string.utf8len(friendInfo:getAvatar())<7,friendInfo:getAvatar(),friendInfo:getFriendUid())
    self.SmashEggPlayerHead:addChild(avater)
    self.SmashEggNum:setString(Utils.getFormatNumber_MuitiLanguage(self.mGold))
    self:playNormalAnimation()

    local addW=180
    local addH=160
    local jumpTo1=cc.JumpTo:create(3.0,cc.p(54+addW, 215-addH),90,0)
    local jumpTo2=cc.JumpTo:create(3.0,cc.p(156+addW, 415-addH),200,0)
    local jumpTo3=cc.JumpTo:create(3.0,cc.p(258+addW, 215-addH),200,0)
    local jumpTo4=cc.JumpTo:create(3.0,cc.p(360+addW, 415-addH),200,0)
    local jumpTo5=cc.JumpTo:create(3.0,cc.p(462+addW, 215-addH),200,0)
    local jumpTo6=cc.JumpTo:create(3.0,cc.p(564+addW, 415-addH),200,0)
    local jumpTo7=cc.JumpTo:create(3.0,cc.p(666+addW, 215-addH),200,0)
    local jumpTo8=cc.JumpTo:create(3.0,cc.p(768+addW, 415-addH),200,0)
    local jumpTo9=cc.JumpTo:create(3.0,cc.p(870+addW, 215-addH),200,0)
    local seq=cc.Sequence:create(jumpTo1,jumpTo2,jumpTo3,jumpTo4,jumpTo5,jumpTo6,jumpTo7,jumpTo8,jumpTo9,cc.CallFunc:create(function()
        self:setVisible(false)
    end))
    self.SmashEggNode:runAction(seq)
end

function M:playClick()
    if self.clickIng then return end

    self.clickIng=true
    self:playClickAction()

    self.SmashEggSpineATNode:removeAllChildren()
    local effect = Utils.onlyCreateEffect(GSystem.ThrowEggClickSpine,cc.p(0,0),false,true)
    self.SmashEggSpineATNode:addChild(effect)
end

function M:playClickAction()
    if self.clickAction then return end
    self.clickAction=true

    local skewTo1=cc.RotateTo:create(1/60*4,-8)
    local skewTo2=cc.RotateTo:create(1/60*16,2)
    local skewTo3=cc.RotateTo:create(1/60*6,0)
    local delayTime=cc.DelayTime:create(1/60*14)
    self.SmashEggAnimation_1:runAction(cc.Sequence:create(skewTo1,skewTo2,skewTo3,delayTime,cc.CallFunc:create(function()
        self.clickAction=false
    end)))
end

function M:playNormalAnimation()
    self.clickIng=false

    self.SmashEggSpineATNode:removeAllChildren()
    local effect = Utils.onlyCreateEffect(GSystem.ThrowEggNormalSpine,cc.p(0,0),false,true)
    self.SmashEggSpineATNode:addChild(effect)
    
    self:runTimelineAnimation("NormalcyAnimation",true)
end

function M:playGoldAniamtion(gold)
    local index=1
    for i=1,#GSystem.ThrowEggGoldNum,1 do
        if GSystem.ThrowEggGoldNum[i]==gold then
            index=i
            break
        end
    end

    local effect = Utils.onlyCreateEffect(GSystem.ThrowEggNumSpine[index],cc.p(0,0),false,true)
    self.SmashEggNumSpineATNode:addChild(effect)
end

function M:playHeadAnimation()
    local effect = Utils.onlyCreateEffect(GSystem.ThrowEggEggAnimationId,cc.p(0,0),false,true)
    self.SmashEggPlayerHead:addChild(effect)
end

function M:getWorldPosition()
    local pos=self.SmashEggPlayerHead:convertToWorldSpaceAR(cc.p(0,0))

    return pos
end

function M:SmashEggCell_updateGold()
    self.SmashEggNum:setString(Utils.getFormatNumber_MuitiLanguage(g_GameData:getGuessGoldData()))
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:onCleanup()
    M.super.onCleanup(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
    self:doRegEvent(Constant.CustomEvent.SmashEggCell_updateGold, "SmashEggCell_updateGold")
end

return M