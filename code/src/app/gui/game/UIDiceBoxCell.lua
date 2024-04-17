local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIDiceBoxCell", UIPanel)
local OTHERNODE_SCALE = 0.66--0.75*0.8
local MY_SCALE = 0.75

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_DiceCupLayer.lua"

M.BINDGUIDATANODE = {
    ["OneselfSifter"] = {varname = "OneselfSifter" },
    ["OneselfSifterBg"] = { varname = "OneselfSifterBg" },
    ["OneselfSifterBg_1"] = { varname = "OneselfSifterBg_1" },
    ["OneselfSifterAnimationNode"] = { varname = "OneselfSifterAnimationNode" },
    ["OneselfPanel"] = { varname = "OneselfPanel" },
    ["OneselfSifterNode"] = { varname = "OneselfSifterNode" },
    ["HeadPanel_2"] = { varname = "HeadPanel", onEvent = "onShowPersonPanelTouchEvent" },
    ["NameText_2_O"] = { varname = "NameText" },
    ["HeadIcon_2"] = { varname = "HeadIcon" },
    ["HeadFrame"] = { varname = "HeadFrame"},
    ["HeadShade_2"] = {varname = "HeadShade"},
    ["GoldIcon_2"] = { varname = "GoldIcon" },
    ["GoldNum_2"] = { varname = "GoldNum" },
    ["GoldBg_2"] = { varname = "GoldBg" },
    ["VipImage_2"] = { varname = "VipImage"},
    ["GamePlayerLeftCallPoint"] = { varname = "GamePlayerLeftCallPoint" },
    ["GamePlayerLeftOpenImage_IVT"] = { varname = "GamePlayerLeftOpen" },
    ["GamePlayerRightCallPoint"] = { varname = "GamePlayerRightCallPoint" },
    ["GamePlayerRightOpenImage_IVT"] = { varname = "GamePlayerRightOpen" },
    ["OneselfSifter_1"] = { varname = "OneselfSifter_1" },
    ["OneselfSifter_2"] = { varname = "OneselfSifter_2" },
    ["OneselfSifter_3"] = { varname = "OneselfSifter_3" },
    ["OneselfSifter_4"] = { varname = "OneselfSifter_4" },
    ["OneselfSifter_5"] = { varname = "OneselfSifter_5" },
    ["VerticesText_TT"] = { varname = "VerticesText" },
    ["VerticesNum"] = { varname = "VerticesNum"},
    ["VerticesImage"] = { varname = "VerticesImage" },
    ["VerticesText_1_TT"] = { varname = "VerticesText_1" },
    ["VerticesNum_1"] = { varname = "VerticesNum_1"},
    ["VerticesImage_1"] = { varname = "VerticesImage_1" },
    ["CountDown_2"] = { varname = "CountDown" },
    ["SureImage"] = { varname = "SureImage" },
    ["ShakeAgain"] = { varname = "ShakeAgain"},
    ["ShakeAgainPanel"] = { varname = "ShakeAgain_1" ,onEvent = "onClickReroll" },
    ["HeadListNode"] = { varname = "HeadListNode" },
    ["SitButton"] = {varname = "SitButton", onClick = "onClickSitButton"},
    ["ResultNode"] = {varname = "ResultNode"},
    ["Result"] = {varname = "Result"},
    ["ResultText_1_TT"] = {varname = "ResultText_1"},
    ["ResultText_2_TT"] = {varname = "ResultText_2"},
    ["MicButton_2"] = { varname = "MicButton"},
    ["MicLoadingBar_2"] = { varname = "MicLoadingBar"},
    ["WaitingText_TT"] = { varname = "WaitingText"},
    ["GoldRollNum_2"]={varname="GoldRollNum"},
    ["ServiceImage"]={varname="ServiceImage"},
    ["PrivateRoomMasterIcon"]={varname="PrivateRoomMasterIcon"}
}

M.DICE_MAX = 5

M.RESHAKE_ACTION = 1001

M.BASE_SHAKE_TIMES = 2

function M:updatePrivateRoomMasterIcon()
    local uid=""
    if self.mPlayerData and self.mPlayerData:getUserInfo() then
        uid=self.mPlayerData:getUserInfo():getUserId()
    end
    
    if g_GameData:getPersonalInfo().masterUid==uid then
        self.PrivateRoomMasterIcon:setVisible(true)
    else
        self.PrivateRoomMasterIcon:setVisible(false)
    end
end

