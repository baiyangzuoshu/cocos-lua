local Subscription = {
["0"] = { SubscriptionLV = 0, HiddenName = "无订阅", ProductId = "", CentPrice = 0, SubscriptionIcon = "0", IsGiftAvatarBox = false, GiftRes = {}, BoastKickPower = false, DiceBabyAllInPower = false, DiceBabyDoubleNum = 1, SpecialFocusNum = 1, EverydayGiftRes = {}, SkipADVPower = false },
["1"] = { SubscriptionLV = 1, HiddenName = "白银订阅", ProductId = "", CentPrice = 499, SubscriptionIcon = "1", IsGiftAvatarBox = true, GiftRes = {}, BoastKickPower = false, DiceBabyAllInPower = false, DiceBabyDoubleNum = 2, SpecialFocusNum = 3, EverydayGiftRes = {{2,{50000}}}, SkipADVPower = false },
["2"] = { SubscriptionLV = 2, HiddenName = "黄金订阅", ProductId = "", CentPrice = 1999, SubscriptionIcon = "2", IsGiftAvatarBox = true, GiftRes = {}, BoastKickPower = false, DiceBabyAllInPower = true, DiceBabyDoubleNum = 3, SpecialFocusNum = 5, EverydayGiftRes = {{2,{100000}},{1,{100}}}, SkipADVPower = true },
["3"] = { SubscriptionLV = 3, HiddenName = "黑卡订阅", ProductId = "", CentPrice = 19999, SubscriptionIcon = "3", IsGiftAvatarBox = true, GiftRes = {{201,{0,2}}}, BoastKickPower = true, DiceBabyAllInPower = true, DiceBabyDoubleNum = 5, SpecialFocusNum = 10, EverydayGiftRes = {{2,{1000000}},{1,{1000}}}, SkipADVPower = true }

}
cc.exports.g_Subscription = Subscription
