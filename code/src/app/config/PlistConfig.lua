local M = {}

M.Animation = {
    ["0001"] = { Files = 1, Res = "0001" },
    ["1001"] = { Files = 1, Res = "1001" },
    ["1002"] = { Files = 2, Res = "1002" },
    ["1003"] = { Files = 2, Res = "1003" },
    ["1004"] = { Files = 3, Res = "1004" },
    ["1005"] = { Files = 2, Res = "1005" },
    ["1006"] = { Files = 2, Res = "1006" },
}

M.Icon = {
    Head = { Id = "0010", Files = 1, Res = "010" },                 --头像
    HeadBox={ Id = "0020", Files = 1, Res = "020" },                --头像框
    BigItem = { Id = "0030", Files = 1, Res = "030" },              --普通道具图标
    MiniItem = { Id = "0031", Files = 1, Res = "031" },             --小道具
    BigItemIcon = { Id = "0032", Files = 1, Res = "032" },          --大道具图标
    StaticDiceBox = { Id = "0040", Files = 1, Res = "040" },        --静态筛盅
    ShopGoods = { Id = "0050", Files = 1, Res = "050" },            --商品图
    RoomBg = { Id = "0060", Files = 2, Res = "060" },               --房间背景图
    TaskIcon = { Id = "0070", Files = 1, Res = "070" },             --任务图标
    ChatEmoji = { Id = "0080", Files = 1, Res = "080" },             --表情
    MagicEmoji = { Id = "0090", Files = 1, Res = "090" },             --魔法表情
    VipIcon = { Id = "0100", Files = 1, Res = "100" },             --vip图标
    VipIconMini = { Id = "0101", Files = 1, Res = "101" },             --vip铭牌
    VipIconTail = { Id = "0102", Files = 1, Res = "102" },             --vip铭牌新
}

return M