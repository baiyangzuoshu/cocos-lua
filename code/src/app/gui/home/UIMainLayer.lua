-- local AvatarWidget = require("app.gui.widget.AvatarWidget")
local Payment = require("app.native.Payment")

local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIMainLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_02_Main.01_02_MainLayer.lua"

M.BINDGUIDATANODE = {
    ["SexIcon"] = { varname = "SexIcon" },

    ["VipImage"] = { varname = "VipImage" },

    ["Entrance"] = { varname = "Entrance", onEvent = "onAvatarPanelTouchEvent" },
    ["PlayerNameText_O"] = { varname = "PlayerNameText" },
    ["PlayerJewelNum"] = { varname = "PlayerJewelNum" },
    ["PlayerGoldNum"] = { varname = "PlayerGoldNum" },
    --["PlayerJewelIcon"] = { varname = "PlayerJewelIcon" },
    ["Head"] = { varname = "HeadNode" },
    ["HeadIcon"] = { varname = "HeadIcon" },
    ["HeadBg"] = { varname = "HeadBg" },
    ["PlayerGoldButton"] = { varname = "GoldButton" },
    ["PlayerJewelButton"] = { varname = "DiamondButton" },
    ["PlayerJewelPanel"] = { varname = "PlayerJewelPanel", onEvent = "onDiamondStoreTouchEvent" },
    ["PlayerGoldPanel"] = { varname = "PlayerGoldPanel", onEvent = "onGoldStoreTouchEvent" },

    ["FunctionSetButtonPanel"] = { varname = "FunctionSetButtonPanel", onEvent = "onSettingTouchEvent" },
    ["FunctionSetButton"] = { varname = "settingBtn" },

    ["FunctionMailButtonPanel"] = { varname = "EmailPanel", onEvent = "onMailTouchEvent" },
    ["FunctionMailButton"] = { varname = "EmailBtn" },
    ["FunctionMailRedDot"] = { varname = "EmailRedDot" },
    ["FunctionMailRedNum"] = { varname = "EmailRedDotNum" },

    ["WalkingLanternNode"] = { varname = "WalkingLanternNode" },

    ["NewcomerPanel"] = { varname = "NewcomerPanel", onEvent = "onNewcomerTouchEvent" },

    ["FreeGoldPanel"] = {varname = "FreeGoldPanel", onClick = "onClickEvent" },

    ["DiscountPanel"] = { varname = "DiscountPanel", onEvent = "onDiscountTouchEvent" },

    ["StartGamePanel"] = { varname = "StartGameButton", onEvent = "onClickStartChuiNiuGameButton" },

    ["ActivityPanel"] =  { varname = "ActivityPanel", onEvent = "onActivityTouchEvent" },
    ["ActivityTipIcon"] = { varname = "ActivityTipIcon" },

    ["TaskPanel"] = { varname = "TaskPanel", onEvent = "onTaskTouchEvent" },
    ["TaskTipIcon"] = { varname = "TaskRedDot" },

    ["KnapsackPanel"] = { varname = "KnapsackPanel", onEvent = "onPackageTouchEvent" },
    ["KnapsackTip"] = { varname = "PackageRedDot" },
    ["KnapsackTipNum"] = { varname = "PackageTipNum" },

    ["ShopPanel"] = { varname = "ShopPanel", onEvent = "onShopTouchEvent" },

    ["FriendsPanel"] = { varname = "FriendsPanel", onClick = "onFriendsTouchEvent" },
    ["FriendsTipIcon"] = { varname = "FriendsRedDot" },
    ["FriendsTipText"] = { varname = "FriendsTipText" },
    --红点
    ["ActivityTipDotIcon"]={varname="ActivityTipDotIcon"},
    ["TaskTipDotIcon"]={varname="TaskTipDotIcon"},
    ["TaskTipDotNum"]={varname="TaskTipDotNum"},
    ["ShopTipDotIcon"]={varname="ShopTipDotIcon"},
    ["KnapsackTipDotIcon"]={varname="KnapsackTipDotIcon"},
    ["FriendsTipDotIcon"]={varname="FriendsTipDotIcon"},
    ["FriendsTipDotNum"]={varname="FriendsTipDotNum"},
    ["EntranceTipDotIcon"]={varname="EntranceTipDotIcon"},
    ["FunctionMailTipDotIcon"]={varname="FunctionMailTipDotIcon"},
    ["FunctionMailTipDotNum"]={varname="FunctionMailTipDotNum"},
    ["FunctionSetTipDotIcon"]={varname="FunctionSetTipDotIcon"},
    ["FreeGoldTipText_TT"]={varname="FreeGoldTipText_TT"},
    --
    ["FriendsListNode"]={varname="FriendsListNode"},
    ["AddFriendsPopUpNode"]={varname="AddFriendsPopUpNode"},
    ["StartGameImageNode"]={varname="StartGameImageNode"},
    ["Panel_1"]={varname="Panel_1"},

    ["GuessSizeBankerNode"]={varname="GuessSizeBankerNode"},
    ["GuessSizeHintNode"]={varname="GuessSizeHintNode"},
    ["GuessSizeBankerSpineATNode"]={varname="GuessSizeBankerSpineATNode"},
    ["SmashEggNode"]={varname="SmashEggNode"},

    ["DiceBabyInPanel"]={varname="DiceBabyInPanel",onEvent="onDiceBabyInPanel"},
    ["DiceBabyBankerIcon_SVT"]={varname="DiceBabyBankerIcon_SVT"},
    ["DiceBabyNode"]={varname="DiceBabyNode"},
    ["BankerBg"]={varname="BankerBg"},
    ["BankerNode"]={varname = "BankerNode"},

    ["BankerHeadFrame"] = {varname = "BankerHeadFrame"},--庄家头像框
    ["BankerHead"] = {varname = "BankerHead"},--庄家头像节点
    ["NotBankerText_TT"] = {varname = "NotBankerText"},--系统坐庄标记
    ["BankerNameText_O"] = {varname = "BankerNameText"},--庄家昵称
    ["BankerGoldIcon"] = {varname = "BankerGoldIcon"},--庄家金币图标
    ["BankerGoldNum"] = {varname = "BankerGoldNum"},--庄家金币数额
    ["BankerGoldInfinite"] = {varname = "BankerGoldInfinite"},--系统坐庄时的金币数额显示

    ["GrabBankerHeadNode"] = {varname = "GrabBankerHeadNode"},--候选庄家头像节点
    ["GrabBankerPanel"] = {varname = "GrabBankerPanel",onEvent = "onTouchGrabBankerPanel"},--抢庄点击区域
    ["QuitBankerSprite_SVT"]={varname="QuitBankerSprite_SVT"},
    ["GrabBankerSprite_SVT"]={varname="GrabBankerSprite_SVT"},

    ["ToolHelpButtonPanel"]={varname="ToolHelpButtonPanel",onEvent="onToolHelpButtonPanel"},--帮助按钮点击
    ["ToolSetButtonPanel"]={varname="ToolSetButtonPanel",onEvent="onToolSetButtonPanel"},--设置按钮点击
    ["ToolExitButtonPanel"]={varname="ToolExitButtonPanel",onEvent = "onToolExitButtonPanel"},--退出按钮点击
    ["OpenCardTime"]={varname="OpenCardTime"},--开牌倒计时
    ["BeOpenCardText_TT"]={varname="BeOpenCardText"},--正在开牌提示

    --下注区域
    ["OneAreaNode"]={varname="AreaNode_1"},
    ["TwoAreaNode"]={varname="AreaNode_2"},
    ["ThreeAreaNode"]={varname="AreaNode_3"},
    ["FourAreaNode"]={varname="AreaNode_4"},
    ["FiveAreaNode"]={varname="AreaNode_5"},
    ["SixAreaNode"]={varname="AreaNode_6"},
    ["BigAreaNode"]={varname="AreaNode_7"},
    ["LittleAreaNode"]={varname="AreaNode_8"},
    ["SingleAreaNode"]={varname="AreaNode_9"},
    ["BothAreaNode"]={varname="AreaNode_10"},
    ["StraightAreaNode"]={varname="AreaNode_11"},
    ["LeopardAreaNode"]={varname="AreaNode_12"},

    ["OneShowNode"]={varname="ShowNode_1"},
    ["TwoShowNode"]={varname="ShowNode_2"},
    ["ThreeShowNode"]={varname="ShowNode_3"},
    ["FourShowNode"]={varname="ShowNode_4"},
    ["FiveShowNode"]={varname="ShowNode_5"},
    ["SixShowNode"]={varname="ShowNode_6"},
    ["BigShowNode"]={varname="ShowNode_7"},
    ["LittleShowNode"]={varname="ShowNode_8"},
    ["SingleShowNode"]={varname="ShowNode_9"},
    ["BothShowNode"]={varname="ShowNode_10"},
    ["StraightShowNode"]={varname="ShowNode_11"},
    ["LeopardShowNode"]={varname="ShowNode_12"},


    ["OnePanel"]={varname="OnePanel",onEvent="onTouchBetPanel"},
    ["TwoPanel"]={varname="TwoPanel",onEvent="onTouchBetPanel"},
    ["ThreePanel"]={varname="ThreePanel",onEvent="onTouchBetPanel"},
    ["FourPanel"]={varname="FourPanel",onEvent="onTouchBetPanel"},
    ["FivePanel"]={varname="FivePanel",onEvent="onTouchBetPanel"},
    ["SixPanel"]={varname="SixPanel",onEvent="onTouchBetPanel"},
    ["BigPanel"]={varname="BigPanel",onEvent="onTouchBetPanel"},
    ["LittlePanel"]={varname="LittlePanel",onEvent="onTouchBetPanel"},
    ["SinglePanel"]={varname="SinglePanel",onEvent="onTouchBetPanel"},
    ["BothPanel"]={varname="BothPanel",onEvent="onTouchBetPanel"},
    ["StraightPanel"]={varname="StraightPanel",onEvent="onTouchBetPanel"},
    ["LeopardPanel"]={varname="LeopardPanel",onEvent="onTouchBetPanel"},
   
    ["OperatePanel"]={varname="OperatePanel"},
    ["OperateListPanel"]={varname="OperateListPanel"},--闲家操作区域
    ["BankerOperatePanel"]={varname="BankerOperatePanel"},--庄家翻倍操作区域
    ["BankerDoublePanel"]={varname="BankerDoublePanel",onEvent="onBankerDoublePanel"},--庄家翻倍点击事件

    --筹码选择区域
    ["ChipPanel_100"]={varname="ChipPanel_100",onEvent="onTouchChipPanel"},
    ["ChipPanel_1000"]={varname="ChipPanel_1000",onEvent="onTouchChipPanel"},
    ["ChipPanel_1W"]={varname="ChipPanel_1W",onEvent="onTouchChipPanel"},
    ["ChipPanel_10W"]={varname="ChipPanel_10W",onEvent="onTouchChipPanel"},
    ["ChipPanel_100W"]={varname="ChipPanel_100W",onEvent="onTouchChipPanel"},
    ["StopSprite_SVT"]={varname="StopSprite_SVT"},

    ["AudioHeadPanel"]={varname="AudioHeadPanel"},--正在语音中的玩家头像显示区域
    ["ChatPanel"]={varname="ChatPanel",onEvent="onTouchRoomChatEvent"},--聊天入口
    ["ChatTipDotIcon"]={varname="ChatTipDotIcon"},--聊天信息红点
    ["MicPanel"] = { varname = "MicButton", onEvent = "onClickSayWordBtn" },--麦克风按钮
    ["VoicePanel"] = { varname = "VoiceButon", onEvent = "onClickListenWordBtn" },--语音按钮
    ["MicLoadingBar"] = { varname = "MicLoadingBar"},--麦克风音量进度
    ["MicSprite"] = { varname = "MicSprite"},
    ["VoiceSprite"] = { varname = "VoiceSprite"},
    ["MessageNode"]={varname="MessageNode"},

    --玩家信息
    ["PlayerDataHead"] = {varname = "PlayerDataHead"},--玩家头像节点
    ["PlayerDataFrame"] = {varname = "PlayerDataFrame"},--玩家头像框
    ["PlayerDataName_O"] = {varname = "PlayerDataName"},--玩家昵称
    ["PlayerDataVipImage"] = {varname = "PlayerDataVipImage"},--玩家VIP图标
    ["PlayerDataGoldIcon"] = {varname = "PlayerDataGoldIcon"},--玩家金币图标
    ["PlayerDataGoldNum"] = {varname = "PlayerDataGoldNum"},--玩家金币数额
    ["PlayerDataGoldPanel"] = {varname = "PlayerDataGoldPanel",onEvent = "onGoldStoreTouchEvent"},--玩家购买金币点击区域
    ["PlayerDataGoldButton"] = {varname="PlayerDataGoldButton"},

    ["ModelRecordListView"]={varname="ModelRecordListView"},
    ["AllinForbidImage"]={varname="AllinForbidImage"},
    ["AllinForbidClickImage"]={varname="AllinForbidClickImage"},
    ["AllinPanel"]={varname="AllinPanel",onEvent="onTouchChipPanel"},
    ["DiceBabyHintNode"]={varname="DiceBabyHintNode"},
    ["AllinText"]={varname="AllinText"},
    ["AllinFloorBg"]={varname="AllinFloorBg"},
    ["AllinFloorText"]={varname="AllinFloorText"},
    ["AllinLimitBg"]={varname="AllinLimitBg"},
    ["AllinLimitText_TT"]={varname="AllinLimitText_TT"},
    ["AllinForbidText_TT"]={varname="AllinForbidText_TT"},

    ["OpenAnimation"]={varname="OpenAnimation"},
    ["SpecialCardTypeAnimation"]={varname="SpecialCardTypeAnimation"},
    ["SizeCardTypeAnimation"]={varname="SizeCardTypeAnimation"},
    ["OddEvenCardTypeAnimation"]={varname="OddEvenCardTypeAnimation"},
    ["Middle_10"]={varname="Middle_10"},
    ["Middle_2"]={varname="Middle_2"},
    ["Middle_1"]={varname="Middle_1"},
    ["Middle_11"]={varname="Middle_11"},
    ["FriendsHintNode"]={varname="FriendsHintNode"},
    ["ShutupPanel"]={varname="ShutupPanel",onEvent = "onShutupPanelTouchEvent"},
    ["ShutupNum"]={varname="ShutupNum"},
    ["BankerGoBrokeAnimation"]={varname="BankerGoBrokeAnimation"},
    ["PlayerDataPanel"]={varname="PlayerDataPanel",onEvent = "onShowMyData"},
    ["BankerHeadPanel"]={varname="BankerHeadPanel",onEvent = "onShowBankerInfo"},
    ["EmojiPanel_1"] = {varname = "EmojiPanel_1"},
    ["EmojiPanel_2"] = {varname = "EmojiPanel_2"},
}

local _addX=20
local _addY1=20
local _addY2=300
local _dyw = 0
local   MAX_SIZE=3*15

function M:adaptationPanelSize()
    local size=cc.Director:getInstance():getWinSize()
    local friangeTop = g_GameSettingData:getFringeScreenTop()
    local dyw = (size.height - 1280) / 2
    _dyw = dyw
    
    if dyw > 0 then
        _addY2=_addY2-(dyw-0)
        local _y=self.FriendsHintNode:getPositionY()
        self.FriendsHintNode:setPositionY(_y+dyw)
    end
    self.Middle_10:setPositionY(-640 + dyw - friangeTop)
    self.Middle_2:setPositionY(-640 + dyw - friangeTop)
    self.Middle_1:setPositionY(-640)
    self.Middle_11:setPositionY(-640 - dyw)
