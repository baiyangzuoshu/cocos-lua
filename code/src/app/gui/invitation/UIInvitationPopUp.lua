local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIInvitationPopUp", UIPanel)

M.GUI_FILE_NAME = "csd.03_04_Invitation.03_04_InvitationPopUp.lua"

M.BINDGUIDATANODE = {
    ["InvitationButton"]={varname="InvitationButton",onClick="onClickEvent"},
    ["MorePanel"]={varname="MorePanel",onClick="onClickEvent"},
    ["RulePanel"]={varname="RulePanel",onClick="onClickEvent"},
    ["ReceiveButton"]={varname="ReceiveButton",onClick="onClickEvent"},
    
    ["ReceiveText_TT"] = {varname = "ReceiveText_TT"},

    ["ClickTaskText_TT"]={varname="ClickTaskText_TT"},
    ["RegisterTaskText_TT"]={varname="RegisterTaskText_TT"},
    ["RechargeTaskText_TT"]={varname="RechargeTaskText_TT"},

    ["ClickButton"]={varname="ClickButton",onClick="onSwitchBtn"},
    ["RegisterButton"]={varname="RegisterButton",onClick="onSwitchBtn"},
    ["RechargeButton"]={varname="RechargeButton",onClick="onSwitchBtn"},
    ["ClickText_1_TT"]={varname="ClickText_1_TT"},
    ["ClickText_2_TT"]={varname="ClickText_2_TT"},
    ["RegisterText_1_TT"]={varname="RegisterText_1_TT"},
    ["RegisterText_2_TT"]={varname="RegisterText_2_TT"},
    ["RechargeText_1_TT"]={varname="RechargeText_1_TT"},
    ["RechargeText_2_TT"]={varname="RechargeText_2_TT"},
    
    ["TaskNode_1"]={varname="TaskNode_1"},
    ["TaskNode_2"]={varname="TaskNode_2"},
    ["TaskNode_3"]={varname="TaskNode_3"},
    ["RewardNode_1"]={varname="RewardNode_1"},
    ["RewardNode_2"]={varname="RewardNode_2"},

    ["NameText_O"]={varname="NameText"},
    ["HeadIcon"]={varname="HeadIcon"},
    ["IDNum"]={varname="IDNum"},
    ["TimeText_TT"]={varname="TimeText_TT"},
    ["SexIcon"]={varname="SexIcon"},
    ["VipImage"] = { varname = "VipImage"},
    ["ResIcon"]={varname="ResIcon"},
    ["ResNum"]={varname="ResNum"},
    ["Click"]={varname="Click"},
    ["RegisterRecharge"]={varname="RegisterRecharge"},
    ["Check"]={varname="Check"},
    ["Reward"]={varname="Reward"},
    ["ClickText_TT"]={varname="ClickText_TT"},

    ["ClickTipDotIcon"]={varname="ClickTipDotIcon"},
    ["RegisterTipDotIcon"]={varname="RegisterTipDotIcon"},
    ["RechargeTipDotIcon"]={varname="RechargeTipDotIcon"},
    ["TaskDescBg"]={varname="TaskBg"}
}

function M:onCloseEvent()
    self.ClickText_TT:setString(self.clickText3)
    self:closePanel()
end

function M:refreshHot()
    self.ClickTipDotIcon:setVisible(g_HotData:hasHot(Enum.redPointSubcategory.inviteFriendClick))
    self.RegisterTipDotIcon:setVisible(g_HotData:hasHot(Enum.redPointSubcategory.inviteFriendRegister))
    self.RechargeTipDotIcon:setVisible(g_HotData:hasHot(Enum.redPointSubcategory.inviteFriendCharge))
end

