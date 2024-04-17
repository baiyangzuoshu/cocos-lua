local M = {}

M.UIFilePath = {
    ["UIChangeLogLayer"] = "app.gui.system",
    ["UIConnectionErrorLayer"] = "app.gui.system",
    ["UILoadingLayer"] = "app.gui.system",

    -- 热更页面
    ["UIUpdateLayer"] = "app.gui",

    -- 登录页面
    ["UILoginLayer"] = "app.gui.login",
    ["UILogoutLayer"] = "app.gui.login",
    ["UILoadingTipPopUp_1"] = "app.gui.login", --下载确认界面
    ["UILoadingTipPopUp_2"] = "app.gui.login", --跳转安装界面
    ["UILoadingTipPopUp_3"] = "app.gui.login", --连接服务器更新失败界面
    ["UILoadingTipPopUp_4"] = "app.gui.login", --更新出错或成功界面
    ["UILoginLimitPopUp"] = "app.gui.login",

    -- 主页面
    ["UIMainLayer"] = "app.gui.home",
    ["MainAddFriendsPopUp"] = "app.gui.home",
    ["MainFriendListCell_1"] = "app.gui.home",
    ["MainFriendListCell_2"] = "app.gui.home",
    ["MainFriendListCell"] = "app.gui.home",
    ["UIMainFriendsList"] = "app.gui.home",
    ["DiceBabyShutupPopUp"] = "app.gui.home",
    ["UIMuteItem"] = "app.gui.home",
    -- ["UIBankerMagicEmoji"] = "app.gui.home",
    
    -- 游戏页面
    ["UIGameLayer"] = "app.gui.game",
    ["UIDiceChooseLayer"] = "app.gui.game",
    ["UINumberChooseLayer"] = "app.gui.game",
    ["UIExtraCompareChooseLayer"] = "app.gui.game",

    ["UIChooseCallSeatLayer"] = "app.gui.game",
    ["UIChooseOnlookersLayer"] = "app.gui.game",
    ["UIChooseOpenSeatLayer"] = "app.gui.game",
    ["UIGuessingLayer"] = "app.gui.game",
    ["UIGuessingResultLayer"] = "app.gui.game",
    ["UIGuessingCancelLayer"] = "app.gui.game",
    ["UIBoastListLayer"] = "app.gui.game",
    ["UILaunchUpVotaconfirm"] = "app.gui.game",
    ["UIBingoLayer"] = "app.gui.game",
    ["UILossLayer"] = "app.gui.game",
    ["UIMagicEmojiPopUp"] = "app.gui.game",
    ["UIBoastEntranceLayer"] = "app.gui.game",
    ["BoastMiniTipPopUp_1"] = "app.gui.game",
    --对局玩家列表
    ["UIBoastPlayerListLayer"] = "app.gui.game",
    --房间金币动画显示层
    ["UIBoastMoneyFlyLayer"] = "app.gui.game",

    --魔法表情显示层
    ["UIBoastMagicyFlyLayer_1"] = "app.gui.game",
    ["UIBoastMagicyFlyLayer_2"] = "app.gui.game",

    -- 玩家信息
    ["UIPersonalInfoLayer"] = "app.gui.userinfo",
    ["UIOtherPersonInfoLayer"] = "app.gui.userinfo",
    ["UIHeadFrameLayer"] = "app.gui.userinfo",
    -- 个人中心修改
    ["UIModifyNameLayer"] = "app.gui.userinfo",
    ["UIModifySexLayer"] = "app.gui.userinfo",
    ["UIModifyDescLayer"] = "app.gui.userinfo",
    ["UIModifyConfirmLayer"] = "app.gui.userinfo",

    ["UIBlockFriendConfirmDialog"] = "app.gui.userinfo",
    ["UIDeleteFriendConfirmDialog"] = "app.gui.userinfo",
    ["UIMoreOperateLayer"] = "app.gui.userinfo",

    --设置
    ["UISettingLayer"] = "app.gui.setting",
    ["UILanguageChangeLayer"] = "app.gui.setting",
    ["UISettingAccountLayer"] = "app.gui.setting",
    ["UISettingBindChangeLayer"] = "app.gui.setting",
    ["UISettingBindLayer"] = "app.gui.setting",
    ["UISettingChangePopUp"] = "app.gui.setting",
    ["UISettingModifyAccountLayer"] = "app.gui.setting",
    ["UISettingModifyAccountPopUp"] = "app.gui.setting",
    ["UISettingModifyPasswordLayer"] = "app.gui.setting",
    ["UISettingPhoneNumAreaLayer"] = "app.gui.setting",
    ["UISettingUnbindPopUp"] = "app.gui.setting",
    ["UISignOutAgreementLayer"] = "app.gui.setting",
    ["UISettingHelpLayer"] = "app.gui.setting",

    -- 商城页面
    ["UIStoreLayer"] = "app.gui.store",
    ["UINewItemLayer"] = "app.gui.store",
    ["UIShopBuyConfirmLayer"] = "app.gui.store",
    ["UIShopBuySuccessLayer"] = "app.gui.store",
    ["UIVipRewardItem"] = "app.gui.store",
    ["UIDiceCupItemShowLayer"] = "app.gui.store",

    -- 规则/帮助页面
    ["UIGameRulesLayer"] = "app.gui.rule",

    -- 资源弹窗
    ["UIRewardLayer"] = "app.gui.dialog",
    ["UIGetMulResLayer"] = "app.gui.dialog",
    ["UISystemTipsLayer"] = "app.gui.dialog",

    -- 邮箱
    ["UIEmailLayer"] = "app.gui.email",
    ["UIEmailDetail"] = "app.gui.email",
    ["UIDeleteAllEmailConfirm"] = "app.gui.email",
    ["UIEmailItem2"] = "app.gui.email",

    -- 活动公告跑马灯
    ["UIWalkingLanternNode"] = "app.gui.activity",
    ["UIBigSmallWalkingLanternNode"] = "app.gui.activity",

    ["UINewWelfareNovicePopUp"] = "app.gui.activity",
    ["UIGameAnnouncement"] = "app.gui.activity",
    ["UIOperateGiftBagNovicePopUp"]="app.gui.activity",
    ["OperateGiftBagNoviceCell"]="app.gui.activity",
    ["UIActivitiesLayer"]="app.gui.activity",
    ["ActivitiesCell"]="app.gui.activity",
    ["ActivitiesNoiceCell"]="app.gui.activity",
    ["UIActivitiesNoticePopUp"]="app.gui.activity",
    ["UINewWelfareLoginPopUp"]="app.gui.activity",
    ["NewWelfareLoginCell"]="app.gui.activity",
    ["UIReliefLayer"]="app.gui.activity",
    ["NewWelfareNoviceCell"]="app.gui.activity",
    -- 任务
    ["UITaskLayer"] = "app.gui.task",
    ["UITaskResItem"] = "app.gui.task",

    --好友
    ["UIFriendLayer"] = "app.gui.friend",
    ["FriendsHintCell"] = "app.gui.friend",

    --聊天
    ["UIFriendChatLayer"] = "app.gui.chat",
    ["UIRoomChatLayer"] = "app.gui.chat",

    --分享
    ["UIInvitationPopUp"] = "app.gui.invitation",
    ["UIInvitationCheck"] = "app.gui.invitation",
    ["InvitationCheckCell"] = "app.gui.invitation",
    ["InvitationRewardCell"] = "app.gui.invitation",
    ["InvitationTaskCell"] = "app.gui.invitation",
    ["UIInvitationSharePopUp"]="app.gui.invitation",
    ["UIInvitationRulesPopUp"]="app.gui.invitation",

    --背包
    ["UIPackageLayer"] = "app.gui.bag",
    ["UIPackageItem"] = "app.gui.bag",
    ["UIPackageShowItemTips"] = "app.gui.bag",
    ["UIPackageShowDiceUp"] = "app.gui.bag",
    ["UIItem"] = "app.gui.bag",

    --新手引导
    ["UINoviceStartGuideLayer"]="app.gui.guide",
    ["UINoviceGuideLayer"]="app.gui.guide",
    ["GuideBoastResultPopUp"]="app.gui.guide",
    ["GuideDiceCupLayer"]="app.gui.guide",
    ["GuideNumberLayer"]="app.gui.guide",
    ["GuidePointLayer"]="app.gui.guide",
    ["UIGameGuideLayer"]="app.gui.guide",
    ["UIGuideBigPrizeLayer"]="app.gui.guide",
    ["UIGuideGuessingLayer"]="app.gui.guide",
    ["UIGuideMiniTipPopUp_1"]="app.gui.guide",
    ["UIGuideMiniTipPopUp_2"]="app.gui.guide",
    ["UIGuideMiniTipPopUp_3"]="app.gui.guide",
    ["UIGuideWinAwardLayer"]="app.gui.guide",
    --弹窗
    ["UINetPopup"]="app.gui.popup",
    ["UIKickPopup"]="app.gui.popup",
    ["UINetLimitPopUp"]="app.gui.popup",
    ["UIBoastHangUpPopUp"]="app.gui.popup",
    ["UIClientErrorTipsLayer_0"]="app.gui.popup",
    ["UIClientErrorTipsLayer_1"]="app.gui.popup",
    ["UIClientErrorTipsLayer_2"]="app.gui.popup",
    ["UICommonMediumTipPopUp"]="app.gui.popup",
    --猜大小
    --["UIBankerGuessSizeLayer"]="app.gui.guessSize",
    ["SmashEggCell"]="app.gui.guessSize",
    ["GuessSizeHintCell"]="app.gui.guessSize",
    ["UIGuessSizeLayer"]="app.gui.guessSize",
    ["UIGuessSizeMiniTipPopUp_1"]="app.gui.guessSize",
    ["UIGuessSizeMiniTipPopUp_2"]="app.gui.guessSize",
    ["UIGuessSizeMiniTipPopUp_3"]="app.gui.guessSize",
    ["MainGuessSizeHintCell"]="app.gui.guessSize",
    ["PlayerMessageCell"]="app.gui.guessSize",
    ["RankingPlayerCell"]="app.gui.guessSize",
    ["SelectedLeopardCell"]="app.gui.guessSize",
    ["SizeResultCell"]="app.gui.guessSize",
    --["UISizeResultSpriteCell"] = "app.gui.guessSize",
    ["WalkingLanternCell"]="app.gui.guessSize",
    ["UIRodGoldRankingLayer"]="app.gui.guessSize",
    ["UISmashEggPlaceCell"]="app.gui.guessSize",
    --客服
    ["UIServiceLayer"] = "app.gui.service",
    ["UserDetailsCell"] = "app.gui.service",
    ["UIServiceInletLayer"] = "app.gui.service",
    ["ServiceCell"] = "app.gui.service",
    ["UIMiniTipPopUp"] = "app.gui.service",
    ["CurrentServiceCell"] = "app.gui.service",
}

