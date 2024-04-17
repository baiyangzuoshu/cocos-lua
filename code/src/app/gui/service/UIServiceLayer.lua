local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIServiceLayer", UIPanel)

M.GUI_FILE_NAME = "csd.03_12_Service.03_12_ServiceLayer.lua"

M.BINDGUIDATANODE = {
    ["Return"]={varname="Return",onClick="onClickEvent"},
    ["HomePageButton"]={varname="HomePageButton",onClick="onClickEvent"},
    ["PageUpButton"]={varname="PageUpButton",onClick="onClickEvent"},
    ["NextPageButton"]={varname="NextPageButton",onClick="onClickEvent"},
    ["TrailerPageButton"]={varname="TrailerPageButton",onClick="onClickEvent"},
    ["RefreshButton"]={varname="RefreshButton",onClick="onClickEvent"},

    ["CollectButton"]={varname="CollectButton",onClick="onSortEvent"},
    ["GenderButton"]={varname="GenderButton",onClick="onSortEvent"},
    ["RegisterButton"]={varname="RegisterButton",onClick="onSortEvent"},
    ["RechargeButton"]={varname="RechargeButton",onClick="onSortEvent"},
    ["LanguageButton"]={varname="LanguageButton",onClick="onSortEvent"},
    ["RoomServiceButton"]={varname="RoomServiceButton",onClick="onSortEvent"},
    ["RoomPlayerButton"]={varname="RoomPlayerButton",onClick="onSortEvent"},
    ["StateButton"]={varname="StateButton",onClick="onSortEvent"},

    ["CollectText_TT"]={varname="CollectText_TT"},
    ["GenderText_TT"]={varname="GenderText_TT"},
    ["RegisterText_TT"]={varname="RegisterText_TT"},
    ["RechargeText_TT"]={varname="RechargeText_TT"},
    ["LanguageText_TT"]={varname="LanguageText_TT"},
    ["RoomServiceText_TT"]={varname="RoomServiceText_TT"},
    ["RoomPlayerText_TT"]={varname="RoomPlayerText_TT"},
    ["StateText_TT"]={varname="StateText_TT"},


    ["LanguageText_1_TT"]={varname="LanguageText_1_TT"},
    ["LanguageText_2_TT"]={varname="LanguageText_2_TT"},
    ["LanguageText_3_TT"]={varname="LanguageText_3_TT"},
    ["GenderText_1_TT"]={varname="GenderText_1_TT"},
    ["GenderText_2_TT"]={varname="GenderText_2_TT"},
    ["GenderText_3_TT"]={varname="GenderText_3_TT"},


    ["GenderDrop"]={varname="GenderDrop"},
    ["GenderDrop_2"]={varname="GenderDrop_2"},
    ["LanguageDrop"]={varname="LanguageDrop"},
    ["LanguageDrop_2"]={varname="LanguageDrop_2"},

    ["RegisterDown_1"]={varname="RegisterDown_1"},
    ["RegisterDown_2"]={varname="RegisterDown_2"},
    ["RegisterUp_1"]={varname="RegisterUp_1"},
    ["RegisterUp_2"]={varname="RegisterUp_2"},

    ["RechargeDown_1"]={varname="RechargeDown_1"},
    ["RechargeDown_2"]={varname="RechargeDown_2"},
    ["RechargeUp_1"]={varname="RechargeUp_1"},
    ["RechargeUp_2"]={varname="RechargeUp_2"},

    ["RoomServiceDown_1"]={varname="RoomServiceDown_1"},
    ["RoomServiceDown_2"]={varname="RoomServiceDown_2"},
    ["RoomServiceUp_1"]={varname="RoomServiceUp_1"},
    ["RoomServiceUp_2"]={varname="RoomServiceUp_2"},

    ["RoomPlayerDown_1"]={varname="RoomPlayerDown_1"},
    ["RoomPlayerDown_2"]={varname="RoomPlayerDown_2"},
    ["RoomPlayerUp_1"]={varname="RoomPlayerUp_1"},
    ["RoomPlayerUp_2"]={varname="RoomPlayerUp_2"},

    ["ServiceListPageView"]={varname="ServiceListPageView"},
    ["PageText"]={varname="PageText"},
    ["LogoutNum"]={varname="LogoutNum"},
    ["ReturnButton"]={varname="ReturnButton"}
}