function M:onSwitchBtn(ref)
    self["ClickButton"]:setBrightStyle(ccui.BrightStyle.normal)
    self["RegisterButton"]:setBrightStyle(ccui.BrightStyle.normal)
    self["RechargeButton"]:setBrightStyle(ccui.BrightStyle.normal)
    self["ClickText_1_TT"]:setTextColor(cc.c4b(255,255,255,255))
    self["ClickText_1_TT"]:setFontName("font/Default.TTF")
    self["RegisterText_1_TT"]:setTextColor(cc.c4b(255,255,255,255))
    self["RegisterText_1_TT"]:setFontName("font/Default.TTF")
    self["RechargeText_1_TT"]:setTextColor(cc.c4b(255,255,255,255))
    self["RechargeText_1_TT"]:setFontName("font/Default.TTF")

    local   name=ref:getName()
    if "ClickButton"==name then
        self.taskId=4001
        self["ClickText_1_TT"]:setTextColor(cc.c4b(0,0,0,255))
        self["ClickText_1_TT"]:setFontName("font/Font001.ttf")
        self["ClickButton"]:setBrightStyle(ccui.BrightStyle.highlight)

        g_HotData:C2S_removeRedPoint(Enum.redPointSubcategory.inviteFriendClick)
    elseif "RegisterButton"==name then
        self.taskId=4002
        self["RegisterText_1_TT"]:setTextColor(cc.c4b(0,0,0,255))
        self["RegisterText_1_TT"]:setFontName("font/Font001.ttf")
        self["RegisterButton"]:setBrightStyle(ccui.BrightStyle.highlight)

        g_HotData:C2S_removeRedPoint(Enum.redPointSubcategory.inviteFriendRegister)
    elseif "RechargeButton"==name then
        self.taskId=4003
        self["RechargeText_1_TT"]:setTextColor(cc.c4b(0,0,0,255))
        self["RechargeText_1_TT"]:setFontName("font/Font001.ttf")
        self["RechargeButton"]:setBrightStyle(ccui.BrightStyle.highlight)

        g_HotData:C2S_removeRedPoint(Enum.redPointSubcategory.inviteFriendCharge)
    end

    self:updateInfo()
end

