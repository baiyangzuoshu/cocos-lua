local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIGuessSizeLayer", UIPanel)

M.GUI_FILE_NAME = "csd.02_02_GuessSize.02_02_GuessSizeLayer.lua"

M.BINDGUIDATANODE = {
   ["GuessSizeBg"]={varname="GuessSizeBg"},
   ["BelowLeftFit"]={varname="BelowLeftFit"},
   ["ClosePanel"]={varname="ClosePanel",onClick="onClickEvent"},
   ["RobBankerButton"]={varname="RobBankerButton",onClick="onClickEvent"},
   ["GuessSizeHelpPanel"]={varname="GuessSizeHelpPanel",onClick="onClickEvent"},
   ["BigClickPanel"]={varname="BigClickPanel",onClick="onClickEvent"},
   ["LittleClickPanel"]={varname="LittleClickPanel",onClick="onClickEvent"},
   ["AnteGoldSlider"]={varname="AnteGoldSlider",onClick="onClickEvent"},
   ["BankerNode"]={varname="BankerNode"},
   ["LeopardNode"]={varname="LeopardNode"},
   ["BankerHeadNode"]={varname="BankerHeadNode"},
   ["BankerNameText_O"]={varname="BankerNameText"},
   ["BankerGoldNumText"]={varname="BankerGoldNumText"},
   ["RobBankerGoldNum"]={varname="RobBankerGoldNum"},
   ["SelectedLeopard_1"]={varname="SelectedLeopard_1"},
   ["LeopardDice_1"]={varname="LeopardDice_1"},
   ["SelectedLeopard_2"]={varname="SelectedLeopard_2"},
   ["LeopardDice_2"]={varname="LeopardDice_2"},
   ["SelectedLeopard_3"]={varname="SelectedLeopard_3"},
   ["LeopardDice_3"]={varname="LeopardDice_3"},
   ["SelectedLeopard_4"]={varname="SelectedLeopard_4"},
   ["LeopardDice_4"]={varname="LeopardDice_4"},
   ["SelectedLeopard_5"]={varname="SelectedLeopard_5"},
   ["LeopardDice_5"]={varname="LeopardDice_5"},
   ["SelectedLeopard_6"]={varname="SelectedLeopard_6"},
   ["LeopardDice_6"]={varname="LeopardDice_6"},
   ["GuessSizeJackpot"]={varname="GuessSizeJackpot"},
   ["LeopardJackpotNode"]={varname="LeopardJackpotNode"},
   ["PlayerHeadNode"]={varname="PlayerHeadNode"},
   ["PlayerGoldNumText"]={varname="PlayerGoldNumText"},
   ["JackpotNum"]={varname="JackpotNum"},
   ["JackpotBar"]={varname="JackpotBar"},
   ["AnteGoldNumText"]={varname="AnteGoldNumText"},
   ["BigDefaultNode"]={varname="BigDefaultNode"},
   ["BigSelectedNode"]={varname="BigSelectedNode"},
   ["LittleDefaultNode"]={varname="LittleDefaultNode"},
   ["LittleSelectedNode"]={varname="LittleSelectedNode"},
   ["JackpotSpineATNode"]={varname="JackpotSpineATNode"},
   ["LeopardJackpotNum"]={varname="LeopardJackpotNum"},

   ["GuessSizeSifter_1"]={varname="GuessSizeSifter_1"},
   ["GuessSizeSifterAnimation_1"]={varname="GuessSizeSifterAnimation_1"},
   ["GuessSizeSifter_2"]={varname="GuessSizeSifter_2"},
   ["GuessSizeSifterAnimation_2"]={varname="GuessSizeSifterAnimation_2"},
   ["GuessSizeSifter_3"]={varname="GuessSizeSifter_3"},
   ["GuessSizeSifterAnimation_3"]={varname="GuessSizeSifterAnimation_3"},
   ["SizeSpineATNode_1"]={varname="SizeSpineATNode_1"},
   ["SizeSpineATNode_2"]={varname="SizeSpineATNode_2"},

   ["HistorySizeIconPanel"]={varname="HistorySizeIconPanel"},
   ["BankerNameText_TT"]={varname="BankerNameText_TT"},
   ["BankerGoldIcon"]={varname="BankerGoldIcon"},
   ["SelectedLeopardSpineATNode"]={varname="SelectedLeopardSpineATNode"},
   ["LeopardBigPrizeSpineATNode"]={varname="LeopardBigPrizeSpineATNode"},
   ["GuessSizeBgPanel"]={varname="GuessSizeBgPanel"},
   ["CloseSpineATNode"]={varname="CloseSpineATNode"},
   ["PlayerHeadPanel"]={varname="HeadPanel",onClick="onClickHeadEvent"},
   ["BankerHeadPanel"]={varname="BankerHeadPanel",onClick="onClickBankerHeadEvent"},
}
function M:onClickBankerHeadEvent()
    SoundSystemManager:playSound004()
    if nil==self.mFriendInfo then return end
    
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

