
local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIInvitationCheck", UIPanel)

M.GUI_FILE_NAME = "csd.03_04_Invitation.03_04_InvitationCheck.lua"

M.BINDGUIDATANODE = {
    ["ReturnPanel"]={varname="ReturnPanel",onClick="onClickEvent"},
    ["CheckPanel"]={varname="CheckPanel"},
    ["ClickTaskText_TT"]={varname="ClickTaskText_TT"},
    ["RegisterTaskText_TT"]={varname="RegisterTaskText_TT"},
    ["RechargeTaskText_TT"]={varname="RechargeTaskText_TT"},
    ["InvitationTipImage"]={varname="InvitationTipImage"},
    ["InvitationTipText_TT"]={varname="InvitationTipText_TT"},

    ["ClickButton"]={varname="ClickButton",onClick="onSwitchBtn"},
    ["RegisterButton"]={varname="RegisterButton",onClick="onSwitchBtn"},
    ["RechargeButton"]={varname="RechargeButton",onClick="onSwitchBtn"},

    ["ClickText_1_TT"]={varname="ClickText_1_TT"},
    ["ClickText_2_TT"]={varname="ClickText_2_TT"},
    ["RegisterText_1_TT"]={varname="RegisterText_1_TT"},
    ["RegisterText_2_TT"]={varname="RegisterText_2_TT"},
    ["RechargeText_1_TT"]={varname="RechargeText_1_TT"},
    ["RechargeText_2_TT"]={varname="RechargeText_2_TT"},
    ["Bg_2"]={varname="Bg_2"},
    ["TaskBg"]={varname="TaskBg"}
}

function M:onSwitchBtn(ref)
    self.clickListView:setVisible(false)
    self.RegisterListView:setVisible(false)
    self.RechargeListView:setVisible(false)
    self.InvitationTipImage:setVisible(false)
    self.InvitationTipText_TT:setVisible(false)
    self["ClickText_1_TT"]:setTextColor(cc.c4b(255,255,255,255))
    self["ClickText_1_TT"]:setFontName("font/Default.TTF")
    self["RegisterText_1_TT"]:setTextColor(cc.c4b(255,255,255,255))
    self["RegisterText_1_TT"]:setFontName("font/Default.TTF")
    self["RechargeText_1_TT"]:setTextColor(cc.c4b(255,255,255,255))
    self["RechargeText_1_TT"]:setFontName("font/Default.TTF")
    self["ClickButton"]:setBrightStyle(ccui.BrightStyle.normal)
    self["RegisterButton"]:setBrightStyle(ccui.BrightStyle.normal)
    self["RechargeButton"]:setBrightStyle(ccui.BrightStyle.normal)

    local   name=ref:getName()
    if "ClickButton"==name then
        self.taskId=4001
        self["ClickButton"]:setBrightStyle(ccui.BrightStyle.highlight)
        self.clickListView:setVisible(true)
        self["ClickText_1_TT"]:setTextColor(cc.c4b(0,0,0,255))
        self["ClickText_1_TT"]:setFontName("font/Font001.ttf")
        self.InvitationTipImage:setVisible(self.clickListView:getChildrenCount()<=0)
        self.InvitationTipText_TT:setVisible(self.clickListView:getChildrenCount()<=0)
    elseif "RegisterButton"==name then
        self.taskId=4002
        self["RegisterButton"]:setBrightStyle(ccui.BrightStyle.highlight)
        self.RegisterListView:setVisible(true)
        self["RegisterText_1_TT"]:setTextColor(cc.c4b(0,0,0,255))
        self["RegisterText_1_TT"]:setFontName("font/Font001.ttf")
        self.InvitationTipImage:setVisible(self.RegisterListView:getChildrenCount()<=0)
        self.InvitationTipText_TT:setVisible(self.RegisterListView:getChildrenCount()<=0)
    elseif "RechargeButton"==name then
        self.taskId=4003
        self["RechargeText_1_TT"]:setTextColor(cc.c4b(0,0,0,255))
        self["RechargeText_1_TT"]:setFontName("font/Font001.ttf")
        self["RechargeButton"]:setBrightStyle(ccui.BrightStyle.highlight)
        self.RechargeListView:setVisible(true)
        self.InvitationTipImage:setVisible(self.RechargeListView:getChildrenCount()<=0)
        self.InvitationTipText_TT:setVisible(self.RechargeListView:getChildrenCount()<=0)
    end

    self:updateText()
end

function M:switchId(id)
    local ref
    if 4001==id then
        ref=self["ClickButton"]
    elseif 4002==id then
        ref=self["RegisterButton"]
    elseif 4003==id then
        ref=self["RechargeButton"]
    end

    self:onSwitchBtn(ref)
end

function M:onClickEvent(ref)
    local   name=ref:getName()
    if "ReturnPanel"==name then
        SoundSystemManager:playSound004()
        self:closePanel()
    end
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