function M:onCreate()
    M.super.onCreate(self)

    self.mPlayerData = nil
    self.CountDown:setVisible(false)
    self.GamePlayerLeftCallPoint:setVisible(false)
    self.GamePlayerLeftOpen:setVisible(false)
    self.GamePlayerRightCallPoint:setVisible(false)
    self.GamePlayerRightOpen:setVisible(false)
    self.SureImage:setVisible(false)
    self.OneselfSifterBg:setPosition(cc.p(0,0))
    self.OneselfSifterBg:setVisible(false)
    self.OneselfSifterNode:setVisible(false)
    self.OneselfSifter:setScale(MY_SCALE)

    self.ShakeAgain_1:setVisible(false)
    self.SitButton:setVisible(false)
    self.Result:setVisible(false)
    self.WaitingText:setVisible(false)
    self:updatePrivateRoomMasterIcon()

    self.mMaxTime = 0
    self.mNowTime = 0
    self.mTimeSound = 0
    self.mBackTimeSoundId = 0
    
    
    local btnsize = self.HeadShade:getContentSize()
    self.mLeftTimeLabel = ccui.Text:create()
    self.mLeftTimeLabel:setFontSize(46)
    self.mLeftTimeLabel:setFontName("font/Font003.ttf")
    self.mLeftTimeLabel:setPosition(cc.p(btnsize.width/2,btnsize.height/2))
    self.mLeftTimeLabel:setTextColor({r = 255, g = 255, b = 255})
    self.mLeftTimeLabel:enableShadow({r = 0, g = 0, b = 0, a = 127}, {width = 0, height = -1}, 0)
    self.HeadShade:addChild(self.mLeftTimeLabel)
    self.HeadShade:setVisible(false)

    self.mIsMy = false

    self.mDiceBoxItems={
        [1]=self.OneselfSifter_1,
        [2]=self.OneselfSifter_2,
        [3]=self.OneselfSifter_3,
        [4]=self.OneselfSifter_4,
        [5]=self.OneselfSifter_5,
    }

    self.mMicVolumeChgTime = 0
    self.mPerPlayerMicVolume = 0
    self.mCurPlayerMicVolume = 0

    self.mPointType = 0 --1:顺子，2：豹子，0：都不是
    self.MicButton:setTouchEnabled(false)
    self.MicButton:setVisible(false)
    self.MicLoadingBar:setPercent(0)
    self.MicLoadingBar:setVisible(false)
    self.OneselfPanel:setSwallowTouches(false)
    self.GoldRollNum:setVisible(false)
    self.MicIsOpen = false
end

function M:refreshLanguageHandle()
    if self.mPlayerData then
        self.GoldNum:setString(Utils.getFormatNumber_MuitiLanguage(self.mPlayerData:getUserInfo():getGold()))
        self.GoldRollNum:setString(Utils.getFormatNumber_MuitiLanguage(self.mPlayerData:getUserInfo():getGold()))
    end
end

function M:initDiceBox(id)
    self.OneselfSifterBg:loadTexture(Utils.getIconStr(PlistConfig.Icon.StaticDiceBox,tonumber(id)), ccui.TextureResType.plistType)
end

function M:showIsMy(isMy)
    self.mIsMy = isMy and not g_GameData:isWatching()
    self.OneselfPanel:setVisible(not self.mIsMy)
    local scale = isMy and MY_SCALE or OTHERNODE_SCALE;
    self.OneselfSifter:setScale(scale)
    -- if not isMy then
    --     local _dy =(self.mOneselfSifterHeight*(1-scale))/2
    --     self.OneselfPanel:setPositionY(self.mOneselfPanelPosY - _dy)
    --     self.OneselfPanel:setScale(1.0/0.8)
    -- end
end

function M:showPointData(points,isReOnline)
    if self.mIsNonePlayer then return end
    self.OneselfSifterNode:setVisible(false)
    self.OneselfSifterBg:setVisible(true)
    self.Result:setVisible(false)
    if not points or #points ~=5 then return end
    for i, v in ipairs(points) do
        if v == -1 then return end
        self.mDiceBoxItems[i]:loadTexture("00_01_Common/3D_Dice_" .. v ..".png", ccui.TextureResType.plistType)
    end
    
    if self.mIsMy then
        local isStraight = self:chkIsStraight(clone(points))
        local isLeopard = self:chkIsLeopard(points,g_GameData:isOneCalled())
        if isStraight then
            self.mPointType = 1
        elseif isLeopard then
            self.mPointType = 2
        else
            self.mPointType = 0
        end

        if isReOnline then
            self.OneselfSifterNode:setVisible(true)
            self.Result:setVisible(self.mPointType ~= 0)
            self.ResultText_1:setVisible(self.mPointType == 2)
            self.ResultText_2:setVisible(self.mPointType == 1)
            --self:shakeSieveCup(false)
        end
    end
