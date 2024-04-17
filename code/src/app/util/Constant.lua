cc.exports.Constant = {}

Constant.ResponseUnknowCode = -1

Constant.MaxPlayers = 7

Constant.OpenMaxOffset = 50

Constant.SEAT_INVAILD_ID = -1

Constant.Resource = {
    DIAMOND = 1,
    GOLD = 2,
    MONEY = 3,
}

Constant.TunrnTime = 8000

Constant.PreferenceKey = {
    RESEND_SMS_TIMESTAMP = "resend_sms_timestamp",

    AREA_CODE = "area_code",
    PHONE_NUMBER = "phone_number",

    LOGIN_AUTO = "login_auto",
    GUESTID = "guestId",
    ACCOUNT = "account",
    PASSWARD = "password",
    ACCOUNT_TYPE = "account_type",
    TOKEN = "token",
    TCP_SERVER = "tcp_server",
    KCP_SERVER = "kcp_server",

    MOVE_OPERATE_CODE = "move_operate_code",
    NUMAL_FIRE_CODE = "numal_fire_code",

    MUSIC_VOLUME = "music_volume",
    SOUND_VOLUME = "sound_volume",
    VOICE_VOLUME = "voice_volume",

    MUSIC_SWITCH = "music_switch",
    SOUND_SWITCH = "sound_switch",
    VOICE_SWITCH = "voice_switch",
    MIC_SWITCH = "mic_switch",

    SHAKE_SWITCH = "shake_switch",

    MultiLanguage = "MultiLanguage",

    ISFIRSTINSTALL = "isFirstInstall",

    LAST_LOGINTYPE = "lastLoginType",
}