end

function M:onCreate()
    M.super.onCreate(self)
--临时处理
    --私房
    Net.NET_CMD.MSG_c2sCreatePersonalRoom={code = 3701, protocolName = "client.c2sCreatePersonalRoom", methodName = ""}
    Net.NET_CMD.MSG_c2sEnterPersonalRoom={code = 3702, protocolName = "client.c2sEnterPersonalRoom", methodName = ""}
    Net.NET_CMD.MSG_c2sModifyPersonalRoomInfo={code = 3703, protocolName = "client.c2sModifyPersonalRoomInfo", methodName = ""}
    Net.NET_CMD.MSG_c2sGameInviteBroadcast={code = 3704, protocolName = "client.c2sGameInviteBroadcast", methodName = ""}
    Net.NET_CMD.MSG_c2sGetPersonalPasswd={code = 3705, protocolName = "client.c2sGetPersonalPasswd", methodName = ""}
    Net.NET_CMD.MSG_c2sUserKickPlayer={code = 3706, protocolName = "client.c2sUserKickPlayer", methodName = ""}
    Net.NET_CMD.MSG_s2cGameInviteBroadcast = {code = 4704, protocolName = "server.s2cGameInviteBroadcast", methodName = "s2cGameInviteBroadcast"}
    Net.NET_CMD.MSG_s2cEnterPersonalRoom = {code = 4702, protocolName = "server.s2cEnterPersonalRoom", methodName = "s2cEnterPersonalRoom"}
    Net.NET_CMD.MSG_s2cPersonalRoomInfoChanged = {code = 4703, protocolName = "server.s2cPersonalRoomInfoChanged", methodName = "s2cPersonalRoomInfoChanged"}
    Net.NET_CMD.MSG_s2cPersonalPassword = {code = 4705, protocolName = "server.s2cPersonalPassword", methodName = "s2cPersonalPassword"}
    --新手引导
    Net.NET_CMD.MSG_c2sUpdateGuideGroup={code = 3601, protocolName = "client.c2sUpdateGuideGroup", methodName = ""}
    Net.NET_CMD.MSG_c2sGetGuideGroupRewards={code = 3602, protocolName = "client.c2sGetGuideGroupRewards", methodName = ""}
    Net.NET_CMD.MSG_s2cGuideGroupUpdateAck = {code = 4601, protocolName = "server.s2cGuideGroupUpdateAck", methodName = "s2cGuideGroupUpdateAck"}

    local config ={
        MSG_c2sCreatePersonalRoom={code = 3701, protocolName = "client.c2sCreatePersonalRoom", methodName = ""},
        MSG_c2sEnterPersonalRoom={code = 3702, protocolName = "client.c2sEnterPersonalRoom", methodName = ""},
        MSG_c2sModifyPersonalRoomInfo={code = 3703, protocolName = "client.c2sModifyPersonalRoomInfo", methodName = ""},
        MSG_c2sGameInviteBroadcast={code = 3704, protocolName = "client.c2sGameInviteBroadcast", methodName = ""},
        MSG_c2sGetPersonalPasswd={code = 3705, protocolName = "client.c2sGetPersonalPasswd", methodName = ""},
        MSG_c2sUserKickPlayer={code = 3706, protocolName = "client.c2sUserKickPlayer", methodName = ""},
        MSG_s2cGameInviteBroadcast = {code = 4704, protocolName = "server.s2cGameInviteBroadcast", methodName = "s2cGameInviteBroadcast"},
        MSG_s2cEnterPersonalRoom = {code = 4702, protocolName = "server.s2cEnterPersonalRoom", methodName = "s2cEnterPersonalRoom"},
        MSG_s2cPersonalRoomInfoChanged = {code = 4703, protocolName = "server.s2cPersonalRoomInfoChanged", methodName = "s2cPersonalRoomInfoChanged"},
        MSG_s2cPersonalPassword = {code = 4705, protocolName = "server.s2cPersonalPassword", methodName = "s2cPersonalPassword"},
        
        MSG_c2sUpdateGuideGroup={code = 3601, protocolName = "client.c2sUpdateGuideGroup", methodName = ""},
        MSG_c2sGetGuideGroupRewards={code = 3602, protocolName = "client.c2sGetGuideGroupRewards", methodName = ""},
        MSG_s2cGuideGroupUpdateAck = {code = 4601, protocolName = "server.s2cGuideGroupUpdateAck", methodName = "s2cGuideGroupUpdateAck"},
    }
    for k, v in pairs(config) do
        Net.NET_CMD[k] = v.code
    end
    for _, v in pairs(config) do
        Net.Code2Protobuf[v.code] = { protocolName = v.protocolName, methodName = v.methodName }
    end
--临时处理
    if tonumber(Net.NetworkEnvironment) == tonumber(Enum.requestServerHodType.outTest) then
        GSystem.ShaiBaoAudioRoomId="100000000000001".."4001"
    elseif tonumber(Net.NetworkEnvironment) == tonumber(Enum.requestServerHodType.outLine) then
        GSystem.ShaiBaoAudioRoomId="100000000000001".."5001"
    else
        GSystem.ShaiBaoAudioRoomId="100000000000001".."3001"
    end

    _addX=20
    _addY1=20
    _addY2=300
    self.otherVolume = 0.5
    self.outShaibaoVolume = 0.1
    
    self.openmusic = false
    self.JoinRoomTimes = 0

    self:setShadeShowModel(true)
    self:adaptationPanelSize()
    
    self.Middle_11:setVisible(false)
    kz.IAgoraRoomManager:instance():leaveRoom()

    self.mIsInShaiBao = false
    self.mEmojiHeadInfo = {}
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.MagicEmoji))

    self.mEmojiPanelList = {
        [1] = self.EmojiPanel_1,
        [2] = self.EmojiPanel_2
    }

    self.mChuiNiueffect = Utils.onlyCreateEffect(GSystem.StartGameButtonAnimationId,cc.p(0,0),true)
    self.chuiniuStartPos = {}
    self.chuiniuStartPos.x,self.chuiniuStartPos.y = self.StartGameButton:getPosition()
    if self.mChuiNiueffect then
        self:addChild(self.mChuiNiueffect)
        local gloablePos = self:convertToNodeSpace(cc.p(self.chuiniuStartPos.x,self.chuiniuStartPos.y))
        self.mChuiNiueffect:setPosition(gloablePos.x+_addX, gloablePos.y+_addY1)
        self.StartGameButton:setPosition(gloablePos.x+_addX, gloablePos.y+_addY1-_dyw)
    end

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.MiniItem))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.Head))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.HeadBox))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.VipIconTail))
    
    self.UIMainFriendsList=UIManager:createPanelOnly("UIMainFriendsList")
    self.UIMainFriendsList:setVisible(false)
    self:addChild(self.UIMainFriendsList)
    local posx,posy = self.FriendsListNode:getPosition()
    self.UIMainFriendsList:setPosition(posx,posy+_dyw)
    self.UIMainFriendsList:setLocalZOrder(601)

    self.addfriendNode = cc.Node:create()
    self:addChild(self.addfriendNode)
    self.addfriendNode:setPosition(self.AddFriendsPopUpNode:getPosition())
    self.addfriendNode:setLocalZOrder(601)
	self.SmashEggNode:setLocalZOrder(602)
    self.AllinPanel:setSwallowTouches(false)
    self.OperatePanel:setSwallowTouches(false)
    self.BankerOperatePanel:setSwallowTouches(false)
    self.mClickOpenAudioFail = false


    g_SieveData:getAllSieveData()
    self.DiceBabyBankerIcon_SVT:setVisible(false)
    self.mShaiBao={}
    self.mShaiBao.mIsSelectDouble=false
    self.mShaiBao.mAllUserAudios={}

    self:refreshMuteNum()

    self:refreshInitData()
end

function M:onInit()
    M.super.onInit(self)
    
    self.UIMainFriendsList:init()

    self.mDefault_Store_Tab = Enum.ShopShowType.Diamond
    self.mDefault_Friend_Tab = Enum.FriendTab.UnKnow

    self.WalkingLanternNode:removeAllChildren()

    self.DiamondButton:setTouchEnabled(false)
    self.GoldButton:setTouchEnabled(false)
    self.settingBtn:setTouchEnabled(false)
    self.EmailPanel:setTouchEnabled(true)

    self.ActivityTipDotIcon:setVisible(false)
    self.TaskTipDotIcon:setVisible(false)
    self.TaskTipDotNum:setVisible(false)
    self.ShopTipDotIcon:setVisible(false)
    self.KnapsackTipDotIcon:setVisible(false)
    self.FriendsTipDotIcon:setVisible(false)
    self.FriendsTipDotNum:setVisible(false)
    self.EntranceTipDotIcon:setVisible(false)
    self.FunctionMailTipDotIcon:setVisible(false)
    self.FunctionMailTipDotNum:setVisible(false)
    self.FunctionSetTipDotIcon:setVisible(false)
    self.GuessSizeBankerNode:setVisible(false)
    self.lastUserAudios = 0
    self.betListRemove = true
    self.mNeedUpBackMusic = true
    self.mNeedUpBackMusicTimes = 0
    self.MuteTimes = 0

    self:refreshShowGift()
    self:UIMainLayer_s2cBigSmallBankerInfo()
    
    g_EmailData:requestEmailList()
    g_TaskData:requestTaskList()
    g_HotData:C2S_getRedPoint()
    g_TaskData:C2S_getInvitedReward()
    g_FriendData:requestFriendRequestList()
    g_FriendData:requestFriendList()
    g_FriendData:requestFriendBlockList()
    g_GameData:C2S_GetGamingPlayerNum()

    self.ShutupPanel:setVisible(false)
    
    if g_UserData:getGold()<=GSystem.ReliefTriggerGoldNumber and  g_UserData:getDailyReliefCount()<GSystem.ReliefDailyCapNumber then
        local   panel=UIManager:getOrCreatePanel("UIReliefLayer")
        if panel then
            panel:showToScene()
        end
    end
    
    if g_GameData:isAutoLeaveRoom() then
        local   panel=UIManager:getOrCreatePanel("UIBoastHangUpPopUp")
        if panel then
            panel:showToScene()
        end
        g_GameData:setAutoLeaveRoom(false)
    end

    if g_GameData:getGuessLuckData() then
        self:UIMainLayer_updateLuckPlayer({is=false})
    end

    if g_UserData:getServiceTag() then
        local   panel=UIManager:getOrCreatePanel("UIServiceInletLayer")
        if panel then
            panel:setType(Enum.OnlineState.Idle)
            panel:showToScene()
        end
    end

    local   panel=UIManager:getOrCreatePanel("UIGuideBigPrizeLayer")
    if g_HotData:haveNeedGuide() then
        panel:showToScene()
    end

    g_HotData:searchGuideAward()
    
    self.AllinTexturePaths={
        Forbid="02_04_DiceBaby/picture_141.png",
        Allin="02_04_DiceBaby/picture_142.png",
        Max="02_04_DiceBaby/picture_143.png",
    }

    self.AllinForbidClickImage:setVisible(false)
    self:refreshAllinBtn()

    local RecordListSize = self.ModelRecordListView:getContentSize()
    self.ModelRecordListView:setAnchorPoint(0,0)
    self.ModelRecordListView:setPositionY(27)
    self.ModelRecordListView:setContentSize(RecordListSize.width,RecordListSize.height + _dyw)

    if g_SieveData:getIsMicOpened() then
        self.MicSprite:setSpriteFrame("04_01_Chat/button_057.png")
    else
        self.MicSprite:setSpriteFrame("04_01_Chat/button_058.png")
        self.MicLoadingBar:setPercent(0)
    end

    if g_SieveData:getAudioIsSound() then
        self.VoiceSprite:setSpriteFrame("04_01_Chat/button_059.png")
    else
        self.VoiceSprite:setSpriteFrame("04_01_Chat/button_060.png")
    end

    self.mRemoveList = {}

    if g_GameData:getmUserstatus() == Enum.Userstatus.ShaibaoGaing or g_GameData:getmUserstatus() == Enum.Userstatus.ShaibaoRoom then
        self:joinShaibaoRoom()
    end
end

function M:onEnter()
    M.super.onEnter(self)
    local Language = {
        zh = 1,
        tw = 2,
        en = 3,
    }
    local languageType = g_UserData:getSystemLanguage()
    local language = Language.zh
    if languageType == Enum.LanguageType.zh_cn then 
        language = Language.zh
    elseif languageType == Enum.LanguageType.en then
        language = Language.en
    elseif languageType == Enum.LanguageType.zh_tw then 
        language = Language.tw
    end
    g_UserData:requestSvnMuitiLanguageToServer(language)

    --self:runTimelineAnimation("DiceBabyOutAnimation",false)
    -- 查询商品列表 & 查询没核销的订单
    Payment.startQueryProducts()
    Payment.startPaymentRecharge()
    
    g_UserData:uploadTFUserData()
    g_LoginData:requestAccountBindList()
    self:refreshUserInfo()
    self:refreshShaiBaoUserInfo()
    self:InitAnimationPos()
    self:runEnterAnimation()
end

function M:InitAnimationPos()
    if self.mChuiNiueffect then
        self.mChuiNiueffect:setPositionY(-_addY2)
    end
    if self.UIMainFriendsList then
        self.UIMainFriendsList:setPositionX(-400)
    end
    if self.GSBankereffect then
        self.GSBankereffect:setPositionY(-_addY2+125-20)
    end
end

function M:runEnterAnimation()
    if self.mIsInShaiBao then
        return
    end
    self:runTimelineAnimation("EnterAnimation",false)
    local gloablePos = self:convertToNodeSpace(cc.p(self.chuiniuStartPos.x,self.chuiniuStartPos.y))
    if self.mChuiNiueffect then
        self.mChuiNiueffect:setVisible(true)
        self.mChuiNiueffect:runAction(cc.Sequence:create(cc.EaseBackOut:create(cc.MoveTo:create(0.8, cc.p(gloablePos.x+_addX, gloablePos.y+_addY1)))))
    end
    if self.GSBankereffect then
        self.GSBankereffect:runAction(cc.Sequence:create(cc.EaseBackOut:create(cc.MoveTo:create(0.8, cc.p(gloablePos.x+200, gloablePos.y+125)))))
    end
    self.StartGameButton:setPosition(gloablePos.x+_addX, gloablePos.y+_addY1-_dyw)
    if self.UIMainFriendsList then
        self.UIMainFriendsList:runAction(cc.Sequence:create(cc.MoveTo:create(0.8, cc.p(0,self.UIMainFriendsList:getPositionY()))))
    end
end

