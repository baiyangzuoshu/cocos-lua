--[[
    author:{Vstar}
    time:2020-08-10 14:27:01
	说明：后续将会减少使用，改用GameEnum
]]
cc.exports.Enum={}

Enum.LoginType = {
    Unknow = "",
    Guest = "Guest",
    User = "User",
    Google = "Google",
    Apple = "Apple",
    Facebook = "Facebook",
    Line = "Line",
}

Enum.GameType={
    Base        =        1,      -- 吹牛模式
    Duel           =                 2,       -- 吹牛单挑模式
    ShowHand = 3,    -- 梭哈模式
    Bullfight = 4,       -- 牛牛模式
    BlackRed = 5,      -- 红黑模式
}
--商店类型
Enum.ShopShowType = {
    Null = -1,
    Diamond = 0,    --钻石充值
    Gold = 1,       --金币商城
    DiceCup = 2,    --筛盅
}

Enum.ShopGoodsShowType = {
    Goods = 1,      --商品
    Items = 2,      --道具
}

Enum.RechargeType = {
    Diamond = 1,
    GoodieBag = 2,
}

--背包道具类型
Enum.PackageItemType = {
    Null = -1,
    Gold = 1,       --金币
}

--道具展示类型
Enum.ItemShowType = {
    Null = -1,      
    Diamond = 1,                --钻石
    Gold = 2,                   --金币
    Avatar = 101,               --头像
    AvatarFrame = 102,          --头像框
    DiceCup = 103,              --骰盅  
    BubbleBox = 104,            --气泡框
    ChatEmoji = 105,            --聊天表情
    MagicEmoji = 106,           --魔法表情
    Material = 201,             --材料
    WeeklyActivity = 3,         --周活跃点
}

--个人中心
Enum.SexShowType = {
    Male = 1,
    FeMale = 2,
    Null = 3,
}

Enum.HeadFrameTab = {
    UnKnow = 0,
    Head = 1,           --头像
    HeadFrame = 2,      --头像框
}

--邮箱
Enum.EmailState = {
    unread = 1,      --未读未提取
    unreceived = 2,   --已读未提取
    received = 3,     --已读已提取
}

--任务
Enum.TaskType = {
    NewUser = 1,
    Day = 2,
    Week = 3,
    Invite = 4,
    Season = 5,
    Activity = 6,
    Login=7,
}

Enum.UISkipType = {
    Unknow = 0,
    ChuiNiu = 1,
    Store_Diamond = 2,
    Store_Gold = 3,
    Store_DiceCup = 4,
}

--好友
Enum.FriendTab = {
    UnKnow = 0,
    FriendList = 1,         --好友
    FriendSearch = 2,      --被申请
    FriendRequest = 3,       --添加
    FriendBlock = 4,        --黑名单
}

Enum.OnlineState = {
    Offline = 1,            -- 离线
    Idle = 2,              -- 空闲
    Matching = 3,           -- 匹配中
    Gaming = 4,           -- 游戏中
    Watching = 5,             -- 观战中
}

Enum.FriendStatus = {
    none = 1,
    requesting = 2,
    friend = 3,
    block = 4
}

--背包
Enum.PackageTab = {
    UnKnow = 0,
    DiceCup = 1,
    Item = 2,
}

Enum.Animation = {
    plist = 1,
    ccs = 2,
    spine = 3,

}

Enum.TextFieldAlignment = {
    TOP = 0,        --
    CENTER = 1,     --居中
    BOTTOM = 2,     --
}

Enum.LanguageType={
    zh_cn = "CN",               --简体中文
    en = "EN",               --英文
    zh_tw = "TW",               --繁体中文
}

Enum.BroadcastType = {
    Custom = 1,
    BigSmallLuck = 2,
    BigSamllBet = 3,
    BigSmallBaozi = 4,
}