M.UIZOrderSeting = {
    ["UIModifyConfirmLayer"] = 600,

    ["UIMagicEmojiPopUp"] = 1001,
    ["UIBoastMagicyFlyLayer_1"] = 1002,
    ["UIBoastMagicyFlyLayer_2"] = 1000,

    ["UINoviceStartGuideLayer"] = 10000,
    ["UINoviceGuideLayer"] = 10000,
    ["UIGetMulResLayer"]=10005,
    ["UIRewardLayer"] = 10001,
    ["UISystemTipsLayer"] = 10004,
    ["UINetPopup"]=10001,
    ["UIKickPopup"]=10003,
    ["UILoginLimitPopUp"]=10003,

    ["UIClientErrorTipsLayer_0"] = 10001,
    ["UIClientErrorTipsLayer_1"] = 10003,
    ["UIClientErrorTipsLayer_2"] = 10003,
    ["UICommonMediumTipPopUp"] = 10003,

    ["UISettingLayer"] = 10001,
    ["UILanguageChangeLayer"] = 10001,
    ["UISettingAccountLayer"] = 10001,
    ["UISettingBindChangeLayer"] = 10001,
    ["UISettingBindLayer"] = 10001,
    ["UISettingChangePopUp"] = 10001,
    ["UISettingModifyAccountLayer"] = 10001,
    ["UISettingModifyAccountPopUp"] = 10001,
    ["UISettingModifyPasswordLayer"] = 10001,
    ["UISettingPhoneNumAreaLayer"] = 10001,
    ["UISettingUnbindPopUp"] = 10001,
    ["UISignOutAgreementLayer"] = 10001,
    ["UISettingHelpLayer"] = 10005,

    ["UIStoreLayer"] = 10001,
    ["UINewItemLayer"] = 10001,
    ["UIShopBuyConfirmLayer"] = 10001,
    ["UIShopBuySuccessLayer"] = 10001,
    ["UIVipRewardItem"] = 10001,
    ["UIDiceCupItemShowLayer"] = 10001,
	["UILoadingTipPopUp_2"] = 200001,
    --猜大小
    ["UIGuessSizeLayer"]=1000,
    ["UISmashEggPlaceCell"]=1000,
    ["UIBankerGuessSizeLayer"]=1000,
    ["UIGuessSizeMiniTipPopUp_1"]=1000,
    ["UIGuessSizeMiniTipPopUp_2"]=1000,
    ["UIGuessSizeMiniTipPopUp_3"]=1000,
    --客服
    ["UIServiceLayer"] = 10003,
    ["UserDetailsCell"] = 10003,
    ["UIServiceInletLayer"] = 10003,
    ["ServiceCell"] = 10003,
    ["UIMiniTipPopUp"] = 10003,
    ["UIOtherPersonInfoLayer"]=10003,
    ["UIPersonalInfoLayer"]=10003,
    ["UIMoreOperateLayer"]=10003,
    ["UIDeleteFriendConfirmDialog"]=10003,
    ["UIBlockFriendConfirmDialog"]=10003,
    ["UIHeadFrameLayer"] = 10003,
    ["UIModifyDescLayer"]=10003,
    ["UIModifySexLayer"]=10003,
    ["UIModifyNameLayer"] = 10003,
    --引导
    ["UIGameGuideLayer"]=10004,
    ["UIGuideBigPrizeLayer"]=10004,
    ["UIGuideGuessingLayer"]=10004,
    ["UIGuideMiniTipPopUp_1"]=10004,
    ["UIGuideMiniTipPopUp_2"]=10004,
    ["UIGuideMiniTipPopUp_3"]=10004,
    ["UIGuideWinAwardLayer"]=10004,



    ["UILoadingLayer"]=99999,
}

return M