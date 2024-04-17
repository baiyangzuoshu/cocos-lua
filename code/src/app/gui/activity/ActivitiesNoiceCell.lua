local UIPanel = require("app.gui.basegui.UIPanel")

local M = class("ActivitiesNoiceCell", UIPanel)

M.GUI_FILE_NAME = "csd.01_11_ActivitiesBulletin.01_11_ActivitiesNoiceCell.lua"

M.BINDGUIDATANODE = {
    ["NoticePanel"]={varname="NoticePanel",onClick="onClickEvent"},
}

function M:onClickEvent(ref)
    local str="端午节，又称端阳节、龙舟节、重五节、天中节等，是集拜神祭祖、祈福辟邪、欢庆娱乐和饮食为一体的民俗大节。端午节源于自然天象崇拜，由上古时代祭龙演变而来。仲夏端午，苍龙七宿飞升于正南中央，处在全年最“中正”之位，正如《易经·乾卦》第五爻：“飞龙在天”。端午是“飞龙在天”吉祥日，龙及龙舟文化始终贯穿在端午节的传承历史中。 [1-4] \n端午节是流行于中国以及汉字文化圈诸国的传统文化节日， [139]  传说战国时期的楚国诗人屈原在五月初五跳汨罗江自尽，后人亦将端午节作为纪念屈原的节日；也有纪念伍子胥、曹娥及介子推等说法。端午节的起源涵盖了古老星象文化、人文哲学等方面内容，蕴含着深邃丰厚的文化内涵，在传承发展中杂糅了多种民俗为一体，各地因地域文化不同而又存在着习俗内容或细节上的差异。 [49]  [127-131]  [135] 端午节与春节、清明节、中秋节并称为中国四大传统节日。端午文化在世界上影响广泛，世界上一些国家和地区也有庆贺端午的活动。2006年5月，国务院将其列入首批国家级非物质文化遗产名录；自2008年起，被列为国家法定节假日。2009年9月，联合国教科文组织正式批准将其列入《人类非物质文化遗产代表作名录》，端午节成为中国首个入选世界非遗的节日。 [130] 2021年10月25日，《国务院办公厅关于2022年部分节假日安排的通知》发布，2022年端午节：6月3日至5日放假，共3天。 [140] ";
    local panel=UIManager:getOrCreatePanel("UIActivitiesNoticePopUp")
    if panel then
        panel:showToScene()
        panel:showNotice(str)
    end
end

function M:onCreate()
    M.super.onCreate(self)
    self.NoticePanel:setSwallowTouches(false)
end

function M:onInit()
    
end

return M