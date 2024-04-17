local GuideGroup = {
["1"] = { GuideGroupId = 1, HiddenName = "首次登录引导", ShowName = "", TriggerConditionArray = {}, IsSkipable = false, IsRepeatable = false, RewardInfo = {}, NextGroupId = 0, IsEnd = false },
["2"] = { GuideGroupId = 2, HiddenName = "吹牛模式", ShowName = "LLLL吹牛新手教学LLLL", TriggerConditionArray = {{0,{1}}}, IsSkipable = true, IsRepeatable = true, RewardInfo = {{2,{1000}}}, NextGroupId = 0, IsEnd = true }

}
cc.exports.g_GuideGroup = GuideGroup
