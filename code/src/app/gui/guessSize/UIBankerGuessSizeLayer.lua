local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIBankerGuessSizeLayer", UIPanel)

M.GUI_FILE_NAME = "csd.02_02_GuessSize.02_02_BankerGuessSizeLayer.lua"

M.BINDGUIDATANODE = {
   ["BelowLeftFit"]={varname="BelowLeftFit"},
   ["GuessSizeBg"]={varname="GuessSizeBg"},
   ["LeopardJackpotNode"]={varname="LeopardJackpotNode"},
   ["JackpotNum"]={varname="JackpotNum"},
   ["JackpotBar"]={varname="JackpotBar"},
   ["ClosePanel"]={varname="ClosePanel",onClick="onClickEvent"},
   ["OutBankerButton"]={varname="OutBankerButton",onClick="onClickEvent"},
   ["GuessSizeHelpPanel"]={varname="GuessSizeHelpPanel",onClick="onClickEvent"},
   ["GuessSizeJackpot"]={varname="GuessSizeJackpot"},
   ["BankerHeadNode"]={varname="BankerHeadNode"},
   ["BankerNameText_O"]={varname="BankerNameText"},
   ["BankerGoldNumText"]={varname="BankerGoldNumText"},
   ["BankerResidueGoldNum"]={varname="BankerResidueGoldNum"},
   ["BankerResidueGoldAdd"]={varname="BankerResidueGoldAdd"},
   ["PlayerMessage_1"]={varname="PlayerMessage_1"},
   ["PlayerMessage_2"]={varname="PlayerMessage_2"},
   ["PlayerMessage_3"]={varname="PlayerMessage_3"},
   ["PlayerMessage_4"]={varname="PlayerMessage_4"},
   ["PlayerMessage_5"]={varname="PlayerMessage_5"},
   ["JackpotSpineATNode"]={varname="JackpotSpineATNode"},
   ["GuessSizeBgPanel"]={varname="GuessSizeBgPanel"},
   ["BankerHeadPanel"]={varname="HeadPanel",onClick="onClickHeadEvent"},
   ["CloseSpineATNode"]={varname="CloseSpineATNode"}
}
local targetPlatform = cc.Application:getInstance():getTargetPlatform()

function M:onClickHeadEvent()
    SoundSystemManager:playSound004()
    local panel = UIManager:getOrCreatePanel("UIPersonalInfoLayer")
    if panel then
        panel:showToScene()
    end
end

function M:onClickEvent(ref)
    local name=ref:getName()
    if "ClosePanel"==name then
        self:playAction(0)
        DataManager:dispatchMessage(Constant.CustomEvent.OnCloseGuessSizeLayer, {})
    elseif "OutBankerButton"==name then
        local   panel=UIManager:getOrCreatePanel("UIGuessSizeMiniTipPopUp_3")
        if panel then
            panel:showToScene()
        end
    elseif "GuessSizeHelpPanel"==name then
        if cc.PLATFORM_OS_ANDROID ~= targetPlatform and cc.PLATFORM_OS_IPHONE ~= targetPlatform then
            return 
         end
         
         local   panel=UIManager:getOrCreatePanel("UISettingHelpLayer")
         if panel then
             panel:showToScene()
             panel:setData(5)
         end
    end
end

function M:playAction(type)
    if self.actionIng then return end
    self.actionIng=true
    self.mType=type
    GSystem.GuessSizePopupNum=0.5
    if 0==type then
        local size=self.GuessSizeBg:getContentSize()
        local easeBackOut=cc.EaseBackIn:create(cc.MoveTo:create(tonumber(GSystem.GuessSizePopupNum),cc.p(0,self.mStartPosY-size.height)))
        self.GuessSizeBgPanel:runAction(cc.Sequence:create(easeBackOut,cc.CallFunc:create(function()
            self.actionIng=false
        end)))
    else
        g_GameData:c2sBigSmallBetListReq()
        local easeBackIn=cc.EaseBackOut:create(cc.MoveTo:create(tonumber(GSystem.GuessSizePopupNum),cc.p(0,self.mStartPosY)))
        self.GuessSizeBgPanel:runAction(cc.Sequence:create(easeBackIn,cc.CallFunc:create(function()
            self.actionIng=false
        end)))
    end
    self.mCurIndex=0
    self:refreshUI()
end

function M:refreshUI()
    self.BankerResidueGoldAdd:setOpacity(0)
    self.GuessSizeJackpot:setVisible(g_GameData:isGuessSizeIng())
    self.LeopardJackpotNode:setVisible(g_GameData:isGuessLeopardIng())

    self:initBankerNode()
    self:updateGuessSizeJackpot()
    self:updatePlayerMessage()
    self:playJackpotSpine()
end