function M:updateText()
    self.TaskBg:removeAllChildren()
    local _size=self.TaskBg:getContentSize()
    for kind=1,3,1 do
        local   kindData=g_TaskData:getKindPlayer(kind) or {data={},dailyCount=0}
        local   dailyCount=kindData.dailyCount
        local   total=0
        for _,v in ipairs(kindData["data"]) do
            total=total+v.itemInfo.itemNum
        end
        
        if 1==kind then
            local str=total..';'
            
            self.ClickButton:removeChildByName("ClickText_2")
            local InvitationText1=Enum.Text.InvitationText1
            if self.taskId==4001 then
                InvitationText1=Enum.Text.InvitationText6
            end
            local text=Utils.getFormatString(Utils.getTextByTextId(InvitationText1), str)
            local ret=string.gsub(text,'\\"','"')
            local node = Utils.CreateRichText(ret)
            node:setPosition(cc.p(10,_size.height/2))
            node:setAnchorPoint(cc.p(0,0.5))
            node:setName("ClickText_2")
            self.ClickButton:addChild(node)
            local _x,_y=self.ClickText_2_TT:getPosition()
            node:setPosition(cc.p(_x,_y))

            local num=dailyCount
            str=""
            str=str..GSystem.ClickRewardGold..";"
            str=str..num..";"
            str=str..GSystem.ClickEffectiveCount..";"
            local InvitationText3=Utils.getFormatString(Utils.getTextByTextId(Enum.Text.InvitationText3), str)
            local ret=string.gsub(InvitationText3,'\\"','"')
            local node = Utils.CreateRichText(ret)
            node:setPosition(cc.p(10,_size.height/2))
            node:setAnchorPoint(cc.p(0,0.5))
            self.TaskBg:addChild(node)

            self.clickRichText=node
        elseif 2==kind then
            local str=total..';'
            self.RegisterButton:removeChildByName("Register_2")

            local InvitationText1=Enum.Text.InvitationText1
            if self.taskId==4002 then
                InvitationText1=Enum.Text.InvitationText6
            end
            
            local text=Utils.getFormatString(Utils.getTextByTextId(InvitationText1), str)
            local ret=string.gsub(text,'\\"','"')
            local node = Utils.CreateRichText(ret)
            node:setAnchorPoint(cc.p(0,0.5))
            node:setName("Register_2")
            self.RegisterButton:addChild(node)
            local _x,_y=self.RegisterText_2_TT:getPosition()
            node:setPosition(cc.p(_x,_y))

            local num=dailyCount
            str=""
            str=str..GSystem.RegisterRewardGold..";"
            str=str..num..";"
            str=str..GSystem.RegisterEffectiveCount..";"
            local InvitationText4=Utils.getFormatString(Utils.getTextByTextId(Enum.Text.InvitationText4), str)
            local ret=string.gsub(InvitationText4,'\\"','"')
            local node = Utils.CreateRichText(ret)
            node:setPosition(cc.p(10,_size.height/2))
            node:setAnchorPoint(cc.p(0,0.5))
            self.TaskBg:addChild(node)

            self.registerRichText=node
        elseif 3==kind then
            local str=total..';'

            self.RechargeButton:removeChildByName("Recharge_2")
            local InvitationText2=Enum.Text.InvitationText2
            if self.taskId==4003 then
                InvitationText2=Enum.Text.InvitationText7
            end

            local text=Utils.getFormatString(Utils.getTextByTextId(InvitationText2), str)
            local ret=string.gsub(text,'\\"','"')
            local node = Utils.CreateRichText(ret)
            node:setPosition(cc.p(10,_size.height/2))
            node:setAnchorPoint(cc.p(0,0.5))
            node:setName("Recharge_2")
            self.RechargeButton:addChild(node)
            local _x,_y=self.RechargeText_2_TT:getPosition()
            node:setPosition(cc.p(_x,_y))

            str=GSystem.RechargeCommission..";"
            local InvitationText5=Utils.getFormatString(Utils.getTextByTextId(Enum.Text.InvitationText5), str)
            local ret=string.gsub(InvitationText5,'\\"','"')
            local node = Utils.CreateRichText(ret)
            node:setPosition(cc.p(10,_size.height/2))
            node:setAnchorPoint(cc.p(0,0.5))
            self.TaskBg:addChild(node)

            self.rechargeRichText=node
        end
    end

    self.clickRichText:setVisible(self.taskId==4001)
    self.registerRichText:setVisible(self.taskId==4002)
    self.rechargeRichText:setVisible(self.taskId==4003)
end