function M:adaptationPanelSize()
    local size=cc.Director:getInstance():getWinSize()
    local friangeTop = g_GameSettingData:getFringeScreenTop()
    local dyw = (size.height - 1280) / 2
    
    if dyw > 0 then
        local addHeight=dyw-friangeTop+dyw
        local panelSize=self.ServiceListPageView:getContentSize()
        local y=self.ServiceListPageView:getPositionY()
        self.ServiceListPageView:setContentSize(cc.size(panelSize.width,panelSize.height+addHeight))
        self.ServiceListPageView:setPositionY(y-dyw)
    end
end

function M:onClickEvent(ref)
    local name=ref:getName()

    if "Return"==name then
        self:closePanel()
    elseif "HomePageButton"==name then
        self.curPage=1
        self.ServiceListPageView:setCurrentPageIndex(self.curPage-1)
        self.PageText:setString(string.format("%d/%d",self.curPage,self.maxPage))
    elseif "PageUpButton"==name then
        self.curPage=self.curPage-1
        if self.curPage<1 then self.curPage=1 end

        self.ServiceListPageView:setCurrentPageIndex(self.curPage-1)
        self.PageText:setString(string.format("%d/%d",self.curPage,self.maxPage))
    elseif "NextPageButton"==name then
        self.curPage=self.curPage+1
        if self.curPage>self.maxPage then self.curPage=self.maxPage end

        self.ServiceListPageView:setCurrentPageIndex(self.curPage-1)
        self.PageText:setString(string.format("%d/%d",self.curPage,self.maxPage))
    elseif "TrailerPageButton"==name then
        self.curPage=self.maxPage

        self.ServiceListPageView:setCurrentPageIndex(self.curPage-1)
        self.PageText:setString(string.format("%d/%d",self.curPage,self.maxPage))
    elseif "RefreshButton"==name then
        g_UserData:c2sGetPlayerIdsOnline()
    end
end

