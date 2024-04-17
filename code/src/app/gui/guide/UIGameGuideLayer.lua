local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIGameGuideLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_16_NoviceGuide.01_16_GuideBoastLayer.lua"

M.BINDGUIDATANODE = {
    ["diceBoxDian"]={varname="diceBoxDian"},
    ["diceBoxNum"]={varname="diceBoxNum"},
    ["GuideTextNode_6"]={varname="GuideTextNode_6"},
    ["GuideTextNode_1"]={varname="GuideTextNode_1"},
    ["GuideTextNode_3"]={varname="GuideTextNode_3"},
    ["GuideTextNode_5"]={varname="GuideTextNode_5"},
    ["ReplaceBottomInjectionState"]={varname="ReplaceBottomInjectionState"},
    ["OwnRightCallPoint"]={varname="OwnRightCallPoint"},
    ["OwnRightOpenImage_IVT"]={varname="OwnRightOpen"},
    ["CalledBoxImage_0_IVT"]={varname="CalledBoxImage_0_IVT"},
    ["playerNode_4"]={varname="playerNode_4"},
    ["playerNode_0"]={varname="playerNode_0"},
    ["NameText_O"]={varname="NameText"},
    ["GoldNum"]={varname="GoldNum"},
    ["GoldIcon"]={varname="GoldIcon"},
    ["HeadIcon"]={varname="HeadIcon"},
    ["HeadFrame_1"]={varname="HeadFrame"},
    ["VipImage"] = {varname = "VipImage"},
    ["HeadShade"] = {varname = "HeadShade"},

    ["GoldRollNum"]={varname="GoldRollNum"},
    ["PointText_TT"]={varname="PointText_TT"},
    ["Point"]={varname="Point"},
    ["PointButton"]={varname="PointButton"},
    ["NumberBg"]={varname="NumberBg"},
    ["NumberList"]={varname="NumberList"},
    ["NumberSelectionPanel"]={varname="NumberSelectionPanel"},
    ["ListDian"]={varname="ListDian"},
    ["HelpPanel"]={varname="HelpPanel"},
    ["HelpButton"]={varname="HelpButton"},
    ["PointSelectionPanel"]={varname="PointSelectionPanel"},
    ["PointBg_1"]={varname="PointBg_1"},
    ["VerticesImage_0"]={varname="VerticesImage_0"},
    ["VerticesNum_0"]={varname="VerticesNum_0"},
    ["DesktopCallPoint"]={varname="DesktopCallPoint"},
    ["BottomInjectionText"]={varname="BottomInjectionText"},
    ["BottomInjectionImage"]={varname="BottomInjectionImage"},
    ["NumberText"]={varname="NumberText"},
    ["Vertices"]={varname="Vertices"},
    ["GuideBg_1"]={varname="GuideBg_1"},
    ["GuideImage_1"]={varname="GuideImage_1"},
    ["GuideText_1_TT"]={varname="GuideText_1_TT"},
    ["GuideBg_3"]={varname="GuideBg_3"},
    ["GuideImage_3"]={varname="GuideImage_3"},
    ["GuideText_3_TT"]={varname="GuideText_3_TT"},
    ["GuideBg_5"]={varname="GuideBg_5"},
    ["GuideImage_5"]={varname="GuideImage_5"},
    ["GuideText_5_TT"]={varname="GuideText_5_TT"},
    ["GuideBg_6"]={varname="GuideBg_6"},
    ["GuideImage_6"]={varname="GuideImage_6"},
    ["GuideText_6_TT"]={varname="GuideText_6_TT"},
    ["GuideTextNode_2"]={varname="GuideTextNode_2"},
    ["GuideTextNode_4"]={varname="GuideTextNode_4"},
    ["PointNode"]={varname="PointNode"},
    ["openRange"]={varname="openRange"},
    ["BottomInjectionText_3"]={varname="baseBetTxt"},
    ["CalledBoxImage_IVT"]={varname="CalledBoxImage_IVT"},
    ["GuideMiniTipPopUpNode"]={varname="GuideMiniTipPopUpNode"},
    ["ExitPanel"]={varname="ExitPanel"}
}
local targetPlatform = cc.Application:getInstance():getTargetPlatform()