Constant.CustomEvent = {
    SmsCodeResult = "SmsCodeResult",
    LoginResult = "LoginResult",
    RegisterResult = "RegisterResult",
    

    FileDownloadCompleted = "FileDownloadCompleted",

    --切到后台
    ApplicationDidEnterBackground = "ApplicationDidEnterBackground",
    --切回
    ApplicationWillEnterForeground = "ApplicationWillEnterForeground",

    --热更新
    UpdatePrass="UpdatePrass",
    UpdateSessess="UpdateSessess",
    UpdateFail="UpdateFail",
    UpdateVerisonShow="UpdateVerisonShow",

    --更新用户信息
    UpdateUserInfo = "UpdateUserInfo",
    CheckUserNameExist = "CheckUserNameExist",
    UpdateUserResource = "UpdateUserResource",
    RefrshUserInfo = "RefrshUserInfo",
    onAvatarFrameListArrive = "onAvatarFrameListArrive",
    UIPersonalInfoLayer_refreshHot = "UIPersonalInfoLayer_refreshHot",
    UIHeadFrameLayer_refreshHot="UIHeadFrameLayer_refreshHot",
    UISettingAccountLayer_refreshHot="UISettingAccountLayer_refreshHot",
    UISettingAccountLayer_refreshBindState="UISettingAccountLayer_refreshBindState",
    UISettingLayer_refreshHot="UISettingLayer_refreshHot",
    UIPackageLayer_refreshHot="UIPackageLayer_refreshHot",
    ClosePersonalInfoPanel = "ClosePersonalInfoPanel",
    CheckDescError = "CheckDescError",
    
    -- 房间内
    EnterRoom = "EnterRoom",
    GameStart = "GameStart",
    GameReshakeDiceBox = "GameReshakeDiceBox",
    GameMagicEmoji = "GameMagicEmoji",
    GameTurn = "GameTurn",
    GameDiceUpdate = "GameDiceUpdate",
    GameCallPoint = "GameCallPoint",
    GameOpenDiceBox = "GameOpenDiceBox",
    GameOpenErrorGoldNotEnough = "GameOpenErrorGoldNotEnough",
    GameExtraCompare = "GameExtraCompare",
    GameExtraCompareChoose = "GameExtraCompareChoose",
    GameCallSeatChoose = "GameCallSeatChoose",
    GameOver = "GameOver",
    UpdateDicBox = "UpdateDicBox",
    SitDown = "SitDown",

    GameUpdateNextGameTime = "GameUpdateNextGameTime",

    GamePlayerLeave = "GamePlayerLeave",
    GamePlayerUpdate = "GamePlayerUpdate",
    AudienceListUpdate = "AudienceListUpdate",
    GamePlayerSeatChenged = "GamePlayerSeatChenged",

    GameUpdateComparePool="GameUpdateComparePool",

    GameExtraCallback="GameExtraCallback",
    GamePlayerGoldChange="GamePlayerGoldChange",

    GameMachStateChange = "GameMachStateChange",
    UIGameLayer_refreshHot = "UIGameLayer_refreshHot",

    RefreshDiceBoxUI = "RefreshDiceBoxUI",

    --麦克风音量变化
    PlayerSayAgoraMessageChange = "PlayerSayAgoraMessageChange",
    --玩家加入房间成功
    PlayerJoinRoomSeccess = "PlayerJoinRoomSeccess";
    PlayerJoinRoomFail = "PlayerJoinRoomFail";
    --玩家离开房间
    PlayerLevelRoom = "PlayerLevelRoom",
    PlayerLevelRoomFail = "PlayerLevelRoomFail",

    --刷新吹牛在线人数
    refreshGamingPlayerNum = "refreshGamingPlayerNum",

    --玩家语音开关改变
    PlayerChangeAudioSetting = "PlayerChangeAudioSetting",


    --发起底注提升推送
    GameLaunchVote = "GameLaunchVote",
    GameSomeoneVote = "GameSomeoneVote",
    GameBetBaseUpdateSeccess="GameBetBaseUpdateSeccess",
    --GameSomeoneVoteResult="GameSomeoneVoteResult",

    --猜大小
    OnCloseGuessSizeLayer = "OnCloseGuessSizeLayer",

    -- 充值&商城
    OnShopListArrive = "OnShopListArrive",
    OnShopInfoUpdate = "OnShopInfoUpdate",
    RefreshChargeData = "RefreshChargeData",
    refreshVipUI = "refreshVipUI",

    --邮箱
    OnEmailListArrive = "OnEmailListArrive",
    RefreshEmailData = "RefreshEmailData",
    RefreshEmailUI = "RefreshEmailUI",
    NewEmailArrive = "NewEmailArrive",

    --设置
    RefreshMultiLanguage = "RefreshMultiLanguage",

    --活动公告走马灯
    RemoveWalkingLantern = "RemoveWalkingLantern",

    --任务
    OnTaskListArrive = "OnTaskListArrive",
    OnTaskDataUpdate = "OnTaskDataUpdate",
    UIInvitationPopUp_update = "UIInvitationPopUp_update",
    UIInvitationPopUp_getInvitedReward="UIInvitationPopUp_getInvitedReward",
    UIInvitationPopUp_refreshHot="refreshHot",
    RunSkipEvent = "RunSkipEvent",

    --好友
    --OnFriendListArrive = "OnFriendListArrive",
    OnUpdateFriendList = "OnUpdateFriendList",
    OnUpdateFriendRequestList = "OnUpdateFriendRequestList",
    OnUpdateFriendSearchList = "OnUpdateFriendSearchList",
    OnUpdateFriendBlockList = "OnUpdateFriendBlockList",
    RefreshAddFriendUI = "RefreshAddFriendUI",
    RefreshCancelFriendUI = "RefreshCancelFriendUI",
    RefreshUserInfo = "RefreshUserInfo",
    UIFriendLayer_refreshHot="UIFriendLayer_refreshHot",
    UIFriendItem_refreshHot="UIFriendItem_refreshHot",
    UIMainLayer_AddFriend="UIMainLayer_AddFriend",
    UIGameLayer_AddFriend="UIGameLayer_AddFriend",
    UIGameLayer_onClickAddFriend="UIGameLayer_onClickAddFriend",
    UIGameLayer_S2C_friendAddRequestBroadcast="UIGameLayer_S2C_friendAddRequestBroadcast",
    UIGameLayer_S2C_friendAddAgreeBroadcast="UIGameLayer_S2C_friendAddAgreeBroadcast",
    
    OnClosePanelEvent = "OnClosePanelEvent",

    --聊天
    OnUpdateChatList = "OnUpdateChatList",
    OnUpdateChatTip = "OnUpdateChatTip",
    OnUpdateRoomChatList = "OnUpdateRoomChatList",
    UIChannelCell_refreshHot="UIChannelCell_refreshHot",
    refreshChannelTableView="refreshChannelTableView",
    UIMainLayer_refreshChatHot = "UIMainLayer_refreshChatHot",

    --背包
    RefreshPackageUI = "RefreshPackageUI",
    OnBagListArrive = "OnBagListArrive",
    UIPackageItem_refreshHot = "UIPackageItem_refreshHot",
    
    StartGame="StartGame",
    UpdateHotShow="updateHotShow",
    refreshShowGift="refreshShowGift",
    refreshHotActivity="refreshHotActivity",
    refreshFriendList="refreshFriendList",
    mainRequestAddFriend="requestAddFriend",
    mainRequestShowFriend="mainRequestShowFriend",
    requestRemoveFriend="requestRemoveFriend",
    mainReBindAllNode="mainReBindAllNode",
    mainIsVisibleFriendPanel="mainIsVisibleFriendPanel",

    TipPlayerOpenAudio = "TipPlayerOpenAudio",
    SeccessOpenAudio = "SeccessOpenAudio",

    FriendListInitData="FriendListInitData",
    FriendListRefreshData="FriendListRefreshData",
    --猜大小
    UIGuessSizeLayer_s2cBigSmallBet="UIGuessSizeLayer_s2cBigSmallBet",
    UIGuessSizeLayer_s2cBigSmallBaozi="UIGuessSizeLayer_s2cBigSmallBaozi",
    UIGuessSizeLayer_s2cBigSmallStateInfo="UIGuessSizeLayer_s2cBigSmallStateInfo",
    UIGameLayer_s2cBigSmallStateInfo="UIGameLayer_s2cBigSmallStateInfo",
    UIGameLayer_s2cBigSmallBankerInfo="UIGameLayer_s2cBigSmallBankerInfo",
    UIMainLayer_s2cBigSmallBankerInfo="UIMainLayer_s2cBigSmallBankerInfo",
    UIMainLayer_GuessSizeHintNode="UIMainLayer_GuessSizeHintNode",
    UIMainLayer_updateLuckPlayer="UIMainLayer_updateLuckPlayer",
    UIMainLayer_s2cBigSmallRobResult="UIMainLayer_s2cBigSmallRobResult",
    UIGameLayer_s2cBigSmallRobResult="UIGameLayer_s2cBigSmallRobResult",
    UIGameLayer_GuessSizeHintNode="UIGameLayer_GuessSizeHintNode",
    UIGameLayer_updateLuckPlayer="UIGameLayer_updateLuckPlayer",
    UIGuessSizeLayer_s2cBigSmallPoolUpdate="UIGuessSizeLayer_s2cBigSmallPoolUpdate",
    UIGuessSizeLayer_updatePlayerGold="UIGuessSizeLayer_updatePlayerGold",
    UIGuessSizeLayer_updateLuckPlayer="UIGuessSizeLayer_updateLuckPlayer",
    UIBankerGuessSizeLayer_s2cBigSmallPoolUpdate="UIBankerGuessSizeLayer_s2cBigSmallPoolUpdate",
    UIBankerGuessSizeLayer_s2cBigSmallBetList="UIBankerGuessSizeLayer_s2cBigSmallBetList",
    UIGuessSizeMiniTipPopUp_2_updateGold="UIGuessSizeMiniTipPopUp_2_updateGold",
    UIGuessSizeMiniTipPopUp_3_updateGold="UIGuessSizeMiniTipPopUp_3_updateGold",
    SmashEggCell_updateGold="SmashEggCell_updateGold",
    --客服
    UIFriendItem_refreshService="UIFriendItem_refreshService",
    UIDiceBoxCell_refreshService="UIDiceBoxCell_refreshService",
    UIMagicEmojiPopUp_refreshService="UIMagicEmojiPopUp_refreshService",
    UIOtherPersonInfoLayer_refreshService="UIOtherPersonInfoLayer_refreshService",
    UIServiceLayer_s2cPlayerInfoForPlaymate="UIServiceLayer_s2cPlayerInfoForPlaymate",
    UIServiceLayer_selectButtonEvent="UIServiceLayer_selectButtonEvent",
    --筛宝相关事件
    ShaiBao_RefreshBankerInfo = "ShaiBao_RefreshBankerInfo",
    ShaiBao_BetEvent = "ShaiBao_BetEvent",
    ShaiBao_Start = "ShaiBao_Start",
    ShaiBao_Result ="ShaiBao_Result",
    ShaiBao_Double="ShaiBao_Double",
    ShaiBao_refreshInfo="ShaiBao_refreshInfo",
    ShaiBao_robBetResult = "ShaiBao_robBetResult",
    ShaiBao_s2cShaibaoGameover = "ShaiBao_s2cShaibaoGameover",
    ShaiBao_BankerDownLoadRefresh="ShaiBao_BankerDownLoadRefresh",
    ShaiBao_refreshSayHeroHead="ShaiBao_refreshSayHeroHead",
    DiceBabyShutupPopUp_refreshData="DiceBabyShutupPopUp_refreshData",
    refreshMuteList="refreshMuteList",
    refreshChuiniuMuteList="refreshChuiniuMuteList",
    ShaiBao_s2cShaibaoMagicEmojiBroadcast = "ShaiBao_s2cShaibaoMagicEmojiBroadcast",

    --新手引导
    UIGameGuideLayer_handlerGuide="UIGameGuideLayer_handlerGuide",
}


