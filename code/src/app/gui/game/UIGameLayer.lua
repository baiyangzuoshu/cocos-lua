-- local UIMineDiceBoxCell = require("app.gui.game.UIMineDiceBoxCell")
-- local UIOtherDiceBoxCell = require("app.gui.game.UIOtherDiceBoxCell")
-- local AvatarWidget = require("app.gui.widget.AvatarWidget")

local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIGameLayer", UIPanel)

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_BoastLayer.lua"

M.BINDGUIDATANODE = {
    -- -- 设置按钮
    ["NameText_O"]={varname="NameText"},
    ["GoldNum"]={varname="GoldNum"},
    ["GoldIcon"]={varname="GoldIcon"},
    ["HeadIcon"]={varname="HeadIcon"},
    ["HeadFrame_1"]={varname="HeadFrame"},
    ["VipImage"] = {varname = "VipImage"},
    ["HeadShade"] = {varname = "HeadShade"},

    ["GoldRollNum"]={varname="GoldRollNum"},

    ["playerNode_0"]={varname="playerNode_0"},
    ["playerNode_1"]={varname="playerNode_1"},
    ["playerNode_2"]={varname="playerNode_2"},
    ["playerNode_3"]={varname="playerNode_3"},
    ["playerNode_4"]={varname="playerNode_4"},
    ["playerNode_5"]={varname="playerNode_5"},
    ["playerNode_6"]={varname="playerNode_6"},
    ["playerNode_7"]={varname="playerNode_7"},

    ["CurrentPoints"]={varname="CurrentPoints"},
    ["CurrentFrame"]={varname="CurrentFrame"},
    ["BottomInjectionText_3"]={varname="baseBetTxt"},
    ["OwnRightCallPoint"]={varname="OwnRightCallPoint"},
    ["VerticesImage_0"]={varname="VerticesImage_0"},
    ["VerticesText_0_TT"]={varname="VerticesText_0"},
    ["VerticesNum_0"]={varname="VerticesNum_0"},
    ["OwnRightOpenImage_IVT"]={varname="OwnRightOpen"},
    ["diceBoxNum"]={varname="diceBoxNum"},
    ["diceBoxDian"]={varname="diceBoxDian"},
    ["NumberFrame"]={varname="NumberFrame",onEvent="onEventTouchDiceNum"},
    ["PointFrame"]={varname="PointFrame",onEvent="onEventTouchDiceDian"},
    ["NumberSelectionPanel"]={varname="NumberSelectionPanel"},
    ["NumberList"]={varname="NumberList"},
    ["NumberText"]={varname="NumberText"},
    ["PointSelectionPanel"]={varname="PointSelectionPanel"},
    ["ListDian"]={varname="ListDian"},
    ["Vertices"]={varname="Vertices"},
    ["CalledBoxImage_IVT"]={varname="CalledBox"},
    ["PointButton"]={varname="PointButton",onClick="onClickSayPoint"},
    ["BottomInjectionText"]={varname="BottomInjectionText"},
    ["BottomInjectionImage"]={varname="BottomInjectionImage"},
    ["openRange"]={varname="openRange"},
    ["BottomInjectionButton"]={varname="BottomInjectionButton",onClick="onClickSuggestUpResist"},
    ["ReplaceBottomInjectionNode"]={varname="ReplaceBottomInjection"},
    ["BottomInjectionTips"]={varname="BottomInjectionTips"},
    ["GuessingShowNode"]={varname="GuessingShowNode"},
    ["ReplaceBottomInjectionState"]={varname="ReplaceBottomInjectionState"},

    ["ReturnButton"] = { varname = "ReturnButton", onClick = "onClickLeave"},
    ["SittingButton"] = { varname = "SittingButton", onClick = "onClickSittingBtn"},
    ["CalledBoxImage_0_IVT"]={varname="CalledBox_0"},
    ["GamingReturnFrame"]={varname="GamingReturnFrame"},
    ["GamingReturn"]={varname="GamingReturn"},
    ["DesktopCallPoint"]={varname="DesktopCallPoint"},
    ["BackPackButton"] = { varname = "BackPackButton", onClick = "onClickBagBtn"},

    ["WatchButton"]={varname = "WatchButton", onClick = "onClickWatch"},
    ["GamingWatch"] = {varname = "GamingWatch"},
    ["GamingWatchFrame"] = {varname="GamingWatchFrame"},

    ["ListPanel"] = {varname = "ListPanel"},
    ["ListButton"]={varname = "ListButton", onClick = "onClickListButton"},

    --chat
    ["ChatNode"] = { varname = "ChatNode" },
    ["ChatPanel"] = { varname = "ChatPanel", onEvent = "onTouchRoomChatEvent" },
    ["ChatText_S"] = { varname = "ChatText" },
    ["ChapTip"] = { varname = "ChapTip" },
    ["MicButton"] = { varname = "MicButton", onClick = "onClickSayWordBtn" },
    ["VoiceButon"] = { varname = "VoiceButon", onClick = "onClickListenWordBtn" },
    ["MicLoadingBar"] = { varname = "MicLoadingBar"},

    ["MagicRouteNode"] = {varname = "MagicRouteNode"},
    --Emoji
    ["EmojiPanel_1"] = {varname = "EmojiPanel_1"},
    ["EmojiPanel_2"] = {varname = "EmojiPanel_2"},
    ["EmojiPanel_3"] = {varname = "EmojiPanel_3"},
    ["EmojiPanel_4"] = {varname = "EmojiPanel_4"},

    ["StateCancelButton"] = { varname = "StateCancelButton", onClick = "onClickCancelBtn" },
    ["HeadPanel"] = { varname = "HeadPanel", onEvent = "onTouchHeadEvent" },
    ["State"] = { varname = "State" },

    ["GoldButton"] = { varname = "GoldButton"},
    ["GoldButtonPanel"] = { varname = "PlayerGoldPanel", onEvent = "onGoldStoreTouchEvent" },

    ["ChatTipDotIcon"]={varname="ChatTipDotIcon"},
    ["ChatImage"]={varname="ChatImage"},
    ["ChatImageNode"]={varname="ChatImageNode"},
    ["ChatImageText_S"]={varname="ChatImageText_S"},

    ["WatchNum"] = {varname = "WatchNum"},
    ["WatchLittlePanel"] = {varname = "WatchLittlePanel",onEvent = "onWatchStateTipTouchEvent"},

    ["WatchStateTip"] = {varname = "WatchStateTip"},
    ["WatchStateNum"] = {varname = "WatchStateNum"},
    ["WatchStateTipPanel"] = {varname = "WatchStateTipPanel",onEvent = "onWatchStateTipTouchEvent"},

    ["AddFriendNode"]={varname="AddFriendsPopUpNode"},
    ["GrabAnimationNode"] = {varname="GrabAnimationNode"},

    ["LittleGuessing"]={varname="LittleGuessing"},
    ["LittleGuessingImage_IVT"]={varname="LittleGuessingImage"},
    ["LittleGuessingBg"]={varname="LittleGuessingBg", onEvent = "onLittleGuessingTouchEvent" },
    ["LittleGuessingNum"]={varname="LittleGuessingNum"},
    ["LittleGuessingSpineATNode"]={varname="LittleGuessingSpineATNode"},

    ["WalkingLanternNode"] = { varname = "WalkingLanternNode_1"},
    ["WitnessNode"]={varname="WitnessNode"},
    ["PointNode"]={varname="PointNode"},
    ["GuessSizePanel"]={varname="GuessSizePanel",onClick="onClickEvent"},
    ["GuessSizeNode"]={varname="GuessSizeNode"},
    ["GuessSizeHintNode"]={varname="GuessSizeHintNode"},
    ["SmashEggNode"]={varname="SmashEggNode"},
    ["BottomFrame"]={varname="BottomFrame"},
    ["GuessSizeSpriteATNode"]={varname="GuessSizeSpriteATNode"},
    ["FriendsHintNode"]={varname="FriendsHintNode"},
    ["Bg_1"]={varname="Bg"},
    ["PrivateRoomMasterNode"]={varname="PrivateRoomMasterNode"},
    ["PrivateRoomSetPanel"]={varname="PrivateRoomSetPanel",onClick="onClickEvent"},
    ["PrivateRoomInvitePanel"]={varname="PrivateRoomInvitePanel",onClick="onClickEvent"},
    ["PrivateRoomMasterIcon"]={varname="PrivateRoomMasterIcon"}
}

local OperatorType = {
    Number = 1,
    Dice = 2,
}

local MAX_POINT = 6
local   MAX_SIZE=3*15
local ITEM_TAG = 1001

function M:onClickEvent(ref)
    local name=ref:getName()
    if "GuessSizePanel"==name then
        SoundSystemManager:playSound004()
        if not g_GameData:isGuessEggIng() then
            self:openGuessSizeLayer()
        end
    elseif  "PrivateRoomInvitePanel"==name then
        local panel=UIManager:getOrCreatePanel("app.gui.game.private.BoastMiniTipPopUp_2")
        if panel then
            panel:showToScene()
        end
    elseif "PrivateRoomSetPanel"==name then
        SoundSystemManager:playSound004()
        local panel=UIManager:getOrCreatePanel("app.gui.game.private.UIPrivateRoomSetPopUp")
        if panel then
            local roomName=g_GameData:getPersonalInfo().roomName
            local password=g_GameData:getPersonalInfo().password
            local roomId=g_GameData:getRoomConfigId()
            panel:showToScene()
            panel:initData(roomName,password,roomId)
        end
    end
end

function M:refreshHot()
    local num=g_ChatData:hasUnReadMessage()
    self.ChatTipDotIcon:setVisible(num>0)

    --chat
    local chatData = g_ChatData:getRoomChatDataByChannelId(Enum.ChatChannel.room)
    if Utils.isEmptyTable(chatData) then 
        self.ChatText:setString("")
    else
        local len = table.getn(chatData)
        local txt=Utils.transformProhibitWord(chatData[len].content)
        local startPos,endPos=string.find(txt, "Emoji", 1)
        if startPos~=nil and endPos~=nil then
            self.ChatText:setVisible(false)
            self.ChatImageNode:setVisible(true)
            local   ItemIcon=string.sub(txt,endPos+1,string.len(txt))
            self.ChatImage:loadTexture(Utils.getIconStr(PlistConfig.Icon.ChatEmoji, ItemIcon), ccui.TextureResType.plistType)
            if not chatData[len].isSelf then
                self.ChatImageText_S:setVisible(true)
                self.ChatImageText_S:setString(chatData[len].userInfo.nickname..":")
                local size=self.ChatImageText_S:getVirtualRendererSize()
                self.ChatImage:setPositionX(size.width)
            else
                self.ChatImageText_S:setVisible(false)
                self.ChatImage:setPositionX(0)
            end
        else
            self.ChatText:setVisible(true)
            self.ChatImageNode:setVisible(false)
            if not chatData[len].isSelf then
                txt=chatData[len].userInfo.nickname..":"..txt
            end
            local len,count=self:parseStringData(txt)
            if len>=MAX_SIZE then
                txt=string.sub(txt,1,count-1)..'......'
            end
            self.ChatText:setString(txt)
        end
    end
end

function M:refreshLanguageHandle()
    self.GoldNum:setString(Utils.getFormatNumber_MuitiLanguage(g_UserData:getGold()))
    self.GoldRollNum:setString(Utils.getFormatNumber_MuitiLanguage(g_UserData:getGold()))
end

function M:adaptationPanelSize()
    local size=cc.Director:getInstance():getWinSize()
    local friangeTop = g_GameSettingData:getFringeScreenTop()
    local dyw = (size.height - 1280) / 2
    if dyw > 0 then
        local _y=self.FriendsHintNode:getPositionY()
        self.FriendsHintNode:setPositionY(_y+dyw)
    end
end

function M:onCreate()
    M.super.onCreate(self)
    self:adaptationPanelSize()
    self.mDefault_Store_Tab = Enum.ShopShowType.Gold
    self.State:setVisible(false)

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.MiniItem))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.Head))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.HeadBox))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.StaticDiceBox))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.VipIconTail))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.ChatEmoji))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.MagicEmoji))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.RoomBg))

    self.GoldButton:setTouchEnabled(false)
    self.OwnRightCallPoint:setVisible(false)
    self.OwnRightOpen:setVisible(false)
    self.NumberList:setScrollBarEnabled(false)
    self.JoinRoomTimes = 0
    
    self.ListDian:setScrollBarEnabled(false)
    self.diceBoxNum:setVisible(false)
    self.CalledBox:setVisible(false)
    self.GamingReturnFrame:setVisible(false)
    self.GamingReturn:setVisible(false)
    self.DesktopCallPoint:setVisible(false)
    self.GamingWatchFrame:setVisible(false)
    self.GamingWatch:setVisible(false)
    self.WatchStateTip:setVisible(false)
    self.WatchNum:setString("0")
    self.WatchStateNum:setString("0")
    self.WatchLittlePanel:setVisible(false)
    self.LittleGuessing:setVisible(false)
    self.WitnessNode:setVisible(false)
    self.ReplaceBottomInjectionState:setVisible(false)
    self.bIsLittleGuessingOpening = false
    self.ChatImage:setVisible(true)
    self.ChatImageNode:setVisible(false)

    local effect = Utils.onlyCreateEffect(GSystem.GuessShrinkSpine ,cc.p(0,0),true)
    if effect then
        self.LittleGuessingSpineATNode:addChild(effect)
    end

    self.mMyTurnTime = 0
    self.mMyMaxTurnTime=0
    self.mTimeSound = 0
    self.mFinishGameWaitTime = 0
    self.mAutoLeaveGameTime = GSystem.AutoExitRoom

    self.mNeedLevelRoom = false
    self.mNeedStandUp = false

    self.mTipUpBetBasePanel = nil
    self.CalledBox_0:setVisible(false)

    self.mClickOpenAudioFail = false

    self.mBackTimeSoundId = 0

    self.mRqustPanel = nil

    local btnsize = self.HeadShade:getContentSize()
    self.mLeftTimeLabel = ccui.Text:create()
    self.mLeftTimeLabel:setFontSize(46)
    self.mLeftTimeLabel:setFontName("font/Font003.ttf")
    self.mLeftTimeLabel:setPosition(cc.p(btnsize.width/2,btnsize.height/2))
    self.mLeftTimeLabel:setTextColor({r = 255, g = 255, b = 255})
    self.mLeftTimeLabel:enableShadow({r = 0, g = 0, b = 0, a = 127}, {width = 0, height = -1}, 0)
    self.HeadShade:addChild(self.mLeftTimeLabel)
    self.HeadShade:setVisible(false)

    self.mTouchStartPos = cc.p(-1000,-1000)
    self.mIsOpeningHandle=false


    self.mSayMaxPoint=1
    self.mSayPointNum=1
    self.mNowSaySeat = 0
    self.mIsHaveSomeSay = false

    self.mPointNum = g_GameData:getMinCallNumber()
    self.mDicePoint = 2

    self.mIsCanOpen = false
    self.mIsHavePlayerSayPoint = false

    self.mbeforeSayItem = nil

    self.diceBoxDian:setVisible(false)

    if g_UserData:getServiceTag() then
        local   panel=UIManager:getOrCreatePanel("UIServiceInletLayer")
        if panel then
            panel:setType(Enum.OnlineState.Gaming)
            panel:showToScene()
        end
    end
    
    self.mReadyLayer = UIManager:createPanelOnly("app.gui.game.UIGameReady")
    if self.mReadyLayer then
        self:addChild(self.mReadyLayer)
    end

    self.bIsOpenGuessSizeLayer = false
    
    self.mGuessLayer=UIManager:getOrCreatePanel("UIGuessSizeLayer")
    self.mGuessLayer:showToScene()
    self.mGuessLayer:setVisible(false)
    self.mGuessLayer:setLocalZOrder(1000)
    self.mBankerGuessLayer=UIManager:getOrCreatePanel("app.gui.guessSize.UIBankerGuessSizeLayer")
    self.mBankerGuessLayer:showToScene()
    self.mBankerGuessLayer:setVisible(false)
    self.mBankerGuessLayer:setLocalZOrder(1000)

    local effect = Utils.onlyCreateEffect(GSystem.GuessSizeInletSpine,cc.p(0,0),true)
    self.GuessSizeSpriteATNode:addChild(effect)

    self.mMySeatItem = nil
    self.mMySeatId = 0

    self.mSeatSTable={
        [1] = self.playerNode_0,
        [2] = self.playerNode_1,
        [3] = self.playerNode_2,
        [4] = self.playerNode_3,
        [5] = self.playerNode_4,
        [6] = self.playerNode_5,
        [7] = self.playerNode_6,
        [8] = self.playerNode_7,
    }

    self.mEmojiPanelList = {
        [1] = self.EmojiPanel_1,
        [2] = self.EmojiPanel_2,
        [3] = self.EmojiPanel_3,
        [4] = self.EmojiPanel_4
    }
    self.mEmojiHeadInfo = {}
    self.mEggHeadInfo={}

    self.CurrentPoints:setVisible(false)
    self.GoldRollNum:setVisible(false)


    self:setShadeShowModel(true)

    self:refrashOneselfData()

    self:initAllPlayerSeat()
    if self.mMySeatItem then
        self.mMySeatItem:initMatchGame()
    end

    self:refreshNowCanSelectNum()
    self:refreshNowDiceBoxPoint()

    self:setIsCanSayPoint(false)

    self.mMicVolumeChgTime = 0
    self.mPerPlayerMicVolume = 0
    self.mCurPlayerMicVolume = 0
    self.MicLoadingBar:setPercent(0)
    self.bIsInAudioRoom = false
    self:setMicIsOpen(false,false)
    
    self.ChatPanel:setVisible(false)
    self:initOutClickableArea()