end
--暂时关闭开骰盅动画
function M:ShowOpenUpEffect(isshow)
    -- if not self.mIsMy then return end

    -- if isshow then
    --     if self.OneselfSifterAnimationNode:getChildByName("DiceBoxUpAnimation") then return end
    --     local _effect = Utils.onlyCreateEffect(GSystem.DiceBoxUpAnimationId,cc.p(0,0),true)
    --     _effect:setName("DiceBoxUpAnimation")
    --     self.OneselfSifterAnimationNode:addChild(_effect)
    -- else
    --     local _effect = self.OneselfSifterAnimationNode:getChildByName("DiceBoxUpAnimation")
    --     if _effect then
    --         _effect:removeFromParent()
    --     end
    -- end
end

function M:openDiceHandle(dic)
    if self.mIsNonePlayer then return end
    if dic>0  then
        if dic<100 then
            self.OneselfSifterBg:setPositionY(dic)
        else
            self.OneselfSifterBg:setPositionY(150)
        end
        self.OneselfSifterBg_1:setVisible(false)
    else
        self.OneselfSifterBg:setPositionY(0)
        self.OneselfSifterBg_1:setVisible(true)
    end

end

function M:open()
    if self.mIsNonePlayer then return end
    g_GameData:C2S_OpenDiceBox()
end

function M:callOpen()
    if self.mIsNonePlayer then return end
    --此玩家开了
    if not self.mPlayerData then return end
    local seat = self.mPlayerData.actualSeat or 0
    if seat<=4 then
        --显示右边开
        self.GamePlayerRightOpen:setVisible(true)
        self.GamePlayerRightOpen:runAction(cc.Sequence:create(cc.ScaleTo:create(0.3,1.2)
            ,cc.ScaleTo:create(0.16,1)
        ))
    else
        --显示左边开
        self.GamePlayerLeftOpen:setVisible(true)
        self.GamePlayerLeftOpen:runAction(cc.Sequence:create(cc.ScaleTo:create(0.3,1.2)
            ,cc.ScaleTo:create(0.16,1)
        ))
    end

    self:setTimePerent(0)
end

function M:setSay(point,num)
    if self.mIsNonePlayer then return end
    if not self.mPlayerData then return end
    local seat = self.mPlayerData.actualSeat or 0
    if seat<=4 then
        --显示右边叫点
        self.GamePlayerRightCallPoint:setVisible(true)
        self.VerticesNum_1:setString(tostring(num))
        --self.VerticesText_1:setString(Utils.getFormatString(self.mVerticesText_1, tostring(num)))
        self.VerticesImage_1:loadTexture("00_01_Common/2D_Small_" .. point ..".png", ccui.TextureResType.plistType)
    else
        --显示左边叫点
        self.GamePlayerLeftCallPoint:setVisible(true)
        self.VerticesNum:setString(tostring(num))
        --self.VerticesText:setString(Utils.getFormatString(self.mVerticesText, tostring(num)))
        self.VerticesImage:loadTexture("00_01_Common/2D_Small_" .. point ..".png", ccui.TextureResType.plistType)

    end

    self:setTimePerent(0)
end

function M:setNotSay()
    if self.mIsNonePlayer then return end
    self.GamePlayerLeftCallPoint:setVisible(false)
    self.GamePlayerRightCallPoint:setVisible(false)
end

function M:setAllDiceBoxShow(value)
    if self.mIsNonePlayer then return end
    self.OneselfSifterNode:setVisible(value)
end

function M:showPoint(points)
    if self.mIsNonePlayer then return end
    self.OneselfSifterNode:setVisible(true)
    for i, v in ipairs(points) do
        if self.mDiceBoxItems[i] then
            self.mDiceBoxItems[i]:loadTexture("00_01_Common/3D_Dice_" .. v ..".png", ccui.TextureResType.plistType)
            if not self.mIsMy then
                self.mDiceBoxItems[i]:setOpacity(0)
                self.mDiceBoxItems[i]:runAction(cc.FadeIn:create(0.5))
            end
        end
    end
end

--座位没人则隐藏所有UI,若玩家当前不在对局中则显示坐下按钮
function M:SetIsNonePlayer(isNonePlayer,isWatching,seatId)
    self.mIsNonePlayer = isNonePlayer

    self.SitButton:setVisible(isNonePlayer and isWatching)
    self.OneselfSifter:setVisible(not isNonePlayer)
    self.ShakeAgain:setVisible(not isNonePlayer)

    self.OneselfPanel:setVisible(not isNonePlayer and not self.mIsMy)
    if isNonePlayer then
        self.mPlayerData = nil
        self.mIsMy = false
        self:removeEffect()
    else
        self.mSeatId = nil
    end

    if seatId ~= nil then
        self.mSeatId = seatId
    end