function M:updateInfo()
    local   kind=self.taskId-4000
    local   kindData=g_TaskData:getKindPlayer(kind) or {data={},dailyCount=0}
    table.sort(kindData.data,function(a,b)
        if a == nil or b == nil then 
            return false 
        end
        
        if a.createdTime>b.createdTime then
            return true
        end

        return false
    end)
    local   dailyCount=kindData.dailyCount
    local   playerInfo=kindData["data"][1]
    if nil==playerInfo then
        self.Check:setVisible(false)
    else
        self.Check:setVisible(true)
        self.NameText:setString(playerInfo.nickname)
       

        if 0==playerInfo.sex then
            self.SexIcon:setVisible(false)
        elseif 1==playerInfo.sex then
            self.SexIcon:setVisible(true)
            self.SexIcon:loadTexture("01_06_PersonalCenter/icon_030.png",ccui.TextureResType.plistType)
        elseif 2==playerInfo.sex then
            self.SexIcon:setVisible(true)
            self.SexIcon:loadTexture("01_06_PersonalCenter/icon_031.png",ccui.TextureResType.plistType)
        end

        local   itemId=playerInfo.itemInfo.itemId
        local   itemNum=playerInfo.itemInfo.itemNum

        local diamondId = GSystem.DiamondItemId
        local goldId = GSystem.GoldItemId
        local diamondIcon = DataManager:getTbxData("Item", diamondId).BigItemIcon
        local goldIcon = DataManager:getTbxData("Item", goldId).BigItemIcon

        self.ResNum:setString(itemNum..'')
        self.Click:setVisible(false)
        self.RegisterRecharge:setVisible(false)
        if 0==itemNum then
            local   data=DataManager:getTbxData("Text",Enum.Text.invitation3)
            self.ClickText_TT:setString(data.Desc)
        else
            self.ClickText_TT:setString(self.clickText3)
        end
        self.TimeText_TT:setString(Utils.getCreateTimeText(playerInfo.createdTime))
        self.IDNum:setString(playerInfo.uid)
        local   total=0
        for _,v in ipairs(kindData) do
            total=total+v.itemInfo.itemNum
        end

        if 1==kind then
            playerInfo.vipLevel=0
            
            self.Click:setVisible(true)
            self.ResIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.BigItem, goldIcon), ccui.TextureResType.plistType)
        elseif 2==kind then
            self.RegisterRecharge:setVisible(true)
            self.ResIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.BigItem, goldIcon), ccui.TextureResType.plistType)

            local   friendInfo= require("app.bean.FriendInfo").new(playerInfo)
            self.mFriendInfo=friendInfo
            self.HeadIcon:removeAllChildren()
            local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
            avater:InitTexture(string.utf8len(self.mFriendInfo:getAvatar())<7,self.mFriendInfo:getAvatar(),self.mFriendInfo:getFriendUid())
            self.HeadIcon:addChild(avater)
        elseif 3==kind then
            local   friendInfo= require("app.bean.FriendInfo").new(playerInfo)
            self.mFriendInfo=friendInfo
            self.HeadIcon:removeAllChildren()
            local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
            avater:InitTexture(string.utf8len(self.mFriendInfo:getAvatar())<7,self.mFriendInfo:getAvatar(),self.mFriendInfo:getFriendUid())
            self.HeadIcon:addChild(avater)

            self.RegisterRecharge:setVisible(true)
            self.ResIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.BigItem, diamondIcon), ccui.TextureResType.plistType)
        end

        local vipLevel = playerInfo.vipLevel
        if vipLevel <= 0 then 
            self.VipImage:setVisible(false)
        else
            self.VipImage:setVisible(true)
            local vipData = DataManager:getTbxData("Vip", vipLevel)
            
            if vipData then 
                self.VipImage:loadTexture(Utils.getIconStr(PlistConfig.Icon.VipIconTail, vipData.VipIcon), ccui.TextureResType.plistType)
            end
        end
        Utils.showFormatVip(self.NameText, self.VipImage)
    end

    self:updateText()
end

function M:onClickEvent(ref)
    --SoundSystemManager:playSound004()
    local   name=ref:getName()
    if "InvitationButton"==name then
        local userInfo = g_UserData:getUserInfo()
        local textData = DataManager:getTbxData("Text", Enum.Text.ShareURL)
        local shareUrl=userInfo:getShareUrl()
        local endPos=string.find(shareUrl,"&")
        local gubUrl=string.sub(shareUrl,1,endPos-1)
        local txt=textData.Desc..gubUrl.."&l="
        if g_UserData:getSystemLanguage() == Enum.LanguageType.zh_tw then
            txt=txt.."t"
        elseif g_UserData:getSystemLanguage() == Enum.LanguageType.en  then
            txt=txt.."e"
        elseif g_UserData:getSystemLanguage() == Enum.LanguageType.zh_cn  then
            txt=txt.."z"
        end
    
        Utils.copyToClipboard(txt)
        local   panel=UIManager:getOrCreatePanel("UIInvitationSharePopUp")
        if panel then
            panel:showToScene()
        end
    elseif "ReceiveButton"==name then
        self:getInvitedReward({})
        g_TaskData:C2S_gainInvitedReward()
        g_HotData:C2S_removeRedPoint(Enum.redPointSubcategory.inviteAwardButton)
    elseif "RulePanel"==name then
        SoundSystemManager:playSound004()
        local   panel=UIManager:getOrCreatePanel("UIInvitationRulesPopUp")
        if panel then
            panel:showToScene()
        end
    elseif "MorePanel"==name then
        SoundSystemManager:playSound004()
        local   panel=UIManager:getOrCreatePanel("UIInvitationCheck")
        if panel then
            panel:showToScene()
            panel:switchId(self.taskId)
        end
    end