end

function M:initOutClickableArea()
    local function onOutClickNumberSelectionPanel()
        self.diceBoxNum:setVisible(false)
    end

    local function onOutClickPointSelectionPanel()
        self.diceBoxDian:setVisible(false)
    end

    UIUtils.addClickableNode(self.PointSelectionPanel, nil, onOutClickPointSelectionPanel)
    UIUtils.addClickableNode(self.NumberSelectionPanel, nil, onOutClickNumberSelectionPanel)
end

--关闭猜大小页面的事件
function M:onCloseGuessSizeLayer()
    if not self.bIsLittleGuessingOpening then
        local panel = UIManager:getPanel("UIGuessingLayer")
        if panel then
            panel:reShowAllNode()
        end
    end
    self.bIsOpenGuessSizeLayer = false
end

function M:setIsCanSayPoint(value)
    if g_GameData:isWatching() then 
        self.PointButton:setTouchEnabled(false)
        self.PointButton:setBright(false)
        return 
    end
    if self.mGuessLayer then
        self.mGuessLayer:setVisible(false)
        self.mBankerGuessLayer:setVisible(false)
    end

    local isCan = false;
    if value then
        if self.mPointNum > self.mSayPointNum or (self.mSayMaxPoint ~= 1 and (self.mDicePoint > self.mSayMaxPoint or self.mDicePoint == 1))then
            local CurrSeatInfo = g_GameData:getCurrSeatInfo()
            if CurrSeatInfo and CurrSeatInfo.seatId == g_GameData:getMineSeatId() then
                isCan = true
            end
        end
    end
    
    self.PointButton:setTouchEnabled(isCan)
    self.PointButton:setBright(isCan)
end

function M:refreshNowDiceBoxPoint()
    self.ListDian:removeAllItems()
    for i = 1, 6 do
        local _dicPoinItem = UIManager:createPanelOnly("app.gui.game.UIDicePointItem")
        if _dicPoinItem then
            local layout = ccui.Layout:create()
            -- size 400,200
            local size = _dicPoinItem:getContentSize()
            layout:setContentSize(size.width, size.height)
            _dicPoinItem:setTag(ITEM_TAG)
            _dicPoinItem:setNum(i)
            _dicPoinItem:setCallfunc(handler(self,self.callBackClickDiceDian))
            layout:addChild(_dicPoinItem)

            self.ListDian:pushBackCustomItem(layout)
        end
    end
end

function M:refreshNowCanSelectNum()
    self.NumberList:removeAllItems()
    local startidx = g_GameData:getMinCallNumber()
    
    Log.info("当前最大点数："..g_GameData:getMaxCallNumber())
    if g_GameData:getMinCallNumber()<g_GameData:getMaxCallNumber() then
        if self.mIsHaveSomeSay and self.mSayMaxPoint==1 then
            startidx = startidx + 1
        end

        if self.mPointNum<=g_GameData:getMinCallNumber()  then
            if self.mIsHaveSomeSay then
                self.mPointNum = g_GameData:getMinCallNumber()+1
            else
                self.mPointNum = g_GameData:getMinCallNumber()
            end
        end
    else
        self.mPointNum=g_GameData:getMaxCallNumber()
        if self.mSayMaxPoint~=1 and self.mDicePoint ~=1 and self.mDicePoint <= self.mSayMaxPoint then
            self.mDicePoint=self.mSayMaxPoint%6+1
        else
            self.mDicePoint=1
        end
    end
    
    for i = startidx, g_GameData:getMaxCallNumber() do
        local _dicNumItem = UIManager:createPanelOnly("app.gui.game.UIDiceNumItem")
        if _dicNumItem then
            local layout = ccui.Layout:create()
            -- size 400,200
            local size = _dicNumItem:getContentSize()
            --layout:setScale(0.96)
            layout:setContentSize(size.width, size.height)
            _dicNumItem:setTag(ITEM_TAG)
            --_dicNumItem:setPosition(cc.p(3,-10))
            _dicNumItem:setNum(i)
            _dicNumItem:setCallfunc(handler(self,self.callBackclickDiceNum))
            layout:addChild(_dicNumItem)

            self.NumberList:pushBackCustomItem(layout)
        end
    end

    self:refreshCallPointSave()
end

function M:initAllNumlistItem()
    local allchailds = self.NumberList:getChildren()
    for i, v in ipairs(allchailds) do
        local item = v:getChildByTag(ITEM_TAG)
        if item then
            item:setSelect(self.mPointNum)
        end
    end
end

function M:initAllDicelistItem()
    local allchailds = self.ListDian:getChildren()
    for i, v in ipairs(allchailds) do
        local item = v:getChildByTag(ITEM_TAG)
        if item then
            item:setSelect(self.mDicePoint)
        end
    end
end

function M:refrashOneselfData()
    self.NameText:setString(g_UserData:getNickName())
    Utils.setShortName(self.NameText,g_UserData:getNickName(), GSystem.NameLimitNumber)

    self.GoldNum:setString(Utils.getFormatNumber_MuitiLanguage(g_UserData:getGold()))
    local goldId = GSystem.GoldItemId
    local goldIcon = DataManager:getTbxData("Item",goldId).MiniItemIcon
    Log.info("goldIcon:"..goldIcon)
    self.GoldIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.MiniItem,goldIcon), ccui.TextureResType.plistType)
    self.HeadIcon:removeAllChildren()
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    avater:InitTexture(string.utf8len(g_UserData:getUserInfo():getHead())<7,g_UserData:getUserInfo():getHead(),g_UserData:getUserInfo():getUserId())
    self.HeadIcon:addChild(avater)

    self.HeadFrame:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(g_UserData:getHeadBox())), ccui.TextureResType.plistType)

    local vipLevel = g_UserData:getVipLevel()
    if vipLevel <= 0 then 
        self.VipImage:setVisible(false)
    else
        self.VipImage:setVisible(true)
        local vipData = DataManager:getTbxData("Vip", vipLevel)
        if vipData then 
            self.VipImage:loadTexture(Utils.getIconStr(PlistConfig.Icon.VipIconTail, vipData.VipIcon), ccui.TextureResType.plistType)
        end
    end
    Utils.showFormatVip(self.NameText, self.VipImage)
end

function M:callBackClickDiceDian(num)
    print("点击了点："..num)
    self.diceBoxDian:setVisible(false)
    self.Vertices:loadTexture("00_01_Common/2D_Small_" .. num ..".png", ccui.TextureResType.plistType)
    self.mDicePoint = num
    self:initAllDicelistItem()
    self:setIsCanSayPoint(true)
    g_GameData:C2S_AutoCallUpdate(self.mDicePoint,self.mPointNum)
end

function M:callBackclickDiceNum(num)
    self.diceBoxNum:setVisible(false)
    self.NumberText:setString(tostring(num))
    self.mPointNum = num
    self:initAllNumlistItem()
    self:setIsCanSayPoint(true)
    g_GameData:C2S_AutoCallUpdate(self.mDicePoint,self.mPointNum)
end

function M:refreshCallPointSave()
    self.Vertices:loadTexture("00_01_Common/2D_Small_" .. self.mDicePoint ..".png", ccui.TextureResType.plistType)
    self:initAllNumlistItem()
    self.NumberText:setString(tostring(self.mPointNum))
end

function M:onClickSayPoint(ref)
    self:checkShowBoastList()
    print("发送叫点 :"..self.mPointNum.."个"..self.mDicePoint)
    self.mMyTurnTime=0
    -- self.mTimeMask:setPercentage(0)
    self.HeadShade:setVisible(false)
    self.mLeftTimeLabel:stopAllActions()
    g_GameData:C2S_CallPoint(self.mDicePoint,self.mPointNum)
    self:setAutoLeaveRoom(false)
    if self.mBackTimeSoundId~=0 then
        SoundSystemManager:stopSound("effect",self.mBackTimeSoundId)
        self.mBackTimeSoundId = 0 
    end
end

function M:onEventTouchDiceNum(ref)
    if ref.event == "end" then
        SoundSystemManager:playSound004()
        self:checkShowBoastList()
        print("点击了选择数字")
        self.diceBoxDian:setVisible(false)
        self.diceBoxNum:setVisible(not self.diceBoxNum:isVisible())
        self:initAllNumlistItem()
    end
end

function M:onEventTouchDiceDian(ref)
    if ref.event == "end" then
        SoundSystemManager:playSound004()
        self:checkShowBoastList()
        print("点击了选择点数")
        self.diceBoxNum:setVisible(false)
        self.diceBoxDian:setVisible(not self.diceBoxDian:isVisible())
        self:initAllDicelistItem()
        if g_GameData:isOneCalled() then
            self.CalledBox:setVisible(true)
        else
            self.CalledBox:setVisible(false)
        end
    end
end

function M:initRoom()
    if  2==g_GameData:getRoomType() then
        self.BottomInjectionButton:setVisible(false)
    end

    self.ChatPanel:setVisible(true)
    self:initRoomData()
    self:initAllPlayersData()
    local sayData = g_GameData:getCallInfo()
    if sayData.seatId ~= -1 and sayData.num>0 and sayData.point>0 then
        self.mIsHaveSomeSay = true
        if g_GameData:isOneCalled() then
            self.CalledBox_0:setVisible(true)
        end
        self:refreshSayPointData()
        self:refreshNowCanSelectNum()
    else
        self.DesktopCallPoint:setVisible(true)
        self.BottomInjectionText:setString("0")
        self.BottomInjectionImage:loadTexture("00_01_Common/2D_Small_2.png", ccui.TextureResType.plistType)
    end
    self:updatePrivateRoomBtn()
    self:initVoteData()
end

function M:updatePrivateRoomBtn()
    local  personalInfo=g_GameData:getPersonalInfo()
    
    if  2==g_GameData:getRoomType() and  g_UserData:isSelfUserId(personalInfo.masterUid)  then
        self.PrivateRoomMasterNode:setVisible(true)
        self.PrivateRoomMasterIcon:setVisible(true)
    else
        self.PrivateRoomMasterNode:setVisible(false)
        self.PrivateRoomMasterIcon:setVisible(false)
    end

end