end

function M:showGoldChangeTxtListPop(num)
    if self.mIsNonePlayer then return end
    if num <10 and num>-10 then return end
    local betBase = g_GameData:getBetBase()
    local times = math.floor(num/betBase)
    for i = 1, times do
        local _label = ccui.Text:create()
        _label:setFontSize(36)
        if num>0 then
            _label:setString("+" .. betBase)
        else
            _label:setString("-" .. betBase)
        end
        _label:setVisible(false)
        self:addChild(_label)
        local posx,posy = self.GoldIcon:getPosition()
        _label:setPosition(cc.p(posx+50,posy+80))
        _label:runAction(cc.Sequence:create(cc.DelayTime:create(0.5*i),cc.CallFunc:create(function()
            _label:setVisible(true)
        end),cc.MoveBy:create(1.2,cc.p(0,200)),cc.CallFunc:create(function()
            _label:removeFromParent()
        end)))

    end

end

function M:PopNumber(num,endnum,time)
    if self.mIsNonePlayer then return end

    local function flytext()
        local _label = ccui.Text:create()
        _label:setFontSize(24)
        _label:setFontName("font/Font003.ttf")
        
        if num>0 then
            _label:setString("+" .. num)
        else
            _label:setString(num)
        end

        _label:setTextColor({r = 230, g = 228, b = 198})
        _label:enableOutline({r = 0, g = 0, b = 0}, 2)

        _label:setVisible(true)
        self:addChild(_label)
        local posx,posy = self.GoldIcon:getPosition()
        _label:setPosition(cc.p(posx+50,posy+20))
        _label:runAction(cc.Sequence:create(cc.Spawn:create(cc.MoveBy:create(1.2,cc.p(0,30)),cc.FadeOut:create(1.2))
                ,cc.CallFunc:create(function()
                    _label:removeFromParent()
                end))
        )
    end
    
    local startnum = self.mPlayerData:getUserInfo():getGold()
    if endnum then
        self.mPlayerData:getUserInfo():setGold(endnum)
        startnum = endnum-num
    end

    self.GoldNum:setString(Utils.getFormatNumber_MuitiLanguage(startnum+num))
    if num<0 then
        flytext()
    else
        self.GoldRollNum:setVisible(true)
        self.GoldRollNum:setString(Utils.getFormatNumber_MuitiLanguage(startnum))
        self.GoldNum:setVisible(false)
        if time == nil then
            time = 0.5
        end
        local chgtimes = math.ceil(time/0.1)
        local act = {}
        for i=1,chgtimes do
            act[#act+1] = cc.DelayTime:create(0.1)
            act[#act+1] = cc.CallFunc:create(function ()
                self.GoldRollNum:setString(Utils.getFormatNumber_MuitiLanguage(math.floor(startnum+i*num/chgtimes)))
            end)
        end
        act[#act+1] = cc.CallFunc:create(function ()
            self.GoldNum:setVisible(true)
            self.GoldRollNum:setVisible(false)
            flytext()
        end)
        self.GoldRollNum:runAction(cc.Sequence:create(act))
    end
end

--竞猜结束结算之前的金币数额同步
function M:setBetResultGoldNum(beforegold)
    if self.mIsNonePlayer then return end
    if self.mPlayerData and self.mPlayerData:getUserInfo() then
        self.mPlayerData:getUserInfo():setGold(beforegold)
    end
    self.GoldNum:setString(Utils.getFormatNumber_MuitiLanguage(beforegold))
    self.GoldRollNum:setString(Utils.getFormatNumber_MuitiLanguage(beforegold))
end

function M:initData(player)
    if self.mIsNonePlayer then return end
    --self.NameText:setVisible(false)
    if not player or player:isEmptySeat() then return end
    --Log.info(player:getUserInfo():getNickName())
    self:refreshData(player)
    self.OneselfSifterBg:setVisible(true)
    self.OneselfSifterBg:setPositionY(0)
    self.OneselfSifterBg_1:setVisible(true)
    if self.mPlayerData:isGaming() or self.mPlayerData:getUserInfo():getUserId() == g_UserData:getUserId() then
        self.OneselfSifterBg:setOpacity(204)
        self.WaitingText:setVisible(false)
        self.GoldIcon:setVisible(true)
        self.GoldNum:setVisible(true)
        self.GoldBg:setVisible(true)
        -- self.VipImage:setVisible(true)
    else
        self.WaitingText:setVisible(true)
        self.GoldIcon:setVisible(false)
        self.GoldNum:setVisible(false)
        self.GoldBg:setVisible(false)
        self.VipImage:setVisible(false)
        self.OneselfSifterBg:setOpacity(102)
    end

    self.GamePlayerLeftCallPoint:setVisible(false)
    self.GamePlayerLeftOpen:setVisible(false)
    self.GamePlayerRightCallPoint:setVisible(false)
    self.GamePlayerRightOpen:setVisible(false)
    local child = self.HeadListNode:getChildByName("UIBoastListLayer")
    if child then
        child:removeFromParent()
    end

    -- self:removeEffect()
end

function M:refreshData(player)
    self.mPlayerData = player
    self.NameText:setString(tostring(player:getUserInfo():getNickName()))
    self.HeadIcon:removeAllChildren()
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    
    avater:InitTexture(string.utf8len(player:getUserInfo():getHead())<7,player:getUserInfo():getHead(),player:getUserInfo():getUserId())
    self.HeadIcon:addChild(avater)
    
    self.HeadFrame:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(player:getUserInfo():getHeadBox())), ccui.TextureResType.plistType)
    local goldId = GSystem.GoldItemId
    local goldIcon = DataManager:getTbxData("Item",goldId).MiniItemIcon
    self.GoldIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.MiniItem,goldIcon), ccui.TextureResType.plistType)
    self.GoldNum:setString(Utils.getFormatNumber_MuitiLanguage(player:getUserInfo():getGold()))
    self.GoldRollNum:setString(Utils.getFormatNumber_MuitiLanguage(player:getUserInfo():getGold()))

    local vipLevel = player:getUserInfo():getVipLevel()
    -- local vipData = DataManager:getTbxData("Vip", vipLevel)
    -- if vipData then 
    --     self.VipImage:loadTexture(Utils.getIconStr(PlistConfig.Icon.VipIconMini, vipData.VipIcon), ccui.TextureResType.plistType)
    -- end
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

    self:refreshServiceView()
    self:updatePrivateRoomMasterIcon()