function M:onShowMyData(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        local panel = UIManager:getOrCreatePanel("UIPersonalInfoLayer")
        if panel then
            panel:showToScene()
        end
    end
end

function M:onShowBankerInfo(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        if g_SieveData:isMeBeBanker() then
            local panel = UIManager:getOrCreatePanel("UIPersonalInfoLayer")
            if panel then
                panel:showToScene()
            end
        else
            local data = g_SieveData:getBankerInfo().banker
            if not data then
                return
            end
            local panel = UIManager:getOrCreatePanel("app.gui.home.UIBankerMagicEmoji")
            if panel then
                panel:setPlayerData(data,self.BankerHead:getParent():convertToWorldSpaceAR(cc.p(self.BankerHead:getPositionX(),self.BankerHead:getPositionY())))
                panel:showToScene()
            end
        end
    end
end

function M:refreshShowGift()
    self.NewcomerPanel:setVisible(0==g_UserData:getChargeNoviceProductTime())
end

function M:showGiftBag()
    if 0==g_UserData:getChargeNoviceProductTime() then
        local panel=UIManager:getOrCreatePanel("UIOperateGiftBagNovicePopUp")
        if panel then
            panel:showToScene()
        end
    end
end

function M:onClickEvent(ref)
    local   name=ref:getName()
    if  "FreeGoldPanel"==name then
        SoundSystemManager:playSound004()

        local panel = UIManager:getOrCreatePanel("UIInvitationPopUp")
        if panel then 
            panel:showToScene()
        end
    end
end

function M:onNewcomerTouchEvent(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        self:showGiftBag()
    end
end

function M:onDiscountTouchEvent(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        --UIUtils.popToast("暂未开放")
        Log.log("暂未开放,敬请期待")
    end
end

function M:onClickStartChuiNiuGameButton(data)
    if data.event == "end" then
        local panel = UIManager:getOrCreatePanel("app.gui.game.UIBoastEntranceLayer")
        if panel then
            self.mDefault_Store_Tab = Enum.ShopShowType.Gold
            panel:showToScene()
        end
    end
end

function M:OnEmailListArrive()
    local panel = UIManager:getOrCreatePanel("UIEmailLayer")
    if panel then
        panel:showToScene()
    end
end

function M:onMailTouchEvent(data) --邮件
    if data.event == "end" then
        SoundSystemManager:playSound004()

        local scaleToStart = cc.ScaleTo:create(0.05, 0.9)
        local scaleToEnd = cc.ScaleTo:create(0.05, 1.0)
        self.EmailBtn:runAction(cc.Sequence:create(scaleToStart, scaleToEnd, cc.CallFunc:create(
            function ()
                local panel = UIManager:getOrCreatePanel("UIEmailLayer")
                if panel then
                    self:InitAnimationPos()
                    panel:showToScene()
                end
            end
        )))
    end
end

function M:onNewEmailArrive()
    --UIUtils.popToast("新邮件到了")
    Log.log("新邮件到了")
end

function M:onActivityTouchEvent(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        local panel=UIManager:getOrCreatePanel("UIActivitiesLayer")
        if panel then
            self:InitAnimationPos()
            panel:showToScene()
        end
    end
end

function M:onTaskTouchEvent(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        local panel = UIManager:getOrCreatePanel("UITaskLayer")
        if panel then 
            panel:showToScene()
        end
    end
end

function M:onDiceBabyInPanel(data)
    if data.event == "end" then
        Log.info("onDiceBabyInPanel")
        SoundSystemManager:playSound004()
        self:joinShaibaoRoom()
    end
end

function M:joinShaibaoRoom()
    self:runTimelineAnimation("DiceBabyEnterAnimation",false,function ()
       
    end)
    self:playOperateAction(true)
    self.mChuiNiueffect:runAction(cc.Sequence:create(cc.EaseBackIn:create(cc.MoveTo:create(0.8, cc.p(self.mChuiNiueffect:getPositionX(),-_addY2))),cc.CallFunc:create(function()
        self:refreshChatHot()
        self.mChuiNiueffect:setVisible(false)
        self.StartGameButton:setPosition(self.mChuiNiueffect:getPositionX(),-_addY2-_dyw)
        self:refreshShaiBaoUserInfo()
    end)))
    if self.GSBankereffect then
        self.GSBankereffect:runAction(cc.Sequence:create(cc.EaseBackIn:create(cc.MoveTo:create(0.8, cc.p(self.mChuiNiueffect:getPositionX()+200,-_addY2+125-20))))) 
    end
    self.UIMainFriendsList:runAction(cc.Sequence:create(cc.MoveTo:create(0.8, cc.p(-400,self.UIMainFriendsList:getPositionY()))))
    --self.addfriendNode:runAction(cc.Sequence:create(cc.MoveTo:create(0.8, cc.p(-500,self.addfriendNode:getPositionY()))))
    self.BankerOperatePanel:setVisible(g_SieveData:isMeBeBanker())
    self.mIsInShaiBao = true
    g_GameData:setmUserstatus(Enum.Userstatus.ShaibaoRoom)
    if not self.betListRemove and not g_SieveData:isMeBeBanker() then
        self.StopSprite_SVT:setVisible(true)
    end
    self:JoinIAgoraRoom()
end

function M:JoinIAgoraRoom()
    -- if self.JoinRoomTimes >= 3 then
    --     self.JoinRoomTimes = 0
    --     return
    -- end
    kz.IAgoraRoomManager:instance():joinRoom("",GSystem.ShaiBaoAudioRoomId,tostring(g_UserData:getUserId()),g_UserData:getUserId())
    --     self.JoinRoomTimes = 0
    -- else
    --     self.JoinRoomTimes = self.JoinRoomTimes + 1
    --     self:JoinIAgoraRoom()
    -- end
end

function M:OnTaskListArrive()    
    if g_TaskData:isShowSevenLogin() and g_UserData:getGuideTime()>3 then
        local   panel=UIManager:getOrCreatePanel("UINewWelfareLoginPopUp")
        if panel then
            panel:showToScene()
        end
    end
end

function M:onPackageTouchEvent(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        g_PackageData:requestGetBagList()
    end
end

function M:OnBagListArrive()
    local panel = UIManager:getOrCreatePanel("UIPackageLayer")
    if panel then 
        panel:setTabIndex(Enum.PackageTab.DiceCup)
        panel:showToScene()
    end
end

function M:onShopTouchEvent(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        self.mDefault_Store_Tab = Enum.ShopShowType.Gold
        self:InitAnimationPos()
        g_StoreData:requestShopList()
    end
end

function M:onFriendsTouchEvent(data)
    if Utils.isBtnClickNeedDelay(data,1000) then return end

    SoundSystemManager:playSound004()
    local panel = UIManager:getOrCreatePanel("UIFriendLayer")
    if panel then 
        self.mDefault_Friend_Tab = Enum.FriendTab.FriendList
        panel:setNewTabIndexAndShowNode(self.mDefault_Friend_Tab)
        panel:showToScene()
    end
end

function M:requestShopDiamond()
    self.mDefault_Store_Tab = Enum.ShopShowType.Diamond
    g_StoreData:requestShopList()
end

--钻石充值
function M:onDiamondStoreTouchEvent(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        local scaleToStart = cc.ScaleTo:create(0.05, 0.9)
        local scaleToEnd = cc.ScaleTo:create(0.05, 1.0)
        self.DiamondButton:runAction(cc.Sequence:create(scaleToStart, scaleToEnd, cc.CallFunc:create(
            function ()
                self:InitAnimationPos()
                self:requestShopDiamond()
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

function M:RunSkipEvent(UISkipType)
    if UISkipType == Enum.UISkipType.Unknow then 
        Log.log("No UISkipType")
    elseif UISkipType == Enum.UISkipType.ChuiNiu then 
        g_GameData:enterChuiNiuRoom()
    elseif UISkipType == Enum.UISkipType.Store_Diamond then 
        self.mDefault_Store_Tab = Enum.ShopShowType.Diamond
        g_StoreData:requestShopList()
    elseif UISkipType == Enum.UISkipType.Store_Gold then 
        self.mDefault_Store_Tab = Enum.ShopShowType.Gold
        g_StoreData:requestShopList()
    elseif UISkipType == Enum.UISkipType.Store_DiceCup then 
        self.mDefault_Store_Tab = Enum.ShopShowType.DiceCup
        g_StoreData:requestShopList()
    else
        Log.log("undefined UISkipType")
    end
end

function M:refreshUserInfo()
    self.PlayerNameText:setString(g_UserData:getNickName())
    Utils.setShortName(self.PlayerNameText, g_UserData:getNickName(), GSystem.NameLimitNumber)

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
    
    local sex = g_UserData:getSex()
    self.SexIcon:setVisible(true)
    if sex == Enum.SexShowType.Null then 
        self.SexIcon:setVisible(false)
    elseif sex == Enum.SexShowType.Male then 
        self.SexIcon:loadTexture("01_06_PersonalCenter/icon_030.png", ccui.TextureResType.plistType)
    elseif sex == Enum.SexShowType.FeMale then 
        self.SexIcon:loadTexture("01_06_PersonalCenter/icon_031.png", ccui.TextureResType.plistType)
    else
        self.SexIcon:setVisible(false)
    end

    Utils.showFormatVip(self.PlayerNameText, self.VipImage, self.SexIcon)

    self.PlayerJewelNum:setString(Utils.getFormatNumber_MuitiLanguage(g_UserData:getDiamond()))
    self.PlayerGoldNum:setString(Utils.getFormatNumber_MuitiLanguage(g_UserData:getGold()))

    self.HeadIcon:removeAllChildren()
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    avater:InitTexture(string.utf8len(g_UserData:getUserInfo():getHead())<7,g_UserData:getUserInfo():getHead(),g_UserData:getUserInfo():getUserId())
    avater:setCascadeOpacityEnabled(true)
    self.HeadIcon:addChild(avater)

    self.HeadBg:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(g_UserData:getHeadBox())), ccui.TextureResType.plistType)

    self:refreshShaiBaoUserInfo()

end

function M:onSettingTouchEvent(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        
        local scaleToStart = cc.ScaleTo:create(0.05, 0.9)
        local scaleToEnd = cc.ScaleTo:create(0.05, 1.0)
        self.settingBtn:runAction(cc.Sequence:create(scaleToStart, scaleToEnd, cc.CallFunc:create(
            function ()
                local panel = UIManager:getOrCreatePanel("UISettingLayer")
                if panel then
                    self:InitAnimationPos()
                    panel:showToScene()
                end
            end
        )))
    end
end

function M:OnUpdate(dt)
    local msgList = g_CommonData:getMsgList()
    if not Utils.isEmptyTable(msgList) then
         self:OnNewMsgArrive()
    end
    if self.UIMainFriendsList then
        self.UIMainFriendsList:OnUpdate(dt)
    end

    local arr=self.addfriendNode:getChildren()
    for _,v in ipairs(arr) do
        v:OnUpdate(dt)
    end

    if self.mLeftTime > 0 then
       
        self.mLeftTime =  self.mLeftTime - dt*1000
        local leftseconds = math.ceil(self.mLeftTime/1000)
        local seconds = leftseconds%60
        if seconds == 5 and not self.openmusic then
            local volume = 1
            if g_GameData:getmUserstatus() ~= Enum.Userstatus.ShaibaoGaing and g_GameData:getmUserstatus() ~= Enum.Userstatus.ShaibaoRoom then
                volume = volume * self.outShaibaoVolume
            end
            g_SieveData:playSound002(volume)
            self.openmusic = true
        end
        self.OpenCardTime:setString(Utils.getFoematLeftTime(self.mLeftTime))
        
    end
        
    if self.mLeftTime <= 0 and self.OpenCardTime:isVisible() then
        self.BeOpenCardText:setVisible(true)
        self.OpenCardTime:setVisible(false)
    end

    self.mNeedUpBackMusic = true
    for i,node in pairs(self.mShaiBao.mAllUserAudios) do
        if node.voicePanel then
            node.voicePanel:OnUpdate(dt)
        end
        if tonumber(node.voicePanel:getUid()) ~= -1 then
            self.mNeedUpBackMusic = false
        end
    end
    if (self.mNeedUpBackMusic and self.mNeedUpBackMusicTimes > 0 and not g_SieveData:getIsMicOpened()) or not self.mIsInShaiBao then
        self.mNeedUpBackMusicTimes = self.mNeedUpBackMusicTimes - 1
        SoundSystemManager:setBackMusicVolumeByPercent(0.5 + 0.5 / 60 * (60 - self.mNeedUpBackMusicTimes))
    end
    -- self:updateAllPlayerAodios(dt)
end

function M:OnNewMsgArrive()
    local child = self.WalkingLanternNode:getChildByName("UIWalkingLanternNode")
    if not child then 
        local walkingLanternNode = UIManager:createPanelOnly("UIWalkingLanternNode")
        local size = walkingLanternNode:getContentSize()
        walkingLanternNode:setPosition(cc.p(- size.width / 2, -size.height / 2))
        self.WalkingLanternNode:addChild(walkingLanternNode)
    end
end

function M:RemoveWalkingLantern()
    self.WalkingLanternNode:removeAllChildren()
end

function M:onAvatarPanelTouchEvent(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        local panel = UIManager:getOrCreatePanel("UIPersonalInfoLayer")
        if panel then
            panel:showToScene()
        end
    end
end

function M:onUpdateUserResource(data)
    self.PlayerJewelNum:setString(Utils.getFormatNumber_MuitiLanguage(g_UserData:getDiamond()))
    self.PlayerGoldNum:setString(Utils.getFormatNumber_MuitiLanguage(g_UserData:getGold()))
    self.PlayerDataGoldNum:setString(Utils.getFormatNumber_MuitiLanguage(g_UserData:getGold())) --骰宝

    if g_GameData:getmUserstatus()==Enum.Userstatus.Loking then
        g_UserData:checkGoldNeedEvent()
    end
    self:refreshAllinBtn()
end

function M:updateHotShow(data)
    local type=data.type
    local is=data.is
    local num=data.num
    
    if type==Enum.mainHotType.activity then
        self.ActivityTipDotIcon:setVisible(is)
    elseif type==Enum.mainHotType.task then
        self.TaskTipDotNum:setVisible(num>0)
        self.TaskTipDotIcon:setVisible(num>0)
        
        if num>99 then
            num="..."
        else
            num=num..""
        end
        self.TaskTipDotNum:setString(num)
    elseif type==Enum.mainHotType.vipShop then
        self.ShopTipDotIcon:setVisible(is)
    elseif type==Enum.mainHotType.bag then
        self.KnapsackTipDotIcon:setVisible(is)
    elseif type==Enum.mainHotType.friend then
        self.FriendsTipDotIcon:setVisible(num>0)
        self.FriendsTipDotNum:setVisible(num>0)
        
        if num>99 then
            num="..."
        else
            num=num..""
        end
        self.FriendsTipDotNum:setString((num))
    elseif type==Enum.mainHotType.userInfo then
        self.EntranceTipDotIcon:setVisible(is)
    elseif type==Enum.mainHotType.email then
        self.FunctionMailTipDotIcon:setVisible(num>0)
        self.FunctionMailTipDotNum:setVisible(num>0)
        
        if num>99 then
            num="..."
        else
            num=num..""
        end
        self.FunctionMailTipDotNum:setString((num))
    elseif type==Enum.mainHotType.set then
        self.FunctionSetTipDotIcon:setVisible(is)
    elseif type==Enum.mainHotType.invitation then
        if is then
            local   data=DataManager:getTbxData("Text",Enum.Text.invitation2)
            self.FreeGoldTipText_TT:setString(data.Desc)
        else
            local   data=DataManager:getTbxData("Text",Enum.Text.invitation1)
            self.FreeGoldTipText_TT:setString(data.Desc)
        end
    end
end

function M:refreshFriendList()
    local   friendData=g_FriendData:getFriendListData()
    local   panel=self.UIMainFriendsList
    panel:setVisible(#friendData>0)
    panel:refreshData()
    --需要特殊处理
    if 0==#friendData then
        g_FriendData:requestFriendList()
    end
end

function M:findFriendByUid(friendUid)
    local arr=self.addfriendNode:getChildren()
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
        if v and not self:findFriendByUid(data.friendUid) and (not g_FriendData:isExitFriendAddDataByUid(data.friendUid)) then
            local layer=UIManager:createPanelOnly("MainAddFriendsPopUp")
            self.addfriendNode:addChild(layer)
            layer:refreshUI(v)
            layer:playEnteryAction()
            layer:setName(tostring(data.friendUid))

            local num=self.addfriendNode:getChildrenCount()
            layer:setTag(num+1)
            self.addfriendNode:setTag(num+1)

            g_FriendData:addFriendAddDataItem(data.friendUid)
        end
    else
        self.addfriendNode:removeAllChildren()
        for _,v in ipairs(friendRequestList) do
            if  (not g_FriendData:isExitFriendAddDataByUid(v.uid)) then
                local layer=UIManager:createPanelOnly("MainAddFriendsPopUp")
                self.addfriendNode:addChild(layer)
                layer:refreshUI(v)
                layer:playEnteryAction()
                layer:setName(tostring(v.uid))
                
                local num=self.addfriendNode:getChildrenCount()
                layer:setTag(num+1)
                self.addfriendNode:setTag(num+1)
    
                g_FriendData:addFriendAddDataItem(v.uid)
            end
        end
    end

    local   friendData=g_FriendData:getFriendListData()
    local   panel=self.UIMainFriendsList
    panel:setVisible(#friendData>0)
    --需要特殊处理
    if 0==#friendData then
        g_FriendData:requestFriendList()
    end
end

function M:requestRemoveFriend(data)
    local   friendUid=data.friendUid
    local   v=self:findFriendByUid(friendUid)
    if v then
        v:playExitAction()
    else
        print("not find ",friendUid)
    end

    local   friendData=g_FriendData:getFriendListData()
    local   panel=self.UIMainFriendsList
    panel:setVisible(#friendData>0)
end

function M:mainReBindAllNode()
    self.UIMainFriendsList:resetAllNode()
    local arr=self.addfriendNode:getChildren()
    for _,v in ipairs(arr) do
        v:reBindingAllNode()
    end

    if self.mChuiNiueffect then 
        self.mChuiNiueffect:removeFromParent()
        self.mChuiNiueffect = Utils.onlyCreateEffect(GSystem.StartGameButtonAnimationId,cc.p(0,0),true)
        if self.mChuiNiueffect then
            self:addChild(self.mChuiNiueffect)
            local gloablePos = self:convertToNodeSpace(cc.p(self.chuiniuStartPos.x,self.chuiniuStartPos.y))
            if self.mIsInShaiBao then
                self.mChuiNiueffect:setPosition(gloablePos.x+_addX, -_addY2)
                self.StartGameButton:setPosition(gloablePos.x+_addX, -_addY2-_dyw)
            else
                self.mChuiNiueffect:setPosition(gloablePos.x+_addX, gloablePos.y+_addY1)
                self.StartGameButton:setPosition(gloablePos.x+_addX, gloablePos.y+_addY1-_dyw)
            end
        end
    end

    for k,v in pairs(self.mAllShowPlayersBetList) do
        for q,w in pairs(v) do
            if w then
                w.BetHeapPanel:refreshLanguage()
            end
        end
    end

    local money = g_UserData:getGold()
    if g_UserData:getGold() > GSystem.AllinGoldLimit then
        money = GSystem.AllinGoldLimit
    end
    self.AllinFloorText:setString(Utils.getFormatString(Utils.getTextByTextId(114),Utils.getFormatNumber_MuitiLanguage(g_UserData:getGold())))
    self.AllinText:setString(Utils.getFormatString(Utils.getTextByTextId(115),Utils.getFormatNumber_MuitiLanguage(money)))

    self.BankerGoldNum:setString(Utils.getFormatNumber_MuitiLanguage(g_SieveData:getBankerAllMoney()))
   self:refreshDiceList()
end

function M:isVisibleFriendPanel(data)
    local is=data.is
    self.Panel_1:setVisible(is)
end

function M:UIMainLayer_s2cBigSmallBankerInfo()
    local bankerData=g_GameData:getGuessBankerData()
    self.GuessSizeBankerNode:setVisible(false)
    if g_UserData:isSelfUserId(bankerData.uid) and g_GameData:isGuessSizeIng() then
        self.GuessSizeBankerNode:setVisible(true)
        if self.GSBankereffect then
            self.GSBankereffect:removeFromParent()
        end
        -- self.GuessSizeBankerSpineATNode:removeAllChildren()
        self.GSBankereffect = Utils.onlyCreateEffect(GSystem.HomePageGuessSizeBankerSpine,cc.p(0,0),true)
        if self.GSBankereffect then
            self:addChild(self.GSBankereffect)
            self.GSBankereffect:setPosition(self.chuiniuStartPos.x+200,self.chuiniuStartPos.y+125)
            self.GSBankereffect:setLocalZOrder(601)
        end
        -- self.GuessSizeBankerSpineATNode:addChild(effect)
    end
end

function M:UIMainLayer_GuessSizeHintNode(data)
    local leaveType=data.leaveType
    
    -- self.GuessSizeHintNode:removeAllChildren()
    local panel=UIManager:createPanelOnly("MainGuessSizeHintCell")
    if panel then
        panel:refreshUI(leaveType)
        self:addChild(panel)
        panel:setPosition(self.GuessSizeHintNode:getPosition())
        panel:setLocalZOrder(601)
    end
end

function M:UIMainLayer_updateLuckPlayer(ret)
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

function M:UIMainLayer_s2cBigSmallRobResult(data)
    local player=data.player
    local gold=data.gold
    if not g_UserData:isSelfUserId(player.uid) then
         return   
    end

    self.mSmashEggCell:playClick()
    local pos=self.mSmashEggCell:getWorldPosition()

    local item=DataManager:getTbxData("Item",GSystem.ThrowEggEggAnimationId)
    local netData = {}
    netData.itemShowType = item.ItemType
    netData.itemId = item.ItemId
    netData.itemNum = 0

    local itemInfo = require("app.bean.ItemInfo").new(netData, item.ItemType)
    local item = UIManager:createPanelOnly("UIItem")
    item:setItemInfo(itemInfo)
    item:setPropFrameVisible(false)
    item:resetCenterPosition()
    self.HeadNode:addChild(item)

    local nodePos=item:convertToNodeSpaceAR(pos)
    nodePos.x=nodePos.x+100
    nodePos.y=nodePos.y+100
    item:runAction(cc.Sequence:create(cc.MoveTo:create(0.2,nodePos),cc.CallFunc:create(function()
        self.mSmashEggCell:playHeadAnimation()
        if gold>0 then
            self.mSmashEggCell:playGoldAniamtion(gold)
        end
        
        item:setVisible(false)
    end),cc.DelayTime:create(0.5),cc.CallFunc:create(function() 
        item:removeFromParent()
        self.mSmashEggCell:playNormalAnimation()
    end)))
end


function M:refreshInitData()
    -- self.mParent = parent
    -- self:bindingAllNode(self, obj, self.BINDGUIDATANODE)

    self.mLeftTime = 0--倒计时
    self.mCheckChip = 100--初始选择筹码

    self.NotBankerText:setVisible(false)
    self.BankerGoldInfinite:setVisible(false)
    self.GrabBankerHeadNode:setVisible(false)
    self.OperatePanel:setSwallowTouches(false)
    self.OperateListPanel:setSwallowTouches(false)
    self.BankerOperatePanel:setVisible(false)
    self.OperateListPanel:setPosition(cc.p(1100,self.OperateListPanel:getPositionY()))
    self.BankerOperatePanel:setPosition(cc.p(0,self.BankerOperatePanel:getPositionY()))

    self.mSieveCupPanel = UIManager:createPanelOnly("app.gui.home.ShaiBaoShaiZiPanel")
    if self.mSieveCupPanel then
        Log.info("创建界面ShaiBaoShaiZiPanel")
        self.mSieveCupPanel:setPosition(-150,-150)
        self.mSieveCupPanel:addTo(self.OpenAnimation,1000)
        if self.BankerDiceBox then
            self.mSieveCupPanel:setDiceBox(self.BankerDiceBox)
        end
        self.mSieveCupPanel:setVisible(false)
    end

    local _DiceTypeNameList = {"One","Two","Three","Four","Five","Six","Big","Little","Single","Both","Straight","Leopard"}
    self.m_szDiceTypePanelList = {}
    self.mAllBetTypeState={}
    for i=1,12 do
        local Panel = self["AreaNode_"..i]:getChildByName(_DiceTypeNameList[i].."Panel")
        local PitchOnLight = self["AreaNode_"..i]:getChildByName(_DiceTypeNameList[i].."PitchOn")
        local WinLight = self["AreaNode_"..i]:getChildByName(_DiceTypeNameList[i].."Win")
        local BankerDoubleLight = self["AreaNode_"..i]:getChildByName(_DiceTypeNameList[i].."BankerDouble")
        local DoubleNode = self["AreaNode_"..i]:getChildByName(_DiceTypeNameList[i].."DoubleNode")
        Panel.idx = i
        self.mAllBetTypeState[i]={}
        self.mAllBetTypeState[i].onTouchShow = PitchOnLight
        self.mAllBetTypeState[i].winShow = WinLight
        self.mAllBetTypeState[i].doubleShow = BankerDoubleLight
        self.mAllBetTypeState[i].DoubleNode = DoubleNode

        --table.insert(self.m_szDiceTypePanelList,{Panel=Panel,PitchOnLight=PitchOnLight,WinLight=WinLight,BankerDoubleLight=BankerDoubleLight})
    end

    local _chiplist = {"100","1000","1W","10W","100W"}
    self.m_szChipPanelList = {}
    for i=1,5 do
        local chip = tostring(10^(i+1))

        local ChipNode = self.OperateListPanel:getChildByName("Chip_".._chiplist[i].."_SVT")
        local chipselectlight = ChipNode:getChildByName("ChipSelect_".._chiplist[i])
        local chippanel = ChipNode:getChildByName("ChipPanel_".._chiplist[i])
        chipselectlight:setVisible(i==1)
        chippanel.chip = chip
        chippanel:setSwallowTouches(false)
        local chipPosY = ChipNode:getPositionY()
        if i==1 then
            ChipNode:setPositionY(chipPosY + 10)
        end
        self.m_szChipPanelList[chip]={ChipNode=ChipNode,chipselectlight=chipselectlight,chippanel=chippanel,chipPosY = chipPosY}
    end

    self.AllinPanel.chip = "99999"
    self.m_szChipPanelList[self.AllinPanel.chip]={chipselectlight="",chippanel=self.AllinPanel}

    self.mAllShowPlayersBetList={

    }
    self.BetTexturePaths_en={
        bai="02_04_DiceBaby/picture_082_en.png",
        qian="02_04_DiceBaby/picture_083_en.png",
        wan="02_04_DiceBaby/picture_084_en.png",
        shiwan="02_04_DiceBaby/picture_085_en.png",
        baiwan="02_04_DiceBaby/picture_085_en.png",
    }
    self.BetTexturePaths_cn={
        bai="02_04_DiceBaby/picture_082_zh_CN.png",
        qian="02_04_DiceBaby/picture_083_zh_CN.png",
        wan="02_04_DiceBaby/picture_084_zh_CN.png",
        shiwan="02_04_DiceBaby/picture_085_zh_CN.png",
        baiwan="02_04_DiceBaby/picture_086_zh_CN.png",
    }
    self.BetTexturePaths_tw={
        bai="02_04_DiceBaby/picture_082_zh_TW.png",
        qian="02_04_DiceBaby/picture_083_zh_TW.png",
        wan="02_04_DiceBaby/picture_084_zh_TW.png",
        shiwan="02_04_DiceBaby/picture_085_zh_TW.png",
        baiwan="02_04_DiceBaby/picture_086_zh_TW.png",
    }
    self.betTypePositionsNode={}
    self.betTypePositionsNode[Enum.ShaibaoDiceType.BigDice]={}
    self.betTypePositionsNode[Enum.ShaibaoDiceType.SmallDice]={}
    self.betTypePositionsNode[Enum.ShaibaoDiceType.Single]={}
    self.betTypePositionsNode[Enum.ShaibaoDiceType.Double]={}
    self.betTypePositionsNode[Enum.ShaibaoDiceType.Series]={}
    self.betTypePositionsNode[Enum.ShaibaoDiceType.Same]={}
    self.betTypePositionsNode[Enum.ShaibaoDiceType.Count1]={}
    self.betTypePositionsNode[Enum.ShaibaoDiceType.Count2]={}
    self.betTypePositionsNode[Enum.ShaibaoDiceType.Count3]={}
    self.betTypePositionsNode[Enum.ShaibaoDiceType.Count4]={}
    self.betTypePositionsNode[Enum.ShaibaoDiceType.Count5]={}
    self.betTypePositionsNode[Enum.ShaibaoDiceType.Count6]={}
    for i=1,7 do
        local node = self.ShowNode_7:getChildByName("BigNode_"..i)
        table.insert( self.betTypePositionsNode[Enum.ShaibaoDiceType.BigDice], node)
    end
    for i=1,7 do
        local node = self.ShowNode_8:getChildByName("LittleNode_"..i)
        table.insert( self.betTypePositionsNode[Enum.ShaibaoDiceType.SmallDice], node)
    end
    for i=1,7 do
        local node = self.ShowNode_9:getChildByName("SingleNode_"..i)
        table.insert( self.betTypePositionsNode[Enum.ShaibaoDiceType.Single], node)
    end
    for i=1,7 do
        local node = self.ShowNode_10:getChildByName("BothNode_"..i)
        table.insert( self.betTypePositionsNode[Enum.ShaibaoDiceType.Double], node)
    end
    for i=1,7 do
        local node = self.ShowNode_12:getChildByName("LeopardNode_"..i)
        table.insert( self.betTypePositionsNode[Enum.ShaibaoDiceType.Same], node)
    end
    for i=1,7 do
        local node = self.ShowNode_11:getChildByName("StraightNode_"..i)
        table.insert( self.betTypePositionsNode[Enum.ShaibaoDiceType.Series], node)
    end
    for i=1,3 do
        local node = self.ShowNode_1:getChildByName("OneNode_"..i)
        table.insert( self.betTypePositionsNode[Enum.ShaibaoDiceType.Count1], node)
    end
    for i=1,3 do
        local node = self.ShowNode_2:getChildByName("TwoNode_"..i)
        table.insert( self.betTypePositionsNode[Enum.ShaibaoDiceType.Count2], node)
    end
    for i=1,3 do
        local node = self.ShowNode_3:getChildByName("ThreeNode_"..i)
        table.insert( self.betTypePositionsNode[Enum.ShaibaoDiceType.Count3], node)
    end
    for i=1,3 do
        local node = self.ShowNode_4:getChildByName("FourNode_"..i)
        table.insert( self.betTypePositionsNode[Enum.ShaibaoDiceType.Count4], node)
    end
    for i=1,3 do
        local node = self.ShowNode_5:getChildByName("FiveNode_"..i)
        table.insert( self.betTypePositionsNode[Enum.ShaibaoDiceType.Count5], node)
    end
    for i=1,3 do
        local node = self.ShowNode_6:getChildByName("SixNode_"..i)
        table.insert( self.betTypePositionsNode[Enum.ShaibaoDiceType.Count6], node)
    end

    self:initBetAreaNode()
end
function M:initBetAreaNode()
    for k,v in pairs(self.mAllBetTypeState) do
        v.onTouchShow:setVisible(false)
        -- v.onTouchShow:setOpacity(0)
        v.winShow:setVisible(false)
        v.doubleShow:setVisible(false)
        v.DoubleNode:removeAllChildren()
        -- v.DoubleLabel:setVisible(false)
    end
end
function M:refreshShaiBaoUserInfo()
    self.PlayerDataName:setString(g_UserData:getNickName())
    Utils.setShortName(self.PlayerDataName, g_UserData:getNickName(), GSystem.NameLimitNumber)

    local vipLevel = g_UserData:getVipLevel()
    if vipLevel <= 0 then 
        self.PlayerDataVipImage:setVisible(false)
    else
        self.PlayerDataVipImage:setVisible(true)
        local vipData = DataManager:getTbxData("Vip", vipLevel)
        if vipData then 
            self.PlayerDataVipImage:loadTexture(Utils.getIconStr(PlistConfig.Icon.VipIconTail, vipData.VipIcon), ccui.TextureResType.plistType)
        end
    end
    

    Utils.showFormatVip(self.PlayerDataName, self.PlayerDataVipImage)

    self.PlayerDataGoldNum:setString(Utils.getFormatNumber_MuitiLanguage(g_UserData:getGold()))
    
    self.PlayerDataHead:removeAllChildren()
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    avater:InitTexture(string.utf8len(g_UserData:getUserInfo():getHead())<7,g_UserData:getUserInfo():getHead(),g_UserData:getUserInfo():getUserId())
    avater:setCascadeOpacityEnabled(true)
    self.PlayerDataHead:addChild(avater)

    self.PlayerDataFrame:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(g_UserData:getHeadBox())), ccui.TextureResType.plistType)
end

function M:playOperateAction(isEnter)
    if isEnter then
        -- if g_UserData:getVipLevel() < GSystem.AllinVIPLimit then
        --     self.OperateListPanel:runAction(cc.Sequence:create(cc.EaseBackOut:create(cc.MoveTo:create(1, cc.p(0,self.OperateListPanel:getPositionY())))))
        -- else
            self.OperateListPanel:runAction(cc.Sequence:create(cc.EaseBackOut:create(cc.MoveTo:create(1, cc.p(0,self.OperateListPanel:getPositionY())))))
        -- end
    else
        -- if g_UserData:getVipLevel() < GSystem.AllinVIPLimit then
        --     self.OperateListPanel:runAction(cc.Sequence:create(cc.EaseBackIn:create(cc.MoveTo:create(1, cc.p(1100,self.OperateListPanel:getPositionY())))))
        -- else
            self.OperateListPanel:runAction(cc.Sequence:create(cc.EaseBackIn:create(cc.MoveTo:create(1, cc.p(1100,self.OperateListPanel:getPositionY())))))
        -- end
    end
end

function M:onTouchGrabBankerPanel(data)
    if data.event=="end"then
        SoundSystemManager:playSound004()
        print("onTouchGrabBankerPanel")


        --RobAvillageTipPanel
        --如果 已被抢庄 则不可点击
        --如果 我事庄家 则点击下庄 
        --若果我不是庄家则点击抢庄
        if g_SieveData:isHaveSecBanker() then
            return
        else
            if g_SieveData:isMeBeBanker() then
                --下庄
                local tipLayer = UIManager:getOrCreatePanel("app.gui.home.BankerDownTipLayer")
                if tipLayer then
                    tipLayer:showToScene()
                end
            else
                --抢庄
                local tipLayer = UIManager:getOrCreatePanel("app.gui.home.RobAvillageTipPanel")
                if tipLayer then
                    tipLayer:showToScene()
                end
            end
        end


        --g_SieveData:MSG_c2sShaibaoRobBanker(GSystem.DiceBabyBankerFreezeGold[1])
    end
end

function M:onToolHelpButtonPanel(data)
    if data.event=="end"then
        SoundSystemManager:playSound004()
        if cc.PLATFORM_OS_ANDROID ~= targetPlatform and cc.PLATFORM_OS_IPHONE ~= targetPlatform then
            print("windows无法使用webview")
           return 
        end
        
        local panel = UIManager:getOrCreatePanel("UISettingHelpLayer")
        if panel then
            panel:setData(0)
            panel:showToScene()
        end
    end
end

function M:onToolSetButtonPanel(data)
    if data.event=="end"then
        SoundSystemManager:playSound004()
        
        local scaleToStart = cc.ScaleTo:create(0.05, 0.9)
        local scaleToEnd = cc.ScaleTo:create(0.05, 1.0)
        self.settingBtn:runAction(cc.Sequence:create(scaleToStart, scaleToEnd, cc.CallFunc:create(
            function ()
                local panel = UIManager:getOrCreatePanel("UISettingLayer")
                if panel then
                    panel:showToScene()
                end
            end
        )))
    end
end

function M:onToolExitButtonPanel(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        if self.mIsInShaiBao == false then
            return
        end
        self:runTimelineAnimation("DiceBabyOutAnimation",false,function ()
            kz.IAgoraRoomManager:instance():leaveRoom()
        end)
        self:playOperateAction(false)
        self.mIsInShaiBao = false
        local gloablePos = self:convertToNodeSpace(cc.p(self.chuiniuStartPos.x,self.chuiniuStartPos.y))
        self.mChuiNiueffect:setVisible(true)
        self.mChuiNiueffect:runAction(cc.Sequence:create(cc.EaseBackOut:create(cc.MoveTo:create(0.8, cc.p(gloablePos.x+_addX, gloablePos.y+_addY1)))))
        if self.GSBankereffect then
            self.GSBankereffect:runAction(cc.Sequence:create(cc.EaseBackOut:create(cc.MoveTo:create(0.8, cc.p(gloablePos.x+200, gloablePos.y+125)))))
        end
        self.StartGameButton:setPosition(gloablePos.x+_addX, gloablePos.y+_addY1-_dyw)
        self.UIMainFriendsList:runAction(cc.Sequence:create(cc.MoveTo:create(0.8, cc.p(0,self.UIMainFriendsList:getPositionY()))))
        --self.addfriendNode:runAction(cc.Sequence:create(cc.MoveTo:create(0.8, cc.p(0,self.addfriendNode:getPositionY()))))
        self.BankerOperatePanel:setVisible(false)
        self.StopSprite_SVT:setVisible(false)
        self.betListRemove = true
        if g_GameData:getmUserstatus() == Enum.Userstatus.ShaibaoRoom then
            g_GameData:setmUserstatus(Enum.Userstatus.Loking)
        end
    end
end

function M:onBankerDoublePanel(data)
    if data.event == "end" then
        Log.info("onBankerDoublePanel")
        self.BankerOperatePanel:getChildByName("BankerDoubleSelect"):setVisible(not self.mShaiBao.mIsSelectDouble)
        self.mShaiBao.mIsSelectDouble=not self.mShaiBao.mIsSelectDouble
    end
end

function M:onTouchBetPanel(data)
    if not self.mIsInShaiBao then return end
    if data.event == "end" then
        local betType = data.node.idx
        local doubleAreas = g_SieveData:getDoubleAreaList()
        if g_SieveData:isMeBeBanker() then
            if self.mShaiBao.mIsSelectDouble then
                if GSystem.BankerDoubleCount < #doubleAreas + 1 then
                    UIUtils.popToadtByMessageId("60030")
                    return
                end
                -- if g_UserData:getGold() >= GSystem.BankerDoubleGoodLimit then 
                    g_SieveData:MSG_c2sShaibaoDouble(betType)
                    self.BankerOperatePanel:getChildByName("BankerDoubleSelect"):setVisible(false)
                    self.mShaiBao.mIsSelectDouble=false
                -- else
                --     UIUtils.popToadtByMessageId("60031")
                -- end
            else
                
            end
        else
            if self.mCheckChip == 99999 then
                if g_UserData:getGold() < GSystem.AllinGoldFloor then
                    UIUtils.popToadtByMessageId("52001")
                    return
                end

                self.OperateListPanel:runAction(cc.Sequence:create(cc.MoveTo:create(0.5,cc.p(0,self.OperateListPanel:getPositionY()))))
                self.AllinForbidClickImage:setVisible(false)
                self.m_szChipPanelList["100"].chipselectlight:setVisible(true)
                g_SieveData:MSG_c2sShaibaoBet(self.mCheckChip,betType)
                self.mCheckChip = 100
                return
            else
                if self.mCheckChip == 0 then
                    return
                end
                for i, v in ipairs(doubleAreas) do
                    if v == betType then
                        if g_UserData:getGold() - GSystem.BankerDoublePower * self.mCheckChip < 0 then
                            self:changeChip(GSystem.BankerDoublePower,betType)
                            return
                        end
                    end
                end
                self:changeChip(1,betType)
            end
        end
        
    end
end

function M:changeChip(multiply,betType)
    local nums = { 100, 1000, 10000, 100000, 1000000 }

    local index = 0

    for i = 1, #nums do
        if g_UserData:getGold() - nums[i] * multiply >= 0 then
            index = i
        end
    end
    if g_UserData:getGold() - self.mCheckChip * multiply < 0 then
        self.m_szChipPanelList[tostring(self.mCheckChip)].chipselectlight:setVisible(false)
        self.m_szChipPanelList[tostring(self.mCheckChip)].ChipNode:setPositionY(self.m_szChipPanelList[tostring(self.mCheckChip)].chipPosY)
        if g_UserData:getGold() > 0 then
            local newChip = index + 1
            if newChip > 5 then
                newChip = 5
            end
            self.m_szChipPanelList[tostring(nums[newChip])].chipselectlight:setVisible(true)
            self.m_szChipPanelList[tostring(nums[newChip])].ChipNode:setPositionY(self.m_szChipPanelList[tostring(nums[newChip])].chipPosY + 10)
            self.mCheckChip = nums[newChip]
            g_SieveData:MSG_c2sShaibaoBet(g_UserData:getGold(),betType)
            return
        else
            self.m_szChipPanelList[tostring(100)].chipselectlight:setVisible(true)
            self.m_szChipPanelList[tostring(100)].ChipNode:setPositionY(self.m_szChipPanelList[tostring(100)].chipPosY + 10)
            self.mCheckChip = 100
            UIUtils.popToadtByMessageId("52001")
            return
        end
    end
    g_SieveData:MSG_c2sShaibaoBet(self.mCheckChip,betType)
end

function M:onTouchChipPanel(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        for k,v in pairs(self.m_szChipPanelList) do
            if k=="99999" then
                if data.node.chip == "99999" then
                    if g_UserData:getGold() < GSystem.AllinGoldFloor then
                        UIUtils.popToadtByMessageId("1100033")
                        return
                    end
                    if self.mCheckChip == 99999 then
                        self.AllinForbidClickImage:setVisible(false)
                        self.mCheckChip = 0
                        return
                    else
                        self.AllinForbidClickImage:setVisible(true)
                    end
                else
                    self.AllinForbidClickImage:setVisible(false)
                end
            else
                if k == data.node.chip then
                    v.chipselectlight:setVisible(true)
                    v.ChipNode:setPositionY(v.chipPosY + 10)
                else
                    v.chipselectlight:setVisible(false)
                    v.ChipNode:setPositionY(v.chipPosY)
                end
            end
        end
        self.mCheckChip = tonumber(data.node.chip)
    end
end

function M:onGameTouchBegin(pos)
    if not self.betListRemove then
        return
    end
    self.mTouchStartPos=cc.p(0,0)
    self.mIsTouchMoveOperate=false
    local rangeStartx,rangeStarty = self.OperatePanel:getPosition()
    local range = self.OperatePanel:getContentSize()
    rangeStarty = rangeStarty + _dyw
    if pos.x>=rangeStartx and pos.x<=rangeStartx+range.width
    and pos.y>=rangeStarty and pos.y<=rangeStarty+range.height then
        print("点击start位置："..pos.x.." "..pos.y,rangeStartx,rangeStarty)
        self.OperateListPanelStartPosX = self.OperateListPanel:getPositionX()
        self.mTouchStartPos = pos
        self.mIsTouchMoveOperate = true
    end
    return true
end

function M:onGameTouchMoved(pos)
    if g_UserData:getVipLevel() < GSystem.AllinVIPLimit or not self.mIsInShaiBao then
        return
    end
    local dicX = pos.x - self.mTouchStartPos.x
    if self.OperateListPanel:isVisible() and self.mIsTouchMoveOperate then
        self.OperateListPanel:setPositionX(self.OperateListPanelStartPosX+dicX)
    end
end

function M:refreshAllinBtn()
    if g_UserData:getGold() < GSystem.AllinGoldFloor then
        self.AllinForbidImage:loadTexture(self.AllinTexturePaths.Forbid,ccui.TextureResType.plistType)
        self.AllinForbidText_TT:setVisible(true)
        self.AllinFloorBg:setVisible(true)
        self.AllinLimitBg:setVisible(false)
        self.AllinText:setVisible(false)
        self.AllinFloorText:setString(Utils.getFormatString(Utils.getTextByTextId(114),Utils.getFormatNumber_MuitiLanguage(g_UserData:getGold())))
    else
        self.AllinForbidText_TT:setVisible(false)
        self.AllinFloorBg:setVisible(false)
        self.AllinLimitBg:setVisible(false)
        self.AllinText:setVisible(true)
        local money = g_UserData:getGold()
        if g_UserData:getGold() > GSystem.AllinGoldLimit then
            self.AllinForbidImage:loadTexture(self.AllinTexturePaths.Max,ccui.TextureResType.plistType)
            self.AllinLimitBg:setVisible(true)
            money = GSystem.AllinGoldLimit
        else
            self.AllinForbidImage:loadTexture(self.AllinTexturePaths.Allin,ccui.TextureResType.plistType)
        end
        self.AllinText:setString(Utils.getFormatString(Utils.getTextByTextId(115),Utils.getFormatNumber_MuitiLanguage(money)))
    end
end

function M:onGameTouchEnded(pos)
    if g_UserData:getVipLevel() < GSystem.AllinVIPLimit or not self.mIsInShaiBao then
        return
    end
    local dicX = pos.x - self.mTouchStartPos.x
    if self.OperateListPanel:isVisible() and self.mIsTouchMoveOperate then
        self.OperateListPanel:setPositionX(self.OperateListPanelStartPosX+dicX)
        if dicX < -150 then
            self.OperateListPanel:runAction(cc.Sequence:create(cc.MoveTo:create(0.5,cc.p(-720,self.OperateListPanel:getPositionY()))))
            self:refreshAllinBtn()
        elseif dicX > 150 then
            self.OperateListPanel:runAction(cc.Sequence:create(cc.MoveTo:create(0.5,cc.p(0,self.OperateListPanel:getPositionY()))))
        else
            if self.OperateListPanel:getPositionX() <= -360 then
                self.OperateListPanel:runAction(cc.Sequence:create(cc.MoveTo:create(0.5,cc.p(-720,self.OperateListPanel:getPositionY()))))
            elseif self.OperateListPanel:getPositionX() > -360 then
                self.OperateListPanel:runAction(cc.Sequence:create(cc.MoveTo:create(0.5,cc.p(0,self.OperateListPanel:getPositionY()))))
            end
        end
    end
    self.mIsTouchMoveOperate = false
end

function M:onTouchRoomChatEvent(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        local panel = UIManager:getOrCreatePanel("UIRoomChatLayer")
        if panel then
            if panel:isSleepIng() then
                panel:active()
            else
                panel:resetRootNodeAnchorPoint(cc.p(0, 0))
                local posX = self.MessageNode:getPositionX()
                local posY = self.MessageNode:getPositionY()
                panel:resetRootNodePosition(cc.p(posX, posY))
                panel:showToScene()
                panel:setChannelID(Enum.ChatChannel.world)
            end
        end
    end
end


function M:onClickSayWordBtn(data)
    --UIUtils.popToast("暂未开放")
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        self:setMicIsOpen(not g_SieveData:getIsMicOpened(),true)
    end
end

--听筒
function M:onClickListenWordBtn(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        if g_SieveData:getAudioIsSound() then
            if kz.IAgoraRoomManager:instance():muteAllRemoteAudioStreams(false)>=0 then
                print("she zhi cheng gong  guan bi")
                self.VoiceSprite:setSpriteFrame("04_01_Chat/button_060.png")
                g_SieveData:setAudioIsSound(false)
                -- self.VoiceButon:setBright(false)
            end
        else
            if kz.IAgoraRoomManager:instance():muteAllRemoteAudioStreams(true)>=0 then
                print("she zhi cheng gong  da kai")
                self.VoiceSprite:setSpriteFrame("04_01_Chat/button_059.png")
                g_SieveData:setAudioIsSound(true)
                for k, v in pairs(g_SieveData:getmMuteList()) do
                    self:MuteAudio(v,true)
                end
                -- self.VoiceButon:setBright(true)
            end
        end
    end
end

--商城
function M:onGoldStoreTouchEvent(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        local scaleToStart = cc.ScaleTo:create(0.05, 0.9)
        local scaleToEnd = cc.ScaleTo:create(0.05, 1.0)
        self.PlayerDataGoldButton:runAction(cc.Sequence:create(scaleToStart, scaleToEnd, cc.CallFunc:create(
            function ()
                self.mDefault_Store_Tab = Enum.ShopShowType.Gold
                self:InitAnimationPos()
                g_StoreData:requestShopList()
            end
        )))
    end
end

--事件消息处理
function M:onShaiBao_refreshInfo(data)
    self.DiceBabyBankerIcon_SVT:setVisible(g_SieveData:isMeBeBanker())

    self.GrabBankerSprite_SVT:setVisible(not g_SieveData:isMeBeBanker())
    self.QuitBankerSprite_SVT:setVisible(g_SieveData:isMeBeBanker())
    
    
    if g_SieveData:getShaiBaoGameState() == Enum.ShaibaoState.Init then
        self.BeOpenCardText:setVisible(true)
        if (g_GameData:getmUserstatus() == Enum.Userstatus.ShaibaoGaing or g_GameData:getmUserstatus() == Enum.Userstatus.ShaibaoRoom) and not g_SieveData:isMeBeBanker() then
            self.StopSprite_SVT:setVisible(true)
        else
            self.StopSprite_SVT:setVisible(false)
        end
        self.betListRemove = false
        self.OpenCardTime:setVisible(false)
    else
        self:onShaiBao_Start(g_SieveData:getBetingLeftTime())
        
    end
    self:refreshDiceList()
end

function M:onShaiBao_Start(lefttime)
    self.mAllShowPlayersBetList={
        
    }

    self.mSieveCupPanel:setDiceBox(self.BankerDiceBox)
    for i, node in pairs(self.betTypePositionsNode) do
        for k, v in pairs(node) do
            v:removeAllChildren()
        end
    end
    self.betListRemove = true
    self.StopSprite_SVT:setVisible(false)
    self.OperateListPanel:setOpacity(255)

    self.BeOpenCardText:setVisible(false)
    self.OpenCardTime:setVisible(true)
    self.mSieveCupPanel:setVisible(false)
    self.mLeftTime = lefttime
    self.OpenCardTime:setString(Utils.getFoematLeftTime(self.mLeftTime))

    self.openmusic = false
    self:refreshShaiBaoUserInfo()
end

function M:onShaiBao_RefreshBankerInfo(data)
    local banker = data.banker
    local secBanker = data.secBanker--候选庄家信息
    local bankerInfo = banker.banker --当前庄家个人信息
    local chip = banker.chip--庄家当前筹码
    local robCost = banker.robCost--抢庄消耗
    local offReason = banker.offReason--上任庄家下庄原因
    --如果老庄家是我 
    --DiceBabyHintNode
    if offReason == Enum.ShaiBaoOffReason.ChipNotEnough then
        local brokeAni = Utils.onlyCreateEffect(GSystem.DiceBabyBankerBrokeSpine,cc.p(0,0),false)
        self.BankerGoBrokeAnimation:addChild(brokeAni)
    end

    -- if offReason ~= 5 then
        self.BankerGoldNum:setString(Utils.getFormatNumber_MuitiLanguage(chip))
    -- else
    --     self:runAction(cc.Sequence:create(cc.DelayTime:create(1.5+1),cc.CallFunc:create(function ()
    --         self.BankerGoldNum:setString(Utils.getFormatNumber_MuitiLanguage(chip))
    --     end)))
    -- end
    
    local goldId = GSystem.GoldItemId
    local goldIcon = DataManager:getTbxData("Item",goldId).MiniItemIcon
    self.BankerGoldIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.MiniItem,goldIcon), ccui.TextureResType.plistType)
    self.BankerDiceBox = banker.diceBox

    if bankerInfo == nil then
        self.NotBankerText:setVisible(true)
        self.BankerNameText:setVisible(false)
        self.BankerGoldInfinite:setVisible(true)
        self.BankerGoldNum:setVisible(false)

        self.BankerHead:removeAllChildren()
        local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
        avater:InitTexture(true,101001,101001)
        avater:setCascadeOpacityEnabled(true)
        self.BankerHead:addChild(avater)
    
        self.BankerHeadFrame:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, 102001), ccui.TextureResType.plistType)
    else
        self.NotBankerText:setVisible(false)
        self.BankerGoldInfinite:setVisible(false)
        self.BankerGoldNum:setVisible(true)
        self.BankerNameText:setVisible(true)

        self.BankerNameText:setString(bankerInfo.name)
        Utils.setShortName(self.BankerNameText,bankerInfo.name, GSystem.NameLimitNumber)
    
        self.BankerHead:removeAllChildren()
        local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
        avater:InitTexture(string.utf8len(bankerInfo.avatar)<7,bankerInfo.avatar,bankerInfo.uid)
        avater:setCascadeOpacityEnabled(true)
        self.BankerHead:addChild(avater)
        self.BankerHeadFrame:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(bankerInfo.avatarFrame)), ccui.TextureResType.plistType)
    end

    if secBanker then
        self.GrabBankerPanel:setVisible(false)
        self.GrabBankerHeadNode:setVisible(true)
        self.GrabBankerHeadNode:removeAllChildren()
        local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
        avater:setCascadeOpacityEnabled(true)
        avater:InitTexture(string.utf8len(secBanker.avatar)<7,secBanker.avatar,secBanker.uid)
        self.GrabBankerHeadNode:addChild(avater)
    else
        self.GrabBankerPanel:setVisible(true)
        self.GrabBankerHeadNode:setVisible(false)
    end 
    Log.info("my userid:"..g_UserData:getUserId())
    self.DiceBabyBankerIcon_SVT:setVisible(g_SieveData:isMeBeBanker())

    self.GrabBankerSprite_SVT:setVisible(not g_SieveData:isMeBeBanker())
    self.QuitBankerSprite_SVT:setVisible(g_SieveData:isMeBeBanker())
    self.OperateListPanel:setVisible(not g_SieveData:isMeBeBanker())
    self.BankerOperatePanel:setVisible(g_SieveData:isMeBeBanker() and (g_GameData:getmUserstatus() == Enum.Userstatus.ShaibaoGaing or g_GameData:getmUserstatus() == Enum.Userstatus.ShaibaoRoom))
    self.BankerOperatePanel:getChildByName("BankerDoubleSelect"):setVisible(false)
    if g_SieveData:isMeBeBanker() and (g_GameData:getmUserstatus() == Enum.Userstatus.ShaibaoGaing or g_GameData:getmUserstatus() == Enum.Userstatus.ShaibaoRoom) then
        self.StopSprite_SVT:setVisible(false)
    end
end

function M:onShaiBao_Result(data)
    if not data or not data.betResult then  return end
    --处理我的金币变化
    for i,v in ipairs(data.betResult) do
        local addMouny = v.chipWin
        local addStr = "+"..Utils.getFormatNumber_MuitiLanguage(addMouny)
        local _label = ccui.Text:create()
        _label:setFontSize(36)
        _label:setString(addStr)
        _label:setColor(cc.c3b(252, 242, 98))
        local posMy = self.PlayerDataHead:getParent():convertToWorldSpaceAR(cc.p(self.PlayerDataHead:getPositionX(),self.PlayerDataHead:getPositionY()))
        _label:setPosition(posMy.x, posMy.y)
        _label:setVisible(false)
        self:addChild(_label)
        _label:runAction(cc.Sequence:create(cc.DelayTime:create(0.2*i+1.5+1),cc.Show:create(),cc.MoveBy:create(0.8, cc.p(0,150)),cc.FadeOut:create(0.5),cc.CallFunc:create(function()
            _label:removeFromParent()
        end)))
    end

    self:runAction(cc.Sequence:create(cc.DelayTime:create(1.5+1),cc.CallFunc:create(function ()
        self:refreshShaiBaoUserInfo()
    end)))


    

end
function M:allBetFlyOut()
    
end
function M:onShaiBao_s2cShaibaoGameover(data)
    self.betListRemove = false
    if (g_GameData:getmUserstatus() == Enum.Userstatus.ShaibaoGaing or g_GameData:getmUserstatus() == Enum.Userstatus.ShaibaoRoom) and not g_SieveData:isMeBeBanker() then
        self.StopSprite_SVT:setVisible(true)
    else
        self.StopSprite_SVT:setVisible(false)
    end
    self.OperateListPanel:setOpacity(255 * 0.3)

    if self.mIsInShaiBao then
        g_GameData:setmUserstatus(Enum.Userstatus.ShaibaoRoom)
    else
        g_GameData:setmUserstatus(Enum.Userstatus.Loking)
    end
    
    if self.mSieveCupPanel then

        -- _shaizi:setVisible(true)
        local function onShakeEnded()
            self.bIsShake = false
            
            self.mSieveCupPanel:openSieveCup()

            local diceType = g_SieveData:getShaiZiResult(data.dice.dice)
            local animationId = 0
            for i,v in ipairs(diceType) do
                if v==Enum.ShaibaoDiceType.Same then
                    --豹子
                    animationId = GSystem.DiceBabyLeopardSpine
                    self.SpecialCardTypeAnimation:removeAllChildren()
                    local effect = Utils.onlyCreateEffect(animationId,cc.p(0,0),false,true)
                    self.SpecialCardTypeAnimation:addChild(effect)
                elseif v==Enum.ShaibaoDiceType.Series then
                    --顺子
                    animationId = GSystem.DiceBabyStraightSpine
                    self.SpecialCardTypeAnimation:removeAllChildren()
                    local effect = Utils.onlyCreateEffect(animationId,cc.p(0,0),false,true)
                    self.SpecialCardTypeAnimation:addChild(effect)
                end
            end

            self:addOneDiceHistory(data.dice.dice)

            local diceType = g_SieveData:getShaiZiResult(data.dice.dice)
   
            for i,v in ipairs(diceType) do
                local acts_win = {}

                -- acts_win[#acts_win + 1] = cc.DelayTime:create(0.5)
                acts_win[#acts_win + 1] = cc.FadeIn:create(0.5)

                for k = 1, 7 do
                    acts_win[#acts_win + 1] = cc.DelayTime:create(0.12)
                    acts_win[#acts_win + 1] = cc.Hide:create()
                    acts_win[#acts_win + 1] = cc.DelayTime:create(0.12)
                    acts_win[#acts_win + 1] = cc.Show:create()
                end

                acts_win[#acts_win + 1] = cc.DelayTime:create(1.85)
                acts_win[#acts_win + 1] = cc.Hide:create()

                self.mAllBetTypeState[v].winShow:runAction(cc.Sequence:create(acts_win))
                
                if self.mAllShowPlayersBetList[v] then
                    for k,w in pairs(self.mAllShowPlayersBetList[v]) do
                        if tostring(k) == tostring(g_UserData:getUserId()) then
                            local posMy = self.PlayerDataHead:getParent():convertToWorldSpaceAR(cc.p(self.PlayerDataHead:getPositionX(),self.PlayerDataHead:getPositionY()))
                            local posBet = w.BetHeapPanel:getParent():convertToWorldSpaceAR(cc.p(w.BetHeapPanel:getPositionX(),w.BetHeapPanel:getPositionY()))
                            w.BetHeapPanel:setHeadNode(false)
                            self.mAllShowPlayersBetList[v][k]=nil
                            local moveTime = self:getMoveTime(posBet,posMy)
                            w.BetHeapPanel:runAction(cc.Sequence:create(cc.DelayTime:create(0.5+1),cc.MoveBy:create(moveTime, cc.p(posMy.x-posBet.x,posMy.y-posBet.y)),cc.CallFunc:create(function()
                                w.BetHeapPanel:removeFromParent()
                                
                            end)))
                        else
                            w.BetHeapPanel:setHeadNode(false)
                            self.mAllShowPlayersBetList[v][k]=nil
                            local posBet ={}
                            posBet.x,posBet.y = w.BetHeapPanel:getPosition()
                            local posMy = {}
                            posMy.x,posMy.y = math.random(800,1500 ),math.random(800,1500)
                            local moveTime = self:getMoveTime(posBet,posMy)
                            w.BetHeapPanel:runAction(cc.Sequence:create(cc.DelayTime:create(0.5+1),cc.MoveTo:create(moveTime, posMy),cc.CallFunc:create(function()
                                w.BetHeapPanel:removeFromParent()
                                
                            end)))
                        end
                    end
                end
            end

            for k,v in pairs(self.mAllShowPlayersBetList) do
                for q,w in pairs(v) do
                    if w then
                        local posMy = self.BankerHead:getParent():convertToWorldSpaceAR(cc.p(self.BankerHead:getPositionX(),self.BankerHead:getPositionY()))
                        local posBet = w.BetHeapPanel:getParent():convertToWorldSpaceAR(cc.p(w.BetHeapPanel:getPositionX(),w.BetHeapPanel:getPositionY()))
                        w.BetHeapPanel:setHeadNode(false)
                        local moveTime = self:getMoveTime(posBet,posMy)
                        w.BetHeapPanel:runAction(cc.Sequence:create(cc.DelayTime:create(0.5+1),cc.MoveBy:create(moveTime, cc.p(posMy.x-posBet.x,posMy.y-posBet.y)),cc.CallFunc:create(function()
                            w.BetHeapPanel:removeFromParent()
                            self.mAllShowPlayersBetList[k][q]=nil
                        end)))
                    end
                    
                end
            end

            for k,v in pairs(self.mAllBetTypeState) do
                v.onTouchShow:setVisible(false)
                -- v.onTouchShow:setOpacity(0)
                v.winShow:setVisible(false)
                v.doubleShow:setVisible(false)
                v.DoubleNode:removeAllChildren()
                -- v.DoubleLabel:setVisible(false)
            end
                end

        local sAct1 = cc.RotateTo:create(0.1, -45)
        local sAct2 = cc.RotateTo:create(0.1, 45)
        local sAct3 = cc.RotateTo:create(0.1, 0)
        local acts = {}

        local delayTime = data.timeLeft / 1000 - 5
        acts[#acts + 1] = cc.DelayTime:create(delayTime)
        acts[#acts + 1] = cc.CallFunc:create(function ()
            self.mSieveCupPanel:setPosition(-150,-150)
            self.mSieveCupPanel:setDiceBoxPos({x= 0,y=0})
            self.mSieveCupPanel:setVisible(true)
        end)
        acts[#acts + 1] = sAct1
        acts[#acts + 1] = sAct2
        acts[#acts + 1] = sAct1
        acts[#acts + 1] = sAct2
        acts[#acts + 1] = sAct1
        acts[#acts + 1] = sAct2
        acts[#acts + 1] = sAct1
        acts[#acts + 1] = sAct2

        acts[#acts + 1] = sAct3
        acts[#acts + 1] = cc.CallFunc:create(onShakeEnded)
        self.mSieveCupPanel:runAction(cc.Sequence:create(acts))
        local volume = 1
        if g_GameData:getmUserstatus() ~= Enum.Userstatus.ShaibaoGaing and g_GameData:getmUserstatus() ~= Enum.Userstatus.ShaibaoRoom then
            volume = volume * self.outShaibaoVolume
        end
        g_SieveData:playSound008(volume)
        self.mSieveCupPanel:initDices(data)
    end
    
    print("onShaiBao_s2cShaibaoGameover")
    self.mLeftTime = 0

    --self.mAllBetTypeState[Enum.ShaibaoDiceType.Count1].winShow 
end

function M:refreshDiceList()
    self.ModelRecordListView:removeAllItems()
    self.ModelRecordListView:setScrollBarEnabled(false)
    local dicesData = g_SieveData:getAllDicesData()
    if dicesData then
        for i,v in ipairs(dicesData) do
            if i<= GSystem.DiceResultShowLimit then
                local panel = UIManager:createPanelOnly("app.gui.home.ShaiBaoRecordOnePanel")
                if panel then
                    panel:initData(v)
                    local _widget  = Utils.createWidgetByPanel(panel)
                    if _widget then
                        self.ModelRecordListView:pushBackCustomItem(_widget)
                    end
                    
                end
            end
        end
    end
end
function M:addOneDiceHistory(data)
    if not data then return end
    if not self.ModelRecordListView then return end
    local panel = UIManager:createPanelOnly("app.gui.home.ShaiBaoRecordOnePanel")
    if panel then
        panel:initData(data)
        panel:flashOne()
        local _widget  = Utils.createWidgetByPanel(panel)
        if _widget then
            self.ModelRecordListView:insertCustomItem(_widget,0)
        end

        if #self.ModelRecordListView:getItems()>GSystem.DiceResultShowLimit then
            self.ModelRecordListView:removeLastItem()
        end
                    
    end
end

--筛宝相关事件消息
-- function M:onShaiBao_refreshInfo(data)
--     self.DiceBabyBankerIcon_SVT:setVisible(g_SieveData:isMeBeBanker())
--     self:onShaiBao_refreshInfo(data)
--     self:refreshDiceList()
-- end

function M:onShaiBao_BetEvent(bet)
    -- Log.info("===onShaiBao_BetEvent===")
    if not bet or not bet.betType  then return end
    -- Log.print_table(bet)
    
    local BetTexturePaths = self.BetTexturePaths_tw
    if g_UserData:getSystemLanguage() == Enum.LanguageType.zh_tw then
        BetTexturePaths = self.BetTexturePaths_tw
    elseif g_UserData:getSystemLanguage() == Enum.LanguageType.en  then
        BetTexturePaths = self.BetTexturePaths_en
    elseif g_UserData:getSystemLanguage() == Enum.LanguageType.zh_cn  then
        BetTexturePaths = self.BetTexturePaths_cn
    end
    local v = bet

    if v.uid == g_UserData:getUserId() then
        g_GameData:setmUserstatus(Enum.Userstatus.ShaibaoGaing)
    end
    
    if not self.mAllShowPlayersBetList[v.betType] then
        self.mAllShowPlayersBetList[v.betType]={}
    end
    if self.mAllShowPlayersBetList[v.betType][v.uid] then
    else
        for i,node in ipairs(self.betTypePositionsNode[v.betType]) do
            local childrien = node:getChildren()
            if childrien and #childrien > 0 then
                if i == g_SieveData:getShowNumLimit(v.betType) then
                    local AllPlayerBetData = g_SieveData:getAllPlayerBetData()
                    local limitBetCount = 0
                    local limitBetCount_uid = 0
                    for uid, player in pairs(self.mAllShowPlayersBetList[v.betType]) do
                        if (limitBetCount == 0 or AllPlayerBetData[uid].mBetCountList[v.betType] < limitBetCount) and uid ~= g_UserData:getUserId() then
                            limitBetCount = AllPlayerBetData[uid].mBetCountList[v.betType]
                            limitBetCount_uid = uid
                        end
                    end
                    if (AllPlayerBetData[v.uid].mBetCountList[v.betType] > limitBetCount or v.uid == g_UserData:getUserId()) and limitBetCount_uid ~= 0 then
                        self.mAllShowPlayersBetList[v.betType][limitBetCount_uid].BetHeapPanel:removeFromParent()
                        self.mAllShowPlayersBetList[v.betType][limitBetCount_uid] = nil

                        self.mAllShowPlayersBetList[v.betType][v.uid]={}
                        self.mAllShowPlayersBetList[v.betType][v.uid].BetHeapPanel = UIManager:createPanelOnly("app.gui.home.BetHeapPanel")

                        self.mAllShowPlayersBetList[v.betType][v.uid].BetHeapPanel:setPosition(-30, -30)
                        if v.uid == g_UserData:getUserId() then
                            node:setLocalZOrder(10)
                        end
                        node:addChild(self.mAllShowPlayersBetList[v.betType][v.uid].BetHeapPanel)
                        self.mAllShowPlayersBetList[v.betType][v.uid].BetHeapPanel:initData(v)
                        break
                    end
                end
            else
                self.mAllShowPlayersBetList[v.betType][v.uid]={}
                self.mAllShowPlayersBetList[v.betType][v.uid].BetHeapPanel = UIManager:createPanelOnly("app.gui.home.BetHeapPanel")
                self.mAllShowPlayersBetList[v.betType][v.uid].BetHeapPanel:setPosition(-30, -30)
                if v.uid == g_UserData:getUserId() then
                    node:setLocalZOrder(10)
                end
                node:addChild(self.mAllShowPlayersBetList[v.betType][v.uid].BetHeapPanel)
                self.mAllShowPlayersBetList[v.betType][v.uid].BetHeapPanel:initData(v)
                break
            end
        end
        -- 加入到相应的位置 并且 初始化
    end
    if not self.mAllShowPlayersBetList[v.betType][v.uid] then
        return
    end
    local betPath=""
    local pos={}
    local betType=Enum.ShaiBaoBetTye.Bai
    local _chiplist = {"100","1000","1W","10W","100W"}
    if self.mAllShowPlayersBetList[v.betType][v.uid].BetHeapPanel then
        
        if v.chip>=1000000 then
            betPath = BetTexturePaths.baiwan
            local ChipNode = self.OperateListPanel:getChildByName("Chip_".._chiplist[5].."_SVT")
            pos.x,pos.y = ChipNode:getParent():convertToWorldSpaceAR(cc.p(ChipNode:getPositionX(),ChipNode:getPositionY()))
            betType=Enum.ShaiBaoBetTye.BaiWan
        elseif v.chip >= 100000 then
            betPath = BetTexturePaths.shiwan
            local ChipNode = self.OperateListPanel:getChildByName("Chip_".._chiplist[4].."_SVT")
            pos.x,pos.y = ChipNode:getParent():convertToWorldSpaceAR(cc.p(ChipNode:getPositionX(),ChipNode:getPositionY()))
            betType=Enum.ShaiBaoBetTye.ShiWan
        elseif v.chip >= 10000 then
            betPath = BetTexturePaths.wan
            local ChipNode = self.OperateListPanel:getChildByName("Chip_".._chiplist[3].."_SVT")
            pos.x,pos.y = ChipNode:getParent():convertToWorldSpaceAR(cc.p(ChipNode:getPositionX(),ChipNode:getPositionY()))
            betType=Enum.ShaiBaoBetTye.Wan
        elseif v.chip >=1000 then
            betPath = BetTexturePaths.qian
            local ChipNode = self.OperateListPanel:getChildByName("Chip_".._chiplist[2].."_SVT")
            pos.x,pos.y = ChipNode:getParent():convertToWorldSpaceAR(cc.p(ChipNode:getPositionX(),ChipNode:getPositionY()))
            betType=Enum.ShaiBaoBetTye.Qian
        elseif v.chip >=100 then
            betPath = BetTexturePaths.bai
            local ChipNode = self.OperateListPanel:getChildByName("Chip_".._chiplist[1].."_SVT")
            pos.x,pos.y = ChipNode:getParent():convertToWorldSpaceAR(cc.p(ChipNode:getPositionX(),ChipNode:getPositionY()))
            betType=Enum.ShaiBaoBetTye.Bai
        end
    end

    if v.uid == g_UserData:getUserId() and (g_GameData:getmUserstatus() == Enum.Userstatus.ShaibaoGaing or g_GameData:getmUserstatus() == Enum.Userstatus.ShaibaoRoom) then
        self.mAllBetTypeState[v.betType].onTouchShow:setVisible(true)
        self.mAllBetTypeState[v.betType].onTouchShow:runAction(cc.Sequence:create(cc.FadeIn:create(GSystem.DiceBabyClickResultVanishTime / 1000/2),cc.FadeOut:create(GSystem.DiceBabyClickResultVanishTime / 1000/2),cc.CallFunc:create(function ()
            self.mAllBetTypeState[v.betType].onTouchShow:setVisible(false)
        end)))
    end

    if v.needAct then
        local betSprite = cc.Sprite:createWithSpriteFrameName(betPath)
        if betSprite then
            local volume = 1
            if v.uid==g_UserData:getUserId() then
                betSprite:setPosition(cc.p(pos.x, pos.y))
            else
                volume = volume * self.otherVolume
                betSprite:setPosition(cc.p(math.random(-100,-50), math.random(100, 1200)))
            end
            
            self:addChild(betSprite)
            --getBetAtPosition
            local armPos = self.mAllShowPlayersBetList[v.betType][v.uid].BetHeapPanel:getBetAtPosition(betType)
            local betPos = {}
            betPos.x,betPos.y = betSprite:getPosition()
            local moveTime = self:getMoveTime(betPos,armPos)
            if g_GameData:getmUserstatus() ~= Enum.Userstatus.ShaibaoGaing and g_GameData:getmUserstatus() ~= Enum.Userstatus.ShaibaoRoom then
                volume = volume * self.outShaibaoVolume
            end
            g_SieveData:playSound004(volume)
            betSprite:runAction(cc.ScaleTo:create(moveTime, 0.5))
            betSprite:runAction(cc.Sequence:create(cc.MoveTo:create(moveTime,cc.p(armPos.x,armPos.y)),cc.CallFunc:create(function()
                if self.mAllShowPlayersBetList[v.betType] and self.mAllShowPlayersBetList[v.betType][v.uid] and self.mAllShowPlayersBetList[v.betType][v.uid].BetHeapPanel then
                    self.mAllShowPlayersBetList[v.betType][v.uid].BetHeapPanel:addBet(betType,v.isAllin)
                end
                
                betSprite:removeFromParent()
                
            end)))
        end
    else
        if self.mAllShowPlayersBetList[v.betType] and self.mAllShowPlayersBetList[v.betType][v.uid] and self.mAllShowPlayersBetList[v.betType][v.uid].BetHeapPanel then
            self.mAllShowPlayersBetList[v.betType][v.uid].BetHeapPanel:addBet(betType,v.isAllin)
        end
    end

end

function M:getMoveTime(pos1,pos2)
    local speed = 2000
    local x = math.sqrt((pos2.x-pos1.x)^2 + (pos2.y-pos1.y)^2)
    local time = x / speed
    return time
end

function M:onShaiBao_Double(data)
    local doubleAreas = g_SieveData:getDoubleAreaList()
    for i,v in ipairs(doubleAreas) do
        self.mAllBetTypeState[v].doubleShow:setVisible(true)

        local DoubleTexturePaths = "02_04_DiceBaby/button_100_zh_TW.png"
        if g_UserData:getSystemLanguage() == Enum.LanguageType.zh_tw then
            DoubleTexturePaths = "02_04_DiceBaby/button_100_zh_TW.png"
        elseif g_UserData:getSystemLanguage() == Enum.LanguageType.en  then
            DoubleTexturePaths = "02_04_DiceBaby/button_100_en.png"
        elseif g_UserData:getSystemLanguage() == Enum.LanguageType.zh_cn  then
            DoubleTexturePaths = "02_04_DiceBaby/button_100_zh_CN.png"
        end
        local doubleBet = cc.Sprite:createWithSpriteFrameName(DoubleTexturePaths)
        if doubleBet then
            if g_SieveData:isMeBeBanker() then
                doubleBet:setPosition(self.BankerDoublePanel:getParent():convertToWorldSpaceAR(cc.p(self.BankerDoublePanel:getPositionX(),self.BankerDoublePanel:getPositionY())))
            else
                doubleBet:setPosition(self.BankerHead:getPosition())
            end
            self:addChild(doubleBet)

            local armPos = self.mAllBetTypeState[v].DoubleNode:getParent():convertToWorldSpaceAR(cc.p(self.mAllBetTypeState[v].DoubleNode:getPositionX(),self.mAllBetTypeState[v].DoubleNode:getPositionY()))
            local betPos = {}
            betPos.x,betPos.y = doubleBet:getPosition()
            local moveTime = self:getMoveTime(betPos,armPos)
            g_SieveData:playSound004()
            doubleBet:runAction(cc.ScaleTo:create(moveTime, 0.5))
            doubleBet:runAction(cc.Sequence:create(cc.MoveTo:create(moveTime,cc.p(armPos.x,armPos.y)),cc.CallFunc:create(function()
                local doublenode = cc.Sprite:createWithSpriteFrameName(DoubleTexturePaths)
                self.mAllBetTypeState[v].DoubleNode:addChild(doublenode)
                doublenode:setPosition(cc.p(0,0))
                if v > 6 then
                    doublenode:setScale(0.83)
                else
                    doublenode:setScale(0.5)
                end
                doubleBet:removeFromParent()
                
            end)))
        end
        -- self.mAllBetTypeState[v].DoubleLabel:setVisible(true)
    end

    if g_SieveData:isMeBeBanker() and #doubleAreas > 0 then
        g_GameData:setmUserstatus(Enum.Userstatus.ShaibaoGaing)
        self:refreshShaiBaoUserInfo()
    end

end

function M:onShaiBao_BankerDownLoadRefresh(data)
    if not data or data.offReason == Enum.ShaiBaoOffReason.On or data.offReason == Enum.ShaiBaoOffReason.ReqOff then return end
    if self.mIsInShaiBao then
        local panel = UIManager:getOrCreatePanel("app.gui.home.BankerDownShaiBaoTipLayer")
        if panel then
            panel:showToScene()
            panel:initDataByType(data.offReason)
        end
    else
        local panel = UIManager:createPanelOnly("app.gui.home.BankerDownTipResultLayer")
        if panel then
            self:addChild(panel)
            panel:initDataByType(data.offReason)
            panel:setPosition(self.DiceBabyHintNode:getPosition())
            panel:setLocalZOrder(601)
            panel:runAction(cc.Sequence:create(cc.DelayTime:create(3.0),cc.CallFunc:create(function ()
                panel:removeFromParent()
            end)))
        end
    end
    
end

function M:UIMainLayer_AddFriend(data)
    local friend=data.friend
    local applyUid=data.applyUid
    if not g_UserData:isSelfUserId(applyUid) then
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
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
    
    self:doRegEvent(Constant.CustomEvent.UpdateUserResource, "onUpdateUserResource")
    self:doRegEvent(Constant.CustomEvent.OnShopListArrive, "onShopListArrive")
    self:doRegEvent(Constant.CustomEvent.UpdateUserInfo, "refreshUserInfo")
    self:doRegEvent(Constant.CustomEvent.OnEmailListArrive, "OnEmailListArrive")
    self:doRegEvent(Constant.CustomEvent.NewEmailArrive, "onNewEmailArrive")
    self:doRegEvent(Constant.CustomEvent.RemoveWalkingLantern, "RemoveWalkingLantern")
    self:doRegEvent(Constant.CustomEvent.OnTaskListArrive, "OnTaskListArrive")
    self:doRegEvent(Constant.CustomEvent.OnBagListArrive, "OnBagListArrive")
    self:doRegEvent(Constant.CustomEvent.StartGame, "startGame")
    self:doRegEvent(Constant.CustomEvent.UpdateHotShow, "updateHotShow")
    self:doRegEvent(Constant.CustomEvent.refreshShowGift, "refreshShowGift")
    self:doRegEvent(Constant.CustomEvent.refreshFriendList, "refreshFriendList")
    self:doRegEvent(Constant.CustomEvent.mainRequestAddFriend, "requestAddFriend")
    self:doRegEvent(Constant.CustomEvent.requestRemoveFriend, "requestRemoveFriend")
    self:doRegEvent(Constant.CustomEvent.mainRequestShowFriend, "requestShowFriend")
    self:doRegEvent(Constant.CustomEvent.mainReBindAllNode, "mainReBindAllNode")
    self:doRegEvent(Constant.CustomEvent.mainIsVisibleFriendPanel, "isVisibleFriendPanel")
    self:doRegEvent(Constant.CustomEvent.RunSkipEvent, "RunSkipEvent")
    self:doRegEvent(Constant.CustomEvent.UIMainLayer_s2cBigSmallBankerInfo, "UIMainLayer_s2cBigSmallBankerInfo")
    self:doRegEvent(Constant.CustomEvent.UIMainLayer_GuessSizeHintNode, "UIMainLayer_GuessSizeHintNode")
    self:doRegEvent(Constant.CustomEvent.UIMainLayer_updateLuckPlayer, "UIMainLayer_updateLuckPlayer")
    self:doRegEvent(Constant.CustomEvent.UIMainLayer_s2cBigSmallRobResult, "UIMainLayer_s2cBigSmallRobResult")

    self:doRegEvent(Constant.CustomEvent.ShaiBao_refreshInfo, "onShaiBao_refreshInfo")
    self:doRegEvent(Constant.CustomEvent.ShaiBao_Start, "onShaiBao_Start")
    self:doRegEvent(Constant.CustomEvent.ShaiBao_RefreshBankerInfo, "onShaiBao_RefreshBankerInfo")
    self:doRegEvent(Constant.CustomEvent.ShaiBao_Result, "onShaiBao_Result")
    self:doRegEvent(Constant.CustomEvent.ShaiBao_s2cShaibaoGameover, "onShaiBao_s2cShaibaoGameover")
    self:doRegEvent(Constant.CustomEvent.ShaiBao_BetEvent, "onShaiBao_BetEvent")
    self:doRegEvent(Constant.CustomEvent.ShaiBao_Double, "onShaiBao_Double")
    self:doRegEvent(Constant.CustomEvent.ShaiBao_BankerDownLoadRefresh, "onShaiBao_BankerDownLoadRefresh")
    self:doRegEvent(Constant.CustomEvent.refreshMuteList,"refreshMuteNum")

    self:doRegEvent(Constant.CustomEvent.PlayerSayAgoraMessageChange, "onPlayerSayAgoraMessageChange")
    self:doRegEvent(Constant.CustomEvent.PlayerJoinRoomSeccess,"onPlayerJoinRoomSeccess")
    self:doRegEvent(Constant.CustomEvent.ShaiBao_refreshSayHeroHead,"onRefreshSayHeroHead")
    self:doRegEvent(Constant.CustomEvent.ShaiBao_robBetResult,"onShaiBao_robBetResult")
    self:doRegEvent(Constant.CustomEvent.UIMainLayer_AddFriend,"UIMainLayer_AddFriend")

    -- self:doRegEvent(Constant.CustomEvent.ShaiBao_s2cShaibaoMagicEmojiBroadcast, "onShaibaoMagicEmoji")
    self:doRegEvent("ShaiBao_s2cShaibaoMagicEmojiBroadcast", "onShaibaoMagicEmoji")
    self:doRegEvent("PlayerLevelRoom", "playerLevelAudioRoom")
    self:doRegEvent("UIMainLayer_refreshChatHot", "refreshChatHot")
    self:doRegEvent("PlayerJoinRoomFail", "playerJoinRoomFail")
    self:doRegEvent("PlayerLevelRoomFail", "playerLevelRoomFail")
    self:doRegEvent("mainlayerEnterAnimation", "runEnterAnimation")
end

function M:s2cGameInviteBroadcast(data)
    local uid=data.uid
    local nickname=data.nickname
    local roomId=data.roomId
    local password=data.password
    local roomName=data.roomName
    
end

function M:MuteAudio(uid,mute)
    if self.MuteTimes < 3 then
        if kz.IAgoraRoomManager:instance():muteRemoteAudioStream(tonumber(uid),mute) == 0 then
            self.MuteTimes = 0
            return true
        else
            self:MuteAudio(uid,mute)
        end
    else
        self.MuteTimes = 0
        return false
    end
end

--收到魔法表情消息
function M:onShaibaoMagicEmoji(data)
    if not (g_GameData:getmUserstatus() == Enum.Userstatus.ShaibaoRoom or g_GameData:getmUserstatus() == Enum.Userstatus.ShaibaoGaing) then
        return
    end
    local fromUid = data.fromUid
    local itemId = data.itemId
    local startpos,endpos
    local zOrder
    local headinfo

    local item = DataManager:getTbxData("Item",itemId)
    if nil==item then
        return
    end

    local ismesend = g_UserData:isSelfUserId(fromUid)

    if UIManager:isPanelOpenOrOpening("app.gui.home.UIBankerMagicEmoji") then
        local panel = UIManager:getPanel("app.gui.home.UIBankerMagicEmoji")
        if panel then
            if ismesend then
                startpos = panel:getMagicEmojiPosition(itemId)
                --zOrder =panel:getLocalZOrder()+1--本人发送魔法表情动画显示在魔法表情页面的上层
            else
                --zOrder =panel:getLocalZOrder()-1--其他魔法表情动画显示在魔法表情页面的下层
            end
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
                    g_SieveData:playEffect("music/02sound/"..GSystem.MagicEmojiFlyingSound..".mp3",false)
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
                                g_SieveData:playEffect("music/02sound/"..item.SoundEffect..".mp3",false)
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

    endpos = cc.p(self.BankerHead:getPositionX(),self.BankerHead:getPositionY()+_dyw+80)
    if startpos == nil then
        if not ismesend then--其他人发的魔法表情
            headinfo = self.mEmojiHeadInfo[fromUid]
            if headinfo then--头像存在则不重新创建
                headinfo.num = headinfo.num + 1
                startpos = Utils.getNodeWordPosition(headinfo.head)
            else--随机区域生成玩家头像，从头像位置发出魔法表情
                local panelidx = math.random(1,2)
                local panelsize = self.mEmojiPanelList[panelidx]:getContentSize()
                local panelpos = cc.p(self.mEmojiPanelList[panelidx]:getPosition())
                local randompos = cc.p(math.random(0,panelsize.width), math.random(0,panelsize.height))

                local magichead = cc.Node:create()
                magichead:setPosition(0,0)
                if magichead then
                    local flystartpos = cc.p(0,randompos.y)
                    if panelidx%2==1 then
                        flystartpos.x = panelsize.width/2-panelpos.x-48
                    else
                        flystartpos.x = 48 + self:getContentSize().width-panelpos.x+panelsize.width/2
                    end
                    self.mEmojiPanelList[panelidx]:addChild(magichead)
                    magichead:setPosition(flystartpos)
                    headinfo = {num = 1,head = magichead,idx = panelidx,uid = fromUid}
                    self.mEmojiHeadInfo[fromUid] = headinfo
                    if g_SieveData:getInfoByuid(fromUid) then
                        self:createAvatar(g_SieveData:getInfoByuid(fromUid))
                    else
                        g_SieveData:getPlayerAvatar(fromUid)
                    end
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
            startpos = cc.p(self.PlayerDataHead:getPosition())
        end
    end

    SendMagicEmoji()
end

function M:onShaiBao_robBetResult(data)
    if data == 4 then
        UIUtils.popToadtByMessageId("52001")
    elseif data == 2 or data == 3 or data == 5 then
        UIUtils.popToadtByMessageId("60022")
    end
end

function M:onRefreshSayHeroHead(data)
    for i,v in ipairs(data.avatarInfo) do
        if self.mShaiBao.mAllUserAudios[v.uid] then
            self.mShaiBao.mAllUserAudios[v.uid]:setHeadIcon(v.avatar,v.uid)
        end
        if self.mEmojiHeadInfo[v.uid] then
           self:createAvatar(v)
        end
    end
end

function M:createAvatar(data)
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    avater:setCascadeOpacityEnabled(true)
    avater:InitTexture(string.utf8len(data.avatar)<7,data.avatar,data.uid)
    local HeadFrame = ccui.ImageView:create()
    HeadFrame:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(data.avatarFrame)), ccui.TextureResType.plistType)
    avater:setScale(0.8)
    avater:setPosition(-72,-155)
    HeadFrame:setScale(0.8)
    HeadFrame:setPosition(0,0)
    self.mEmojiHeadInfo[data.uid].head:addChild(avater)
    self.mEmojiHeadInfo[data.uid].head:addChild(HeadFrame)
end
function  M:setOnePlayerAudio(data)
    local UserAudios = 0
    for i, v in ipairs(self.mShaiBao.mAllUserAudios) do
        if tonumber(v.voicePanel:getUid()) ~= -1 then
            UserAudios = UserAudios + 1
        end
    end
    if self.lastUserAudios ~= UserAudios then
        self.lastUserAudios = UserAudios
        self:refreshAudioPos()
    end
    for i, v in ipairs(self.mShaiBao.mAllUserAudios) do
        if v.voicePanel:getUid() == data.uid then
            v.voicePanel:setVoice(data.volume,data.uid,false)
            return
        end
    end
    
    local audioLen = Utils.getTableLength(self.mShaiBao.mAllUserAudios)
    if audioLen + 1 <= GSystem.VoiceHeadShowLimit then
        local voicePanel = UIManager:createPanelOnly("app.gui.home.ShaiBaoAudionPlayerPanel")
        if voicePanel then
            local playerData = g_SieveData:getPlayerAvatar(data.uid)
            if playerData then
                voicePanel:setHeadIcon(playerData,data.uid)
            end
            self.AudioHeadPanel:setTouchEnabled(false)
            self.AudioHeadPanel:addChild(voicePanel)
            voicePanel:setVoice(data.volume,data.uid,true)
            self.mShaiBao.mAllUserAudios[audioLen + 1] = {}
            self.mShaiBao.mAllUserAudios[audioLen + 1].voicePanel=voicePanel
            self:refreshAudioPos()
        end
    else
        for i, v in pairs(self.mShaiBao.mAllUserAudios) do
            if tonumber(v.voicePanel:getUid()) == -1 then
                local playerData = g_SieveData:getPlayerAvatar(data.uid)
                if playerData then
                    v.voicePanel:setVoice(data.volume,data.uid,true)
                    v.voicePanel:setHeadIcon(playerData,data.uid)
                    -- v.voicePanel:setPosition(audioLen*60, 0)
                    -- v.voicePanel:runAction(cc.FadeIn:create(GSystem.DiceBabyHeadAppearTime))
                end
                break
            end
        end
        self:refreshAudioPos()
    end
end

function M:refreshAudioPos()
    table.sort(self.mShaiBao.mAllUserAudios,function (a,b)
        return tonumber(a.voicePanel:getUid())>tonumber(b.voicePanel:getUid())
    end )
    for i,node in pairs(self.mShaiBao.mAllUserAudios) do
        if node.voicePanel then
            node.voicePanel:setPosition((i-1)*65, 0)
        end
    end
end

function M:onPlayerSayAgoraMessageChange(data)
    if not Utils.isEmptyTable(data) then
        --self.mBgVolumeChgTime = 0.4
        --SoundSystemManager:setVolumeCoefficient(0.15)
        for _,v in ipairs(data) do
            if v.uid == 0 and g_SieveData:getIsMicOpened() then
                --我自己的 语音
                self.MicLoadingBar:setPercent(v.volume/255*100)
            else
                if v.volume > GSystem.DiceBabyHeadVolumeAstrict / 100 * 255 then
                    self:setOnePlayerAudio(v)
                end
            end
        end
        SoundSystemManager:setBackMusicVolumeByPercent(0.5)
        self.mNeedUpBackMusic = false
        self.mNeedUpBackMusicTimes = 1 * 60
    end
end
function M:setMicIsOpen(isOpen,needSetMicOpened)
    if isOpen then

        if not self.bIsInAudioRoom then
            UIUtils.popToadtByMessageId(Constant.Define.UnJoinAudioRoom)
            kz.IAgoraRoomManager:instance():joinRoom("",GSystem.ShaiBaoAudioRoomId,tostring(g_UserData:getUserId()),g_UserData:getUserId())
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
        -- self.MicButton:setBright(isOpen)
        if needSetMicOpened then
            g_SieveData:setIsMicOpened(isOpen)
        end
        if isOpen then
            self.mClickOpenAudioFail = false
            self.MicSprite:setSpriteFrame("04_01_Chat/button_057.png")
            print("she zhi cheng gong  da kai")
        else
            self.MicSprite:setSpriteFrame("04_01_Chat/button_058.png")
            print("she zhi cheng gong  guan bi")
            self.MicLoadingBar:setPercent(0)
        end
    end
end

function M:TipPlayerOpenAudio()
    UIUtils.popToadtByMessageId(Constant.Define.MicrophonePermissionsNotOpen)
end

function M:onPlayerJoinRoomSeccess(data)
    self.bIsInAudioRoom = true
    kz.IAgoraRoomManager:instance():enableLocalAudio(true)
    kz.IAgoraRoomManager:instance():enableLocalAudio(false)
    self:setMicIsOpen(g_SieveData:getIsMicOpened(),false)

    if g_SieveData:getAudioIsSound() then
        if kz.IAgoraRoomManager:instance():muteAllRemoteAudioStreams(true)>=0 then
            self.VoiceSprite:setSpriteFrame("04_01_Chat/button_059.png")
            for k, v in pairs(g_SieveData:getmMuteList()) do
                self:MuteAudio(v,true)
            end
        end
    else
        if kz.IAgoraRoomManager:instance():muteAllRemoteAudioStreams(false)>=0 then
            self.VoiceSprite:setSpriteFrame("04_01_Chat/button_060.png")
        end
    end
    self:refreshMuteNum()
end

function M:onShutupPanelTouchEvent(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        local   panel=UIManager:getOrCreatePanel("DiceBabyShutupPopUp")
        if panel then
            panel:showToScene()
        end
    end
end

function M:refreshMuteNum()
    if #g_SieveData:getmMuteList() > 0 then
        self.ShutupPanel:setVisible(true)
        self.ShutupNum:setString(#g_SieveData:getmMuteList())
    else
        self.ShutupPanel:setVisible(false)
    end
end

function M:onCleanup()
    M.super.onCleanup(self)
end

function M:playerLevelAudioRoom()
    
end

function M:refreshChatHot()
    local is=g_ChatData:isTouBaoChatShowHot()
    self.ChatTipDotIcon:setVisible(is)
end

function M:playerJoinRoomFail()

end

function M:playerLevelRoomFail()

end

return M