Constant.Define={
    LevelGamePlayingFail = "1000001",   --退出房间
    ModifyPasswardSuccess = "1000002",  --修改密码成功
    PasswardNotSame = "1000003",    --密码不同
    PasswardIsNil = "1000004",  --密码空
    CheckAgreeSelected = "1000005",     -- 勾选用户协议
    IsNumberTrue = "1000006",       -- 注册账号密码校验
    ModifyUserInfoSuccess = "1000007",  --信息修改成功
    DiamondNotEnough = "1000008",   --钻石不足
    NoChange = "1000009",   --未作修改
    InputError = "1000010",     -- 输入不合法
    NoEmail = "1000011",        --暂无可领取得邮件
    UseUserId = "1000012",      --请输入好友id
    IsFriend = "1000013",     --他已是你的好友
    InBlackList = "1000014",     --他在你的黑名单中
    AddFriendResponse = "1000015",   --好友申请已发送
    
    --登录相关
    AccountIsNotNull = "1100001",       
    PasswardIsNotNull = "1100002",
    PasswardIsLongOrShort = "1100003",
    AccountSpecial = "1100004",
    ClickIsTooOften = "1100005",
    --设置账号相关
    PasswardTextIsNull = "1100006",
    TwicePasswardIsNotSame = "1100007",
    TwicePasswardIsTooLongOrShot = "1100008",
    OldPasswardIsNull = "1100009",
    NewPasswardIsNull = "1100010",
    TwiceNewPasswardIsNull = "1100011",
    --个人中心
    UserNameIsIllegal = "1100012",--未接入
    UserNameIsNotNull = "1100013",
    UserNameIsTooLong = "1100014",
    SloganIsTooLong = "1100015",
    --好友
    AddFriendAleadySend = "1100016",
    NoCanCancelRequest = "1100017",
    NoCanAgreeRequest = "1100018",
    --聊天
    ChatSendNull = "1100019",--未接入
    ChatNumIsTooLong = "1100021",
    --对局
    MicrophonePermissionsNotOpen = "1100020",--未接入
    CantSendMagicEmoji = "1100022", --观战不可发送魔法表情
    --邮件
    NoCanDeleteEmail = "1100023",

    UnJoinAudioRoom = "1100024",
    UnBindAccountSuccess = "1100025",
    RemoveAccountSuccess = "1100026",
    ErrorGoldNotEnough = "1100027",
    WatherCantOpenMic = "1100028",

    IsShaibaoGaming = "1100030",

    ErrorGoldNotEnoughSendMagic = "60016",
}

-- In app event names constants
Constant.AFEventCompleteRegistration = "af_complete_registration"
Constant.AFEventPurchase             = "af_purchase"

-- In app event parameter names
Constant.AFEventParamRegistrationMethod      =   "af_registration_method"
Constant.AFEventParamRevenue                 =   "af_revenue"
Constant.AFEventParamCurrency                =   "af_currency"