end

--匹配中显示本人骰盅
function M:initMatchGame()
    self.OneselfSifter:setVisible(true)
    self.OneselfPanel:setVisible(false)
    self.ShakeAgain:setVisible(false)
    self.SitButton:setVisible(false)

    self.OneselfSifterBg:setVisible(true)
    self.OneselfSifterBg:setPosition(cc.p(0,0))
    self.OneselfSifterBg_1:setVisible(true)
    self.OneselfSifterNode:setVisible(false)
    self.Result:setVisible(false)
end

function M:setInitPlayerDicIsShow(isShow)
    if self.mIsNonePlayer then return end
    self.OneselfSifterBg:setVisible(isShow)
end

function M:shakeSieveCup()
    if self.mIsNonePlayer then return end
    if self.bIsShake then return end
    self.bIsShake = true

    if self.mIsMy then
        self.ShakeAgain:setVisible(false)
    end

    SoundSystemManager:playSound008()

    self.GamePlayerLeftCallPoint:setVisible(false)
    self.GamePlayerLeftOpen:setVisible(false)
    self.GamePlayerRightCallPoint:setVisible(false)
    self.GamePlayerRightOpen:setVisible(false)
    self.OneselfSifterBg:setPositionY(0)
    self.OneselfSifterBg_1:setVisible(false)

    local function onShakeEnded()
        self.bIsShake = false
        self.OneselfSifterBg_1:setVisible(true)
        if self.mIsMy then
            self.ShakeAgain:setVisible(true)
            self.OneselfSifterNode:setVisible(true)
            self.Result:setVisible(self.mPointType ~= 0)
            self.ResultText_1:setVisible(self.mPointType == 2)
            self.ResultText_2:setVisible(self.mPointType == 1)
        end
    end

    local sAct1 = cc.RotateTo:create(0.1, -45)
    local sAct2 = cc.RotateTo:create(0.1, 45)
    local sAct3 = cc.RotateTo:create(0.1, 0)
    local acts = {}

    acts[#acts + 1] = sAct1
    acts[#acts + 1] = sAct2
    acts[#acts + 1] = sAct1
    acts[#acts + 1] = sAct2
    acts[#acts + 1] = sAct1
    acts[#acts + 1] = sAct2
    acts[#acts + 1] = sAct1
    acts[#acts + 1] = sAct2

    acts[#acts + 1] = sAct3
    acts[#acts + 1] = cc.CallFunc:create(onShakeEnded)
    self.OneselfSifterBg:runAction(cc.Sequence:create(acts))
end

function M:playEffect(effect)
    if self.mIsNonePlayer then return end
    if effect then
        effect:setPosition(cc.p(120,200))
        effect:setName("resulteffect")
        self:addChild(effect)
    end
end

function M:removeEffect()
    local resulteffect = self:getChildByName("resulteffect")
    if resulteffect then
        resulteffect:removeFromParent()
    end
end

function M:setTimePerent(time)
    if self.mIsNonePlayer then return end
    self.mMaxTime = time/1000
    self.mNowTime = time/1000

    -- self.mTimeMask:setPercentage(0)
    self.mTimeSound = 0
    self.HeadShade:setVisible(false)
    self.mLeftTimeLabel:stopAllActions()
    if self.mBackTimeSoundId~=0 then
        SoundSystemManager:stopSound("effect",self.mBackTimeSoundId)
        self.mBackTimeSoundId = 0 
    end
end

--1叫过后要重新判断下是不是豹子
function M:reChkShowPointResult()
    if self.mIsNonePlayer then return end
    if not self.mPlayerData then return end
    if self.mPointType ~= 2 then return end -- 如果之前不是豹子则不需要重新判断
    
    local points = self.mPlayerData:getDices()
    if points == nil then return end
    for i, v in ipairs(points) do
        if v == -1 then return end -- 没有点数信息则不要判断
    end

    if not self:chkIsLeopard(points,true) then
        self.mPointType = 0
        self.Result:setVisible(false)
    end
end

--判断是否为豹子
function M:chkIsLeopard(points,isCallOne,callpoint)
    local targetpoint
    for i, v in ipairs(points) do
        if v~= 1 then
            targetpoint = v
            break
        end
    end

    if targetpoint == nil then--所有点数都是1
        return not (callpoint ~= nil and isCallOne and callpoint ~= 1)--若叫过1且开的不是1则不是豹子
    end

    for i, v in ipairs(points) do
        if v~= targetpoint and (isCallOne or v~= 1) then
            return false
        end
    end

    return not (callpoint ~= nil and callpoint ~= targetpoint)--若开的点数与豹子的点数不同则不算豹子（用于动画显示控制）
end

--判断是否为顺子
function M:chkIsStraight(points)
    local function sortpoints(data1,data2)
        return data1<data2
    end

    table.sort(points,sortpoints)
    for i = 1,#points-1 do
        if points[i] == points[i+1] then
            return false
        end
    end

    return true
end
--当前回合结束
function M:gameResult(data,callpoint,isCallOne,isMeOpened)
    if self.mIsNonePlayer then return end
    if not self.mPlayerData then return end
    --if not self.mPlayerData:isGaming() then return end
    --local _seatId = g_GameData:getMineSeatId()
    local isStraight = self:chkIsStraight(clone(data.diceInfo.point))
    local isLeopard = self:chkIsLeopard(data.diceInfo.point,isCallOne,callpoint)

    local function ShowResult()
        local isfirstsetblack = true
        for i, v in ipairs(data.diceInfo.point) do
            if self.mDiceBoxItems[i] then
                if isStraight or not (v==callpoint or (v == 1 and not isCallOne))then
                    self.mDiceBoxItems[i]:loadTexture("00_01_Common/3D_Dice_" .. v .."B.png", ccui.TextureResType.plistType)
                    self.mDiceBoxItems[i]:setOpacity(0)
                    if isfirstsetblack then
                        isfirstsetblack = false
                        self.mDiceBoxItems[i]:runAction(cc.FadeIn:create(0.1))
                    else
                        self.mDiceBoxItems[i]:runAction(cc.Sequence:create(cc.DelayTime:create(0.1)
                            ,cc.FadeIn:create(0.1)
                        ))
                    end
                end
            end
        end

        local _effectId
        if isLeopard then
            _effectId=GSystem.LeopardAnimationId
        elseif isStraight then
            _effectId=GSystem.StraightAnimationId
        end

        self.Result:setVisible(false)

        if _effectId then
            local _effect = Utils.onlyCreateEffect(_effectId,cc.p(0,0),false,false)
            local scale = self.mIsMy and MY_SCALE or OTHERNODE_SCALE;
            _effect:setScale(scale)
            self.ResultNode:addChild(_effect)
            self.ResultNode:runAction(cc.Sequence:create(cc.DelayTime:create(2)
                                        ,cc.CallFunc:create(function ()
                                            _effect:removeFromParent()
                                        end))
            )
        end
    end
    self.OneselfSifterBg_1:setVisible(false)
    if not self.mIsMy or not isMeOpened then
        self.OneselfSifterBg:runAction(cc.Sequence:create(cc.MoveTo:create(0.5,cc.p(0,300))
            ,cc.Spawn:create(cc.FadeOut:create(0.5),cc.MoveTo:create(0.5,cc.p(0,600)))
            ,cc.CallFunc:create(function()
                ShowResult()
            end)
        ) )
    else
        self.OneselfSifterBg:runAction(cc.Sequence:create(cc.MoveTo:create(0.5,cc.p(0,450))
            ,cc.Spawn:create(cc.FadeOut:create(0.5),cc.MoveTo:create(0.5,cc.p(0,750)))
            ,cc.CallFunc:create(function()
                ShowResult()
            end)
        ))
    end

    self:showPoint(data.diceInfo.point)
end

--当前回合开始
function M:gameStart()
    if self.mIsNonePlayer then return end
    --self.SureImage:setVisible(false)
    self.OneselfSifterBg:setPosition(cc.p(0,0))
    self.OneselfSifterBg:setVisible(true)
    self.OneselfSifterBg_1:setVisible(true)
    self.OneselfSifterNode:setVisible(false)
    self.Result:setVisible(false)

    self:shakeSieveCup()
end

function M:setIsCanReRoll(isRe)
    if self.mIsNonePlayer then return end
    if not self.mIsMy then return end
    self.ShakeAgain_1:setVisible(isRe)
end

function M:setUpBetVoteResult(value)
    if self.mIsNonePlayer then return end
    self.SureImage:setVisible(true)
    if value then
        self.SureImage:loadTexture("02_01_Boast/button_017.png", ccui.TextureResType.plistType)
    else
        self.SureImage:loadTexture("02_01_Boast/button_012.png", ccui.TextureResType.plistType)
    end
end

function M:unShowUpBetImg()
    self.SureImage:setVisible(false)
end

function M:onClickReroll(data)
    if self.mIsNonePlayer then return end
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        self.ShakeAgain:setVisible(false)
        g_GameData:C2S_ReshakeDiceBox()
    end
end

function M:OnUpdate(dt)
    if self.mIsNonePlayer then return end
    if self.mNowTime>0 then

        self.mNowTime=self.mNowTime-dt
       
        local _time = math.floor(self.mNowTime)
        if _time >= 0 then
            --self.mTimeMask:setPercentage(self.mNowTime/self.mMaxTime*100)
           -- self.mTimeMask:setColor(cc.c4b(255*((self.mMaxTime-self.mNowTime)/self.mMaxTime),255*((self.mMaxTime-self.mNowTime)/self.mMaxTime),0,180))
            self.HeadShade:setVisible(true)
            self.mLeftTimeLabel:setScale(1)
            self.mLeftTimeLabel:setString(tostring(_time))
        else
            --self.mTimeMask:setPercentage(0)
            self.HeadShade:setVisible(false)
        end
        
        if _time > 3 then
            -- self.mLeftTimeLabel:setTextColor({r = 255, g = 255, b = 255})
            if _time == 4 and tonumber(self.mTimeSound) ~= 4 then
                self.mBackTimeSoundId = SoundSystemManager:playEffect("music/02sound/Sound002.mp3",false)
            end
        elseif _time >= 0 then
            -- self.mLeftTimeLabel:setTextColor({r = 255, g = 40, b = 40})
            if tonumber(self.mTimeSound) ~= _time then
                self.mLeftTimeLabel:runAction(cc.Sequence:create(cc.ScaleTo:create(0.4,1.2),cc.ScaleTo:create(0.2,1)))
            end
        end
        self.mTimeSound = _time
    end

    self:onUpdateMicLoadingBar(dt)
end

--动态更新麦克风音量进度条
function M:onUpdateMicLoadingBar(dt)
    if self.mMicVolumeChgTime and self.mMicVolumeChgTime > 0 then
        self.mMicVolumeChgTime = self.mMicVolumeChgTime - dt
        if self.mMicVolumeChgTime <= 0 then
            self.mMicVolumeChgTime = 0
            self.mPerPlayerMicVolume = 0
            self.MicLoadingBar:setPercent(0)
            if self.ismute then
                self.MicButton:setVisible(true)
            else
                self.MicButton:setVisible(false)
            end
            self.MicLoadingBar:setVisible(false)
        else
            local delaytime = 0.4-self.mMicVolumeChgTime
            local coefficient = (1/3.901)*(math.sin(math.pi*(5*delaytime-1/2))+math.sin(math.pi*((20/7)*delaytime-1/2))+2)--定义域[0，1]时,对应值域[0,1]
            local per = self.mPerPlayerMicVolume + (self.mCurPlayerMicVolume - self.mPerPlayerMicVolume) *coefficient
            per = per > 100 and 100 or per
            self.MicLoadingBar:setPercent(per)
        end
    end
end

function M:getMicVolumeChgTime()
    return self.mMicVolumeChgTime
end

--麦克风音量设置
function M:setMicVolume(volume)
    if volume > 0 then
        self.MicIsOpen = true
    else
        self.MicIsOpen = false
    end
    self.mMicVolumeChgTime = 0.4
    self.mPerPlayerMicVolume = self.MicLoadingBar:getPercent()
    self.mCurPlayerMicVolume = volume/2.55
    self.MicButton:setVisible(true)
    self.MicLoadingBar:setVisible(true)
end

function M:getPlayerUid()
    if not self.mPlayerData or self.mPlayerData:getUserInfo() == nil then return nil end
    
    return self.mPlayerData:getUserInfo():getUserId()
end

function M:getHeadListNode()
    return self.HeadListNode
end

-- function M:getHeadOffsetY()
--     return self:convertToNodeSpaceAR(self.HeadIcon:getPosition())
--     -- return self.HeadIcon:getPositionY()-self:getContentSize().height/2
-- end

--获取头像世界坐标
function M:getHeadWorldPosition()
    return Utils.getNodeWordPosition(self.HeadIcon)
end

--获取金币图标世界坐标
function M:getGoldWorldPosition()
    return Utils.getNodeWordPosition(self.GoldIcon)
end

function M:onShowPersonPanelTouchEvent(data)
    if self.mIsNonePlayer then return end
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        DataManager:dispatchMessage(Constant.CustomEvent.RefreshDiceBoxUI)

        if not self.mPlayerData then return end
        local worldPos=self.HeadListNode:convertToWorldSpace(cc.p(0,0))

        local panel = UIManager:getPanel("UIGameLayer")
        if panel then
            panel:showUIMagicEmojiPopUp(self.mPlayerData,worldPos)
        end
    end
end

function M:onClickSitButton(ref)
    if not self.mIsNonePlayer then return end
    if g_GameData:isWatching() then
        g_GameData:MSG_C2S_SitDown(self.mSeatId)

        DataManager:dispatchMessage(Constant.CustomEvent.SitDown)
    end
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
    
    self:doRegEvent(Constant.CustomEvent.refreshChuiniuMuteList, "refreshChuiniuMuteList")
    self:doRegEvent("UpdatePrivateRoomMasterIcon", "updatePrivateRoomMasterIcon")
end

function M:refreshChuiniuMuteList()
    self.ismute = false
    for k, v in pairs(g_GameData:getChuiniuMuteList()) do
        if v == self:getPlayerUid() then
            self.ismute = true
            self.MicButton:setVisible(true)
            self.MicButton:setBright(false)
        end
    end
    if not self.ismute then
        if self.MicIsOpen then
            self.MicButton:setVisible(true)
        else
            self.MicButton:setVisible(false)
        end
        self.MicButton:setBright(true)
    end
end

function M:refreshServiceView()
    if not g_UserData:getServiceTag() or not self.mPlayerData then return end

    local data=g_UserData:getPlayerOnlineDataByUid(self.mPlayerData:getUserInfo():getUserId())
    if data then
        self.ServiceImage:setVisible(true)
        if data.isPlaymate then
            self.ServiceImage:loadTexture("00_01_Common/icon_129.png",ccui.TextureResType.plistType)
        elseif data.isOperator then
            self.ServiceImage:loadTexture("00_01_Common/icon_154.png",ccui.TextureResType.plistType)
        elseif data.isBot then
            self.ServiceImage:loadTexture("00_01_Common/icon_130.png",ccui.TextureResType.plistType)
        else
            self.ServiceImage:loadTexture("00_01_Common/icon_131.png",ccui.TextureResType.plistType)
        end
    else
        local arr={}
        table.insert(arr,self.mPlayerData:getUserInfo():getUserId())
        g_UserData:c2sGetPlayerInfosForPlaymate(arr)
        self.ServiceImage:setVisible(false)
    end
end

function M:refreshService()
    if not g_UserData:getServiceTag() or not self.mPlayerData then return end

    local data=g_UserData:getPlayerOnlineDataByUid(self.mPlayerData:getUserInfo():getUserId())
    if data then
        self.ServiceImage:setVisible(true)
        if data.isPlaymate then
            self.ServiceImage:loadTexture("00_01_Common/icon_129.png",ccui.TextureResType.plistType)
        elseif data.isOperator then
            self.ServiceImage:loadTexture("00_01_Common/icon_154.png",ccui.TextureResType.plistType)
        elseif data.isBot then
            self.ServiceImage:loadTexture("00_01_Common/icon_130.png",ccui.TextureResType.plistType)
        else
            self.ServiceImage:loadTexture("00_01_Common/icon_131.png",ccui.TextureResType.plistType)
        end
    else
        self.ServiceImage:setVisible(false)
    end
end

return M