function M:onClickHeadEvent()
    SoundSystemManager:playSound004()
    local panel = UIManager:getOrCreatePanel("UIPersonalInfoLayer")
    if panel then
        panel:showToScene()
    end
end

local targetPlatform = cc.Application:getInstance():getTargetPlatform()
local GuessSizeNetTime=3.0--播放筛子动画
local GuessBigSmallNetTime=10.0--猜大小网络请求超时

function M:onCreate()
    M.super.onCreate(self)
    self.mSizeCD=0
    self.mCloseCD=0
    self.mStakeGold=0
    self.mNetCD=0
    self.mNetCount=0
    self.mGuessSizeRate=GSystem.GuessSizeRate
    
    local size=self.GuessSizeBgPanel:getContentSize()
    self.mStartPosY=self.GuessSizeBgPanel:getPositionY()
    self.GuessSizeBgPanel:setPositionY(self.mStartPosY-size.height)
    self.AnteGoldSlider:addEventListener(handler(self,self.onSliderEvent))
    local effect = Utils.onlyCreateEffect(GSystem.GuessSizeCloseSpine ,cc.p(0,0),true)
    if effect then
        self.CloseSpineATNode:addChild(effect)
    end
    
    
    self.mSizeResultCell=UIManager:createPanelOnly("SizeResultCell")
    self.HistorySizeIconPanel:addChild(self.mSizeResultCell)

    local size=cc.Director:getInstance():getWinSize()
    local friangeTop = g_GameSettingData:getFringeScreenTop()
    local dyw = (size.height - 1280) / 2
    
    if dyw > 0 then
        self.mStartPosY=self.mStartPosY+10
    end
end

function M:onSliderEvent(ref,type)
    local percent=ref:getPercent()
    self:updateSlider(percent)
end