function M:refreshSayPointData(mSayPointNum,mSayMaxPoint)
    self.DesktopCallPoint:setVisible(true)
    self.BottomInjectionText:setString(tostring(mSayPointNum))
    self.BottomInjectionImage:loadTexture("00_01_Common/2D_Small_" .. mSayMaxPoint ..".png", ccui.TextureResType.plistType)
end

function M:onCreate()
    M.super.onCreate(self)

    g_HotData:c2sUpdateGuideGroup(1,4)

    self:setShadeShowModel(true,1)

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.MiniItem))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.Head))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.HeadBox))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.StaticDiceBox))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.VipIconTail))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.ChatEmoji))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.MagicEmoji))

    local data={}
    data.uid=100001
    data.nickname=GSystem.GuideRobotName_1[1]
    data.sex=0
    data.avatar=GSystem.GuideRobotFaceId_1
    data.avatarFrame=GSystem.GuideRobotFrameId_1
    data.vipLevel=0
    local   friendInfo= require("app.bean.FriendInfo").new(data)
    local GuideDiceCupLayer4=UIManager:createPanelOnly("GuideDiceCupLayer")
    GuideDiceCupLayer4:setPosition(cc.p(-GuideDiceCupLayer4:getContentSize().width/2,-GuideDiceCupLayer4:getContentSize().height/2))
    
    GuideDiceCupLayer4:refreshData(friendInfo,1)
    self.playerNode_4:addChild(GuideDiceCupLayer4)
    self.mGuideDiceCupLayer4=GuideDiceCupLayer4

    local GuideDiceCupLayer0=UIManager:createPanelOnly("GuideDiceCupLayer")
    GuideDiceCupLayer0:setPosition(cc.p(-GuideDiceCupLayer0:getContentSize().width/2,-GuideDiceCupLayer0:getContentSize().height/2))
    self.mGuideDiceCupLayer0=GuideDiceCupLayer0
    
    GuideDiceCupLayer0:refreshData({},0)
    self.playerNode_0:addChild(GuideDiceCupLayer0)

    local btnsize = self.HeadShade:getContentSize()
    self.mLeftTimeLabel = ccui.Text:create()
    self.mLeftTimeLabel:setFontSize(46)
    self.mLeftTimeLabel:setFontName("font/Font003.ttf")
    self.mLeftTimeLabel:setPosition(cc.p(btnsize.width/2,btnsize.height/2))
    self.mLeftTimeLabel:setTextColor({r = 255, g = 255, b = 255})
    self.mLeftTimeLabel:enableShadow({r = 0, g = 0, b = 0, a = 127}, {width = 0, height = -1}, 0)
    self.HeadShade:addChild(self.mLeftTimeLabel)
    self.HeadShade:setVisible(false)

    self.NumberList:setTouchEnabled(false)
    self.NumberSelectionPanel:setTouchEnabled(false)
    for i = 3, 50 do
        local _dicNumItem = UIManager:createPanelOnly("GuideNumberLayer")
        if _dicNumItem then
            local layout = ccui.Layout:create()
            local size = _dicNumItem:getContentSize()
            layout:setContentSize(size.width, size.height)
            _dicNumItem:setNum(i)
            layout:addChild(_dicNumItem)
            _dicNumItem:setSelected(i==3)

            self.NumberList:pushBackCustomItem(layout)
        end
    end

    self.ListDian:setTouchEnabled(false)
    self.PointSelectionPanel:setTouchEnabled(false)
    for i = 1, 6 do
        local _dicPoinItem = UIManager:createPanelOnly("GuidePointLayer")
        if _dicPoinItem then
            local layout = ccui.Layout:create()
            local size = _dicPoinItem:getContentSize()
            layout:setContentSize(size.width, size.height)
            _dicPoinItem:setNum(i)
            layout:addChild(_dicPoinItem)
            _dicPoinItem:setSelected(i==5)

            self.ListDian:pushBackCustomItem(layout)
        end
    end

    local startEffectId = GSystem.MatchStartAnimationId
    local _effect = Utils.onlyCreateEffect(startEffectId,cc.p(0,0),false)
    if _effect then
        local size = self:getContentSize()
        _effect:setPosition(cc.p(size.width/2,size.height/2))
        self._rootNode:addChild(_effect)
    end

    local UIGuideMiniTipPopUp_2=UIManager:createPanelOnly("UIGuideMiniTipPopUp_2")
    UIGuideMiniTipPopUp_2:refreshData(2)
    UIGuideMiniTipPopUp_2:resetCenterPosition()

    self.GuideMiniTipPopUpNode:addChild(UIGuideMiniTipPopUp_2)
    self.GuideMiniTipPopUpNode:setVisible(false)

    SoundSystemManager:playSound009()