Enum.ServerConditionType = {
    Done_By_Default = 0,            --默认完成
    Create_User_Days = 1,           --创角天数大于等于
    Own_Item_Num = 2,               --拥有指定编号道具数量大于等于
    Invite_Valid_Click = 3,         --邀请链接有效点击数大于等于
    Invite_Valid_Sign = 4,          --邀请链接有效注册数大于等于
    Invite_Get_Commission = 5,      --邀请链接获取佣金钻石数大于等于
    Any_GameType_Finish = 6,        --任意游戏类型完成次数大于等于
    Any_GameType_Win = 7,           --任意游戏类型获胜次数大于等于
    Any_GameType_Lose = 8,          --任意游戏类型失败次数大于等于
    Specify_GameType_Finish = 9,    --指定游戏类型完成次数大于等于
    Specify_GameType_Win = 10,      --指定游戏类型获胜次数大于等于
    Specify_GameType_Lose = 11,     --指定游戏类型失败次数大于等于
    Consume_Diamonds_Num = 12,      --消耗钻石数量大于等于
    Any_GameType_Quiz = 13,         --任意游戏类型竞猜大于等于
}

Enum.ChatChannel = {
    friend=0,
    room = 1,
    world=2
}

Enum.Text = {
    FirstModify = 3,	    --首次修改免费，是否确定修改,	--昵称/性别修改
    MultiModify = 4,	    --是否花费{1}钻进行修改,	--昵称/性别修改
    GoldBuy = 5,	        --您将花费{1}钻购买{2}金币,	--金币购买确认框
    GolsBuySuccess = 6,	    --恭喜您获得{1}金币,	--金币购买成功提示
    DiaMondBuySuccess = 7,  -- 钻石 
    HourAfter = 8,               --小時後過期 
    DayAfter = 9,                --天后過期
    HourBefore = 10,             --小時前
    DayBefore = 11,              --天前
    Just = 12,                   --刚刚
    MinuteBefore = 13,           --{0}分钟前
    TodayMoring = 14,            --上午{0}
    TodayAfternoon = 15,         --下午{0}
    YesterdayMoring = 16,        --昨天 
    YesterdayAfternoon = 17,     --
    Monday = 18,                 --星期一
    Tuesday = 19,               
    Wednesday = 20,            
    Thursday = 21,              
    Friday = 22,
    Saturday = 23,
    Sunday = 24,
    Date = 25,                  --{0}月{1}日            
    RoomChannel = 26,           --房间频道名
    VipLevelShow = 27,          --再累计充值{0}钻石，将升到下一级
    ShareURL=28,                
    ShareRules=68,
    StakeGold = 30,              --已升至最高场次
    DiceCupBuy = 31,                           --您将花费{0}钻购买{1}
    DiceCupBuySuccess = 32,
    invitation1=33,
    invitation2=34,
    invitation3=35,
    newFriend=36,
    netTile=37,
    netBtn=38,
    netstart=50,
    loginstart=51,
    InputPlaceHolder = 52,
    AccountInputPlaceHolder = 66,
    PasswordInputPlaceHolder = 67,
    HeadFrameDayTime = 69,
    HeadFrameHourTime = 70,
    SitDownErrorGoldNotEnough = 77,

    --前端弹窗
    --勾选用户协议
    TitleText = 37,
    ContentText = 39,
    ButtonText = 38,
    --黑名单
    BlackTitleText = 46,
    BlackContentText = 45,
    BlackRemove = 47,
    BlackCancle = 44,

    --登录成功
    LoginTitleText = 42,
    LoginContentText = 41,

    --钻石不足
    DiamondTitleText = 37,
    DiamondContentText = 48,
    DiamondButtonText = 38,

    --豹子顺子
    LeopardText = 54,
    StraightText = 55,

    KICKText=56,
    DiffLogin=57,
    KICKText1=58,
    KICKText2=59,
    KICKText3=60,

    DeleteAgreementText_1 = 111,
    DeleteAgreementText_2 = 112,
    DeleteAgreementText_3 = 113,
    ChkDeleteText = 62,
    ReChkDeleteText = 63,
    ContinueText = 64,
    ChkDeleteText2 = 65,

    --登录网络
    NetErrorContent = 40,

    --猜大小
    GuessSizeBankerCost=72,
    GuessSizeRichText=76,
    GuessSizeRichBig=78,
    GuessSizeRichSmall=79,
    GuessSizeRichSuccess=80,
    GuessSizeRichLose=81,
    GuessSizeRichWin=82,
    GuessSizeRichFaild=83,
    --邀请
    InvitationText1=84,--邀请有礼-累计金币
    InvitationText2=85,--邀请有礼-累计钻石
    InvitationText3=86,--邀请有礼-好友点击
    InvitationText4=87,--邀请有礼-好友注册
    InvitationText5=88,--邀请有礼-好友充值
    InvitationText6=89,--邀请有礼-累计金币2
    InvitationText7=90,--邀请有礼-累计钻石2

    --客服
    ServiceText1=96,
    ServiceText2=97,
    ServiceText3=98,
    ServiceText4=99,

    GuessSizeBigWin=101,
    GuessSizeBigLose=102,
    GuessSizeSmallWin=103,
    GuessSizeSmallLose=104,
}