function M:adaptationPanelSize()
    local size=cc.Director:getInstance():getWinSize()
    local friangeTop = g_GameSettingData:getFringeScreenTop()
    local dyw = (size.height - 1280) / 2
    
    if dyw > 0 then
        local addHeight=dyw-friangeTop+dyw
        local panelSize=self.CheckPanel:getContentSize()
        local y=self.CheckPanel:getPositionY()
        self.CheckPanel:setContentSize(cc.size(panelSize.width,panelSize.height+addHeight-20))
        self.CheckPanel:setPositionY(y-dyw+20)
        local bgSize=self.Bg_2:getContentSize()
        y=self.Bg_2:getPositionY()
        self.Bg_2:setContentSize(cc.size(bgSize.width,bgSize.height+addHeight))
        self.Bg_2:setPositionY(y-dyw)
    end
end

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)
    self.Bg_2:setAnchorPoint(cc.p(0,0))
    self.CheckPanel:setAnchorPoint(cc.p(0,0))
    self:adaptationPanelSize()
    
    self.taskId=1
    
    
    self["ClickButton"]:setBright(true)
    self["ClickButton"]:setBrightStyle(ccui.BrightStyle.normal)

    local size = self.CheckPanel:getContentSize()
    self.clickListView = ccui.ListView:create()
    self.clickListView:setContentSize(size)
    self.clickListView:setDirection(ccui.ListViewDirection.vertical)
    self.clickListView:setBounceEnabled(true)
    self.clickListView:setScrollBarEnabled(false)
    self.clickListView:setItemsMargin(10)
    self.clickListView:setPosition(cc.p(0, 0))
    self.clickListView:setAnchorPoint(cc.p(0, 0))
    self.CheckPanel:addChild(self.clickListView)

    self.RegisterListView = ccui.ListView:create()
    self.RegisterListView:setVisible(false)
    self.RegisterListView:setContentSize(size)
    self.RegisterListView:setDirection(ccui.ListViewDirection.vertical)
    self.RegisterListView:setBounceEnabled(true)
    self.RegisterListView:setScrollBarEnabled(false)
    self.RegisterListView:setItemsMargin(10)
    self.RegisterListView:setPosition(cc.p(0, 0))
    self.RegisterListView:setAnchorPoint(cc.p(0, 0))
    self.CheckPanel:addChild(self.RegisterListView)

    self.RechargeListView = ccui.ListView:create()
    self.RechargeListView:setVisible(false)
    self.RechargeListView:setContentSize(size)
    self.RechargeListView:setDirection(ccui.ListViewDirection.vertical)
    self.RechargeListView:setBounceEnabled(true)
    self.RechargeListView:setScrollBarEnabled(false)
    self.RechargeListView:setItemsMargin(10)
    self.RechargeListView:setPosition(cc.p(0, 0))
    self.RechargeListView:setAnchorPoint(cc.p(0, 0))
    self.CheckPanel:addChild(self.RechargeListView)

    self["ClickTaskText_TT"]:setVisible(false)
    self["ClickText_2_TT"]:setVisible(false)
    self["RegisterTaskText_TT"]:setVisible(false)
    self["RegisterText_2_TT"]:setVisible(false)
    self["RechargeTaskText_TT"]:setVisible(false)
    self["RechargeText_2_TT"]:setVisible(false)
end

function M:onInit()
    M.super.onInit(self)
    self.clickListView:removeAllChildren()
    local   kind=1
    local   kind1=g_TaskData:getKindPlayer(kind) or {data={},dailyCount=0}
    table.sort(kind1.data,function(a,b)
        if a == nil or b == nil then 
            return false 
        end

        if a.createdTime>b.createdTime then
            return true
        end

        return false
    end)
    for i=1,#kind1["data"],1 do 
        local item = UIManager:createPanelOnly("InvitationCheckCell")
        item:init(kind1["data"][i],kind)
        local panel = ccui.Layout:create()
        local size = item:getContentSize()
        panel:setContentSize(size)
        self.clickListView:pushBackCustomItem(panel)

        item:setAnchorPoint(cc.p(0.5,0.5))
        panel:addChild(item)
    end
    --
    
    self.RegisterListView:removeAllChildren()
    kind=2
    local   kind2=g_TaskData:getKindPlayer(kind) or {data={},dailyCount=0}
    table.sort(kind2.data,function(a,b)
        if a == nil or b == nil then 
            return false 
        end

        if a.createdTime>b.createdTime then
            return true
        end

        return false
    end)
    for i=1,#kind2["data"],1 do 
        local item = UIManager:createPanelOnly("InvitationCheckCell")
        item:init(kind2["data"][i],kind)
        local panel = ccui.Layout:create()
        local size = item:getContentSize()
        panel:setContentSize(size)
        self.RegisterListView:pushBackCustomItem(panel)

        item:setAnchorPoint(cc.p(0.5,0.5))
        panel:addChild(item)
    end
    --
    self.RechargeListView:removeAllChildren()
    kind=3
    local   kind3=g_TaskData:getKindPlayer(kind) or {data={},dailyCount=0}
    table.sort(kind3.data,function(a,b)
        if a == nil or b == nil then 
            return false 
        end
        
        if a.createdTime>b.createdTime then
            return true
        end

        return false
    end)
    for i=1,#kind3["data"],1 do 
        local item = UIManager:createPanelOnly("InvitationCheckCell")
        item:init(kind3["data"][i],kind)
        local panel = ccui.Layout:create()
        local size = item:getContentSize()
        panel:setContentSize(size)
        self.RechargeListView:pushBackCustomItem(panel)

        item:setAnchorPoint(cc.p(0.5,0.5))
        panel:addChild(item)
    end
    
end

return M