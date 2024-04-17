local MailContent = {
["1"] = { MailId = 1, MailTitle = "LLLL对局胜利LLLL", MailContent = "LLLL您在对局中获胜，盈利{0}金币LLLL", MailContentValueArray = "1", MailSign = "LLLLLet\'s Roll运营组LLLL", MailTimeLimit = 86400 },
["2"] = { MailId = 2, MailTitle = "LLLL对局失败LLLL", MailContent = "LLLL您在对局中失败，损失{0}金币LLLL", MailContentValueArray = "1", MailSign = "LLLLLet\'s Roll运营组LLLL", MailTimeLimit = 86400 },
["3"] = { MailId = 3, MailTitle = "LLLL竞猜成功LLLL", MailContent = "LLLL您竞猜成功，盈利{0}金币LLLL", MailContentValueArray = "1", MailSign = "LLLLLet\'s Roll运营组LLLL", MailTimeLimit = 86400 },
["4"] = { MailId = 4, MailTitle = "LLLL竞猜失败LLLL", MailContent = "LLLL您竞猜失败，损失{0}金币LLLL", MailContentValueArray = "1", MailSign = "LLLLLet\'s Roll运营组LLLL", MailTimeLimit = 86400 },
["5"] = { MailId = 5, MailTitle = "LLLL竞猜返还LLLL", MailContent = "LLLL没有竞猜对手，返还{0}金币LLLL", MailContentValueArray = "1", MailSign = "LLLLLet\'s Roll运营组LLLL", MailTimeLimit = 86400 },
["6"] = { MailId = 6, MailTitle = "LLLL猜大小游戏LLLL", MailContent = "LLLL尊敬的玩家：\\n    猜大小游戏中您选择主动下庄，已为您下庄。您上庄时本金为{0}金币，剩余本金为{1}金币，请注意查收哦~LLLL", MailContentValueArray = "1,1", MailSign = "LLLLLet\'s Roll运营组LLLL", MailTimeLimit = 86400 },
["7"] = { MailId = 7, MailTitle = "LLLL猜大小游戏LLLL", MailContent = "LLLL尊敬的玩家：\\n    猜大小游戏中您的庄家身份被{0}抢走，已为您自动下庄。您上庄时本金为{1}金币，剩余本金为{2}金币，请注意查收哦~LLLL", MailContentValueArray = "0,1,1", MailSign = "LLLLLet\'s Roll运营组LLLL", MailTimeLimit = 86400 },
["8"] = { MailId = 8, MailTitle = "LLLL猜大小游戏LLLL", MailContent = "LLLL尊敬的玩家：\\n    本轮猜大小游戏结束，已为您自动下庄。您上庄时本金为{0}金币，剩余本金为{1}金币，请注意查收哦~LLLL", MailContentValueArray = "1,1", MailSign = "LLLLLet\'s Roll运营组LLLL", MailTimeLimit = 86400 },
["9"] = { MailId = 9, MailTitle = "LLLL猜大小游戏LLLL", MailContent = "LLLL尊敬的玩家：\\n    猜大小游戏中您的本金金额不足，已为您自动下庄。您上庄时本金为{0}金币，剩余本金为{1}金币，请注意查收哦~LLLL", MailContentValueArray = "1,1", MailSign = "LLLLLet\'s Roll运营组LLLL", MailTimeLimit = 86400 },
["10"] = { MailId = 10, MailTitle = "LLLL骰宝游戏LLLL", MailContent = "LLLL尊敬的玩家：\\n    骰宝游戏中您选择主动下庄，已为您下庄。您上庄时本金为{0}金币，剩余本金为{1}金币，请注意查收哦~LLLL", MailContentValueArray = "1,1", MailSign = "LLLLLet\'s Roll运营组LLLL", MailTimeLimit = 86400 },
["11"] = { MailId = 11, MailTitle = "LLLL骰宝游戏LLLL", MailContent = "LLLL尊敬的玩家：\\n    骰宝游戏中您的庄家身份被{0}抢走，已为您自动下庄。您上庄时本金为{1}金币，剩余本金为{2}金币，请注意查收哦~LLLL", MailContentValueArray = "0,1,1", MailSign = "LLLLLet\'s Roll运营组LLLL", MailTimeLimit = 86400 },
["12"] = { MailId = 12, MailTitle = "LLLL骰宝游戏LLLL", MailContent = "LLLL尊敬的玩家：\\n    骰宝游戏中您的本金金额不足，已为您自动下庄。您上庄时本金为{0}金币，剩余本金为{1}金币，请注意查收哦~LLLL", MailContentValueArray = "1,1", MailSign = "LLLLLet\'s Roll运营组LLLL", MailTimeLimit = 86400 },
["13"] = { MailId = 13, MailTitle = "LLLL骰宝游戏LLLL", MailContent = "LLLL尊敬的玩家：\\n    骰宝游戏中您的坐庄时间已达上限，已为您自动下庄。您上庄时本金为{0}金币，剩余本金为{1}金币，请注意查收哦~LLLL", MailContentValueArray = "1,1", MailSign = "LLLLLet\'s Roll运营组LLLL", MailTimeLimit = 86400 }

}
cc.exports.g_MailContent = MailContent