Enum.PopMessage = {
    --后端弹窗
    LoginSuccess = 200,
    Error=500,
    DiamodNotEnough = 52002,
    DiffLogin=99004,
}

Enum.requestServerHodType={
    InternalTest = 1,   --内测
    outTest = 2,   --外侧
    outLine = 3,   --线上
    Auto = 4,
}

Enum.requestSystemType={
    ios = 1,
    android = 2,
}

Enum.redPointSubcategory ={
    diceList = 1;  -- 【背包界面】【骰盅分页】
    vipAwardButton = 2; --【商城界面】【Vip升级奖励按钮】
    friendApplyList = 3; -- 【好友界面】【申请列表分页】
    mailButton = 4;  --【主界面】【邮件按钮】
    inviteClickNumButton = 5;  --【邀请有礼】【点击数任务按钮】
    inviteRegisterNumButton = 6;  --【邀请有礼】【注册数任务按钮】
    inviteChargeNumButton = 7;  --【邀请有礼】【充值数任务按钮】
    inviteAwardButton = 8;  --【邀请有礼】【领取按钮】
    inviteFriendClick = 9; --【邀请有礼】【好友点击分页】
    inviteFriendRegister = 10;--【邀请有礼】【好友注册分页】
    inviteFriendCharge = 11;--【邀请有礼】【好友充值分页】
    accont = 12;  --【账户管理界面】【账户（未注册）文本】 （未设置账号）
    avatarList = 13;  -- 【个性设置界面】【头像框分页】 （新获得头像框）
    nicknameEditButton = 14;  -- 【编辑按钮】【角色昵称编辑按钮】
    sexEditButton = 15;  -- 【编辑按钮】【角色性别编辑按钮】
    avatarEditButton = 16; -- 【编辑按钮】【角色头像编辑按钮】
    activity = 17;  -- 【主界面】【活动按钮】
  }

  Enum.mainHotType={
      activity=1,
      task=2,
      shop=3,
      bag=4,
      friend=5,
      userInfo=6,
      email=7,
      set=8,
      invitation=9
  }

  Enum.ChatText={
      RoomDefault="RoomDefault"
  }

  Enum.GuessType={
    Size=2,
    Leopard=3,
    Egg=4
  }

  Enum.BankerLeave={
    Default=1,
    Off=2,
    Gold=3,
    Farmer=4
  }
--参数类型
  Enum.ParmType={
    string = 0,
    number = 1
  }

  Enum.ServicePlayerSort={
    CollectButton=1,
    GenderButton=2,
    RegisterButton=3,
    RechargeButton=4,
    LanguageButton=5,
    RoomServiceButton=6,
    RoomPlayerButton=7,
    StateButton=8
  }

  Enum.ShaibaoDiceType={
	Count1		= 1, --数字1的数量
	Count2		= 2, --数字2的数量
	Count3		= 3, --...3...
	Count4		= 4, --...4...
	Count5		= 5, --...5...
	Count6		= 6, --/...6...
	
	BigDice		= 7, --大
	SmallDice	= 8, --小
	Single    = 9, --单
	Double    = 10, --双
	Series		= 11, --顺子
	Same      = 12, --豹子
}

Enum.ShaibaoState={
    Init    = 1,--初始状态
    Beting  = 2,--下注阶段
}

Enum.ShaiBaoBetTye={
    Bai= 1,
    Qian = 2,
    Wan = 3,
    ShiWan = 4,
    BaiWan = 5,
}
--下庄原因
Enum.ShaiBaoOffReason={
    TimeOver      = 1,--时间到下庄
    ReqOff        = 2,--主动下庄
    ChipNotEnough	= 3,--金币不足
    BeKicked      = 4,--被踢下庄
    On            = 5,--继续在庄上   
}

Enum.Userstatus = {
    Loking = 0,--闲逛
    ShaibaoGaing = 1,--骰宝游戏中
    ChuiniuGaing = 2,--吹牛游戏中
    ShaibaoRoom  = 3,--骰宝闲逛中
}

Enum.RoomType={
    Common=1,
    Private=2
}