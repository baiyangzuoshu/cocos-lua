return {

    -- 模板
    -- MSG_C2S_Undefined = { code = 2009, protocolName = "undefined.undefined", methodName = "S2C_Undefined" },
    
    -- 心跳
    MSG_C2S_Heartbeat = { code = 1, protocolName = "client.heartbeat", methodName = "" },
    MSG_S2C_Heartbeat = { code = 2, protocolName = "server.heartbeat", methodName = "S2C_Heartbeat" },

    -- 默认回复
    MSG_S2C_ErrorMessage = { code = 2000, protocolName = "server.defaultResponse", methodName = "S2C_ErrorMessage" },

    --默认回复弹窗
    MSG_S2C_PopMessage = { code = 2042, protocolName = "server.defaultPopResponse", methodName = "S2C_PopMessage" },

    -- 登入
    MSG_C2S_Entry = { code = 1001, protocolName = "client.entry", methodName = "" },
    MSG_S2C_Entry = { code = 2001, protocolName = "server.onEntry", methodName = "S2C_Entry" },

    -- 登录成功
    MSG_S2C_LoginFinish = { code = 2022, protocolName = "server.loginFinish", methodName = "" },

    MSG_C2S_EnterHome = { code = 1020, protocolName = "client.enterHome", methodName = "" },
    MSG_S2C_EnterHome = { code = 2020, protocolName = "server.onEnterHome", methodName = "S2C_EnterHome" },
    

    --匹配游戏
    MSG_C2S_MatchGame = {code = 1002,protocolName="client.matchGame",methodName = ""},
    --MSG_S2C_MatchGameSuccess={code = 2403,protocolName="server.matchSuccess",methodName = "S2C_MatchGameSuccess"},
    MSG_S2C_MatchGameAck={code = 2404,protocolName="server.matchGameAck",methodName = "S2C_MatchGameAck"},

    MSG_S2C_MatchRoomLevel = {code = 2401,protocolName="server.matchingRoom",methodName="S2C_MatchRoomLevel"},

    --退出匹配
    MSG_C2S_CansualMatchGame = {code = 1402,protocolName="client.quitMatch",methodName = ""},
    MSG_S2C_CansualMatchGameBack = {code=2402,protocolName="server.quitMatchResponse",methodName="MSG_S2C_CansualMatchGameBack"},

    --获取玩各场次游戏的人数
    MSG_C2S_GetGamingPlayerNum = {code = 1405,protocolName="client.c2sGetGamingPlayerNum",methodName = ""},
    MSG_S2C_GamingPlayerNum = {code=2405,protocolName="server.s2cGamingPlayerNum",methodName="MSG_S2C_GamingPlayerNum"},

    -- 加入游戏
    --MSG_C2S_JoinGame = { code = 1002, protocolName = "client.joinGame", methodName = "" },
    MSG_C2S_JoinRoom = {code = 1012,protocolName="client.joinRoom",methodName = ""},
    MSG_S2C_JoinGame = { code = 2002, protocolName = "server.onJoinGame", methodName = "S2C_JoinGame" },

    -- 玩家加入房间
    -- MSG_S2C_GamePlayerEnter = { code = 2021, protocolName = "server.playerJoinGame", methodName = "S2C_GamePlayerEnter" },

    -- 观众列表变更
    MSG_S2C_AudienceListUpdate = { code = 2037, protocolName = "server.audienceListUpdate", methodName = "S2C_AudienceListUpdate" },

     -- 玩家列表变更
    MSG_S2C_PlayerListUpdate = { code = 2038, protocolName = "server.playerListUpdate", methodName = "S2C_PlayerListUpdate" },

    -- 游戏开始
    MSG_S2C_GameStart = { code = 2005, protocolName = "server.gameStart", methodName = "S2C_GameStart" },

    -- 回合轮广播
    MSG_S2C_Turn = { code = 2006, protocolName = "server.turn", methodName = "S2C_Turn" },

    -- 骰子更新
    MSG_S2C_DiceUpdate = { code = 2003, protocolName = "server.setDice", methodName = "S2C_DiceUpdate" },

    -- 叫点
    MSG_C2S_CallPoint = { code = 1003, protocolName = "client.callPoint", methodName = "" },
    MSG_S2C_CallPoint = { code = 2007, protocolName = "server.callPoint", methodName = "S2C_CallPoint" },
    --玩家更新叫点（用于自动叫点）
    MSG_C2S_AutoCallUpdate = { code = 1051, protocolName = "client.autoCallUpdate", methodName = "" },

    -- 开骰
    MSG_C2S_OpenDiceBox = { code = 1004, protocolName = "client.openDiceBox", methodName = "" },
    MSG_S2C_OpenDiceBox = { code = 2008, protocolName = "server.openDiceBox", methodName = "S2C_OpenDiceBox" },
    MSG_S2C_OpenErrorGoldNotEnough = { code = 2041, protocolName = "server.openErrorGoldNotEnough", methodName = "S2C_OpenErrorGoldNotEnough" },

    --提升底注
    MSG_C2S_LaunchVote = {code = 1013, protocolName = "client.createLevelUpVote", methodName = ""},
    MSG_S2C_LaunchVote = {code = 2026, protocolName = "server.betBaseUpdateTime", methodName = "S2C_LaunchVote"},

    --底注提升投票
    MSG_C2S_Vote={code = 1014,protocolName="client.voteForLevelUp",methodName=""},
    MSG_S2C_SomeoneVoteResult={code=2031,protocolName="server.betBaseUpdateVote",methodName="MSG_S2C_SomeoneVoteResult"},

    -- 竞猜
    MSG_S2C_ExtraCompare = { code = 2009, protocolName = "server.betTime", methodName = "S2C_ExtraCompare" },

    -- 发送竞猜结果
    MSG_C2S_ExtraCompareChoose = { code = 1005, protocolName = "client.addBetPrize", methodName = "" },
    MSG_S2C_ExtraCompareUpdataPool = {code = 2029,protocolName = "server.updatePrizePool",methodName="MSG_S2C_ExtraCompareUpdataPool"},
    MSG_S2C_ExtraCompareChoose = { code = 2010, protocolName = "server.openDiceBoxBet", methodName = "S2C_ExtraCompareChoose" },
    MSG_C2S_CallSeatChoose = { code = 1010, protocolName = "client.reverseBet", methodName = "" },
    MSG_S2C_CallSeatChoose = { code = 2025, protocolName = "server.reverseBet", methodName = "S2C_CallSeatChoose" },
    MDG_S2C_ExtraCallback={code = 2502,protocolName="server.betPrize",methodName="MDG_S2C_ExtraCallback"},

    -- 游戏结束 
    MSG_S2C_GameOver = { code = 2012, protocolName = "server.gameOver", methodName = "S2C_GameOver" },
    
    -- 下局游戏倒计时变更广播
    MSG_S2C_UpdateNextGameTime = { code = 2013, protocolName = "server.nextGameCountdownStampRefresh", methodName = "S2C_UpdateNextGameTime" },
    
    -- 玩家金币更新
    MSG_S2C_UpdatePlayerGold = { code = 2014, protocolName = "server.gamePlayerGoldUpdate", methodName = "S2C_UpdatePlayerGold" },

    -- 离开房间
    MSG_C2S_LeaveGame = { code = 1006, protocolName = "client.leaveGame", methodName = "" },
    MSG_S2C_LeaveGame = { code = 2011, protocolName = "server.leaveGame", methodName = "S2C_GamePlayerLeave" },

    -- 重摇
    MSG_C2S_ReshakeDiceBox = { code = 1007, protocolName = "client.reroll", methodName = "" },
    MSG_S2C_ReshakeDiceBox = { code = 2004, protocolName = "server.reroll", methodName = "S2C_ReshakeDiceBox" },

    -- 恭喜获得物品
    MSG_S2C_NewItem = { code = 2015, protocolName = "server.newItem", methodName = "S2C_NewItem" },

    -- 世界聊天消息
    MSG_S2C_WorldChatMessage = { code = 2016, protocolName = "server.worldChatMessage", methodName = "S2C_WorldChatMessage" },

    -- 更新个人资产
    MSG_S2C_UpdateUserResource = { code = 2017, protocolName = "server.updateUserAssets", methodName = "S2C_UpdateUserResource" },

    -- 离线系统消息
    MSG_S2C_OfflineSystemMessage = { code = 2018, protocolName = "server.offlineSystemMsg", methodName = "S2C_OfflineSystemMessage" },

    -- 在线系统消息
    MSG_S2C_OnlineSystemMessage = { code = 2019, protocolName = "server.systemMsg", methodName = "S2C_OnlineSystemMessage" },

    -- 底注更新
    MSG_S2C_UpdateBetBase = { code = 2023, protocolName = "server.betBaseUpdate", methodName = "onGameBetUpdate" },

    -- 金币购买
    MSG_C2S_BuyGold = { code = 1008, protocolName = "client.buyGold", methodName = "" },



    --获取商店列表
    MSG_C2S_UserShopList = { code = 1101, protocolName = "client.userShops", methodName = ""},
    MSG_S2C_UserShopList = { code = 2101, protocolName = "server.userShops", methodName = "S2C_ShopList"},
    --进入商店
    MSG_C2S_EntryShop = { code = 1102, protocolName = "client.entryShop", methodName = ""},
    MSG_S2C_EntryShop = { code = 2102, protocolName = "server.userShopLog", methodName = "S2C_EntryShop"},
    --商品购买
    MSG_C2S_ShopBuy = { code = 1103, protocolName = "client.shopBuy", methodName = ""},
    MSG_S2C_ShopBuy = { code  = 2103, protocolName = "server.shopBuy", methodName = "S2C_ShopBuy"},
    --vip礼包
    MSG_C2S_GetVipReward = { code = 1203, protocolName = "client.gainVipLevel", methodName = ""},
    --vip经验
    MSG_C2S_GetVipExp = { code = 2206, protocolName = "server.vipChange", methodName = "S2C_UpdateVipExp"},



    -- 获取用户信息和游戏对局游戏
    MSG_C2S_GetUserInfo = { code = 1009, protocolName = "client.getBaseInfo", methodName = "" },
    MSG_S2C_RefrshUserInfo = { code = 2024, protocolName = "server.baseInfo", methodName = "S2C_RefrshUserInfo" },
    -- 更新用户信息
    MSG_C2S_UpdateUserInfo = { code = 1201, protocolName = "client.updatePlayerInfo", methodName = "" },
    MSG_c2sGetPlayerIdsOnline = { code = 3501, protocolName = "client.c2sGetPlayerIdsOnline", methodName = "" },
    MSG_c2sGetPlayerInfosForPlaymate = { code = 3502, protocolName = "client.c2sGetPlayerInfosForPlaymate", methodName = "" },
    MSG_s2cPlayerIdsOnline = { code = 4501, protocolName = "server.s2cPlayerIdsOnline", methodName = "s2cPlayerIdsOnline" },
    MSG_s2cPlayerInfoForPlaymate = { code = 4502, protocolName = "server.s2cPlayerInfoForPlaymate", methodName = "s2cPlayerInfoForPlaymate" },
    MSG_S2C_UpdateUserInfo = { code = 2028, protocolName = "server.updatePlayerInfo", methodName = "S2C_UpdateUserInfo" },
    MSG_S2C_UpdateNickNameError = { code = 2030, protocolName = "server.updateNickNameError", methodName = "S2C_CheckNickNameError" },
    --获取头像和头像框信息
    MSG_C2S_GetAvatarList = { code = 1305, protocolName = "client.getAvatarList", methodName = "" },
    MSG_S2C_GetAvatarAndFrameList = { code = 2305, protocolName = "server.avatarAndFrameList", methodName = "S2C_GetAvatarAndFrameList" },

    MSG_C2S_gainRegisterReward = { code = 1204, protocolName = "client.gainRegisterReward", methodName = "" },
    MSG_C2S_gainRescueGold = { code = 1205, protocolName = "client.gainRescueGold", methodName = "" },

    --头像框等道具过期推送
    MSG_S2C_UpdateNewItemTime = { code = 2208, protocolName = "server.itemExpired", methodName = "S2C_UpdateNewItemTime" },

    --游戏中玩家变更骰钟
    MSG_S2C_UpdateDicBox = { code = 2209, protocolName = "server.diceBoxChange", methodName = "S2C_UpdateDicBox" },
    -- 恭喜获得
    MSG_S2C_GetRes = { code = 2032, protocolName = "server.itemChange", methodName = "S2C_GetReward"},



    --邮箱
    --获取所有邮件
    MSG_C2S_GetEmailList = { code = 1601, protocolName = "client.getMailList", methodName = "" },
    MSG_S2C_GetEmailList = { code = 2601, protocolName = "server.mailList", methodName = "S2C_EmailList" },
    --邮件已读
    MSG_C2S_ReadEmail = { code = 1602, protocolName = "client.readMail", methodName = "" },
    MSG_S2C_ReadEmail = { code = 2602, protocolName = "server.updateMailState", methodName = "S2C_UpdateEmailState" },
    --邮件附件领取
    MSG_C2S_ReciveEmail = { code = 1603, protocolName = "client.receiveMailAttachment", methodName = "" },
    MSG_S2C_ReciveEmail = { code = 2605, protocolName = "server.receiveMail", methodName = "S2C_ReciveEmail" },
    --一键领取
    MSG_C2S_ReciveEmailAll = { code = 1604, protocolName = "client.receiveAllMailAttachment", methodName = "" },
    MSG_S2C_ReciveEmailAll = { code = 2606, protocolName = "server.receiveMailAll", methodName = "S2C_ReciveEmailAll" },
    --一键删除
    MSG_C2S_DeleteEmailAll = { code = 1606, protocolName = "client.deleteAllMail", methodName = "" },
    MSG_S2C_DeleteEmailAll = { code = 2604, protocolName = "server.deleteMail", methodName = "S2C_DeleteEmailAll" },
    --推送新邮件
    MSG_S2C_NewEmailArrive = { code = 2603, protocolName = "server.newMail", methodName = "S2C_NewEmailArrive" },



    --活动公告&走马灯
    --推送走马灯广播消息
    MSG_S2C_NewMsgArrive = { code = 2701, protocolName = "server.broadcast", methodName = "S2C_NewMsgArrive" },



    --任务
    --获取所有任务
    MSG_C2S_GetTaskList = { code = 1801, protocolName = "client.getTask", methodName = "" },
    MSG_S2C_GetTaskList = { code = 2801, protocolName = "server.getTask", methodName = "S2C_GetTaskList" },
    --领取奖励
    MSG_C2S_ReceiveTask = { code = 1802, protocolName = "client.taskGetReward", methodName = "" },
    --领取所有
    MSG_C2S_ReceiveTaskAll = { code = 1803, protocolName = "client.taskGetRewardAll", methodName = "" },
    MSG_S2C_ReceiveTaskAll = { code = 2803, protocolName = "server.taskGetReward", methodName = "S2C_ReceiveTask" },
    --任务进度更新
    MSG_S2C_ReceiveTask = { code = 2802, protocolName = "server.taskUpdate", methodName = "S2C_TaskUpdate" },


    MSG_C2S_gainInvitedReward={ code = 3102, protocolName = "client.gainInvitedReward", methodName = "" },
    MSG_C2S_getInvitedReward={ code = 3101, protocolName = "client.getInvitedReward", methodName = "" },
    MSG_S2C_getInvitedReward= { code = 4101, protocolName = "server.getInvitedReward", methodName = "S2C_getInvitedReward" },

    MSG_C2S_taskInvitedPlayer={ code = 1804, protocolName = "client.taskInvitedPlayer", methodName = "" },
    MSG_S2C_taskInvitedPlayer= { code = 2804, protocolName = "server.taskInvitedPlayer", methodName = "S2C_taskInvitedPlayer" },


    --好友
    --好友列表
    MSG_C2S_GetFriendList = { code = 1901, protocolName = "client.getFriendList", methodName = "" },
    MSG_S2C_GetFriendList = { code = 2901, protocolName = "server.friendList", methodName = "S2C_GetFriendList" },
    
    --好友搜索列表
    MSG_C2S_GetFriendSearchList = { code = 1902, protocolName = "client.getFriendSearchList", methodName = "" },
    MSG_S2C_GetFriendSearchList = { code = 2902, protocolName = "server.friendSearchList", methodName = "S2C_GetFriendSearchList" },
   
    --好友申请列表
    MSG_C2S_GetFriendRequestList = { code = 1903, protocolName = "client.getFriendRequestList", methodName = "" },
    MSG_S2C_GetFriendRequestList = { code = 2903, protocolName = "server.friendRequestList", methodName = "S2C_GetFriendRequestList" },
    
    --黑名单列表
    MSG_C2S_GetBlacklist = { code = 1904, protocolName = "client.getBlacklist", methodName = "" },
    MSG_S2C_GetBlacklist = { code = 2904, protocolName = "server.blacklist", methodName = "S2C_GetBlacklist" },

    --请求添加好友
    MSG_C2S_AddFriendRequest = { code = 1905, protocolName = "client.addFriendRequest", methodName = "" },
    MSG_S2C_AddFriendResponse = { code = 2905, protocolName = "server.addFriendResponse", methodName = "S2C_AddFriendResponse" },
    MSG_S2C_RequestedToAddFriend = { code = 2913, protocolName = "server.requestedToAddFriend", methodName = "S2C_AddFriendToOther" },

    --取消申请
    MSG_C2S_CancelAddFriend = { code = 1914, protocolName = "client.cancelAddFriend", methodName = "" },
    MSG_S2C_CancelAddFriendResponse = { code = 2914, protocolName = "server.cancelAddFriendResponse", methodName = "S2C_CancelAddFriendResponse" },
    MSG_S2C_CancelAddFriend = { code = 2915, protocolName = "server.cancelAddFriend", methodName = "S2C_CancelAddFriend" },
   
    --删除好友
    MSG_C2S_DeleteFriend = { code = 1906, protocolName = "client.deleteFriend", methodName = "" },
    MSG_S2C_DeleteFriend = { code = 2906, protocolName = "server.deleteFriend", methodName = "S2C_DeleteFriend" },
   
    --拉黑好友
    MSG_C2S_BlockFriend = { code = 1907, protocolName = "client.blockFriend", methodName = "" },
    MSG_S2C_BlockFriend = { code = 2907, protocolName = "server.blockFriend", methodName = "S2C_BlockFriend" },
   
    --拉白好友
    MSG_C2S_CancelBlockFriend = { code = 1908, protocolName = "client.cancelBlockFriend", methodName = "" },
    MSG_S2C_CancelBlockFriend = { code = 2908, protocolName = "server.cancelBlockFriend", methodName = "S2C_CancelBlockFriend" },
    MSG_S2C_friendNetStatus = { code = 2917, protocolName = "server.friendNetStatus", methodName = "S2C_friendNetStatus" },
    MSG_S2C_friendInfoUpdate = { code = 2918, protocolName = "server.friendInfoUpdate", methodName = "S2C_friendInfoUpdate" },
    MSG_S2C_friendGoldUpdate = { code = 2919, protocolName = "server.friendGoldUpdate", methodName = "S2C_friendGoldUpdate" },
    
    --观战
    MSG_C2S_WatchingByFriends = { code = 1909, protocolName = "client.watchingByFriends", methodName = "" },
    
    --观众坐下
    MSG_C2S_SitDown = {code= 1035, protocolName = "client.sitDown", methodName = ""},

    --玩家站起
    MSG_C2S_StandUp = {code= 1036, protocolName = "client.standUp", methodName = ""},

     --玩家金币不足强制站起
     MSG_S2C_SitDownErrorGoldNotEnough = {code= 2045, protocolName = "server.sitDownErrorGoldNotEnough", methodName = "S2C_SitDownErrorGoldNotEnough"},

    --变更座位
    MSG_C2S_CangeSeat = {code= 1040, protocolName = "client.changeSeat", methodName = ""},
    MSG_S2C_SeatChanged = {code= 2039, protocolName = "server.seatChanged", methodName = "S2C_SeatChanged"},
    
    --同意添加好友
    MSG_C2S_AddFriendAgree = { code = 1910, protocolName = "client.addFriendAgree", methodName = "" },
    MSG_S2C_AddFriendAgree = { code = 2910, protocolName = "server.addFriendAgree", methodName = "S2C_AddFriendAgree" },
    MSG_S2C_friendAddRequestBroadcast = { code = 2920, protocolName = "server.friendAddRequestBroadcast", methodName = "S2C_friendAddRequestBroadcast" },
    MSG_S2C_friendAddAgreeBroadcast = { code = 2921, protocolName = "server.friendAddAgreeBroadcast", methodName = "S2C_friendAddAgreeBroadcast" },
    
    --全部同意/拒绝
    MSG_C2S_AddFriendAgreeAll = { code = 1911, protocolName = "client.addFriendAgreeAll", methodName = "" },
    
    --好友推荐
    MSG_C2S_GetRecommendFriendList = { code = 1912, protocolName = "client.getRecommendFriendList", methodName = "" },
    MSG_S2C_GetRecommendFriendList = { code = 2912, protocolName = "server.recommendFriendList", methodName = "S2C_GetRecommendFriendList" },
    
    MSG_S2C_updateUnreadMsgNum = { code = 4008, protocolName = "server.updateUnreadMsgNum", methodName = "S2C_updateUnreadMsgNum" },

    MSG_S2C_GetRequestFriendData = { code = 2916, protocolName = "server.friendApplyToList", methodName = "S2C_GetRequestFriendData" },



    --聊天
    --好友聊天
    MSG_C2S_FriendChatMessage = { code = 3003, protocolName = "client.sendFriendChatMsg", methodName = "" },
    MSG_C2S_getFriendChatMsg = { code = 3004, protocolName = "client.getFriendChatMsg", methodName = "" },
    MSG_C2S_readFriendChatMsgAll = { code = 3005, protocolName = "client.readFriendChatMsgAll", methodName = "" },
    MSG_S2C_receiveFriendChatMessageOne = { code = 4002, protocolName = "server.receiveFriendChatMessageOne", methodName = "S2C_receiveFriendChatMessageOne" },
    MSG_S2C_FriendChatMsgAck = { code = 4005, protocolName = "server.sendFriendChatMsgAck", methodName = "S2C_FriendChatMsgAck" },
    MSG_S2C_FriendChatMessage = { code = 4006, protocolName = "server.receiveFriendChatMessage", methodName = "S2C_FriendChatMessage" },
    MSG_S2C_readFriendChatMsgAck= { code = 4007, protocolName = "server.readFriendChatMsgAck", methodName = "S2C_readFriendChatMsgAck" },
    --频道聊天
    MSG_C2S_RoomChatMessage = { code = 3002, protocolName = "client.sendChatMsg", methodName = "" },
    MSG_S2C_RoomChatMsgAck = { code = 4003, protocolName = "server.sendChatMsgAck", methodName = "S2C_RoomChatMsgAck" },
    MSG_S2C_RoomChatMessage = { code = 4004, protocolName = "server.receiveChatMessage", methodName = "S2C_RoomChatMessage" },
    --魔法表情
    MSG_C2S_SendMagicEmoji = { code = 3009, protocolName = "client.sendMagicEmoji", methodName = "" },
    MSG_C2S_ShaibaoSendMagicEmoji = { code = 3407, protocolName = "client.c2sShaibaoSendMagicEmoji", methodName = "" },
    MSG_S2C_SendMagicEmojiAck = { code = 4009, protocolName = "server.sendMagicEmojiAck", methodName = "S2C_SendMagicEmojiAck" },
    MSG_S2C_MagicEmoji = { code = 4010, protocolName = "server.magicEmoji", methodName = "S2C_MagicEmoji" },


    --多语言同步
    MSG_C2S_MultiLanguage = { code = 1200, protocolName = "client.setLanguage", methodName = "" },



    --背包
    MSG_S2C_UpdateUserItems = { code = 2033, protocolName = "server.updateUserItems", methodName = "S2C_UpdateUserItems" },

    MSG_C2S_GetBagList = { code = 1301, protocolName = "client.getBagList", methodName = "" },
    MSG_S2C_GetBagList = { code = 2034, protocolName = "server.bagList", methodName = "S2C_GetBagList" },

    MSG_C2S_UseDiceBox = { code = 1306, protocolName = "client.useDiceBox", methodName = "" },

    --红点
    MSG_S2C_redPoint = { code = 4201, protocolName = "server.redPoint", methodName = "S2C_redPoint" },
    MSG_C2S_getRedPoint = { code = 3201, protocolName = "client.getRedPoint", methodName = "" },
    MSG_C2S_removeRedPoint = { code = 3202, protocolName = "client.removeRedPoint", methodName = "" },
    MSG_S2C_removeRedPointAck = { code = 4202, protocolName = "server.removeRedPointAck", methodName = "S2C_removeRedPointAck" },

    MSG_C2S_guideStepUpdate = { code = 1206, protocolName = "client.guideStepUpdate", methodName = "" },
    MSG_S2C_guideStepUpdateAck = { code = 2205, protocolName = "server.guideStepUpdateAck", methodName = "S2C_guideStepUpdateAck" },

    MSG_S2C_kick = { code = 2202, protocolName = "server.kick", methodName = "S2C_kick" },
    MSG_S2C_gainRegisterReward = { code = 2203, protocolName = "server.gainRegisterReward", methodName = "S2C_gainRegisterReward" },
    MSG_S2C_gainRescueGold = { code = 2204, protocolName = "server.gainRescueGold", methodName = "S2C_gainRescueGold" },

    --猜大小
    MSG_c2sBigSmallBankerOn = { code = 3301, protocolName = "client.c2sBigSmallBankerOn", methodName = "" },
    MSG_c2sBigSmallBankerOff = { code = 3302, protocolName = "client.c2sBigSmallBankerOff", methodName = "" },
    MSG_c2sBigSmallBet = { code = 3303, protocolName = "client.c2sBigSmallBet", methodName = "" },
    MSG_c2sBigSmallBetListReq = { code = 3304, protocolName = "client.c2sBigSmallBetListReq", methodName = "" },
    MSG_c2sBigSmallRob = { code = 3305, protocolName = "client.c2sBigSmallRob", methodName = "" },

    MSG_s2cBigSmallBet = { code = 4301, protocolName = "server.s2cBigSmallBet", methodName = "s2cBigSmallBet" },
    MSG_s2cBigSmallStateInfo = { code = 4302, protocolName = "server.s2cBigSmallStateInfo", methodName = "s2cBigSmallStateInfo" },
    MSG_s2cBigSmallBankerInfo = { code = 4303, protocolName = "server.s2cBigSmallBankerInfo", methodName = "s2cBigSmallBankerInfo" },
    MSG_s2cBigSmallPoolUpdate = { code = 4304, protocolName = "server.s2cBigSmallPoolUpdate", methodName = "s2cBigSmallPoolUpdate" },
    MSG_s2cBigSmallBaozi = { code = 4305, protocolName = "server.s2cBigSmallBaozi", methodName = "s2cBigSmallBaozi" },
    MSG_s2cBigSmallRobResult = { code = 4306, protocolName = "server.s2cBigSmallRobResult", methodName = "s2cBigSmallRobResult" },
    MSG_s2cBigSmallRobRank = { code = 4307, protocolName = "server.s2cBigSmallRobRank", methodName = "s2cBigSmallRobRank" },
    MSG_s2cBigSmallBetList = { code = 4308, protocolName = "server.s2cBigSmallBetList", methodName = "s2cBigSmallBetList" },


    --筛宝相关

    --获取筛宝信息
    MSG_c2sShaibaoInfo={code = 3401, protocolName = "client.c2sShaibaoInfo", methodName = ""},

    --筛子结果记录
    MSG_c2sShaibaoDiceHistory={code = 3402, protocolName = "client.c2sShaibaoDiceHistory", methodName = ""},

    --庄家选择翻倍
    MSG_c2sShaibaoDouble={code = 3403, protocolName = "client.c2sShaibaoDouble", methodName = ""},

    --下注请求
    MSG_c2sShaibaoBet={code = 3404, protocolName = "client.c2sShaibaoBet", methodName = ""},

    --抢庄 
    MSG_c2sShaibaoRobBanker={code = 3405, protocolName = "client.c2sShaibaoRobBanker", methodName = ""},

    --庄家下庄
    MSG_c2sShaibaoBankerOff={code = 3406, protocolName = "client.c2sShaibaoBankerOff", methodName = ""},

    --筛宝筛子每局记录
    MSG_s2cShaibaoDiceHistory = { code = 4402, protocolName = "server.s2cShaibaoDiceHistory", methodName = "s2cShaibaoDiceHistory" },

    --筛宝初始化数据
    MSG_s2cShaibaoInfo = { code = 4401, protocolName = "server.s2cShaibaoInfo", methodName = "s2cShaibaoInfo" },

    --设置翻倍区域回复
    MSG_s2cShaibaoDouble = { code = 4403, protocolName = "server.s2cShaibaoDouble", methodName = "s2cShaibaoDouble" },

    --筛宝开局通知
    MSG_s2cShaibaoStart = { code = 4404, protocolName = "server.s2cShaibaoStart", methodName = "s2cShaibaoStart" },

    --抢庄回复
    MSG_s2cShaibaoRobBanker = { code = 4405, protocolName = "server.s2cShaibaoRobBanker", methodName = "s2cShaibaoRobBanker" },

    --庄家信息变更
    MSG_s2cShaibaoBankerUpdate = { code = 4406, protocolName = "server.s2cShaibaoBankerUpdate", methodName = "s2cShaibaoBankerUpdate" },

    --下注回复
    MSG_s2cShaibaoBet = { code = 4407, protocolName = "server.s2cShaibaoBet", methodName = "s2cShaibaoBet" },

    --筛宝对局结果
    MSG_s2cShaibaoResult = { code = 4408, protocolName = "server.s2cShaibaoResult", methodName = "s2cShaibaoResult" },

    --主动下庄回复
    MSG_s2cShaibaoBankerOff = { code = 4409, protocolName = "server.s2cShaibaoBankerOff", methodName = "s2cShaibaoBankerOff" },
    --筛宝结果 
    MSG_s2cShaibaoGameover = {code = 4410, protocolName = "server.s2cShaibaoGameover", methodName = "s2cShaibaoGameover"},
    --骰宝魔法表情房间广播
    MSG_s2cShaibaoMagicEmojiBroadcast = {code = 4411, protocolName = "server.s2cShaibaoMagicEmojiBroadcast", methodName = "s2cShaibaoMagicEmojiBroadcast"},


    --通过uid获取角色信息
    MSG_c2sAvatarInfo={code = 3503, protocolName = "client.c2sAvatarInfo", methodName = ""},

    --筛宝结果 
    MSG_s2cAvatarInfo = {code = 4503, protocolName = "server.s2cAvatarInfo", methodName = "s2cAvatarInfo"},

    --新手引导
    MSG_c2sUpdateGuideGroup={code = 3601, protocolName = "client.c2sUpdateGuideGroup", methodName = ""},
    MSG_c2sGetGuideGroupRewards={code = 3602, protocolName = "client.c2sGetGuideGroupRewards", methodName = ""},
    MSG_s2cGuideGroupUpdateAck = {code = 4601, protocolName = "server.s2cGuideGroupUpdateAck", methodName = "s2cGuideGroupUpdateAck"},
    --私房
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
}