function M:updatePlayerMessage()
    local players=g_GameData:getGuessPlayerData()
    local index=0
    for i=1,#players,1 do
        index=index+players[i].diceResult
    end

    if self.mCurIndex~=index then 
        self.mCurIndex=index
        for i=1,5,1 do
            local PlayerMessage=self["PlayerMessage_"..i]
            PlayerMessage:removeAllChildren()
            local idx=#players-i+1
            if players[idx] then 
                local panel=UIManager:createPanelOnly("PlayerMessageCell")
                panel:resetCenterPosition()
                PlayerMessage:addChild(panel)
                panel:refreshUI(players[idx])
            end
        end
    
        self.mAddGold=0
    
        self.BankerResidueGoldAdd:setOpacity(0)
        local index=#players
        if players[index] then 
            if  players[index].win then
                self.mAddGold=-players[index].goldWin
                self.BankerResidueGoldAdd:setString(Utils.getFormatNumber_MuitiLanguage(self.mAddGold))
            else
                self.mAddGold=players[index].goldWin
                self.BankerResidueGoldAdd:setString("+"..Utils.getFormatNumber_MuitiLanguage(self.mAddGold))
            end
            self.BankerResidueGoldAdd:runAction(cc.Sequence:create(cc.FadeIn:create(0.5),cc.DelayTime:create(2.0),cc.FadeOut:create(0.5)))
        end
    end
end

function M:initBankerNode()
    local   bankerData=g_GameData:getGuessBankerData()

    local   friendInfo= require("app.bean.FriendInfo").new(bankerData)
    self.BankerHeadNode:removeAllChildren()
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    avater:InitTexture(string.utf8len(friendInfo:getAvatar())<7,friendInfo:getAvatar(),friendInfo:getFriendUid())
    self.BankerHeadNode:addChild(avater)

    self.BankerNameText:setString(bankerData.name)
    
    self.BankerResidueGoldNum:setString(Utils.getFormatNumber_MuitiLanguage(g_GameData:getGuessBankerGold()))
end

function M:updateGuessSizeJackpot()
    local maxGold=g_GameData:getGuessGoldData()

    self.JackpotNum:setString(Utils.getFormatNumber(maxGold))
    self.JackpotBar:setPercent(maxGold*100/GSystem.JackpotGoldLimit)

    self.BankerResidueGoldNum:setString(Utils.getFormatNumber_MuitiLanguage(g_GameData:getGuessBankerGold()))
end

function M:onCreate()
    M.super.onCreate(self)
    local size=self.GuessSizeBgPanel:getContentSize()
    self.mStartPosY=self.GuessSizeBgPanel:getPositionY()
    self.GuessSizeBgPanel:setPositionY(self.mStartPosY-size.height)
    local effect = Utils.onlyCreateEffect(GSystem.GuessSizeCloseSpine ,cc.p(0,0),true)
    if self.CloseSpineATNode and effect then
        self.CloseSpineATNode:addChild(effect)
    end

    local size=cc.Director:getInstance():getWinSize()
    local friangeTop = g_GameSettingData:getFringeScreenTop()
    local dyw = (size.height - 1280) / 2
    
    if dyw > 0 then
        self.mStartPosY=self.mStartPosY+10
    end
    
    self.mReqCD=10
    self.mAddGold=0
end

function M:playJackpotSpine()
    self.JackpotSpineATNode:removeAllChildren()
    if g_GameData:getGuessGoldData()>=GSystem.JackpotGoldLimit then
        local effect = Utils.onlyCreateEffect(GSystem.JackpotFullSpine,cc.p(0,0),true)
        self.JackpotSpineATNode:addChild(effect)
    else
        local effect = Utils.onlyCreateEffect(GSystem.JackpotNormalcySpine,cc.p(0,0),true)
        self.JackpotSpineATNode:addChild(effect)
    end
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:onCleanup()
    M.super.onCleanup(self)
end


function M:UIBankerGuessSizeLayer_s2cBigSmallPoolUpdate()
    self:updateGuessSizeJackpot()
end

function M:UIBankerGuessSizeLayer_s2cBigSmallBetList(data)
    self:updatePlayerMessage()
end

function M:refreshLanguageHandle()
    self.BankerResidueGoldNum:setString(Utils.getFormatNumber_MuitiLanguage(g_GameData:getGuessBankerGold()))
    self.BankerResidueGoldNum:setString(Utils.getFormatNumber_MuitiLanguage(g_GameData:getGuessBankerGold()))
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.UIBankerGuessSizeLayer_s2cBigSmallPoolUpdate, "UIBankerGuessSizeLayer_s2cBigSmallPoolUpdate")
    self:doRegEvent(Constant.CustomEvent.UIBankerGuessSizeLayer_s2cBigSmallBetList, "UIBankerGuessSizeLayer_s2cBigSmallBetList")
end

function M:OnUpdate(dt)
    self.mReqCD=self.mReqCD-1
    if self.mReqCD<0 and 1==self.mType then
        g_GameData:c2sBigSmallBetListReq()
        self.mReqCD=60*3
    end
end

return M