function M:onSortEvent(ref)
    local name=ref:getName()

    self.CollectText_TT:setColor(cc.c3b(255,255,255))
    self.GenderText_TT:setVisible(true)
    self.GenderText_TT:setColor(cc.c3b(255,255,255))
    self.RegisterText_TT:setColor(cc.c3b(255,255,255))
    self.RechargeText_TT:setColor(cc.c3b(255,255,255))
    self.LanguageText_TT:setVisible(true)
    self.LanguageText_TT:setColor(cc.c3b(255,255,255))
    self.RoomServiceText_TT:setColor(cc.c3b(255,255,255))
    self.RoomPlayerText_TT:setColor(cc.c3b(255,255,255))
    self.StateText_TT:setColor(cc.c3b(255,255,255))

    self.LanguageText_1_TT:setVisible(false)
    self.LanguageText_2_TT:setVisible(false)
    self.LanguageText_3_TT:setVisible(false)
    self.GenderText_1_TT:setVisible(false)
    self.GenderText_2_TT:setVisible(false)
    self.GenderText_3_TT:setVisible(false)

    self.GenderDrop:setVisible(true)
    self.GenderDrop_2:setVisible(false)
    self.LanguageDrop:setVisible(true)
    self.LanguageDrop_2:setVisible(false)

    self.RegisterDown_1:setVisible(true)
    self.RegisterDown_2:setVisible(false)
    self.RegisterUp_1:setVisible(true)
    self.RegisterUp_2:setVisible(false)

    self.RechargeDown_1:setVisible(true)
    self.RechargeDown_2:setVisible(true)
    self.RechargeUp_1:setVisible(false)
    self.RechargeUp_2:setVisible(false)

    self.RoomServiceDown_1:setVisible(true)
    self.RoomServiceDown_2:setVisible(false)
    self.RoomServiceUp_1:setVisible(true)
    self.RoomServiceUp_2:setVisible(false)

    self.RoomPlayerDown_1:setVisible(true)
    self.RoomPlayerDown_2:setVisible(false)
    self.RoomPlayerUp_1:setVisible(true)
    self.RoomPlayerUp_2:setVisible(false)

    if "CollectButton"==name then
        self.CollectText_TT:setColor(cc.c3b(255,177,0))

        self.data=g_UserData:getAllPlayerOnlineDataByTag(Enum.ServicePlayerSort.CollectButton)
        self:updatePageView()
    elseif "GenderButton"==name then
        self.GenderDrop:setVisible(false)
        self.GenderDrop_2:setVisible(true)
        self.GenderText_TT:setColor(cc.c3b(255,177,0))
        local panel=UIManager:getOrCreatePanel("UIMiniTipPopUp")
        if panel then
            panel:refreshUI(Enum.ServicePlayerSort.GenderButton)
            panel:showToScene()
        end
    elseif "RegisterButton"==name then
        self.RegisterText_TT:setColor(cc.c3b(255,177,0))
        self.registerClick=not self.registerClick
        self.data=g_UserData:getAllPlayerOnlineDataByTag(Enum.ServicePlayerSort.RegisterButton,self.registerClick)
        self:updatePageView()

        self.rechargeClick=false
        self.serviceClick=false
        self.playerClick=false
        if self.registerClick then
            self.RegisterDown_1:setVisible(true)
            self.RegisterDown_2:setVisible(false)
            self.RegisterUp_1:setVisible(false)
            self.RegisterUp_2:setVisible(true)
        else
            self.RegisterDown_1:setVisible(false)
            self.RegisterDown_2:setVisible(true)
            self.RegisterUp_1:setVisible(true)
            self.RegisterUp_2:setVisible(false)
        end
    elseif "RechargeButton"==name then
        self.RechargeText_TT:setColor(cc.c3b(255,177,0))

        self.rechargeClick=not self.rechargeClick
        self.data=g_UserData:getAllPlayerOnlineDataByTag(Enum.ServicePlayerSort.RechargeButton,self.rechargeClick)
        self:updatePageView()

        self.registerClick=false
        self.serviceClick=false
        self.playerClick=false
        if self.rechargeClick then
            self.RechargeDown_1:setVisible(true)
            self.RechargeDown_2:setVisible(false)
            self.RechargeUp_1:setVisible(false)
            self.RechargeUp_2:setVisible(true)
        else
            self.RechargeDown_1:setVisible(false)
            self.RechargeDown_2:setVisible(true)
            self.RechargeUp_1:setVisible(true)
            self.RechargeUp_2:setVisible(false)
        end
    elseif "LanguageButton"==name then
        self.LanguageDrop:setVisible(false)
        self.LanguageDrop_2:setVisible(true)
        self.LanguageText_TT:setColor(cc.c3b(255,177,0))
        local panel=UIManager:getOrCreatePanel("UIMiniTipPopUp")
        if panel then
            panel:refreshUI(Enum.ServicePlayerSort.LanguageButton)
            panel:showToScene()
        end
    elseif "RoomServiceButton"==name then
        self.RoomServiceText_TT:setColor(cc.c3b(255,177,0))
        self.serviceClick=not self.serviceClick
        self.data=g_UserData:getAllPlayerOnlineDataByTag(Enum.ServicePlayerSort.RoomServiceButton,self.serviceClick)
        self:updatePageView()

        self.registerClick=false
        self.rechargeClick=false
        self.playerClick=false
        if self.serviceClick then
            self.RoomServiceDown_1:setVisible(true)
            self.RoomServiceDown_2:setVisible(false)
            self.RoomServiceUp_1:setVisible(false)
            self.RoomServiceUp_2:setVisible(true)
        else
            self.RoomServiceDown_1:setVisible(false)
            self.RoomServiceDown_2:setVisible(true)
            self.RoomServiceUp_1:setVisible(true)
            self.RoomServiceUp_2:setVisible(false)
        end
    elseif "RoomPlayerButton"==name then
        self.RoomPlayerText_TT:setColor(cc.c3b(255,177,0))
        self.playerClick=not self.playerClick
        self.data=g_UserData:getAllPlayerOnlineDataByTag(Enum.ServicePlayerSort.RoomPlayerButton,self.playerClick)
        self:updatePageView()

        self.registerClick=false
        self.rechargeClick=false
        self.serviceClick=false
        if self.playerClick then
            self.RoomPlayerDown_1:setVisible(true)
            self.RoomPlayerDown_2:setVisible(false)
            self.RoomPlayerUp_1:setVisible(false)
            self.RoomPlayerUp_2:setVisible(true)
        else
            self.RoomPlayerDown_1:setVisible(false)
            self.RoomPlayerDown_2:setVisible(true)
            self.RoomPlayerUp_1:setVisible(true)
            self.RoomPlayerUp_2:setVisible(false)
        end
    elseif "StateButton"==name then
        self.StateText_TT:setColor(cc.c3b(255,177,0))
        self.data=g_UserData:getAllPlayerOnlineDataByTag(Enum.ServicePlayerSort.StateButton)
        self:updatePageView()
    end