function M:updateSlider(percent)
    local rate=math.floor(100/#self.mGuessSizeRate)
    local index=math.ceil(percent/rate)
    if index<1 then index=1 end
    if index>#self.mGuessSizeRate then index=#self.mGuessSizeRate end
    
    self.mGuessGold=self.mGuessSizeRate[index]*self.mStakeGold
    self.AnteGoldNumText:setString(Utils.getFormatNumber_MuitiLanguage(self.mGuessGold))
end

function M:updateHistorySizeIconPanel()
    local mSizeResult=g_GameData:getSizeResult()
    self.mSizeResultCell:setVisible(#mSizeResult>0)
    self.mSizeResultCell:setData(mSizeResult)
end

function M:onClickEvent(ref)
    local name=ref:getName()
    if "ClosePanel"==name then
        self:playAction(0)
        DataManager:dispatchMessage(Constant.CustomEvent.OnCloseGuessSizeLayer, {})
    elseif "RobBankerButton"==name then
        local   panel=UIManager:getOrCreatePanel("UIGuessSizeMiniTipPopUp_2")
        if panel then
            panel:showToScene()
        end
    elseif "BigClickPanel"==name and self.mSizeCD<0 then
        local gold=self.mGuessGold
        if g_UserData:getGold()<self.mGuessGold then
            gold=g_UserData:getGold()
        end
        if gold<=0 then
            return UIUtils.popToadtByMessageId("52001")
        end
        self:handlerC2sBigSmallBet(1,gold)
    elseif "LittleClickPanel"==name and self.mSizeCD<0 then
        local gold=self.mGuessGold
        if g_UserData:getGold()<self.mGuessGold then
            gold=g_UserData:getGold()
        end
        if gold<=0 then
            return UIUtils.popToadtByMessageId("52001")
        end
        self:handlerC2sBigSmallBet(2,gold)
    elseif "GuessSizeHelpPanel"==name then
        if cc.PLATFORM_OS_ANDROID ~= targetPlatform and cc.PLATFORM_OS_IPHONE ~= targetPlatform then
           return 
        end

        local   panel=UIManager:getOrCreatePanel("UISettingHelpLayer")
        if panel then
            panel:showToScene()
            panel:setData(5)
        end
    elseif "AnteGoldSlider"==name then
        SoundSystemManager:playSound004()
    end
end

function M:handlerC2sBigSmallBet(type,gold)
    self.mType=type
    self.mNetCD=GuessBigSmallNetTime*60
    self.mSizeCD=GuessSizeNetTime*60
    if 1==type then
        self.BigDefaultNode:setVisible(false)
        self.BigSelectedNode:setVisible(true)
    else
        self.LittleDefaultNode:setVisible(false)
        self.LittleSelectedNode:setVisible(true)
    end
    
    g_GameData:c2sBigSmallBet(type,gold)

    self:playGuessSizeSifter(1)
end

function M:playSizeSpine(data)
    local betType=data.betType
    local gold=data.gold
    local diceResult=data.diceResult
    local win=data.win

    local index1=math.floor(diceResult/100)
    local index2=math.floor((diceResult-100*index1)/10)
    local index3=math.floor(diceResult-100*index1-index2*10)
    
    self["GuessSizeSifter_1"]:loadTexture(string.format("00_01_Common/3D_Dice_%dC.png",index1),ccui.TextureResType.plistType)
    self["GuessSizeSifter_2"]:loadTexture(string.format("00_01_Common/3D_Dice_%dC.png",index2),ccui.TextureResType.plistType)
    self["GuessSizeSifter_3"]:loadTexture(string.format("00_01_Common/3D_Dice_%dC.png",index3),ccui.TextureResType.plistType)

    local spineNode
    if 1==betType then
        spineNode=self.SizeSpineATNode_1
    else
        spineNode=self.SizeSpineATNode_2
    end

    spineNode:removeAllChildren()
    if win then
        local effect = Utils.onlyCreateEffect(GSystem.GuessSizeResultWinSpine,cc.p(0,0),false,true)
        spineNode:addChild(effect)
    else
        local effect = Utils.onlyCreateEffect(GSystem.GuessSizeResultLoseSpine,cc.p(0,0),false,true)
        spineNode:addChild(effect)
    end
end

function M:playGuessSizeSifter(state)
    self.mSifterState=state
    self.SizeSpineATNode_1:removeAllChildren()
    self.SizeSpineATNode_2:removeAllChildren()

    for i=1,3,1 do
        local   GuessSizeSifter=self["GuessSizeSifter_"..i]
        local   GuessSizeSifterAnimation=self["GuessSizeSifterAnimation_"..i]
        GuessSizeSifter:setVisible(0==state)
        GuessSizeSifterAnimation:removeAllChildren()
        if 1==state then  
            local effect = Utils.onlyCreateEffect(GSystem.GuessSizeDiceRotateSpine,cc.p(0,0),true)
            GuessSizeSifterAnimation:addChild(effect)
        else
            self.mSizeCD=0
        end
    end
end

function M:updateBankerNode()
    local   bankerData=g_GameData:getGuessBankerData()
    self.BankerNameText:setVisible(false)
    self.BankerGoldIcon:setVisible(false)
    self.BankerNameText_TT:setVisible(false)

    if bankerData.uid then
        local   friendInfo= require("app.bean.FriendInfo").new(bankerData)
        self.mFriendInfo=friendInfo

        self.BankerHeadNode:removeAllChildren()
        local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
        avater:InitTexture(string.utf8len(friendInfo:getAvatar())<7,friendInfo:getAvatar(),friendInfo:getFriendUid())
        self.BankerHeadNode:addChild(avater)
    
        self.BankerNameText:setString(bankerData.name)
        self.BankerNameText:setVisible(true)
        self.BankerGoldIcon:setVisible(true)
    else
        self.mFriendInfo=nil

        self.BankerHeadNode:removeAllChildren()
        local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
        avater:InitTexture(true,101001,101001)
        self.BankerHeadNode:addChild(avater)
        self.BankerNameText_TT:setVisible(true)
    end
end

function M:initPlayerNode()
    local data={}
    data.isSystemAvatar=g_UserData:getIsSystemHead()
    data.gold=g_UserData:getGold()
    data.uid=g_UserData:getUserId()
    data.avatar=g_UserData:getHead()

    local   friendInfo= require("app.bean.FriendInfo").new(data)
    self.PlayerHeadNode:removeAllChildren()
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    avater:InitTexture(string.utf8len(friendInfo:getAvatar())<7,friendInfo:getAvatar(),friendInfo:getFriendUid())
    self.PlayerHeadNode:addChild(avater)

    self.SizeSpineATNode_1:removeAllChildren()
    self.SizeSpineATNode_2:removeAllChildren()

    self.LittleDefaultNode:setVisible(true)
    self.LittleSelectedNode:setVisible(false)
    self.BigDefaultNode:setVisible(true)
    self.BigSelectedNode:setVisible(false)

    self:updatePlayerGold()
end

function M:updatePlayerGold()
    self.PlayerGoldNumText:setString(Utils.getFormatNumber_MuitiLanguage(g_UserData:getGold()))
    -- local   GuessSizeBet=DataManager:getTbxData("GuessSizeBet")
    -- local   stakeGold=0
    -- local   arr={}
    -- for _,v in pairs(GuessSizeBet) do
    --     table.insert(arr,v)
    -- end
    -- table.sort(arr,function(a,b)
    --     if a.MinGoldNum<b.MinGoldNum then
    --         return true
    --     end

    --     return false
    -- end)

    -- for _,v in ipairs(arr) do
    --     if v.MinGoldNum<g_UserData:getGold() then
    --         stakeGold=v.GuessSizeBet
    --     end
    -- end

    -- if stakeGold~=self.mStakeGold then
    --     self.mStakeGold=stakeGold
    --     self.AnteGoldSlider:setPercent(1)
    --     self:updateSlider(1)
    -- end
end

function M:updateLeopardNode(data)
    local isMax=0
    for i=1,6,1 do
        local SelectedLeopard=self["SelectedLeopard_"..i]
        SelectedLeopard:removeAllChildren()
        local baozi=g_GameData:getGuessLeopardByIndex(i)
        if baozi then
            local cell=UIManager:createPanelOnly("SelectedLeopardCell")
            cell:resetCenterPosition()
            SelectedLeopard:addChild(cell)
            cell:refreshUI(baozi)

            isMax=isMax+1
        end
    end

    if data and isMax>0 and isMax<6 then
        if g_UserData:isSelfUserId(data.baozi.player.uid) then
            self.baozi=data.baozi
        end
    end
end

function M:updateLuckPlayer()
    for i=1,6,1 do
        local SelectedLeopard=self["SelectedLeopard_"..i]
        SelectedLeopard:removeAllChildren()
        local data=g_GameData:getGuessLeopardByIndex(i)
        if data then
            local cell=UIManager:createPanelOnly("SelectedLeopardCell")
            cell:resetCenterPosition()
            SelectedLeopard:addChild(cell)
            cell:refreshUI(data)
        end
    end

    self:setVisible(true)
    self.mCloseCD=60*3
    self.isLuckActionIng=true
    self.LeopardBigPrizeSpineATNode:removeAllChildren()
    local effect = Utils.onlyCreateEffect(GSystem.LeopardBigPrizeSpine,cc.p(0,0),false)
    self.LeopardBigPrizeSpineATNode:addChild(effect)
end

function M:updateGuessSizeJackpot()
    local maxGold=g_GameData:getGuessGoldData()

    self.JackpotNum:setString(Utils.getFormatNumber(maxGold))
    self.JackpotBar:setPercent(maxGold*100/GSystem.JackpotGoldLimit)
    self.LeopardJackpotNum:setString(Utils.getFormatNumber(maxGold))

    self.BankerGoldNumText:setString(Utils.getFormatNumber_MuitiLanguage(g_GameData:getGuessBankerGold()))
    self.RobBankerGoldNum:setString(Utils.getFormatNumber_MuitiLanguage(g_GameData:getGuessBankerCost()))
end

function M:refreshLanguageHandle()
    self.BankerGoldNumText:setString(Utils.getFormatNumber_MuitiLanguage(g_GameData:getGuessBankerGold()))
    self.RobBankerGoldNum:setString(Utils.getFormatNumber_MuitiLanguage(g_GameData:getGuessBankerCost()))
    self.AnteGoldNumText:setString(Utils.getFormatNumber_MuitiLanguage(self.mGuessGold))
    self.PlayerGoldNumText:setString(Utils.getFormatNumber_MuitiLanguage(g_UserData:getGold()))
end

function M:playAction(type)
    if self.actionIng then return end
    self.actionIng=true
    GSystem.GuessSizePopupNum=0.5
    if 0==type then
        local size=self.GuessSizeBg:getContentSize()
        local easeBackOut=cc.EaseBackIn:create(cc.MoveTo:create(tonumber(GSystem.GuessSizePopupNum),cc.p(0,self.mStartPosY-size.height)))
        self.GuessSizeBgPanel:runAction(cc.Sequence:create(easeBackOut,cc.CallFunc:create(function()
            self.actionIng=false
        end)))
        
        self.mNetCD=0
        self.mNetCount=0
    else
        local easeBackIn=cc.EaseBackOut:create(cc.MoveTo:create(tonumber(GSystem.GuessSizePopupNum),cc.p(0,self.mStartPosY)))
        self.GuessSizeBgPanel:runAction(cc.Sequence:create(easeBackIn,cc.CallFunc:create(function()
            self.actionIng=false
        end)))
    end
    self.mStakeGold=g_GameData:getBetBase()
    self.mSizeCD=0
    self.mCloseCD=0
    g_GameData:clearSizeResult()
    self:refreshUI()
end

function M:refreshUI()
    self.BankerNode:setVisible(g_GameData:isGuessSizeIng())
    self.GuessSizeJackpot:setVisible(g_GameData:isGuessSizeIng())
    self.LeopardNode:setVisible(g_GameData:isGuessLeopardIng())
    self.LeopardJackpotNode:setVisible(g_GameData:isGuessLeopardIng())
    self.SelectedLeopardSpineATNode:removeAllChildren()
    self["GuessSizeSifter_1"]:loadTexture(string.format("00_01_Common/3D_Dice_%dC.png",1),ccui.TextureResType.plistType)
    self["GuessSizeSifter_2"]:loadTexture(string.format("00_01_Common/3D_Dice_%dC.png",2),ccui.TextureResType.plistType)
    self["GuessSizeSifter_3"]:loadTexture(string.format("00_01_Common/3D_Dice_%dC.png",3),ccui.TextureResType.plistType)
    
    self:initPlayerNode()
    self:updateBankerNode()
    self:updateGuessSizeJackpot()
    self:playJackpotSpine()
    
    self:playGuessSizeSifter(0)
    self:updateLeopardNode()
    self.AnteGoldSlider:setPercent(1)
    self:updateSlider(1)
    self:updateHistorySizeIconPanel()
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

function M:UIGuessSizeLayer_s2cBigSmallBet(data)
    self.data=data
    self.mNetCD=0
    self.mNetCount=0
    self.mSizeCD=tonumber(GSystem.DiceATSpinTime)*60
end

function M:UIGuessSizeLayer_s2cBigSmallPoolUpdate()
    self:updateGuessSizeJackpot()
end

function M:UIGuessSizeLayer_s2cBigSmallStateInfo()
    if not g_GameData:isGuessEggIng() then
        self:updateBankerNode()
    end
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.UIGuessSizeLayer_s2cBigSmallBet, "UIGuessSizeLayer_s2cBigSmallBet")
    self:doRegEvent(Constant.CustomEvent.UIGuessSizeLayer_s2cBigSmallBaozi, "updateLeopardNode")
    self:doRegEvent(Constant.CustomEvent.UIGuessSizeLayer_s2cBigSmallPoolUpdate, "UIGuessSizeLayer_s2cBigSmallPoolUpdate")
    self:doRegEvent(Constant.CustomEvent.UIGuessSizeLayer_updatePlayerGold, "updatePlayerGold")
    self:doRegEvent(Constant.CustomEvent.UIGuessSizeLayer_updateLuckPlayer, "updateLuckPlayer")
    self:doRegEvent(Constant.CustomEvent.UIGuessSizeLayer_s2cBigSmallStateInfo, "UIGuessSizeLayer_s2cBigSmallStateInfo")
end

function M:OnUpdate(dt)
    self.mSizeCD=self.mSizeCD-1
    if self.mSizeCD<0 then
        self.LittleDefaultNode:setVisible(true)
        self.LittleSelectedNode:setVisible(false)
        self.BigDefaultNode:setVisible(true)
        self.BigSelectedNode:setVisible(false)
    elseif 0==self.mSizeCD then
        if self.data then
            self:playGuessSizeSifter(0)
            self:playSizeSpine(self.data)
            local betType=self.data.betType
            if not self.data.win then
                if 1==betType then
                    betType=2
                else
                    betType=1
                end    
            end

            g_GameData:insertSizeResult(betType)
            self:updateHistorySizeIconPanel()
            self.mSizeCD=tonumber(GSystem.DiceATSpinTime)*60/2

            self.data=nil
        end

        if self.baozi then
            local baoziDiget=self.baozi.baoziDiget
            self.SelectedLeopardSpineATNode:removeAllChildren()
            local effect = Utils.onlyCreateEffect(GSystem.LeopardOneToSixSpine[baoziDiget],cc.p(0,0),false,true)
            self.SelectedLeopardSpineATNode:addChild(effect)

            self.mSizeCD=self.mSizeCD+tonumber(GSystem.DiceATSpinTime)*60

            self.baozi=nil
        end

        if self.isLuckActionIng then
            self.isLuckActionIng=false
            self.LeopardBigPrizeSpineATNode:removeAllChildren()
        end
    end

    self.mCloseCD=self.mCloseCD-1
    if 0==self.mCloseCD then
        self:playAction(0)
    end

    self.mNetCD=self.mNetCD-1
    if 0==self.mNetCD then
        self.mNetCount=self.mNetCount+1
        if self.mNetCount<3 then--重新连接不超过3次
            self:handlerC2sBigSmallBet(self.mType)
        else
            self.mNetCount=0
            self:playGuessSizeSifter(0)
        end
    end
end

return M