end

function M:handlerGuide()
    local data=g_HotData:getCurGuideData()

    if 0==data.type then
        self.mGuideDiceCupLayer0:startGame(function() 
            self.mGuideDiceCupLayer0:showPoint(GSystem.GuidePlayerDicePoint_1) 
        end)
        self.mGuideDiceCupLayer4:startGame(function()
            self:handlerGuide()
        end)
    elseif 1==data.type then--叫点
        if 1==data.target then
            local sex=2
            g_GameData:playSayDian(data.arr[1],data.arr[2],sex)

            self.mGuideDiceCupLayer4:doHandler({type=1,data=data.arr})
            self.cdTime=60*0.1
            self:refreshSayPointData(data.arr[1],data.arr[2])

            self.OwnRightCallPoint:setVisible(false)
        elseif 2==data.target then
            local sex = g_UserData:getSex()
            g_GameData:playSayDian(data.arr[1],data.arr[2],sex)

            self:refreshSayPointData(data.arr[1],data.arr[2])

            self.GuideTextNode_5:removeChildByName("GuideTextNode_5_clip")
            self.GuideTextNode_5:setVisible(false)

            self.OwnRightCallPoint:setVisible(true)
            self.VerticesNum_0:setString(tostring(data.arr[1]))
            self.VerticesImage_0:loadTexture("00_01_Common/2D_Small_" .. data.arr[2] ..".png", ccui.TextureResType.plistType)
            self.cdTime=60*1

            self.mGuideDiceCupLayer4:hidePoint()
        end
    elseif 2==data.type then--轮到你了
        self.cdTime=60*2
        SoundSystemManager:playSound0010()
        local _effect = Utils.onlyCreateEffect(GSystem.YourTurnAnimationId,cc.p(0,0),false)
        local size = self:getContentSize()
        _effect:setPosition(cc.p(size.width/2,size.height/2))
        self._rootNode:addChild(_effect)
    elseif 3==data.type then--弹窗
        local panel=UIManager:getOrCreatePanel("UIGuideMiniTipPopUp_2")
        panel:refreshData(data.arr[1])
        panel:showToScene()
    elseif 4==data.type then
        if 1==data.arr[1] then
            self.GuideTextNode_1:setLocalZOrder(9998)
            self.GuideTextNode_1:setVisible(true)
            self.GuideBg_1:setLocalZOrder(9999)
            self.GuideImage_1:setLocalZOrder(9999)
            self.GuideText_1_TT:setLocalZOrder(9999)
            self:setClip(self.GuideTextNode_1,"GuideTextNode_1_clip",cc.p(-50,-130))
        elseif 2==data.arr[1] then
            self.diceBoxNum:removeChildByName("diceBoxNum_clip")
            self.diceBoxNum:setVisible(false)
            self.GuideTextNode_3:setLocalZOrder(9998)
            self.GuideBg_3:setLocalZOrder(9999)
            self.GuideImage_3:setLocalZOrder(9999)
            self.GuideText_3_TT:setLocalZOrder(9999)
            self.GuideTextNode_3:setVisible(true)
            self:setClip(self.GuideTextNode_3,"GuideTextNode_3_clip",cc.p(-50,-130))
        elseif 3==data.arr[1] then
            self.diceBoxDian:removeChildByName("diceBoxDian_clip")
            self.diceBoxDian:setVisible(false)
            self.GuideTextNode_5:setLocalZOrder(9998)
            self.GuideBg_5:setLocalZOrder(9999)
            self.GuideImage_5:setLocalZOrder(9999)
            self.GuideText_5_TT:setLocalZOrder(9999)
            self.GuideTextNode_5:setVisible(true)
            self:setClip(self.GuideTextNode_5,"GuideTextNode_5_clip",cc.p(-50,-150))
        elseif 4==data.arr[1] then
            self.GuideTextNode_6:setLocalZOrder(9998)
            self.GuideBg_6:setLocalZOrder(9999)
            self.GuideImage_6:setLocalZOrder(9999)
            self.GuideText_6_TT:setLocalZOrder(9999)
            self.GuideTextNode_6:setVisible(true)
            self:setClip(self.GuideTextNode_6,"GuideTextNode_6_clip",cc.p(-25,50),cc.p(50,50))
        end
    elseif 5==data.type then--选择数
        self.GuideTextNode_1:removeChildByName("GuideTextNode_1_clip")
        self.GuideTextNode_1:setVisible(false)
        self.diceBoxNum:setVisible(true)
        self.diceBoxNum:setLocalZOrder(9998)
        self.GuideTextNode_2:setLocalZOrder(9999)
        self:setClip(self.diceBoxNum,"diceBoxNum_clip",cc.p(20,185))
    elseif 6==data.type then--选择点
        self.GuideTextNode_3:removeChildByName("GuideTextNode_3_clip")
        self.GuideTextNode_3:setVisible(false)
        self.diceBoxDian:setVisible(true)
        self.diceBoxDian:setLocalZOrder(9998)
        self.GuideTextNode_4:setLocalZOrder(9999)
        self:setClip(self.diceBoxDian,"diceBoxDian_clip",cc.p(480,185))
    elseif 7==data.type then--开牌
        self.GuideMiniTipPopUpNode:setVisible(true)
        self.openRange:setVisible(true)
        self.openRange:setLocalZOrder(9998)
        -- self:setClip(self.openRange,"openRange_clip",cc.p(30,70),cc.p(150,200))
        self.mGuideDiceCupLayer0:playNoviceGuideHandAnimation()
    elseif 8==data.type then--胜利失败
        self.mGuideDiceCupLayer4:gameResult(GSystem.GuideRobot_1_DicePoint_1,5,true)
        self.mGuideDiceCupLayer0:gameResult(GSystem.GuidePlayerDicePoint_1,5,true)

        self.cdTime=60*1.5
    elseif 9==data.type then
        self.cdTime=60*1.5
        self:playResultAnimation(self.mGuideDiceCupLayer4,false,false)
        self:playResultAnimation(self.mGuideDiceCupLayer0,true,true)
        SoundSystemManager:playSound0012()
        
    end

    if data then
        g_HotData:nextGuideGroupStep()
    end