function M:initRoomData(_betBase)
    self.CurrentPoints:setVisible(true)
    local betBase = _betBase or g_GameData:getBetBase()
    self.baseBetTxt:setString(Utils.getFormatNumber_MuitiLanguage(betBase))
    self:initWatching()
    self:updateBg()
    
    local Audiences = g_GameData:getAudiences()
    self.WatchNum:setString(tostring(#Audiences))
    self.WatchStateNum:setString(tostring(#Audiences))
end

function M:initWatching()
    local isWatching = g_GameData:isWatching();
    local Audiences = g_GameData:getAudiences()

    self.WatchButton:setTouchEnabled(not isWatching);
    self.WatchButton:setBright(not isWatching);
    --self.MicButton:setTouchEnabled(not isWatching);
    if isWatching then
        if self.mRqustPanel then
            self.mRqustPanel:removeFromParent()
            self.mRqustPanel=nil
        end

        self:setMicIsOpen(false,false)
        self.OwnRightCallPoint:setVisible(false)
        self.OwnRightOpen:setVisible(false)
    end

    self.NumberFrame:setTouchEnabled(not isWatching)
    self.PointFrame:setTouchEnabled(not isWatching)

    self.BottomInjectionButton:setTouchEnabled(not isWatching)
    self.BottomInjectionButton:setBright(not isWatching)
    self.WatchStateTip:setVisible(isWatching)
    self.WatchLittlePanel:setVisible((not isWatching) and #Audiences>0)
    
    self.WitnessNode:setVisible(isWatching)
    self.PointNode:setVisible(not isWatching)
    self.BottomFrame:setVisible(not isWatching)
    if self.mGuessLayer and self.mGuessLayer:isVisible() and not isWatching then
        self.mGuessLayer:playAction(0)
    end
    if self.mBankerGuessLayer and self.mBankerGuessLayer:isVisible() and not isWatching then
        self.mBankerGuessLayer:playAction(0)
    end
end

function M:initAllPlayersData()
    self.mMySeatId = g_GameData:getMineSeatId()
    local players = g_GameData:getGamePlayers()

    print("initAllPlayersData");
    print("我自己的座位号："..self.mMySeatId)
    for i = 0, g_GameData.MAX_PLAYERS-1 do
        if not players[i]:isEmptySeat() then
            print("玩家座位号："..players[i]:getUiSeatId())
            local seat = self:getActualSeat(i) -- 重构
            self:setPlayerSeat(seat,players[i]) -- 重构
            print("当前座位有玩家："..i)
        else
            print("当前座位没有玩家："..i)
            local seat = self:getActualSeat(i)
            self:setNonePlayerSeat(seat,i) -- 重构
        end
    end
end

function M:initAllPlayerSeat()
    for i=1,8 do
        local _dicePanel = UIManager:createPanelOnly("app.gui.game.UIDiceBoxCell")
        if _dicePanel then
            _dicePanel:setPosition(cc.p(-_dicePanel:getContentSize().width/2,-_dicePanel:getContentSize().height/2))
            _dicePanel:setTag(ITEM_TAG)
            _dicePanel:SetIsNonePlayer(true)
            self.mSeatSTable[i].isRemove=true
            self.mSeatSTable[i]:addChild(_dicePanel)
            if i == 1 then
                self.mMySeatItem=_dicePanel
                local _diceBoxId = g_UserData:getMyDiceBox()
                self.mMySeatItem:initDiceBox(_diceBoxId)
            end
        end
    end
end

function M:setPlayerSeat(seat,data)
    if self.mSeatSTable[seat] == nil or data==nil then
        return
    end

    local item = self.mSeatSTable[seat]:getChildByTag(ITEM_TAG)
    if item then
        item:SetIsNonePlayer(false)
        local _diceBoxId = data:getUserInfo():getMyDiceBox()
        item:initDiceBox(_diceBoxId)
        item:showIsMy(seat == 1)
        data.actualSeat = seat
        if seat == 1 then
            item:showPointData(data:getDices(),true)
        else
            item:setAllDiceBoxShow(false)
        end
        item:initData(data)
        self.mSeatSTable[seat].isRemove=false
    end
end

function M:setNonePlayerSeat(seat,seatId)
    local item = self.mSeatSTable[seat]:getChildByTag(ITEM_TAG)
    if item then
        item:SetIsNonePlayer(true,g_GameData:isWatching(),seatId)
        self.mSeatSTable[seat].isRemove=true
    end
end

function M:refreshNonePlayerSeat()
    local allchailds = self.mSeatSTable
    for i, v in ipairs(allchailds) do
        local item = v:getChildByTag(ITEM_TAG)
        if item and v.isRemove then
            item:SetIsNonePlayer(true,g_GameData:isWatching())
        end
    end
end

--重连时恢复升场投票相关的UI表现
function M:initVoteData()
    local players = g_GameData:getGamePlayers()
    self.mMySeatId = g_GameData:getMineSeatId()
    if g_GameData:isWatching() then--未参与对局玩家不会看到投票信息
        return
    end

    local voteInfo = g_GameData:getVoteInfo()
    if not voteInfo.isVoting then return end--投票中才恢复

    local isMeVote = false
    if voteInfo.uidVoteList and not Utils.isEmptyTable(voteInfo.uidVoteList)then
        for _,v in ipairs(voteInfo.uidVoteList) do
            if v.seatId == self.mMySeatId then
                isMeVote = true
            end
            self:onGameSomeoneVote(v)
        end
    end

    if not isMeVote then
        local leftTime = voteInfo.creatVoteInfo.countdownTimeStamp - g_UserData:calcServerTimestamp()
        self:onGameLaunchVote({seatId=voteInfo.creatVoteInfo.seatId,betBase=voteInfo.creatVoteInfo.betBase,leftTime=leftTime})
    end
end

function M:onInit()
    M.super.onInit(self)
    g_FriendData:requestFriendList()
    SoundSystemManager:playBackMusic(SoundSystemManager:getRandomDefaultBGMPath())
    if g_GameData:getGuessLuckData() then 
        self:UIGameLayer_updateLuckPlayer({is=false})
    end

    if self.mReadyLayer then
        self.mReadyLayer:refreshEffect()
    end
    self:refreshHot()
    self.ChatText:setString("")

    local MagicyFlypanel1 = UIManager:getPanel("UIBoastMagicyFlyLayer_1")
    if MagicyFlypanel1 then
        MagicyFlypanel1:closePanel(0)
    end

    local MagicyFlypanel2 = UIManager:getPanel("UIBoastMagicyFlyLayer_2")
    if MagicyFlypanel2 then
        MagicyFlypanel2:closePanel(0)
    end

    local panel = UIManager:getOrCreatePanel("UIBoastMoneyFlyLayer")
    if panel then
        panel:StopAllGoldAction()
        panel:showToScene()
    end
    self.VoiceButon:setVisible(false)
    self.MicButton:setVisible(false)
    self.mNeedUpBackMusic = true
    self.mNeedUpBackMusicTimes = 0
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:onGamePlayerUpdate(data)
    print("玩家列表变更消息接收")
    local players = g_GameData:getGamePlayers()
    self.mMySeatId = g_GameData:getMineSeatId()

    local uiSeatId = players[data.seatId]:getUiSeatId()
    local seat = self:getActualSeat(uiSeatId)
    if data.isadd then
        if self.mMySeatId == uiSeatId and not g_GameData:isWatching() then
            self:initAllPlayersData()
            self:initWatching();
            self:setAutoLeaveRoom(false)

            self:onCloseGuessSizeLayer()
        else
            self:setPlayerSeat(seat,players[data.seatId]) -- 重构
        end
    else
        self:setNonePlayerSeat(seat,data.seatId) -- 重构
        if self.mMySeatId == uiSeatId then
            self:refreshNonePlayerSeat()
            self:initWatching();
            self:setAutoLeaveRoom(false)
        end
    end
end

function M:onAudienceListUpdate(data)
    print("观众列表变更消息接收")
    if data.isMe then
        self:initWatching();
    end

    local Audiences = g_GameData:getAudiences()
    self.WatchNum:setString(tostring(#Audiences))
    self.WatchStateNum:setString(tostring(#Audiences))
    self.WatchLittlePanel:setVisible((not g_GameData:isWatching()) and #Audiences>0)
end

function M:onUpdateUserResource(data)
    self.GoldNum:setString(Utils.getFormatNumber_MuitiLanguage(g_UserData:getGold()))
    
    local vipLevel = g_UserData:getVipLevel()
    if vipLevel <= 0 then 
        self.VipImage:setVisible(false)
    else
        self.VipImage:setVisible(true)
        local vipData = DataManager:getTbxData("Vip", vipLevel)
        if vipData then 
            self.VipImage:loadTexture(Utils.getIconStr(PlistConfig.Icon.VipIconTail, vipData.VipIcon), ccui.TextureResType.plistType)
        end
    end
    Utils.showFormatVip(self.NameText, self.VipImage)

    local roomData=g_GameData:getRoomDataByRoomId(g_GameData:getRoomConfigId())
    if g_UserData:getGold() < tonumber(roomData[1].StakeGold) then
        self.mNeedStandUp = true
    end

    --是否站起
    if self.WitnessNode:isVisible() or g_UserData:getGold() < tonumber(roomData[1].StakeGold) then
        g_UserData:checkGoldNeedEvent()
    end
end

function M:onEnterRoom(data)
    print("收到进去房间消息")
    if self.mReadyLayer then
        self.mReadyLayer:removeFromParent()
        self.mReadyLayer=nil
    end
    if nil ~= data then
        self:JoinIAgoraRoom()
        self:initRoom()
    end
end

function M:JoinIAgoraRoom()
    -- if self.JoinRoomTimes >= 3 then
    --     self.JoinRoomTimes = 0
        self.VoiceButon:setVisible(true)
        self.MicButton:setVisible(true)
        self.VoiceButon:setBright(false)
        self.MicButton:setBright(false)
    --     self.joinroomFailure = true
    --     g_GameSettingData:setIsMicOpened(false)
    --     g_GameSettingData:saveSettingDataToLocal()
    --     g_GameData:setAudioIsSound(false)
    --     return
    -- end
    kz.IAgoraRoomManager:instance():joinRoom("",tostring(g_GameData:getGameId()),tostring(g_UserData:getUserId()),g_UserData:getUserId())
        -- self.JoinRoomTimes = 0
        -- self.VoiceButon:setVisible(true)
        -- self.MicButton:setVisible(true)
    -- else
    --     self.JoinRoomTimes = self.JoinRoomTimes + 1
    --     self:JoinIAgoraRoom()
    -- end
end

function M:updateBg()
    local roomData=g_GameData:getRoomDataByRoomId(g_GameData:getRoomConfigId())
    self.Bg:loadTexture(Utils.getIconStr(PlistConfig.Icon.RoomBg, roomData[1].RoomBG), ccui.TextureResType.plistType)
end

function M:onGameStart(data)
    if self.mReadyLayer then
        self.mReadyLayer:removeFromParent()
        self.mReadyLayer=nil
    end
    self.mbeforeSayItem=nil
    self.OwnRightCallPoint:setVisible(false)
    self.OwnRightOpen:setVisible(false)
    self.NumberList:setScrollBarEnabled(false)
    self.ListDian:setScrollBarEnabled(false)
    self.diceBoxNum:setVisible(false)
    self.CalledBox:setVisible(false)
    self.CalledBox_0:setVisible(false)
    self.GoldRollNum:setVisible(false)
    self.GoldNum:setVisible(true)
    self.ReplaceBottomInjectionState:setVisible(false)
    
    self.mPointNum = g_GameData:getMinCallNumber()
    self.mDicePoint = 2
    self.mSayMaxPoint = 1
    self.mSayPointNum = 1
    self.mIsHaveSomeSay = false
    self.DesktopCallPoint:setVisible(true)
    self.BottomInjectionText:setString("0")
    self.BottomInjectionImage:loadTexture("00_01_Common/2D_Small_2.png", ccui.TextureResType.plistType)

    self:refreshNowCanSelectNum()
    self:initRoomData()
    self:initAllPlayersData()

    --self:callBackClickDiceDian(self.mDicePoint)
    --self:refreshCallPointSave()
    --充值数据
    --播放开始动画
    local startEffectId = GSystem.MatchStartAnimationId
    if startEffectId~=0 then
        local _effect = Utils.onlyCreateEffect(startEffectId,cc.p(0,0),false)
        if _effect then
            local size = self:getContentSize()
            _effect:setPosition(cc.p(size.width/2,size.height/2))
            print("开始动画开始播放")
            self._rootNode:addChild(_effect)
        end
    end
    --所有玩家初始化
    self:allPlayersInit()

    self.mIsCanOpen = false
    self.mIsHavePlayerSayPoint = false
    if self.mMySeatItem then 
        self.mMySeatItem:setIsCanReRoll(true)
    end

    SoundSystemManager:playSound009()
    print("游戏开始")
end

function M:allPlayersInit()
    local allchailds = self.mSeatSTable
    for i, v in ipairs(allchailds) do
        local item = v:getChildByTag(ITEM_TAG)
        if item then
            item:gameStart()
        end
    end
end

--当前游戏结束
function M:onGameOver(data)
    local _callinfo = data.callInfo
    local _openSeat = data.openSeatId
    local _myResult = data.resultUserList
    local _totalCount = data.totalCount
    local _isCallOne = data.isTypeOneDiceUsed
    local _callpoint = _callinfo.point
    local _multiple = data.multiple
    local isEnoughWin = _totalCount>=_callinfo.num

    local _baseBet = g_GameData:getBetBase()
    self.baseBetTxt:setString(Utils.getFormatNumber_MuitiLanguage(_baseBet))
    self:updateBg()

    self.mMySeatId = g_GameData:getMineSeatId()
    local isMeOpened = _openSeat == self.mMySeatId
    if data.hasBetResult then
        self.mFinishGameWaitTime = GSystem.FinishGameWaitTime[1]--[7,5]
    else
        self.mFinishGameWaitTime = GSystem.FinishGameWaitTime[2]--[7,5]
    end

    local function goldfly()--飞金币动画
        local winseatid,losesearid
        local goldchg = 0
        local endgoldnum = 0

        local flydata
        local flygoldconfig =DataManager:getTbxData("FlyGold","FlyGoldType",2)
        for _,v in ipairs(flygoldconfig) do
            if v.FlyGoldValue == _multiple then
                flydata = v
            end
        end

        for i, v in ipairs(_myResult) do --对局金币动画
            local seatId = v.seatId
            local actualSeatid = self:getActualSeat(seatId)
            if v.goldChangeBeforeTax>0 then
                goldchg = v.goldChangeBeforeTax
                winseatid = actualSeatid
                endgoldnum = v.gold
            elseif v.goldChangeBeforeTax<0 then
                losesearid = actualSeatid
                local players = g_GameData:getGamePlayers()
                if not players[seatId]:isEmptySeat() and players[seatId]:isGaming() then
                    local goldchgtime= GSystem.RollWordExtraTime or 0.5
                    goldchgtime = goldchgtime + flydata.FlyGoldInterval/1000

                    if seatId == self.mMySeatId and not g_GameData:isWatching() then
                        self:myPopNumber(v.goldChangeBeforeTax,v.gold,goldchgtime)
                    else
                        local Item = self.mSeatSTable[actualSeatid]:getChildByTag(ITEM_TAG)
                        Item:PopNumber(v.goldChangeBeforeTax,v.gold,goldchgtime)
                    end
                end
            end
        end

        if losesearid~=nil and winseatid~=nil then
            self:newgoldFlyFromWhereToSeat(losesearid,winseatid,goldchg,endgoldnum,flydata)
        end
    end

    --所有人开骰盅并播放音效
    --SoundSystemManager:playSound022()
    for i, v in ipairs(_myResult) do
        local seatId = v.seatId
        local actualSeatid = self:getActualSeat(seatId)
        local item = self.mSeatSTable[actualSeatid]:getChildByTag(ITEM_TAG)

        if item then
            item:gameResult(v,_callpoint,_isCallOne,isMeOpened)
            local beforegold = v.gold - v.goldChangeBeforeTax
            if seatId == self.mMySeatId and not g_GameData:isWatching() then
                self.GoldRollNum:setString(Utils.getFormatNumber_MuitiLanguage(beforegold))
            else
                item:setBetResultGoldNum(beforegold)
            end
        end
    end

    local function removeResultEffect()
        for i, v in ipairs(_myResult) do
            local seatId = v.seatId
            local actualSeatid = self:getActualSeat(seatId)
            local item = self.mSeatSTable[actualSeatid]:getChildByTag(ITEM_TAG)

            if item then
                item:removeEffect()
            end
        end
    end
    self.GuessingShowNode:runAction(cc.Sequence:create(cc.DelayTime:create(1)
        ,cc.CallFunc:create(function ()
            self.resultPopUpPanel = UIManager:createPanelOnly("app.gui.game.UIResultPopUp")
            if self.resultPopUpPanel then
                self._rootNode:addChild(self.resultPopUpPanel)
                local panelsize = self.resultPopUpPanel:getContentSize()
                -- local size = self:getContentSize()
                -- self.resultPopUpPanel:setPosition(cc.p(size.width/2-panelsize.width/2,size.height/2-panelsize.height/2))
                local posx,posy = self.CurrentFrame:getPosition()
                self.resultPopUpPanel:setPosition(cc.p(posx-panelsize.width/2,posy-panelsize.height/2))
                self.resultPopUpPanel:setCallPointData(_totalCount,_callinfo.point)
            end
        end)
        ,cc.DelayTime:create(2)
        ,cc.CallFunc:create(function ()
            self:handleAllPlayerResult(data,isEnoughWin,self.mFinishGameWaitTime-2)
        end)
        ,cc.DelayTime:create(self.mFinishGameWaitTime-3)
        ,cc.CallFunc:create(function ()
            goldfly()
        end)
        ,cc.DelayTime:create(1)
        ,cc.CallFunc:create(function ()
            removeResultEffect()
        end)
    ))
    
    print("开的人的位置：".._openSeat.." 被开的人的位置：".._callinfo.seatId.." 开的人的实际位置："..self:getActualSeat(_openSeat).." 被开的人的实际位置："..self:getActualSeat(_callinfo.seatId))

    print("回合结束")
end

--金币移动动画
function M:newgoldFlyFromWhereToSeat(seatStar,seatEnd,goldchg,seatEndGoldNum,flydata)
    local flyIconId = GSystem.ResultShowItmeId
    if not flyIconId then
        print("没有配置飞的筹码")
        return
    end

    local goldchgtime= GSystem.RollWordExtraTime or 0.5

    local num = flydata.FlyGoldNum or 1
    local FlyGoldSpeed = flydata.FlyGoldSpeed or 1750
    local FlyGoldInterval = flydata.FlyGoldInterval/1000 or 0.45
    local FlyGoldCreateFadeIn = flydata.GoldCreateFadeIn/1000 or 0.2
    local FlyGoldCreatedDelay = flydata.GoldCreatedDelay/1000 or 0.3
    goldchgtime = goldchgtime + flydata.FlyGoldInterval/1000

    self.mMySeatId = g_GameData:getMineSeatId()

    local function getPos(seatId)
        if seatId == 1 and not g_GameData:isWatching() then --自己
            return self.GoldIcon:getPosition()
        else
            local seatNode = self.mSeatSTable[seatId]
            if not seatNode then return nil,nil end
            local item = seatNode:getChildByTag(ITEM_TAG)
            local posx,posy = seatNode:getPosition()
            if item then
                local itwmwordpos = item:getGoldWorldPosition()
                local localPos = self:convertToNodeSpace(itwmwordpos)
                posx = localPos.x
                posy = localPos.y
            end
            return posx,posy
        end
    end

    local function popNumber(chgnum,seatId)--金币飘字
        if seatId == -3 or (seatId == 1 and not g_GameData:isWatching()) then
            self:myPopNumber(chgnum,seatEndGoldNum,goldchgtime)
        elseif self.mSeatSTable[seatId] then
            local seatItem = self.mSeatSTable[seatId]:getChildByTag(ITEM_TAG)
            if seatItem then
                seatItem:PopNumber(chgnum,seatEndGoldNum,goldchgtime)
            end
        end
    end

    local startx,starty = getPos(seatStar)
    local endx,endy = getPos(seatEnd)
    if startx == nil or endx == nil then return end

    local _dx = 0
    local _dy = 0
    local flytime = 1--金币移动所需时间
    for i = 1, num do
        _dx = math.random(-30,30)
        _dy = math.random(30,90)
        flytime = cc.pGetDistance(cc.p(startx+_dx,starty+_dy),cc.p(endx,endy))/FlyGoldSpeed--金币移动所需时间
        
        local delaytime = 0
        if i == num then 
            delaytime = FlyGoldInterval
        elseif i>1 then 
            delaytime = math.random()*FlyGoldInterval
        end
       
        local flyIcon = DataManager:getTbxData("Item",flyIconId).MiniItemIcon
        
        local sprite = cc.Sprite:createWithSpriteFrameName(Utils.getIconStr(PlistConfig.Icon.MiniItem,flyIcon))
        if sprite then
            sprite:setName("flyItem")
            local panel = UIManager:getPanel("UIBoastMoneyFlyLayer")
            if panel then
                panel:addChild(sprite)
                sprite:setPosition(cc.p(startx+_dx,starty+_dy))
                sprite:setOpacity(0)
                sprite:runAction(cc.Sequence:create(cc.FadeIn:create(FlyGoldCreateFadeIn)
                    ,cc.DelayTime:create(delaytime+FlyGoldCreatedDelay)
                    ,cc.CallFunc:create(function()
                        SoundSystemManager:playSound005()
                    end)
                    ,cc.MoveTo:create(flytime,cc.p(endx,endy))
                    ,cc.CallFunc:create(function()
                        if i==num then
                            popNumber(goldchg,seatEnd)
                        end
                    end)
                    ,cc.ScaleTo:create(0.05,1.2)
                    ,cc.ScaleTo:create(0.05,1)
                    ,cc.FadeOut:create(FlyGoldCreateFadeIn)
                    ,cc.CallFunc:create(function()
                        sprite:removeFromParent()
                    end)
                ))
            end
        end
    end
end

function M:myPopNumber(num,endnum,time)
    local function flytext()
        local _label = ccui.Text:create()
        _label:setFontSize(24)
        _label:setFontName("font/Font003.ttf")
        
        if num>0 then
            _label:setString("+" .. num)
            --_label:setTextColor({r = 245, g = 226, b = 115})
        else
            _label:setString(num)
            --_label:setTextColor({r = 227, g = 227, b = 227})
        end

        _label:setTextColor({r = 230, g = 228, b = 198})
        _label:enableOutline({r = 0, g = 0, b = 0}, 2)
        --_label:enableOutline({r = 0, g = 0, b = 0, a = 127}, 3)
        --_label:enableShadow({r = 30, g = 24, b = 134, a = 255}, {width = 2, height = -2}, 0)

        _label:setVisible(true)
        self:addChild(_label)
        local posx,posy = self.GoldIcon:getPosition()
        _label:setPosition(cc.p(posx+50,posy+20))
        -- _label:setOpacity(0)
        _label:runAction(cc.Sequence:create(cc.Spawn:create(cc.MoveBy:create(1.2,cc.p(0,30)),cc.FadeOut:create(1.2))
                ,cc.CallFunc:create(function()
                    _label:removeFromParent()
                end))
        )
    end
    
    local startnum = g_UserData:getGold()
    if endnum then 
        startnum = endnum-num
    end

    if num<0 then
        self.GoldNum:setVisible(true)
        self.GoldRollNum:setVisible(false)
        self.GoldNum:setString(Utils.getFormatNumber_MuitiLanguage(startnum+num))
        flytext()
    else
        self.GoldRollNum:setVisible(true)
        self.GoldRollNum:setString(Utils.getFormatNumber_MuitiLanguage(startnum))
        self.GoldNum:setVisible(false)
        if time == nil then
            time = 0.5
        end
        local chgtimes = math.ceil(time/0.1)
        local act = {}
        for i=1,chgtimes do
            act[#act+1] = cc.DelayTime:create(0.1)
            act[#act+1] = cc.CallFunc:create(function ()
                self.GoldRollNum:setString(Utils.getFormatNumber_MuitiLanguage(math.floor(startnum+i*num/chgtimes)))
            end)
        end
        act[#act+1] = cc.CallFunc:create(function ()
            self.GoldNum:setVisible(true)
            self.GoldNum:setString(Utils.getFormatNumber_MuitiLanguage(startnum+num))
            self.GoldRollNum:setVisible(false)
            flytext()
        end)
        self.GoldRollNum:runAction(cc.Sequence:create(act))
    end
end

--处理所有人的结果
function M:handleAllPlayerResult(data,isEnoughWin)
    local _multiple = data.multiple
    local _myResult = data.resultUserList
    local _prizeInfo = data.prizeInfoList or {}
    local _hasBetResult  = data.hasBetResult

    local bplaysound = true
    --竞猜结算动画
    if not Utils.isEmptyTable(_prizeInfo) then
        local panel = UIManager:getOrCreatePanel("UIGuessingResultLayer")
        if panel then
            panel:showToScene()
            local isWinOrLoss = panel:setData(isEnoughWin,_prizeInfo,_multiple,_hasBetResult)
            if isWinOrLoss then 
                bplaysound = false
            end
        end
        --bplaysound = false
    end

    --对局结算动画
    for i, v in ipairs(_myResult) do
        local seatId = v.seatId
        local actualSeatid = self:getActualSeat(seatId)
        local item = self.mSeatSTable[actualSeatid]:getChildByTag(ITEM_TAG)

        local _effectId = 0
        --获取动画ID
        if v.goldChangeBeforeTax>0 then--赢
            _effectId = self:getTimesEffectId(GSystem.WinAnimationId,_multiple)
            if bplaysound and seatId == self.mMySeatId then--主视角音效
                SoundSystemManager:playSound0012()
                bplaysound = false
            end
        elseif v.goldChangeBeforeTax<0 then--输
            _effectId = self:getTimesEffectId(GSystem.FailAnimationId,_multiple)
            if bplaysound and seatId == self.mMySeatId then--主视角音效
                SoundSystemManager:playSound006()
                bplaysound = false
            end
        end

        if _effectId~=0 then
            local _effect = Utils.onlyCreateEffect(_effectId,cc.p(0,0),false,false)
            
            if _effect then
                if seatId ~= self.mMySeatId then
                    _effect:setScale(0.8)
                end

                if item then
                    item:playEffect(_effect)
                end
            end
        end
    end

    if bplaysound then
        SoundSystemManager:playSound026()
    end
end

function M:getTimesEffectId(list,times)
    for j, w in ipairs(list) do
        if w[1] == times then
            local _effectId = w[2]
            return _effectId
        end
    end

    return 0
end

function M:OnUpdate(dt)
    if self.mMyTurnTime >0 then
        self.mMyTurnTime=self.mMyTurnTime-dt
        local _time = math.floor(self.mMyTurnTime)
        
        if _time >= 0 then
            --self.mTimeMask:setPercentage(self.mMyTurnTime/self.mMyMaxTurnTime*100)
            self.HeadShade:setVisible(true)
            self.mLeftTimeLabel:setScale(1)
            self.mLeftTimeLabel:setString(tostring(_time))
        else
            --self.mTimeMask:setPercentage(0)
            self.HeadShade:setVisible(false)
        end
        
        if _time > 3 then
            -- self.mLeftTimeLabel:setTextColor({r = 255, g = 255, b = 255})

            if _time == 5 and tonumber(self.mTimeSound) ~= 5 then
                SoundSystemManager:vibrate()
            elseif _time == 4 and tonumber(self.mTimeSound) ~= 4 then
                self.mBackTimeSoundId = SoundSystemManager:playEffect("music/02sound/Sound002.mp3",false)
            end
        elseif _time >= 0 then
            -- self.mLeftTimeLabel:setTextColor({r = 255, g = 40, b = 40})
            if tonumber(self.mTimeSound) ~= _time then
                self.mLeftTimeLabel:runAction(cc.Sequence:create(cc.ScaleTo:create(0.4,1.2),cc.ScaleTo:create(0.2,1)))
            end
        end
        self.mTimeSound = _time
    end

    if self.mRqustPanel then
        local time = self.mRqustPanel:getCountTime()-dt
        if time <0 then
            self.mRqustPanel:removeFromParent()
            self.mRqustPanel = nil
        else
            self.mRqustPanel:setContTime(time)
        end
    end
    
    --全服公告注释
    local msgList = g_CommonData:getMsgList()
    if not Utils.isEmptyTable(msgList) then
         self:OnNewMsgArrive()
    end

    self.mNeedUpBackMusic = true
    local allchailds = self.mSeatSTable
    for i, v in ipairs(allchailds) do
        local item = v:getChildByTag(ITEM_TAG)
        if item then
            item:OnUpdate(dt)
            if item:getMicVolumeChgTime() > 0 then
                self.mNeedUpBackMusic = false
            end
        end
    end

    if self.mNeedUpBackMusic and self.mNeedUpBackMusicTimes > 0 and not g_GameData:getAudioIsEnable() then
        self.mNeedUpBackMusicTimes = self.mNeedUpBackMusicTimes - 1
        SoundSystemManager:setBackMusicVolumeByPercent(0.5 + 0.5 / 60 * (60 - self.mNeedUpBackMusicTimes))
    end

    if self.mGuessLayer then
        self.mGuessLayer:OnUpdate(dt)
    end
    if self.mBankerGuessLayer then
        self.mBankerGuessLayer:OnUpdate(dt)
    end

    if self.mFinishGameWaitTime > 0 then
        self.mFinishGameWaitTime = self.mFinishGameWaitTime - dt
        if self.mFinishGameWaitTime <= 0 then
            self:clearRoom()
        end
    end

    self:onUpdateMicLoadingBar(dt)
    self:onUpdateAutoLeaveRoom(dt)

    local arr=self.AddFriendsPopUpNode:getChildren()
    for _,v in ipairs(arr) do
        v:OnUpdate(dt)
    end
end

function M:parseStringData(inputstr)
    if not inputstr or type(inputstr) ~= "string" or #inputstr <= 0 then
        return nil
    end
    local length = 0  -- 字符的个数
    local i = 1
    while true do
        local curByte = string.byte(inputstr, i)
        local byteCount = 1
        if curByte > 239 then
            byteCount = 4  -- 4字节字符
            length = length + byteCount
        elseif curByte > 223 then
            byteCount = 3  -- 汉字
            length = length + byteCount
        elseif curByte > 128 then
            byteCount = 2  -- 双字节字符
            length = length + byteCount
        else
            byteCount = 1  -- 单字节字符
            length = length + 2
        end
        i = i + byteCount
        
        if i > #inputstr or length>=MAX_SIZE then
            break
        end
    end
    return length,i
end

function M:OnNewMsgArrive()
    --可根据游戏模式判断创建不同样式的跑马灯
    --猜大小吹牛模式使用 UIBigSmallWalkingLanternNode
    --主界面使用 WalkingLanternNode
    local child = self.WalkingLanternNode_1:getChildByName("UIBigSmallWalkingLanternNode")
    if not child then 
        local WalkingLanternNode_1 = UIManager:createPanelOnly("UIBigSmallWalkingLanternNode")
        local size = WalkingLanternNode_1:getContentSize()
        WalkingLanternNode_1:setPosition(cc.p(- size.width / 2, -size.height / 2))
        self.WalkingLanternNode_1:addChild(WalkingLanternNode_1)
    end
end

function M:RemoveWalkingLantern()
    self.WalkingLanternNode_1:removeAllChildren()
end

--结算时间结束处理
function M:clearRoom()
    self.OwnRightCallPoint:setVisible(false)
    self.OwnRightOpen:setVisible(false)

    if self.resultPopUpPanel then
        self.resultPopUpPanel:removeFromParent()
        self.resultPopUpPanel=nil
    end

    local qopeneffect = self.GrabAnimationNode:getChildByName("qopeneffect")
    if qopeneffect then
        qopeneffect:removeFromParent()
    end
    
    self:initAllPlayersData()
    self.State:setVisible(false)
    self.GamingWatchFrame:setVisible(false)

    if g_GameData:isAutoLeaveRoom() or self.mNeedLevelRoom then
        self.mNeedLevelRoom=false
        g_GameData:C2S_LeaveGame()
    elseif self.mNeedStandUp then
        self.mNeedStandUp = false
        g_GameData:MSG_C2S_StandUp()
    end
end

function M:onUpdateAutoLeaveRoom(dt)
    if self.mAutoLeaveGameTime > 0 then
        local players = g_GameData:getGamePlayers()
        self.mMySeatId = g_GameData:getMineSeatId()
        if g_GameData:isWatching() or not (players[self.mMySeatId] and players[self.mMySeatId]:isGaming())then
            return
        end
        self.mAutoLeaveGameTime = self.mAutoLeaveGameTime - dt
        if self.mAutoLeaveGameTime <= 0 then
            self:setAutoLeaveRoom(true)
        end
    end
end

--设置局后自动退出
function M:setAutoLeaveRoom(isleave)
    print("setAutoLeaveRoom:"..tostring(isleave))
    g_GameData:setAutoLeaveRoom(isleave and not self.mNeedLevelRoom)

    if isleave and not self.mNeedLevelRoom then
        if not g_GameData:isGamePlayStart() and self.mFinishGameWaitTime <= 0 then
            g_GameData:C2S_LeaveGame()
        end
    else
        self.mAutoLeaveGameTime = GSystem.AutoExitRoom
    end
end

function M:onGameTurn(data)
    print("到达某人回合,座位号："..data.seatId.." 我的座位号："..self.mMySeatId)
    
    print("回合时间："..data.leftTime)
    self.mMySeatId = g_GameData:getMineSeatId()
    if self.mMySeatId == data.seatId and not g_GameData:isWatching() then
        SoundSystemManager:playSound0010()
        self:setIsCanSayPoint(true)
        self.mTimeSound=0
        self.mMyTurnTime=data.leftTime/1000
        self.mMyMaxTurnTime=data.leftTime/1000

        local startEffectId = GSystem.YourTurnAnimationId
        if startEffectId~=0 then
            local _effect = Utils.onlyCreateEffect(startEffectId,cc.p(0,0),false)
            if _effect then
                local size = self:getContentSize()
                _effect:setPosition(cc.p(size.width/2,size.height/2))
                self._rootNode:addChild(_effect)
            end
        end

        local CurrSeatInfo = g_GameData:getCurrSeatInfo()
        if CurrSeatInfo and CurrSeatInfo.seatId == g_GameData:getMineSeatId() then
            g_GameData:C2S_AutoCallUpdate(self.mDicePoint,self.mPointNum)
        end
    else
        SoundSystemManager:playSound0011()
        self:setIsCanSayPoint(false)

        local actualSeat = self:getActualSeat(data.seatId)
        local item = self.mSeatSTable[actualSeat]:getChildByTag(ITEM_TAG)
        if item then
            item:setTimePerent(data.leftTime)
            print("回合倒計時："..data.leftTime)
        end
    end
    --SoundSystemManager:playSound0010()
end

--获取显示椅子号
function M:getActualSeat(seat)
    return (seat+g_GameData.MAX_PLAYERS-self.mMySeatId)%g_GameData.MAX_PLAYERS+1
end

function M:refreshSayPointData()
    self.DesktopCallPoint:setVisible(true)
    local sayData = g_GameData:getCallInfo()
    if sayData.seatId < 0 or sayData.num<=0 or sayData.point<=0 then
        return
    end
    self.mSayMaxPoint=sayData.point
    self.mSayPointNum=sayData.num
    self.mNowSaySeat = sayData.seatId
    self.BottomInjectionText:setString(tostring(self.mSayPointNum))
    self.BottomInjectionImage:loadTexture("00_01_Common/2D_Small_" .. self.mSayMaxPoint ..".png", ccui.TextureResType.plistType)
    local players = g_GameData:getGamePlayers()

    local uiSeatId = players[self.mNowSaySeat]:getUiSeatId()
    local seatid = self:getActualSeat(uiSeatId)
    self.mIsHavePlayerSayPoint = true
    if seatid == 1 then
        self.mIsCanOpen = false
        if self.mMySeatItem then 
            self.mMySeatItem:openDiceHandle(0)
            if g_GameData:isFirstGaming() then
                self.mMySeatItem:ShowOpenUpEffect(false)
            end
        end
    else
        self.mIsCanOpen = true
        if g_GameData:isFirstGaming() and g_GameData:isGamePlaying() and not g_GameData:isWatching() and self.mMySeatItem then
            self.mMySeatItem:ShowOpenUpEffect(true)
        end
    end
    if sayData.seatId == self.mMySeatId and not g_GameData:isWatching() then
        self:myCallPoint(sayData.num,sayData.point)
        if self.mbeforeSayItem then
            self.mbeforeSayItem:setNotSay()
        end

        self.mbeforeSayItem=nil
    else
        self.OwnRightCallPoint:setVisible(false)
        local seatItem = self.mSeatSTable[seatid]:getChildByTag(ITEM_TAG)
        if seatItem then
            seatItem:setSay(self.mSayMaxPoint,self.mSayPointNum)
            if self.mbeforeSayItem then
                self.mbeforeSayItem:setNotSay()
            end

            self.mbeforeSayItem=seatItem
        end
    end
    
end

function M:myCallPoint(num,point)

    self.OwnRightCallPoint:setVisible(true)
    self.VerticesNum_0:setString(tostring(num))
    --self.VerticesText_0:setString(Utils.getFormatString(self.mVerticesText, tostring(num)))
    self.VerticesImage_0:loadTexture("00_01_Common/2D_Small_" .. point ..".png", ccui.TextureResType.plistType)
end

function M:onGameCallPoint(data)
    --self.mDicePoint = data.point
    --callInfo.point, callInfo.num
    local players = g_GameData:getGamePlayers()
    local sex = nil
    if players and players[data.seatId] and players[data.seatId]:getUserInfo() then
        sex = players[data.seatId]:getUserInfo():getSex()
    end
    
    g_GameData:playSayDian(data.num,data.point,sex)
    self.mIsHaveSomeSay = true
    if self.mMySeatItem then
        self.mMySeatItem:setIsCanReRoll(false)
    end
    --显示已叫
    if g_GameData:isOneCalled() then
        self.CalledBox_0:setVisible(true)
        self.mMySeatItem:reChkShowPointResult()
    end
    
    self:refreshSayPointData()
    self:refreshNowCanSelectNum()

    
end

function M:onGameDiceUpdate()
    print("onGameDiceUpdate")
    local _mySeatId = g_GameData:getMineSeatId()
    local _players = g_GameData:getGamePlayers()
    print("获取我的座位号：".._mySeatId)
    local seatData = _players[_mySeatId]
    self.mMySeatItem:showPointData(seatData:getDices(),false)

end

--凡是阻挡游戏层触摸事件的，需加此判断检测
function M:checkShowBoastList()
    local allChildren = self.mSeatSTable
    for _, v in ipairs(allChildren) do
        local item = v:getChildByTag(ITEM_TAG)
        if item then
            local child = item:getHeadListNode():getChildByName("UIBoastListLayer") 
            if child then 
                child:removeFromParent()
            end
        end
    end
end

function M:onGameTouchBegin(pos)
    self:checkShowBoastList()
    self.mTouchStartPos=cc.p(0,0)
    self.mIsOpeningHandle=false
    if not self.mIsCanOpen then return end
    local rangeStartx,rangeStarty = self.openRange:getPosition()
    local range = self.openRange:getContentSize()
    if pos.x>=rangeStartx and pos.x<=rangeStartx+range.width
    and pos.y>=rangeStarty and pos.y<=rangeStarty+range.height then
        print("点击start位置："..pos.x.." "..pos.y)
        self.mTouchStartPos = pos
        self.mIsOpeningHandle = true
    end

    return true
end

function M:onGameTouchMoved(pos)
    if not self.mIsCanOpen then return end
    local dicY = pos.y - self.mTouchStartPos.y
    if g_GameData:isGamePlaying() then
        if self.mMySeatItem and self.mIsOpeningHandle then
            self.mMySeatItem:openDiceHandle(dicY)
        end
    end
    
end

function M:onGameTouchEnded(pos)
    if not self.mIsCanOpen then return end
    local dicY = pos.y - self.mTouchStartPos.y
    print("点击end位置："..pos.x.." "..pos.y)
    if dicY > 50  then
        if g_GameData:isGamePlaying() and self.mIsOpeningHandle then
            self.mMySeatItem:open()
            self.mIsOpeningHandle= false
            self:setAutoLeaveRoom(false)
            return
        end
    end

    if g_GameData:isGamePlaying() then
        if self.mMySeatItem and self.mIsOpeningHandle then
            self.mMySeatItem:openDiceHandle(0)
        end
    end
end

--抢开失败
function M:onOpenErrorGoldNotEnough()
    UIUtils.popToadtByMessageId("52001")
    if self.mMySeatItem then
        self.mMySeatItem:openDiceHandle(0)
        if g_GameData:isFirstGaming() then
            self.mMySeatItem:ShowOpenUpEffect(false)
        end
    end
end

--有人开了
function M:onGameOpenDiceBox(data)
    local openSeatId = data.openSeatId
    local players = g_GameData:getGamePlayers()
    local sex = nil
    if players and players[openSeatId] and players[openSeatId]:getUserInfo() then
        sex = players[openSeatId]:getUserInfo():getSex()
    end

    if data.multiple>1 then
        g_GameData:qopenSound(sex)
    else
        g_GameData:openSound(sex)
    end
    self.mMyTurnTime = 0
    --self.mTimeMask:setPercentage(0)
    self.HeadShade:setVisible(false)
    self.mLeftTimeLabel:stopAllActions()
    for i,v in ipairs(self.mSeatSTable) do
        local item = self.mSeatSTable[i]:getChildByTag(ITEM_TAG)
        if item then
            item:setTimePerent(0)
        end
    end
    
    if data.multiple > 1 then
        self:qOpenEffect(data.multiple,self:getActualSeat(openSeatId))
    else
        if openSeatId == self.mMySeatId and not g_GameData:isWatching() then
            self:myCallOpen()
        else
            local seatid = self:getActualSeat(openSeatId)
            local seatItem = self.mSeatSTable[seatid]:getChildByTag(ITEM_TAG)
            if seatItem then
                seatItem:callOpen()
            end
        end
    end

    if g_GameData:isFirstGaming() and self.mMySeatItem then
        self.mMySeatItem:ShowOpenUpEffect(false)
    end
    
    self:setIsCanSayPoint(false)
    if self.mBackTimeSoundId~=0 then
        SoundSystemManager:stopSound("effect",self.mBackTimeSoundId)
        self.mBackTimeSoundId = 0 
    end

end

function  M:myCallOpen()
    self.OwnRightOpen:setVisible(true)
    self.OwnRightOpen:runAction(cc.Sequence:create(cc.ScaleTo:create(0.3,1.2)
    ,cc.ScaleTo:create(0.16,1)
    ))
end

--抢开动画
function M:qOpenEffect(multiple,seatEnd)
    local function getPos(seatId)
        local seatNode = self.mSeatSTable[seatId]
        if not seatNode then return nil,nil end
        --return seatNode:getPosition()
        return self.GrabAnimationNode:convertToNodeSpace(Utils.getNodeWordPosition(seatNode))
    end

    local startx,starty = self.GuessingShowNode:getPosition()
    local endx,endy = getPos(seatEnd)
    if startx == nil or endx == nil then return end

    local movetime = cc.pGetDistance(cc.p(startx,starty),cc.p(endx,endy))/1000--动画移动所需时间

    local _effectId = self:getTimesEffectId(GSystem.EarlyAnimationId,multiple)

    if _effectId ~= 0 then
        local _effect= Utils.onlyCreateEffect(_effectId,cc.p(0,0),false,false)
        if _effect then
            _effect:setName("qopeneffect")
            self.GrabAnimationNode:addChild(_effect)
            _effect:setPosition(cc.p(startx,starty))
            _effect:setScale(2)
            _effect:runAction(cc.Sequence:create(
                cc.ScaleTo:create(1,1)
                ,cc.Spawn:create(cc.MoveTo:create(movetime,cc.p(endx,endy)),cc.ScaleTo:create(movetime,0.5))
            ))
        end
    end
end

--竞猜
function M:onGameExtraCompare(leftTime)
    local players = g_GameData:getGamePlayers()
    self.mMySeatId = g_GameData:getMineSeatId()
    if not g_GameData:isWatching() and players[self.mMySeatId] and players[self.mMySeatId]:isGaming() then--如果本人在参与对局，则在竞猜开始时锁定金币数额的变动
        self.GoldRollNum:setVisible(true)
        self.GoldRollNum:setString(self.GoldNum:getString())
        self.GoldNum:setVisible(false)
    end

    self.ChatPanel:setVisible(true)

    --self.bIsLittleGuessingOpening
    local panel = UIManager:getOrCreatePanel("UIGuessingLayer")
    if panel then
        panel:setBackTime(leftTime)
        panel:setHandleCallback(handler(self,self.setAutoLeaveRoom))
        panel:setCloseCallBack(Utils.getNodeWordPosition(self.LittleGuessingBg),handler(self,self.setLittleGuessingShow))
        --竞猜时间结束时要关闭LittleGuessing
        self.LittleGuessingNum:setString("0")

        self:setLittleGuessingShow(self.bIsOpenGuessSizeLayer or self.bIsLittleGuessingOpening,false)
        panel:setIsNarrowAllNode(self.bIsOpenGuessSizeLayer or self.bIsLittleGuessingOpening)
        panel:showToScene()
    end
end

function M:onLittleGuessingTouchEvent(data)
    if data.event == "end" then
        self:setLittleGuessingShow(false,true)
        local panel = UIManager:getPanel("UIGuessingLayer")
        if panel then
            panel:reShowAllNode()
        end
    end
end

function M:setLittleGuessingShow(isShow,bSetLittleGuessingOpening)
    if bSetLittleGuessingOpening then 
        self.bIsLittleGuessingOpening = isShow
    end

    self.LittleGuessing:setVisible(isShow)
    self.LittleGuessingBg:setTouchEnabled(isShow)
    self.LittleGuessingSpineATNode:setVisible(isShow)
end

function M:onGameUpdateComparePool(data)
    self.LittleGuessingNum:setString(Utils.getFormatNumber_MuitiLanguage(tostring(data.goldNum)))
end

--离开
function M:onClickLeave(ref)
    self:checkShowBoastList()
    local players = g_GameData:getGamePlayers()
    self.mMySeatId = g_GameData:getMineSeatId()
    if g_GameData:isQuitMach() then

        Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_CansualMatchGame)

    else
        if self.mNeedLevelRoom  then
            self.mNeedLevelRoom = false
            self.State:setVisible(false)
            self.GamingWatchFrame:setVisible(false)
            self.GamingReturnFrame:setVisible(false)
        else
            if not g_GameData:isWatching() and players[self.mMySeatId] and players[self.mMySeatId]:isGaming() and (g_GameData:isGamePlayStart() or self.mFinishGameWaitTime > 0) then
                self.mNeedLevelRoom = true
                self.GamingReturnFrame:setVisible(true)
                self.GamingReturn:setVisible(true)
                self.mNeedStandUp = false
                self.GamingWatch:setVisible(false)
                self.GamingWatchFrame:setVisible(false)
                self.State:setVisible(true)
                UIUtils.popToadtByMessageId(Constant.Define.LevelGamePlayingFail)
            else
                g_GameData:C2S_LeaveGame()
            end
        end   
    end
end

--取消离开房间
function M:onClickCancelBtn(ref)
    self:checkShowBoastList()

    self.mNeedLevelRoom = false
    self.mNeedStandUp = false
    self.State:setVisible(false)
    self.GamingWatchFrame:setVisible(false)
    self.GamingReturnFrame:setVisible(false)
end

--玩家站起
function M:onClickWatch(ref)
    self:checkShowBoastList()
    if g_GameData:isWatching() then return end;

    local  personalInfo=g_GameData:getPersonalInfo()
    if  2==g_GameData:getRoomType() and  g_UserData:isSelfUserId(personalInfo.masterUid)  then
        return UIUtils.popToadtByMessageId(60040)
    end

    local players = g_GameData:getGamePlayers()
    self.mMySeatId = g_GameData:getMineSeatId()
    if not g_GameData:isQuitMach() then
        if self.mNeedStandUp then
            self.mNeedStandUp = false
            self.State:setVisible(false)
            self.GamingWatchFrame:setVisible(false)
            self.GamingReturnFrame:setVisible(false)
        else
            if players[self.mMySeatId] and players[self.mMySeatId]:isGaming() and (g_GameData:isGamePlayStart() or self.mFinishGameWaitTime > 0) then
                self.mNeedStandUp = true
                self.GamingWatchFrame:setVisible(true)
                self.GamingWatch:setVisible(true)
                self.mNeedLevelRoom = false
                self.GamingReturnFrame:setVisible(false)
                self.GamingReturn:setVisible(false)
                self.State:setVisible(true)
            else
                g_GameData:MSG_C2S_StandUp()
            end
        end   
    end
end

function M:onWatchStateTipTouchEvent(data)
    if data.event == "end" then
        local panel = UIManager:getOrCreatePanel("UIBoastPlayerListLayer")
        if panel then 
            panel:showToScene()
        end
    end
end

function M:onClickListButton(ref)
    self:checkShowBoastList()

    local panel = UIManager:getOrCreatePanel("UIBoastPlayerListLayer")
    if panel then 
        panel:showToScene()
    end
end

function M:onClickSittingBtn(ref)
    self:checkShowBoastList()

    local panel = UIManager:getOrCreatePanel("UISettingLayer")
    if panel then
        panel:showToScene()
    end
end

function M:onClickBagBtn(ref)
    self:checkShowBoastList()

    g_PackageData:requestGetBagList()
end

function M:OnBagListArrive()
    local panel = UIManager:getOrCreatePanel("UIPackageLayer")
    if panel then 
        panel:setTabIndex(Enum.PackageTab.DiceCup)
        panel:showToScene()
    end
end

--广播离开房间
function M:onGamePlayerLeave(data)
    local userId = data.userId
    local seatId = data.seatId
    local isAudience = data.isAudience

    self.mMySeatId = g_GameData:getMineSeatId()
    if g_UserData:isSelfUserId(userId) then
        --去大厅
       g_GameData:leaveRoom()
    else
        if not isAudience then
            local players = g_GameData:getGamePlayers()

            local uiSeatId = players[seatId]:getUiSeatId()
            local seat = self:getActualSeat(uiSeatId)

            self:setNonePlayerSeat(seat,seatId) -- 重构
        end
    end
end

--点击提出提高底注
function M:onClickSuggestUpResist()
    self:checkShowBoastList()

    if self:chkIsMaxRoomLv() then
        return
    end

    local rqustPanel = UIManager:createPanelOnly("app.gui.game.UILaunchUpVotaconfirm")
    if rqustPanel then
        self.BottomInjectionButton:setTouchEnabled(false)
        self.BottomInjectionButton:setBright(false)
        self:addChild(rqustPanel)
        rqustPanel:setHandleCallback(handler(self,self.requestIsUpVate))
        local betLevel = g_GameData:getBetLevel()
        rqustPanel:setNowBetLevel(betLevel)
    end
    SoundSystemManager:playSound003()
end

function M:chkIsMaxRoomLv()
    local maxlv = 0
    local _roomdata = DataManager:getTbxData("Room")
    for k,v in pairs(_roomdata) do
        if v.RoomLv > maxlv then
            maxlv = v.RoomLv
        end
    end

    if maxlv == g_GameData:getBetLevel() then
        local textData = DataManager:getTbxData("Text", Enum.Text.StakeGold)
        if textData then
            UIUtils.popToast(textData.Desc)
        end
        return true
    end
   
    return false
end

function M:requestIsUpVate(value)
    self.BottomInjectionButton:setTouchEnabled(true)
    self.BottomInjectionButton:setBright(true)
    if value then
        g_GameData:MSG_C2S_LaunchVote()
    end
end

--底注提升通知
function M:onGameLaunchVote(data)
    local leftTime = data.leftTime
    local seatId = data.seatId
    local betBase = data.betBase
    self.lanuchBetBase=betBase

    self.mMySeatId = g_GameData:getMineSeatId()
    if self.mMySeatId == seatId then return end
    self.mRqustPanel = UIManager:createPanelOnly("app.gui.game.UIUpBetNotice")
    if self.mRqustPanel then
        self.ReplaceBottomInjection:addChild(self.mRqustPanel)
        self.mRqustPanel:setBaseData(seatId,betBase,leftTime)
        self.mRqustPanel:setHandleCallback(handler(self,self.yesOrNoUpBetLevel))
        SoundSystemManager:playSound024()
    end

end

function M:yesOrNoUpBetLevel(value)
    g_GameData:MSG_C2S_Vote(value)
    local isRemove=true
    if value and g_UserData:getGold()<self.lanuchBetBase  then
        isRemove=false
    end

    if self.mRqustPanel and isRemove then
        self.mRqustPanel:removeFromParent()
        self.mRqustPanel=nil
    end
end

function M:onGameSomeoneVote(data)
    local seatid = data.seatId

    local nowseatId = self:getActualSeat(seatid)
    print("seatid:"..seatid.." nowseatId:"..nowseatId)
    local seatItem = self.mSeatSTable[nowseatId]:getChildByTag(ITEM_TAG)
    if seatItem then
        seatItem:setUpBetVoteResult(data.accept)
    end

    if seatid == self.mMySeatId and not g_GameData:isWatching() then
        self:setUpBetVoteResult(data.accept)
    end
end

function M:setUpBetVoteResult(value)
    self.ReplaceBottomInjectionState:setVisible(true)
    if value then
        self.ReplaceBottomInjectionState:loadTexture("02_01_Boast/button_017.png", ccui.TextureResType.plistType)
    else
        self.ReplaceBottomInjectionState:loadTexture("02_01_Boast/button_012.png", ccui.TextureResType.plistType)
    end
end

function M:unShowALLUpBetImg()
    self.ReplaceBottomInjectionState:setVisible(false)
    for _,v in pairs(self.mSeatSTable) do
        local item = v:getChildByTag(ITEM_TAG)
        if item then
            item:unShowUpBetImg()
        end
    end
end

--底注提升结束
function M:onGameBetBaseUpdateSeccess(data)
    local isSeccess = data.shouldLevelUp
    
    if  2==g_GameData:getRoomType()  then
        self.mTipUpBetBasePanel = UIManager:createPanelOnly("app.gui.game.UIUpdateBetBaseSeccess")
        if self.mTipUpBetBasePanel then
            self.BottomInjectionTips:addChild(self.mTipUpBetBasePanel)
            local bet  =  data.nextBetBase
            self.mTipUpBetBasePanel:setBetNumber(bet)
            self.mTipUpBetBasePanel:privateShowText()
            self:runAction(cc.Sequence:create(cc.DelayTime:create(1.5), cc.CallFunc:create(function()
                self:unShowALLUpBetImg()
                self.mTipUpBetBasePanel=nil
                self.BottomInjectionTips:removeAllChildren()
            end)))
        end

        local nextBetBaseLevel = data.nextBetBaseLevel
        local nextBetBase=data.nextBetBase
        g_GameData:updateRoomConfigId(nextBetBase)
        g_GameData:setBetLevel(nextBetBaseLevel)
        if not g_GameData:isGamePlaying() then
            g_GameData:setBetBase(nextBetBase)
            self:initRoomData(nextBetBase)
        end

        return
    elseif g_GameData:isWatching() then
        if isSeccess then
            g_GameData:setmNeedShowUpbet(true)
            g_GameData:setmUpbet(data.nextBetBase)
        end
        return
    end

    if isSeccess then
        self.mTipUpBetBasePanel = UIManager:createPanelOnly("app.gui.game.UIUpdateBetBaseSeccess")
        if self.mTipUpBetBasePanel then
            self.BottomInjectionTips:addChild(self.mTipUpBetBasePanel)
            local bet  =  data.nextBetBase
            self.mTipUpBetBasePanel:setBetNumber(bet)
            
            self:runAction(cc.Sequence:create(cc.DelayTime:create(1.5), cc.CallFunc:create(function()
                self:unShowALLUpBetImg()
                self.mTipUpBetBasePanel=nil
                self.BottomInjectionTips:removeAllChildren()
            end)))
        end
    else
        self.mTipUpBetBasePanel = UIManager:createPanelOnly("app.gui.game.UIUpdateBetBasefail")
        if self.mTipUpBetBasePanel then
            self.BottomInjectionTips:addChild(self.mTipUpBetBasePanel)
            self:runAction(cc.Sequence:create(cc.DelayTime:create(1.5), cc.CallFunc:create(function()
                self:unShowALLUpBetImg()
                self.mTipUpBetBasePanel=nil
                self.BottomInjectionTips:removeAllChildren()
            end)))
        end
    end
end

function M:onGamePlayerGoldChange(data)
    local seatid = data.seatid
    local actualSeat = self:getActualSeat(seatid)
    local item = self.mSeatSTable[actualSeat]
    local players = g_GameData:getGamePlayers()
    self.mMySeatId = g_GameData:getMineSeatId()
    if seatid == self.mMySeatId and not g_GameData:isWatching() then
        --self:refrashOneselfData()
        self.GoldNum:setString(Utils.getFormatNumber_MuitiLanguage(g_UserData:getGold()))
        self.GoldRollNum:setString(Utils.getFormatNumber_MuitiLanguage(g_UserData:getGold()))
    end
    local player = players[seatid]
    if player and not player:isEmptySeat() and item:getChildByTag(ITEM_TAG) and not item.isRemove then
        item:getChildByTag(ITEM_TAG):refreshData(player)
    end
end

function M:onGameReshakeDiceBox(data)
    local list = data.list
    local rerollActualSeat = self:getActualSeat(data.seatId)
    local players = g_GameData:getGamePlayers()
    print("实际座位位置："..rerollActualSeat)
    local _reRollItem = self.mSeatSTable[rerollActualSeat]:getChildByTag(ITEM_TAG)
    self.mMySeatId = g_GameData:getMineSeatId()
    local flydata={}
    
    for _,playerdata in ipairs(list)do
        if playerdata.seatId == data.seatId then
            print("goldChange:"..tostring(playerdatagoldChange))
            local rerollper = math.floor(-playerdata.goldChange/g_GameData:getBetBase()*100)
            local rerollconfig = DataManager:getTbxData("ReRollCost","BoastModeCostGoldRatio",rerollper)

            local flygoldconfig =DataManager:getTbxData("FlyGold","FlyGoldType",1)
            for i,v in ipairs(flygoldconfig) do
                if v.FlyGoldValue == rerollconfig[1].ReRollTimes then
                    flydata = v
                    break
                end
            end
        end
    end

    for _,v in ipairs(list)do
        local player = players[v.seatId]
        if not player:isEmptySeat() and player:isGaming() then
            if v.seatId == data.seatId then
                if _reRollItem then
                    _reRollItem:shakeSieveCup()
                end
        
                local goldchgtime= GSystem.RollWordExtraTime or 0.5
                goldchgtime = goldchgtime + flydata.FlyGoldInterval/1000

                if v.seatId ==self.mMySeatId and not g_GameData:isWatching() then
                    self:myPopNumber(v.goldChange,v.goldAfter,goldchgtime)
                else
                    _reRollItem:PopNumber(v.goldChange,v.goldAfter,goldchgtime)
                end
            else
                local _seatid = self:getActualSeat(v.seatId)
                if rerollActualSeat ~= _seatid then
                    local reRollItem = self.mSeatSTable[_seatid]:getChildByTag(ITEM_TAG)
                    if reRollItem then
                        print("金币从："..rerollActualSeat.." 飞向：".._seatid)
                        self:newgoldFlyFromWhereToSeat(rerollActualSeat,_seatid,v.goldChange,v.goldAfter,flydata)
                    end
                end
            end
        end
    end
end

function M:onGameMachStateChange(data)
    if self.mMySeatItem then
        self.mMySeatItem:initMatchGame()
    end
    
    if self.mReadyLayer == nil then
        self.mReadyLayer = UIManager:createPanelOnly("app.gui.game.UIGameReady")
        if self.mReadyLayer then
            self:addChild(self.mReadyLayer)
            self.mReadyLayer:refreshEffect()
        end
    end

    if self.mRqustPanel then
        self.mRqustPanel:removeFromParent()
        self.mRqustPanel=nil
        self:unShowALLUpBetImg()
    end
end

function M:onTouchHeadEvent(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        self:checkShowBoastList()
        local panel = UIManager:getOrCreatePanel("UIPersonalInfoLayer")
        if panel then
            panel:showToScene()
        end
    end
end

function M:requestShopDiamond()
    self.mDefault_Store_Tab = Enum.ShopShowType.Diamond
    g_StoreData:requestShopList()
end

function M:onGoldStoreTouchEvent(data)
    if data.event == "end" then 
        self:checkShowBoastList()
        SoundSystemManager:playSound004()
        local scaleToStart = cc.ScaleTo:create(0.05, 0.9)
        local scaleToEnd = cc.ScaleTo:create(0.05, 1.0)
        self.GoldButton:runAction(cc.Sequence:create(scaleToStart, scaleToEnd, cc.CallFunc:create(
            function ()
                self.mDefault_Store_Tab = Enum.ShopShowType.Gold
                g_StoreData:requestShopList()
            end
        )))
    end
end

function M:onShopListArrive(data)
    local panel = UIManager:getOrCreatePanel("UIStoreLayer")
    if panel then
        panel:initData(data)
        panel:setTabIndex(self.mDefault_Store_Tab)
        panel:showToScene()
    end
end

function M:onTouchRoomChatEvent(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        self:checkShowBoastList()
        local panel = UIManager:getOrCreatePanel("UIRoomChatLayer")
        if panel then
            if panel:isSleepIng() then
                panel:active()
            else
                panel:resetRootNodeAnchorPoint(cc.p(0, 0))
                local posX = self.ChatNode:getPositionX()
                local posY = self.ChatNode:getPositionY()
                panel:resetRootNodePosition(cc.p(posX, posY))
                panel:showToScene()
                panel:setChannelID(Enum.ChatChannel.room)
            end
        end
    end
end

function M:setMicIsOpen(isOpen,needSetMicOpened)
    --print("11111111111111111111111111111111111111111111111111111")
    if isOpen then
        if g_GameData:isWatching() then
            UIUtils.popToadtByMessageId(Constant.Define.WatherCantOpenMic)
            return
        end

        if not self.bIsInAudioRoom then
            kz.IAgoraRoomManager:instance():joinRoom("",tostring(g_GameData:getGameId()),tostring(g_UserData:getUserId()),g_UserData:getUserId())
            UIUtils.popToadtByMessageId(Constant.Define.UnJoinAudioRoom)
            --UIUtils.popToast("尚未进入语音房间,无法开启麦克风")
            return
        end

        if DeviceUtils.isAndroid() then
            if not g_GameData:AudioPerissimIsOpen() then
                self.mClickOpenAudioFail = true
                g_GameData:getRequestAppPermission()
                
                return 
            end
        elseif DeviceUtils.isIOS() then
            local iosVioce = g_GameData:getIosVoidPermission()
            print("--------------iosVioce:"..iosVioce)
            if iosVioce == 1 or iosVioce == 2 then
                self:TipPlayerOpenAudio()
                return
            end
        end
    end
    if kz.IAgoraRoomManager:instance():enableLocalAudio(isOpen)>=0 then
        g_GameData:setAudioIsEnable(isOpen)
        self.MicButton:setBright(isOpen)
        if needSetMicOpened then
            g_GameSettingData:setIsMicOpened(isOpen)
            g_GameSettingData:saveSettingDataToLocal()
        end
        if isOpen then
            self.mClickOpenAudioFail = false
            print("she zhi cheng gong  da kai")
        else
            print("she zhi cheng gong  guan bi")
        end
    end
end
--麦克风
function M:onClickSayWordBtn(ref)
    --UIUtils.popToast("暂未开放")
    self:setMicIsOpen(not g_GameData:getAudioIsEnable(),true)
end

--听筒
function M:onClickListenWordBtn(ref)
    if g_GameData:getAudioIsSound() then
        if kz.IAgoraRoomManager:instance():muteAllRemoteAudioStreams(false)>=0 then
            print("she zhi cheng gong  guan bi")
            g_GameData:setAudioIsSound(false)
            self.VoiceButon:setBright(false)
        end
    else
        if kz.IAgoraRoomManager:instance():muteAllRemoteAudioStreams(true)>=0 then
            print("she zhi cheng gong  da kai")
            g_GameData:setAudioIsSound(true)
            self.VoiceButon:setBright(true)
            for k, v in pairs(g_GameData:getChuiniuMuteList()) do
                kz.IAgoraRoomManager:instance():muteRemoteAudioStream(tonumber(v),true)
                DataManager:dispatchMessage(Constant.CustomEvent.refreshChuiniuMuteList)
            end
        end
    end
end

function M:TipPlayerOpenAudio()
    UIUtils.popToadtByMessageId(Constant.Define.MicrophonePermissionsNotOpen)
end

function M:SeccessOpenAudio()
    if self.mClickOpenAudioFail then
        self:setMicIsOpen(true,true)
    end
end

function M:onPlayerJoinRoomSeccess(uid)
    self.bIsInAudioRoom = true
    
    if not g_GameData:isWatching() then
        self:setMicIsOpen(g_GameSettingData:getIsMicOpened(),false)
    end
    if g_GameData:getAudioIsSound() then
        if kz.IAgoraRoomManager:instance():muteAllRemoteAudioStreams(true) then
            self.VoiceButon:setBright(true)
            for k, v in pairs(g_GameData:getChuiniuMuteList()) do
                kz.IAgoraRoomManager:instance():muteRemoteAudioStream(tonumber(v),true)
                DataManager:dispatchMessage(Constant.CustomEvent.refreshChuiniuMuteList)
            end
        end
    else
        if kz.IAgoraRoomManager:instance():muteAllRemoteAudioStreams(false) then
            self.VoiceButon:setBright(false)
        end
    end
    g_GameData:setmUserstatus(Enum.Userstatus.ChuiniuGaing)
end

--动态更新麦克风音量进度条
function M:onUpdateMicLoadingBar(dt)
    if self.mMicVolumeChgTime and self.mMicVolumeChgTime > 0 then
        self.mMicVolumeChgTime = self.mMicVolumeChgTime - dt
        if self.mMicVolumeChgTime <= 0 then
            self.mMicVolumeChgTime = 0
            self.mPerPlayerMicVolume = 0 
            self.MicLoadingBar:setPercent(0)
        else
            local delaytime = 0.4-self.mMicVolumeChgTime
            local coefficient = (1/3.901)*(math.sin(math.pi*(5*delaytime-1/2))+math.sin(math.pi*((20/7)*delaytime-1/2))+2)--定义域[0，1]时,对应值域[0,1]
            local per = self.mPerPlayerMicVolume + (self.mCurPlayerMicVolume - self.mPerPlayerMicVolume) *coefficient
            per = per > 100 and 100 or per
            self.MicLoadingBar:setPercent(per)
        end
    end

end

function M:onPlayerSayAgoraMessageChange(data)
    print("onPlayerSayAgoraMessageChange")
    if not Utils.isEmptyTable(data) then
        --self.mBgVolumeChgTime = 0.4
        --SoundSystemManager:setVolumeCoefficient(0.15)
        for _,v in ipairs(data) do
            if v.uid == 0 then
                self.mMicVolumeChgTime = 0.4
                self.mPerPlayerMicVolume = self.MicLoadingBar:getPercent()
                self.mCurPlayerMicVolume = v.volume/2.55
            else
                self:setOhtersMicVolume(v)
            end
        end
        SoundSystemManager:setBackMusicVolumeByPercent(0.5)
        self.mNeedUpBackMusic = false
        self.mNeedUpBackMusicTimes = 1 * 60
    end
end

function M:setOhtersMicVolume(data)
    local allchailds = self.mSeatSTable
    for i, v in ipairs(allchailds) do
        local item = v:getChildByTag(ITEM_TAG)
        if item then
            if tostring(data.uid) == item:getPlayerUid() then
                item:setMicVolume(data.volume)
            end
        end
    end
end

function M:findFriendByUid(friendUid)
    local arr=self.AddFriendsPopUpNode:getChildren()
    for _,v in ipairs(arr) do
        local name=v:getName()
        if tostring(friendUid)==name then
            return v
        end
    end

    return nil
end

function M:requestAddFriend(data)
    local friendRequestList=g_FriendData:getFriendRequestData()
    if #friendRequestList<=0 then return end

    if data and data.friendUid then
        local v=g_FriendData:getFriendRequestDataByUid(data.friendUid)
        if v and not self:findFriendByUid(data.friendUid) then
            local layer=UIManager:createPanelOnly("MainAddFriendsPopUp")
            self.AddFriendsPopUpNode:addChild(layer)
            layer:refreshUI(v)
            layer:playEnteryAction()
            layer:setName(tostring(data.friendUid))

            local num=self.AddFriendsPopUpNode:getChildrenCount()
            layer:setTag(num+1)
            self.AddFriendsPopUpNode:setTag(num+1)
        end
    else
        self.AddFriendsPopUpNode:removeAllChildren()
        for _,v in ipairs(friendRequestList) do
            local layer=UIManager:createPanelOnly("MainAddFriendsPopUp")
            self.AddFriendsPopUpNode:addChild(layer)
            layer:refreshUI(v)
            layer:playEnteryAction()
            layer:setName(tostring(v.uid))
            
            local num=self.AddFriendsPopUpNode:getChildrenCount()
            layer:setTag(num+1)
            self.AddFriendsPopUpNode:setTag(num+1)
        end
    end
end

function M:requestRemoveFriend(data)
    local   friendUid=data.friendUid
    local   v=self:findFriendByUid(friendUid)
    if v then
        v:playExitAction()
    end
end

function M:mainReBindAllNode()
    local arr=self.AddFriendsPopUpNode:getChildren()
    for _,v in ipairs(arr) do
        v:reBindingAllNode()
    end
end

--显示魔法表情页面
function M:showUIMagicEmojiPopUp(playerdata,worldPos)
    local panel = UIManager:getOrCreatePanel("UIMagicEmojiPopUp")
    if panel then
        panel:setPlayerData(playerdata,worldPos)
        panel:showToScene()
    end
end

--根据目标UI椅子号获取观众头像显示区域（对角原则）
function M:getRandomIdx(actualToSeatId)
    if actualToSeatId == 1 then
        return math.random(3,4)
    elseif actualToSeatId < g_GameData.MAX_PLAYERS/4+1 then
        return 4
    elseif actualToSeatId == g_GameData.MAX_PLAYERS/4+1 then
        return math.random(2,4)
    elseif actualToSeatId < g_GameData.MAX_PLAYERS/2+1 then
        return 2
    elseif actualToSeatId == g_GameData.MAX_PLAYERS/2+1 then
        return math.random(1,2)
    elseif actualToSeatId < g_GameData.MAX_PLAYERS*3/4+1 then
        return 1
    elseif actualToSeatId == g_GameData.MAX_PLAYERS*3/4+1 then
        return math.random(1,3)
    else
        return 3
    end
end
--收到魔法表情消息
function M:onGameMagicEmoji(data)
    local fromUid = data.fromUid
    local fromSeatId = g_GameData:getSeatIdByUid(fromUid)
    local toSeatId = g_GameData:getSeatIdByUid(data.toUid)
    local itemId = data.itemId
    local startpos,endpos
    local zOrder
    local headinfo

    local item = DataManager:getTbxData("Item",itemId)
    if nil==item then
        return
    end

    local ismesend = g_UserData:isSelfUserId(fromUid)
   
    --test
    -- fromSeatId = -1
    -- ismesend = false

    if UIManager:isPanelOpenOrOpening("UIMagicEmojiPopUp") then
        local panel = UIManager:getPanel("UIMagicEmojiPopUp")
        if panel then
            if ismesend then
                startpos = panel:getMagicEmojiPosition(itemId)
                --zOrder =panel:getLocalZOrder()+1--本人发送魔法表情动画显示在魔法表情页面的上层
            else
                --zOrder =panel:getLocalZOrder()-1--其他魔法表情动画显示在魔法表情页面的下层
            end
        end
    end
    
    --根据UI椅子号获取目标坐标
    local function getPos(seatId)
        if seatId == 1 and not g_GameData:isWatching() then --自己
            return Utils.getNodeWordPosition(self.HeadPanel)
        else
            local seatNode = self.mSeatSTable[seatId]
            if not seatNode then return 0,0 end
            local item = seatNode:getChildByTag(ITEM_TAG)
            local posx,posy = seatNode:getPosition()
            if item then
                local itwmwordpos = item:getHeadWorldPosition()--获取头像世界坐标
                --local localPos = self.MagicRouteNode:convertToNodeSpace(itwmwordpos)--世界坐标转以self为参考系的本地坐标
                posx = itwmwordpos.x
                posy = itwmwordpos.y
            end
            return posx,posy
        end
    end

    --从玩家头像处发出的魔法表情动画全部播完则移除头像
    local function chkRemoveHead()
        if headinfo then
            if headinfo.num <= 1 then
                local panelsize = self.mEmojiPanelList[headinfo.idx]:getContentSize()
                local panelpos = cc.p(self.mEmojiPanelList[headinfo.idx]:getPosition())
                local startposy = headinfo.head:getPositionY()
                local removepos = cc.p(0,startposy)
                if headinfo.idx%2==1 then
                    removepos.x = panelsize.width/2-panelpos.x-48
                else
                    removepos.x = 48 + self:getContentSize().width-panelpos.x+panelsize.width/2
                end
                headinfo.head:runAction(cc.Sequence:create(cc.EaseBackIn:create(cc.MoveTo:create(0.5,removepos))
                                        ,cc.CallFunc:create(function ()
                                            headinfo.head:removeFromParent()
                                            self.mEmojiHeadInfo[fromUid] = nil
                                        end)
                ))
            else
                headinfo.num = headinfo.num - 1
            end
        end
    end

    --发送魔法表情
    local function SendMagicEmoji()
        local panel
        if ismesend then--本人发出的表情动画层级在魔法表情页面上方，他人的在下方
            panel = UIManager:getOrCreatePanel("UIBoastMagicyFlyLayer_1")
        else
            panel = UIManager:getOrCreatePanel("UIBoastMagicyFlyLayer_2")
        end

        if panel then
            panel:showToScene()
        end

        local flytime = GSystem.MagicEmojiFlyingTime or 0.5

        for i=1,item.MagicEmojiItemNum do
            local sprite = cc.Sprite:createWithSpriteFrameName(Utils.getIconStr(PlistConfig.Icon.MagicEmoji,item.ItemIcon))
            if sprite and panel then
                panel:addChild(sprite)
                startpos = panel:convertToNodeSpace(startpos)
                endpos= panel:convertToNodeSpace(endpos)
                --self.MagicRouteNode:addChild(sprite)
                if zOrder then
                    sprite:setLocalZOrder(zOrder)
                end

                local function startfunc()
                    SoundSystemManager:playEffect("music/02sound/"..GSystem.MagicEmojiFlyingSound..".mp3",false)
                end
                local function endfunc()
                    if i==1 then 
                        --播放魔法表情动画和音效
                        local _effect= Utils.onlyCreateEffect(item.AnimationId,cc.p(0,0),false,true,chkRemoveHead)
                        if _effect then
                            _effect:setPosition(endpos)
                            panel:addChild(_effect)
                            --self.MagicRouteNode:addChild(_effect)
                            if item.SoundEffect and item.SoundEffect ~= "" then
                                SoundSystemManager:playEffect("music/02sound/"..item.SoundEffect..".mp3",false)
                            end
                        end
                    elseif item.MagicEmojiAnimationNum>1 then
                        if headinfo then--个别表情动画要播多次，每一次都要计数
                            headinfo.num = headinfo.num + 1
                        end
                        local _effect= Utils.onlyCreateEffect(item.AnimationId,cc.p(0,0),false,true,chkRemoveHead)
                        if _effect then
                            _effect:setPosition(endpos)
                            panel:addChild(_effect)
                            --self.MagicRouteNode:addChild(_effect)
                        end
                    end
                    sprite:removeFromParent()
                end
    
                local dx = 0
                local dy = 0
                local act = {}

                if itemId == 106012 then--高级鸡蛋初始3个一组堆叠出现
                    if i<4 then
                        dy = 24
                    elseif i<7 then
                        dx = -24
                    elseif i<10 then
                        dx = 24
                    else
                        dy = -24
                    end
                    sprite:setPosition(cc.p(startpos.x+dx,startpos.y+dy))
                    act[#act+1] = cc.MoveBy:create(0.3,cc.p(0,40))
                else
                    sprite:setPosition(startpos)
                end
    
                act[#act+1] = cc.DelayTime:create(item.MagicEmojiAnimationIntervalTime*(i-1)/1000)--item.MagicEmojiAnimationIntervalTime*i/1000
    
                if i==1 and item.IsMagicEmojiPlayFlyingSound then
                    act[#act+1] = cc.CallFunc:create(startfunc)
                end
                
                act[#act+1] =  cc.EaseSineIn:create(cc.MoveTo:create(flytime, endpos))
                act[#act+1] = cc.CallFunc:create(endfunc)    
    
                sprite:runAction(cc.Sequence:create(act))
            end
        end
    end

    endpos = cc.p(getPos(self:getActualSeat(toSeatId)))
    if startpos == nil then
        if fromSeatId == -1 then--观众发的魔法表情
            headinfo = self.mEmojiHeadInfo[fromUid]
            if headinfo then--头像存在则不重新创建
                headinfo.num = headinfo.num + 1
                startpos = Utils.getNodeWordPosition(headinfo.head)
            else--随机区域生成玩家头像，从头像位置发出魔法表情
                local panelidx = self:getRandomIdx(self:getActualSeat(toSeatId))
                local panelsize = self.mEmojiPanelList[panelidx]:getContentSize()
                local panelpos = cc.p(self.mEmojiPanelList[panelidx]:getPosition())
                local randompos = cc.p(math.random(0,panelsize.width), math.random(0,panelsize.height))

                local magichead = require("app.gui.game.UIGuessingHeadCell").new()
                local userinfo = g_GameData:getAudienceDataByUid(fromUid)
                magichead:setHeadScale(0.8)
                magichead:resetCenterPosition()
                if magichead:initData(userinfo) then
                    local flystartpos = cc.p(0,randompos.y)
                    if panelidx%2==1 then
                        flystartpos.x = panelsize.width/2-panelpos.x-48
                    else
                        flystartpos.x = 48 + self:getContentSize().width-panelpos.x+panelsize.width/2
                    end
                    self.mEmojiPanelList[panelidx]:addChild(magichead)
                    magichead:setPosition(flystartpos)
                    headinfo = {num = 1,head = magichead,idx = panelidx}
                    self.mEmojiHeadInfo[fromUid] = headinfo

                    magichead:runAction(cc.Sequence:create(cc.EaseBackOut:create(cc.MoveTo:create(0.5,randompos))
                                        ,cc.CallFunc:create(function ()
                                            startpos = Utils.getNodeWordPosition(magichead)--坐标系转换
                                            SendMagicEmoji()
                                        end)
                    ))
                end
                return
            end
        else
            startpos = cc.p(getPos(self:getActualSeat(fromSeatId)))
        end
    end

    SendMagicEmoji()
end

function M:UIGameLayer_s2cBigSmallStateInfo()
    if g_GameData:isGuessEggIng() then
        local data=g_GameData:getGuessLuckData()
        if data and g_UserData:isSelfUserId(data.uid) then
            
        else
            self.mGuessLayer:setVisible(false)
            self.mBankerGuessLayer:setVisible(false)
            DataManager:dispatchMessage(Constant.CustomEvent.OnCloseGuessSizeLayer, {})
        end
    else
        self:openGuessSizeLayer()
    end
end

function M:openGuessSizeLayer()
    if not g_GameData:isWatching() and self.mGuessLayer then return end

    self.bIsOpenGuessSizeLayer = true

    local bankerData=g_GameData:getGuessBankerData()
    if g_UserData:isSelfUserId(bankerData.uid) and g_GameData:isGuessSizeIng() then
        self.mGuessLayer:setVisible(false)
        self.mBankerGuessLayer:setVisible(true)
        self.mBankerGuessLayer:playAction(1)
    else
        self.mGuessLayer:setVisible(true)
        self.mBankerGuessLayer:setVisible(false)
        self.mGuessLayer:playAction(1)
    end
end

function M:UIGameLayer_s2cBigSmallBankerInfo()
    self:openGuessSizeLayer()
end

function M:UIGameLayer_GuessSizeHintNode(data)
    local leaveType=data.leaveType--1游戏结束  2; //主动站起  3; //金币不足  4; //抢庄
    if Enum.BankerLeave.Farmer==leaveType and (not self.mBankerGuessLayer:isVisible()) and (not self.mGuessLayer:isVisible()) then
        self.GuessSizeHintNode:removeAllChildren()
        local panel=UIManager:createPanelOnly("MainGuessSizeHintCell")
        if panel then
            panel:refreshUI(leaveType)
            self.GuessSizeHintNode:addChild(panel)
        end
    elseif Enum.BankerLeave.Off~=leaveType then
        local panel=UIManager:getOrCreatePanel("UIGuessSizeMiniTipPopUp_1")
        if panel then
            panel:showToScene()
            panel:refreshUI(leaveType)
        end
    end
end

function M:playSmashEgg(data,_parent,removeParent)
    local player=data.player
    local gold=data.gold

    self.mSmashEggCell:playClick()
    local pos=self.mSmashEggCell:getWorldPosition()

    local Item=DataManager:getTbxData("Item",GSystem.ThrowEggEggAnimationId)
    local netData = {}
    netData.itemShowType = Item.ItemType
    netData.itemId = Item.ItemId
    netData.itemNum = 0
    
    local itemInfo = require("app.bean.ItemInfo").new(netData, Item.ItemType)
    local item = UIManager:createPanelOnly("UIItem")
    item:setItemInfo(itemInfo)
    item:setPropFrameVisible(false)
    item:resetCenterPosition()
    _parent:addChild(item)

    local nodePos=item:convertToNodeSpaceAR(pos)
    nodePos.x=nodePos.x+80
    nodePos.y=nodePos.y+80
    item:runAction(cc.Sequence:create(cc.MoveTo:create(0.2,nodePos),cc.CallFunc:create(function()
        self.mSmashEggCell:playHeadAnimation()
        if g_UserData:isSelfUserId(player.uid) and gold>0 then
            self.mSmashEggCell:playGoldAniamtion(gold)
        end
        item:setVisible(false)
    end),cc.DelayTime:create(0.5),cc.CallFunc:create(function() 
        self.mSmashEggCell:playNormalAnimation()
        if removeParent then
            self.mEggHeadInfo[_parent:getTag()]=nil
            _parent:removeFromParent()
        else
            item:removeFromParent()
        end
    end)))
end

function M:UIGameLayer_s2cBigSmallRobResult(data)
    local player=data.player
    local gold=data.gold
    if g_UserData:isSelfUserId(player.uid) then
        self:playSmashEgg(data,self.HeadIcon)
    else
        --遍历参战者
        local fromSeatId = g_GameData:getSeatIdByUid(player.uid)-1
        --fromSeatId=3
        if fromSeatId>=0 then
            self:playSmashEgg(data,self["playerNode_"..fromSeatId])
            return
        end
        --遍历观战者
        local panelidx = math.random(1,2)
        local panelsize = self.mEmojiPanelList[panelidx]:getContentSize()
        local panelpos = cc.p(self.mEmojiPanelList[panelidx]:getPosition())
        local randompos = cc.p(math.random(0,panelsize.width), math.random(0,panelsize.height))
        if self.mEggHeadInfo[panelidx] then
            local magichead = self.mEggHeadInfo[panelidx]
            local userinfo = g_GameData:getAudienceDataByUid(player.uid)
            if userinfo and magichead:initData(userinfo) then
                self:playSmashEgg(data,magichead,true)
            end
        else
            local magichead = require("app.gui.game.UIGuessingHeadCell").new()
            local userinfo = g_GameData:getAudienceDataByUid(player.uid)
            if not userinfo then return end

            magichead:setHeadScale(0.8)
            magichead:resetCenterPosition()
            magichead:setTag(panelidx)
            if magichead:initData(userinfo) then
                local flystartpos = cc.p(0,randompos.y)
                if panelidx%2==1 then
                    flystartpos.x = panelsize.width/2-panelpos.x-48
                else
                    flystartpos.x = 48 + self:getContentSize().width-panelpos.x+panelsize.width/2
                end
                self.mEmojiPanelList[panelidx]:addChild(magichead)
                self.mEggHeadInfo[panelidx]=magichead

                magichead:setPosition(flystartpos)
                magichead:runAction(cc.Sequence:create(cc.EaseBackOut:create(cc.MoveTo:create(0.5,randompos))
                                    ,cc.CallFunc:create(function ()
                                        self:playSmashEgg(data,magichead,true)
                                    end)
                ))
            end
        end
    end
end

function M:UIGameLayer_updateLuckPlayer(ret)
    local is=ret.is
    if is and self.mSmashEggCell then
        self.mSmashEggCell:runAction(cc.Hide:create())
        return
    end

    local data={}
    data.gold=g_GameData:getGuessGoldData()
    data.player=g_GameData:getGuessLuckData()

    local panel=UIManager:createPanelOnly("SmashEggCell")
    if panel then
        self.SmashEggNode:removeAllChildren()
        self.SmashEggNode:addChild(panel)
        panel:resetCenterPosition()
        panel:refreshUI(data)

        self.mSmashEggCell=panel
    end
end

function M:UpdateDicBox(data)
    local rerollActualSeat = self:getActualSeat(data.seatId)
    if self.mSeatSTable[rerollActualSeat] == nil or data==nil then
        return
    end

    local item = self.mSeatSTable[rerollActualSeat]:getChildByTag(ITEM_TAG)
    if item then
        item:initDiceBox(data.diceBox)
    end
end

function M:OnSitDown()
    if g_GameData:getmNeedShowUpbet() then
        self.mTipUpBetBasePanel = UIManager:createPanelOnly("app.gui.game.UIUpdateBetBaseSeccess")
        if self.mTipUpBetBasePanel then
            self.BottomInjectionTips:addChild(self.mTipUpBetBasePanel)
            local bet  =  g_GameData:getmUpbet()
            self.mTipUpBetBasePanel:setBetNumber(bet)
            self:runAction(cc.Sequence:create(cc.DelayTime:create(1.5), cc.CallFunc:create(function()
                self.mTipUpBetBasePanel=nil
                self.BottomInjectionTips:removeAllChildren()
            end)))
        end
    end
end

function M:refreshService()
    for i=1,8 do
        if self.mSeatSTable[i] then
            local _dicePanel = self.mSeatSTable[i]:getChildByTag(ITEM_TAG)
            _dicePanel:refreshService()
        end
    end
end

function M:UIGameLayer_onClickAddFriend(data)
    if self.WatchStateTip:isVisible() then return end

    local FlyGoldSpeed = 1750--飞行速度
    local startpos=data.startpos
    local endpos=data.endpos
    local panel = UIManager:getOrCreatePanel("UIBoastMagicyFlyLayer_1")
    if panel then
        panel:showToScene()
        startpos = panel:convertToNodeSpace(startpos)
        endpos= panel:convertToNodeSpace(endpos)

        local effect = Utils.onlyCreateEffect(GSystem.GameAddFriendSpine,cc.p(0,0),false)
        effect:setPosition(startpos)
        panel:addChild(effect)

        local flytime = cc.pGetDistance(startpos,endpos)/FlyGoldSpeed--移动所需时间
        local delayTime=cc.DelayTime:create(1.4)
        local moveTo=cc.MoveTo:create(flytime,endpos)
        local delayTim2=cc.DelayTime:create(0.7)

        effect:runAction(cc.Sequence:create(delayTime,moveTo,delayTim2,cc.Hide:create()))
    end
end

function M:UIGameLayer_AddFriend(data)
    local friend=data.friend
    local applyUid=data.applyUid
    if not g_UserData:isSelfUserId(applyUid) or  self.WatchStateTip:isVisible() then
        return
    end
    
    self.FriendsHintNode:removeAllChildren()

    local cell=UIManager:createPanelOnly("FriendsHintCell")
    cell:refreshData(friend)
    cell:resetCenterPosition()
    self.FriendsHintNode:addChild(cell)

    local moveBy1=cc.EaseBackIn:create(cc.MoveBy:create(0.5,cc.p(0,-200)))
    local delayTime=cc.DelayTime:create(2.0)
    local moveBy2=cc.EaseBackInOut:create(cc.MoveBy:create(0.5,cc.p(0,200)))
    cell:runAction(cc.Sequence:create(moveBy1,delayTime,moveBy2))

    --遍历位置上玩家
    --friend.uid
    local FlyGoldSpeed = 1750--飞行速度
    for i,v in ipairs(self.mSeatSTable) do
        local item = self.mSeatSTable[i]:getChildByTag(ITEM_TAG)
        if item then
            if item:getPlayerUid()==friend.uid then
                local startpos=item:getHeadWorldPosition()
                local endpos=self.HeadIcon:convertToWorldSpace(cc.p(0,0))
                local panel = UIManager:getOrCreatePanel("UIBoastMagicyFlyLayer_1")
                if panel then
                    panel:showToScene()
                    startpos = panel:convertToNodeSpace(startpos)
                    endpos= panel:convertToNodeSpace(endpos)

                    local effect = Utils.onlyCreateEffect(GSystem.GameAddFriendWinSpine,cc.p(0,0),false)
                    effect:setPosition(startpos)
                    panel:addChild(effect)

                    local flytime = cc.pGetDistance(startpos,endpos)/FlyGoldSpeed--移动所需时间
                    local delayTime=cc.DelayTime:create(1.4)
                    local moveTo=cc.MoveTo:create(flytime,endpos)
                    local delayTim2=cc.DelayTime:create(0.7)

                    effect:runAction(cc.Sequence:create(delayTime,moveTo,delayTim2,cc.Hide:create()))
                end
                break
            end
        end
    end
end

function M:UIGameLayer_S2C_friendAddRequestBroadcast(data)
    local fromUid=data.fromUid
    local toUid=data.toUid
    if g_UserData:isSelfUserId(fromUid)  then
        return
    end

    local startpos
    local endpos
    for i,v in ipairs(self.mSeatSTable) do
        local item = self.mSeatSTable[i]:getChildByTag(ITEM_TAG)
        if item then
            if item:getPlayerUid()==fromUid then
                startpos=item:getHeadWorldPosition()
            elseif  item:getPlayerUid()==toUid then
                endpos=item:getHeadWorldPosition()
            end
        end
    end

    if g_UserData:isSelfUserId(toUid)  then
        endpos=self.HeadIcon:convertToWorldSpace(cc.p(0,0))
    end

    local FlyGoldSpeed = 1750--飞行速度
    local panel = UIManager:getOrCreatePanel("UIBoastMagicyFlyLayer_1")
    if panel and startpos and  endpos then
        panel:showToScene()
        startpos = panel:convertToNodeSpace(startpos)
        endpos= panel:convertToNodeSpace(endpos)

        local effect = Utils.onlyCreateEffect(GSystem.GameAddFriendSpine,cc.p(0,0),false)
        effect:setPosition(startpos)
        panel:addChild(effect)
        
        local flytime = cc.pGetDistance(startpos,endpos)/FlyGoldSpeed--移动所需时间
        local delayTime=cc.DelayTime:create(1.4)
        local moveTo=cc.MoveTo:create(flytime,endpos)
        local delayTim2=cc.DelayTime:create(0.7)

        effect:runAction(cc.Sequence:create(delayTime,moveTo,delayTim2,cc.Hide:create()))
    end
end

function M:UIGameLayer_S2C_friendAddAgreeBroadcast(data)
    local fromUid=data.fromUid
    local toUid=data.toUid
    local isAgree=data.isAgree
    if not isAgree then return end

    if g_UserData:isSelfUserId(fromUid)  then
        return
    end

    local startpos
    local endpos
    for i,v in ipairs(self.mSeatSTable) do
        local item = self.mSeatSTable[i]:getChildByTag(ITEM_TAG)
        if item then
            if item:getPlayerUid()==fromUid then
                startpos=item:getHeadWorldPosition()
            elseif  item:getPlayerUid()==toUid then
                endpos=item:getHeadWorldPosition()
            end
        end
    end

    if g_UserData:isSelfUserId(toUid)  then
        endpos=startpos
        startpos=self.HeadIcon:convertToWorldSpace(cc.p(0,0))
    end

    local FlyGoldSpeed = 1750--飞行速度
    local panel = UIManager:getOrCreatePanel("UIBoastMagicyFlyLayer_1")
    if panel and startpos and  endpos then
        panel:showToScene()
        startpos = panel:convertToNodeSpace(startpos)
        endpos= panel:convertToNodeSpace(endpos)

        local effect = Utils.onlyCreateEffect(GSystem.GameAddFriendWinSpine,cc.p(0,0),false)
        effect:setPosition(startpos)
        panel:addChild(effect)
        local flytime = cc.pGetDistance(startpos,endpos)/FlyGoldSpeed--移动所需时间
        local delayTime=cc.DelayTime:create(1.4)
        local moveTo=cc.MoveTo:create(flytime,endpos)
        local delayTim2=cc.DelayTime:create(0.7)

        effect:runAction(cc.Sequence:create(delayTime,moveTo,delayTim2,cc.Hide:create()))
    end
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
    self:doRegEvent(Constant.CustomEvent.EnterRoom,"onEnterRoom")
    self:doRegEvent(Constant.CustomEvent.GameStart, "onGameStart")
    self:doRegEvent(Constant.CustomEvent.GameReshakeDiceBox, "onGameReshakeDiceBox")
    self:doRegEvent(Constant.CustomEvent.GameTurn, "onGameTurn")
    self:doRegEvent(Constant.CustomEvent.GameDiceUpdate, "onGameDiceUpdate")
    self:doRegEvent(Constant.CustomEvent.GameCallPoint, "onGameCallPoint")
    self:doRegEvent(Constant.CustomEvent.GameOpenDiceBox, "onGameOpenDiceBox")
    self:doRegEvent(Constant.CustomEvent.GameOpenErrorGoldNotEnough,"onOpenErrorGoldNotEnough")
    self:doRegEvent(Constant.CustomEvent.GameExtraCompare, "onGameExtraCompare")
    self:doRegEvent(Constant.CustomEvent.GameOver, "onGameOver")
    self:doRegEvent(Constant.CustomEvent.GamePlayerLeave, "onGamePlayerLeave")
    self:doRegEvent(Constant.CustomEvent.GamePlayerUpdate, "onGamePlayerUpdate")
    self:doRegEvent(Constant.CustomEvent.AudienceListUpdate,"onAudienceListUpdate")
    self:doRegEvent(Constant.CustomEvent.GamePlayerSeatChenged,"onGamePlayerSeatChenged")
    self:doRegEvent(Constant.CustomEvent.GameLaunchVote,"onGameLaunchVote")
    self:doRegEvent(Constant.CustomEvent.GameSomeoneVote,"onGameSomeoneVote")
    self:doRegEvent(Constant.CustomEvent.GameBetBaseUpdateSeccess,"onGameBetBaseUpdateSeccess")
    self:doRegEvent(Constant.CustomEvent.GamePlayerGoldChange,"onGamePlayerGoldChange")
    self:doRegEvent(Constant.CustomEvent.GameUpdateComparePool, "onGameUpdateComparePool")
    self:doRegEvent(Constant.CustomEvent.UpdateUserResource, "onUpdateUserResource")
    self:doRegEvent(Constant.CustomEvent.OnShopListArrive, "onShopListArrive")
    self:doRegEvent(Constant.CustomEvent.GameMachStateChange, "onGameMachStateChange")
    self:doRegEvent(Constant.CustomEvent.UIGameLayer_refreshHot, "refreshHot")
    self:doRegEvent(Constant.CustomEvent.TipPlayerOpenAudio, "TipPlayerOpenAudio")
    self:doRegEvent(Constant.CustomEvent.SeccessOpenAudio, "SeccessOpenAudio")
    self:doRegEvent(Constant.CustomEvent.UpdateUserInfo, "refrashOneselfData")
    self:doRegEvent(Constant.CustomEvent.PlayerSayAgoraMessageChange, "onPlayerSayAgoraMessageChange")
    self:doRegEvent(Constant.CustomEvent.mainRequestAddFriend, "requestAddFriend")
    self:doRegEvent(Constant.CustomEvent.requestRemoveFriend, "requestRemoveFriend")
    self:doRegEvent(Constant.CustomEvent.mainRequestShowFriend, "requestShowFriend")
    self:doRegEvent(Constant.CustomEvent.mainReBindAllNode, "mainReBindAllNode")
    self:doRegEvent(Constant.CustomEvent.GameMagicEmoji, "onGameMagicEmoji")
    self:doRegEvent(Constant.CustomEvent.PlayerJoinRoomSeccess,"onPlayerJoinRoomSeccess")
    self:doRegEvent(Constant.CustomEvent.RemoveWalkingLantern, "RemoveWalkingLantern")
    self:doRegEvent(Constant.CustomEvent.OnCloseGuessSizeLayer,"onCloseGuessSizeLayer")
    self:doRegEvent(Constant.CustomEvent.UIGameLayer_s2cBigSmallStateInfo,"UIGameLayer_s2cBigSmallStateInfo")
    self:doRegEvent(Constant.CustomEvent.UIGameLayer_s2cBigSmallBankerInfo,"UIGameLayer_s2cBigSmallBankerInfo")
    self:doRegEvent(Constant.CustomEvent.UIGameLayer_s2cBigSmallRobResult,"UIGameLayer_s2cBigSmallRobResult")
    self:doRegEvent(Constant.CustomEvent.UIGameLayer_GuessSizeHintNode,"UIGameLayer_GuessSizeHintNode")
    self:doRegEvent(Constant.CustomEvent.UIGameLayer_updateLuckPlayer,"UIGameLayer_updateLuckPlayer")
    self:doRegEvent(Constant.CustomEvent.UpdateDicBox,"UpdateDicBox")
    self:doRegEvent(Constant.CustomEvent.OnBagListArrive, "OnBagListArrive")
    self:doRegEvent(Constant.CustomEvent.SitDown, "OnSitDown")
    self:doRegEvent(Constant.CustomEvent.UIDiceBoxCell_refreshService, "refreshService")
    self:doRegEvent(Constant.CustomEvent.UIGameLayer_AddFriend, "UIGameLayer_AddFriend")
    self:doRegEvent(Constant.CustomEvent.UIGameLayer_onClickAddFriend, "UIGameLayer_onClickAddFriend")
    self:doRegEvent(Constant.CustomEvent.UIGameLayer_S2C_friendAddRequestBroadcast, "UIGameLayer_S2C_friendAddRequestBroadcast")
    self:doRegEvent(Constant.CustomEvent.UIGameLayer_S2C_friendAddAgreeBroadcast, "UIGameLayer_S2C_friendAddAgreeBroadcast")
    self:doRegEvent("PlayerLevelRoom", "playerLevelAudioRoom")
    self:doRegEvent("PlayerJoinRoomFail", "playerJoinRoomFail")
    self:doRegEvent("playerLevelRoomFail", "playerLevelRoomFail")
    self:doRegEvent("UpdatePrivateRoomBtn", "updatePrivateRoomBtn")
    
end

function M:onCleanup()
    M.super.onCleanup(self)
end

function M:onToBack()
    self:onCleanLayer()
end

function M:onCleanLayer()
    local panel = UIManager:getPanel("UIRoomChatLayer")
    if panel then
        panel:closePanel(0)
    end
    if self.mGuessLayer then
        self.mGuessLayer:closePanel(0)
        self.mGuessLayer=nil
    end
    if self.mBankerGuessLayer then
        self.mBankerGuessLayer:closePanel(0)
        self.mBankerGuessLayer=nil
    end

    local MoneyFlypanel = UIManager:getPanel("UIBoastMoneyFlyLayer")
    if MoneyFlypanel then
        MoneyFlypanel:closePanel(0)
    end

    local MagicyFlypanel1 = UIManager:getPanel("UIBoastMagicyFlyLayer_1")
    if MagicyFlypanel1 then
        MagicyFlypanel1:closePanel(0)
    end

    local MagicyFlypanel2 = UIManager:getPanel("UIBoastMagicyFlyLayer_2")
    if MagicyFlypanel2 then
        MagicyFlypanel2:closePanel(0)
    end
    
    g_ChatData:clearRoomChatData(Enum.ChatChannel.room)

    self.GuessingShowNode:stopAllActions()
    self:stopAllActions()
    g_GameData:clearAllData(true)
    kz.IAgoraRoomManager:instance():leaveRoom()
    g_GameData:setmUserstatus(Enum.Userstatus.Loking)
end

function M:playerLevelAudioRoom()
    
end

function M:playerJoinRoomFail()

end

function M:playerLevelRoomFail()

end

return M