end

function M:onCreate()
    M.super.onCreate(self)
    self:adaptationPanelSize()
    
    self.GenderText_1_TT:setColor(cc.c3b(255,177,0))
    self.GenderText_2_TT:setColor(cc.c3b(255,177,0))
    self.GenderText_3_TT:setColor(cc.c3b(255,177,0))
    self.LanguageText_1_TT:setColor(cc.c3b(255,177,0))
    self.LanguageText_2_TT:setColor(cc.c3b(255,177,0))
    self.LanguageText_3_TT:setColor(cc.c3b(255,177,0))
    self.ServiceListPageView:setDirection(ccui.ListViewDirection.vertical)
    self.ServiceListPageView:addEventListener(handler(self,self.pageViewCb))
end

function M:pageViewCb(v1,v2,v3)
    self.curPage=self.ServiceListPageView:getCurrentPageIndex()+1
    self.PageText:setString(string.format("%d/%d",self.curPage,self.maxPage))
end

function M:onInit()
    M.super.onInit(self)
    self.maxPage=1
    self.curPage=1
    self.registerClick=false
    self.rechargeClick=false
    self.serviceClick=false
    self.playerClick=false
    self.ReturnButton:setTouchEnabled(false)
    self.LogoutNum:setString("0")
    self:onSortEvent(self["RegisterButton"])

    g_UserData:c2sGetPlayerIdsOnline()
end

function M:updatePageView()
    self.ServiceListPageView:removeAllChildren()

    local row=9
    local panel
    for i=1,#self.data,1 do
        local index=i-1
        if 0==index%row then
            panel= ccui.Layout:create()
            panel:setContentSize(self.ServiceListPageView:getContentSize())
            self.ServiceListPageView:pushBackCustomItem(panel)
        end
        local item = UIManager:createPanelOnly("ServiceCell")
        item:refreshUI(self.data[i],self.mType)
        
        local _h = item:getContentSize().height+0

        item:setPosition(cc.p(0,self.ServiceListPageView:getContentSize().height-index%row*_h-_h))
        panel:addChild(item)
    end

    self.curPage=1
    self.maxPage=math.ceil(#self.data/row)
    self.LogoutNum:setString(tostring(#self.data))
    self.PageText:setString(string.format("%d/%d",self.curPage,self.maxPage))
end

function M:s2cPlayerInfoForPlaymate()
    self.registerClick=false
    self:onSortEvent(self["RegisterButton"])
    self:updatePageView()
end

function M:selectButtonEvent(data)
    local tag=data.tag
    if tag<5 then--1繁体 2简体 3en 4all
        self.LanguageText_TT:setVisible(4==tag)
        self.LanguageText_1_TT:setVisible(2==tag)
        self.LanguageText_2_TT:setVisible(1==tag)
        self.LanguageText_3_TT:setVisible(3==tag)
        self.data=g_UserData:getAllPlayerOnlineDataByTag(Enum.ServicePlayerSort.LanguageButton,nil,tag)
    elseif tag>=5 then--5男 6女 7未设置 8all
        self.GenderText_1_TT:setVisible(5==tag)
        self.GenderText_2_TT:setVisible(6==tag)
        self.GenderText_3_TT:setVisible(7==tag)
        self.GenderText_TT:setVisible(8==tag)
        self.data=g_UserData:getAllPlayerOnlineDataByTag(Enum.ServicePlayerSort.GenderButton,nil,tag)
    end
    self:updatePageView()
end

function M:setType(type)
    self.mType=type
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
    self:doRegEvent(Constant.CustomEvent.UIServiceLayer_s2cPlayerInfoForPlaymate, "s2cPlayerInfoForPlaymate")
    self:doRegEvent(Constant.CustomEvent.UIServiceLayer_selectButtonEvent, "selectButtonEvent")
end

function M:onCleanup()
    M.super.onCleanup(self)

end

return M