end

function  M:myCallOpen()
    self.OwnRightOpen:setVisible(true)
    self.OwnRightOpen:runAction(cc.Sequence:create(cc.ScaleTo:create(0.3,1.2)
    ,cc.ScaleTo:create(0.16,1)
    ))
end

function M:playResultAnimation(item,result,isMy)
    local _effectId = 0
    --获取动画ID
    if result then--赢
        _effectId = self:getTimesEffectId(GSystem.WinAnimationId,1)
    else--输
        _effectId = self:getTimesEffectId(GSystem.FailAnimationId,1)
    end

    if _effectId~=0 then
        local _effect = Utils.onlyCreateEffect(_effectId,cc.p(0,0),false,false)
        
        if _effect then
            if isMy then
                _effect:setScale(0.8)
            end

            item:playEffect(_effect)
        end
    end
end

function M:getTimesEffectId(list,times)
    for j, w in ipairs(list) do
        if w[1] == times then
            local _effectId = w[2]
            return _effectId
        end
    end

    return 0
end

function M:setClip(node,name,pos,v)
    v=v or cc.p(100,100)
    --模板
    local draw = cc.DrawNode:create()
    draw:drawSolidRect(cc.p(0,0), v, cc.c4f(1,0,0,1))

    local bg = cc.Sprite:create()
    bg:initWithSpriteFrameName("00_01_Common/picture_056.png")
    bg:setContentSize(cc.size(4000,4000))
    bg:setOpacity(255*0.5)
    local m_clip = cc.ClippingNode:create()
    --设置模板
    m_clip:setStencil(draw)
    m_clip:setPosition(pos)
    --是否裁剪模板之外的内容
    m_clip:setInverted(true)
    --设置阿发值
    m_clip:setAlphaThreshold(1)
    m_clip:setName(name)
    node:addChild(m_clip)

    m_clip:addChild(bg)
end