end

function M:refreshUI()
    local   data=g_TaskData:getTaskDataByType(Enum.TaskType.Invite)
    for _,v in ipairs(data) do
        local   id=v["id"]
        if self.taskCells[id] then
            self.taskCells[id]:refreshData(v)
        end
    end
end

function M:getInvitedReward(data)
    local   items=data.items or {}
    local   goldNum=0
    local   diamond=0
    for _,v in ipairs(items) do
        if 1==v.itemId then
            diamond=diamond+v.itemNum
        elseif 2==v.itemId then
            goldNum=goldNum+v.itemNum
        end
    end
    
    self.rewardCells[1]:refreshData(Enum.ItemShowType.Diamond, diamond)
    self.rewardCells[2]:refreshData(Enum.ItemShowType.Gold, goldNum)
    local isCanClick = goldNum > 0 or diamond > 0
    
    if isCanClick then
        self.ReceiveText_TT:setOpacity(255)
    else
        self.ReceiveText_TT:setOpacity(125)
    end
    self.ReceiveButton:setEnabled(isCanClick)
    if goldNum<=0 and diamond<=0 then
        g_TaskData:isShowMainInviteHot()
    end
end

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.BigItem))
    self.taskId=4001
    self["ClickTaskText_TT"]:setVisible(false)
    self["ClickText_2_TT"]:setVisible(false)
    self["RegisterTaskText_TT"]:setVisible(false)
    self["RegisterText_2_TT"]:setVisible(false)
    self["RechargeTaskText_TT"]:setVisible(false)
    self["RechargeText_2_TT"]:setVisible(false)

    self.taskCells={}
    for i=1,3,1 do
        local   id=4000+i
        local   node=self["TaskNode_"..i]
        local   InvitationTaskCell=UIManager:createPanelOnly("InvitationTaskCell")
        InvitationTaskCell:resetCenterPosition()
        InvitationTaskCell:init(id,0)
        node:addChild(InvitationTaskCell)
        self.taskCells[id]=InvitationTaskCell
    end

    self.rewardCells={}
    for i=1,2,1 do
        local   node=self["RewardNode_"..i]
        local   InvitationRewardCell=UIManager:createPanelOnly("InvitationRewardCell")
        InvitationRewardCell:resetCenterPosition()
        local itemType = Enum.ItemShowType.Diamond
        if i == GSystem.DiamondItemId then 
            itemType = Enum.ItemShowType.Diamond
        elseif i == GSystem.GoldItemId then
            itemType = Enum.ItemShowType.Gold
        end
        InvitationRewardCell:init(itemType)
        node:addChild(InvitationRewardCell)
        self.rewardCells[i]=InvitationRewardCell
    end
end

function M:onInit()
    M.super.onInit(self)
   
    self.clickText3=self.ClickText_TT:getString()
    for i=1,3,1 do
        local   id=4000+i
        self.taskCells[id]:reBindingAllNode()
    end
    for i=1,2,1 do
        self.rewardCells[i]:reBindingAllNode()
    end

    self:onSwitchBtn(self["ClickButton"])
    self:getInvitedReward({})
    self:refreshHot()
    self:refreshUI()
    g_TaskData:taskInvitedPlayer(1)
    g_TaskData:taskInvitedPlayer(2)
    g_TaskData:taskInvitedPlayer(3)
    g_TaskData:C2S_getInvitedReward()
    self:updateInfo()
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.UIInvitationPopUp_update, "updateInfo")
    self:doRegEvent(Constant.CustomEvent.OnTaskDataUpdate, "refreshUI")
    self:doRegEvent(Constant.CustomEvent.UIInvitationPopUp_getInvitedReward, "getInvitedReward")
    self:doRegEvent(Constant.CustomEvent.UIInvitationPopUp_refreshHot, "refreshHot")
end

return M