function M:onInit()
    M.super.onInit(self)

    self.cdTime=10
    self.diceBoxDian:setVisible(false)
    self.diceBoxNum:setVisible(false)
    self.GuideTextNode_6:setVisible(false)
    self.GuideTextNode_1:setVisible(false)
    self.GuideTextNode_3:setVisible(false)
    self.GuideTextNode_5:setVisible(false)
    self.ReplaceBottomInjectionState:setVisible(false)
    self.OwnRightCallPoint:setVisible(false)
    self.OwnRightOpen:setVisible(false)
    self.CalledBoxImage_0_IVT:setVisible(false)
    self.PointButton:setTouchEnabled(false)
    self.HelpPanel:setTouchEnabled(false)
    self.HelpButton:setTouchEnabled(false)
    self.openRange:setVisible(false)
    self.DesktopCallPoint:setVisible(false)
    self.ExitPanel:setLocalZOrder(10000)
    self.ExitPanel:setTouchEnabled(false)
    self.GuideMiniTipPopUpNode:setLocalZOrder(10000)
    self.CalledBoxImage_IVT:setVisible(false)
    local Room = DataManager:getTbxData("Room",GSystem.GuideRoomId_1)
    self.baseBetTxt:setString(Utils.getFormatNumber_MuitiLanguage(Room.ChipGold))
    self:refrashOneselfData()
end

function M:refrashOneselfData()
    self.NameText:setString(g_UserData:getNickName())
    Utils.setShortName(self.NameText,g_UserData:getNickName(), GSystem.NameLimitNumber)

    self.GoldNum:setString(Utils.getFormatNumber_MuitiLanguage(GSystem.GuideInitGold))
    local goldId = GSystem.GoldItemId
    local goldIcon = DataManager:getTbxData("Item",goldId).MiniItemIcon
    self.GoldIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.MiniItem,goldIcon), ccui.TextureResType.plistType)

    self.HeadIcon:removeAllChildren()
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    avater:InitTexture(string.utf8len(g_UserData:getUserInfo():getHead())<7,g_UserData:getUserInfo():getHead(),g_UserData:getUserInfo():getUserId())
    self.HeadIcon:addChild(avater)

    self.HeadFrame:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(g_UserData:getHeadBox())), ccui.TextureResType.plistType)
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:OnUpdate(dt)
    self.cdTime=self.cdTime-1
    if 0==self.cdTime then
        self:handlerGuide()
    end
end

function M:onGameTouchBegin(pos)
    self.mTouchStartPosY=pos.y
    self.mIsOpeningHandle=false
    return true
end

function M:onGameTouchMoved(pos)
    local dicY = pos.y - self.mTouchStartPosY
    if self.openRange:isVisible() then
        local rangeStartx,rangeStarty = self.openRange:getPosition()
        local range=self.openRange:getContentSize()

        if self:isPointNodeByPos(cc.p(rangeStartx,rangeStarty),range,pos) then
            self.mGuideDiceCupLayer0:openDiceHandle(dicY)
            self.mIsOpeningHandle = true
        end
    end
end

function M:onGameTouchEnded(pos)
    local dicY = pos.y - self.mTouchStartPosY
    print("onGameTouchEnded1",dicY,g_HotData:getCurGuideStep())
    if self.openRange:isVisible() and dicY>30 then
        local rangeStartx,rangeStarty = self.openRange:getPosition()
        local range=self.openRange:getContentSize()
        if self.mIsOpeningHandle then
            local sex=math.random(1,10)
            g_GameData:openSound(sex)

            self:myCallOpen()
            self.cdTime=60*0.5
            self.mGuideDiceCupLayer4:showPoint(GSystem.GuideRobot_1_DicePoint_1) 
            self.mGuideDiceCupLayer0:openDiceHandle(100)
            self.mGuideDiceCupLayer4:openDiceHandle(100)
            self.GuideMiniTipPopUpNode:setVisible(false)
            self.mGuideDiceCupLayer0:stopNoviceGuideHandAnimation()
            self.openRange:removeChildByName("openRange_clip")
            self.openRange:setVisible(false)
        end
    elseif self.GuideTextNode_1:isVisible() then
        local rangeStartx,rangeStarty = self.NumberBg:getPosition()
        local range=self.NumberBg:getContentSize()
        rangeStartx=math.floor(rangeStartx-range.width/2)
        rangeStarty=math.floor(rangeStarty-range.height/2)
        
        if self:isPointNodeByPos(cc.p(rangeStartx,rangeStarty),range,pos) then
            self:handlerGuide()
        end
    elseif self.GuideTextNode_3:isVisible() then
        local rangeStartx,rangeStarty = self.PointBg_1:getPosition()
        local range=self.PointBg_1:getContentSize()
        rangeStartx=math.floor(rangeStartx-range.width/2)
        rangeStarty=math.floor(rangeStarty-range.height/2)

        if self:isPointNodeByPos(cc.p(rangeStartx,rangeStarty),range,pos) then
            self:handlerGuide()
        end
    elseif self.GuideTextNode_5:isVisible() then
        local rangeStartx,rangeStarty = self.PointButton:getPosition()
        local range=self.PointButton:getContentSize()
        rangeStartx=math.floor(rangeStartx-range.width/2)
        rangeStarty=math.floor(rangeStarty-range.height/2)

        if self:isPointNodeByPos(cc.p(rangeStartx,rangeStarty),range,pos) then
            self:handlerGuide()
        end
    elseif self.GuideTextNode_6:isVisible() then
        local rangeStartx,rangeStarty = self.HelpPanel:getPosition()
        local range=self.HelpPanel:getContentSize()
        rangeStartx=math.floor(rangeStartx-range.width/2)
        rangeStarty=math.floor(rangeStarty-range.height/2)
        
        self.cdTime=60*1
        self.GuideTextNode_6:removeChildByName("GuideTextNode_6_clip")
        self.GuideTextNode_6:setVisible(false)

        local panel=UIManager:getOrCreatePanel("app.gui.guide.UIGuideMiniTipPopUp_3")
        panel:showToScene()
        panel:setLocalZOrder(10004)

        g_HotData:c2sUpdateGuideGroup(g_HotData:getCurGuideGroup(),4)
        if cc.PLATFORM_OS_ANDROID ~= targetPlatform and cc.PLATFORM_OS_IPHONE ~= targetPlatform then
            return 
        end

        local   panel=UIManager:getOrCreatePanel("UISettingHelpLayer")
        if panel then
            panel:showToScene()
            panel:setLocalZOrder(10005)
            panel:setData(0)
        end
    elseif self.diceBoxNum:isVisible() then
        local rangeStartx,rangeStarty = self.NumberList:getPosition()
        local range=self.NumberList:getContentSize()
        rangeStartx=math.floor(rangeStartx-range.width/2)
        rangeStarty=math.floor(rangeStarty-range.height/2)

        if self:isPointNodeByPos(cc.p(rangeStartx+0*100,rangeStarty),cc.size(100,100),pos) then
            local data=g_HotData:getCurGuideData()
            self.NumberText:setString(tostring(data.number))

            self:handlerGuide()
        end
    elseif self.diceBoxDian:isVisible() then
        local rangeStartx,rangeStarty = self.ListDian:getPosition()
        local range=self.ListDian:getContentSize()
        rangeStartx=math.floor(rangeStartx-range.width/2)
        rangeStarty=math.floor(rangeStarty-range.height/2)

        if self:isPointNodeByPos(cc.p(rangeStartx+450,rangeStarty),cc.size(100,100),pos) then
            local data=g_HotData:getCurGuideData()
            self.Vertices:loadTexture("00_01_Common/2D_Small_" .. data.number ..".png", ccui.TextureResType.plistType)

            self:handlerGuide()
        end
    end
    --退出按钮判断
    local rangeStartx,rangeStarty = self.ExitPanel:getPosition()
    local range=self.ExitPanel:getContentSize()
    local nodePos=self.ExitPanel:convertToNodeSpace(pos)
    
    if self:isPointNodeByPos(cc.p(rangeStartx,rangeStarty),range,cc.p(rangeStartx+nodePos.x,rangeStarty+nodePos.y)) then
        local panel=UIManager:getOrCreatePanel("UIGuideMiniTipPopUp_1")
        if panel then
            panel:showToScene()
            panel:refreshData(3)
        end
    end

    print("onGameTouchEnded2",rangeStartx,rangeStarty,nodePos.x,nodePos.y,g_HotData:getCurGuideStep())
end

function M:isPointNodeByPos(nodePos,range,pos)
    local rangeStartx,rangeStarty = nodePos.x,nodePos.y
    local _x=math.floor(pos.x)
    local _y=math.floor(pos.y)

    if math.floor(_x)>=rangeStartx and _x<=rangeStartx+range.width
    and _y>=rangeStarty and _y<=rangeStarty+range.height then
        return true
    end

    return false
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
    self:doRegEvent(Constant.CustomEvent.UIGameGuideLayer_handlerGuide, "handlerGuide")
end

function M:onCleanup()
    M.super.onCleanup(self)
end

return M