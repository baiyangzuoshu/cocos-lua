local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("GuideDiceCupLayer", UIPanel)
local OTHERNODE_SCALE = 0.66--0.75*0.8
local MY_SCALE = 0.75
M.GUI_FILE_NAME = "csd.01_16_NoviceGuide.01_16_GuideDiceCupLayer.lua"

M.BINDGUIDATANODE = {
    ["OneselfSifter"]={varname="OneselfSifter"},
    ["OneselfPanel"]={varname="OneselfPanel"},
    ["Result"]={varname="Result"},
    ["ResultNode"]={varname="ResultNode"},
    ["OneselfSifterNode"]={varname="OneselfSifterNode"},
    ["GamePlayerLeftCallPoint"]={varname="GamePlayerLeftCallPoint"},
    ["GamePlayerLeftOpenImage_IVT"]={varname="GamePlayerLeftOpenImage_IVT"},
    ["GamePlayerRightCallPoint"]={varname="GamePlayerRightCallPoint"},
    ["GamePlayerRightOpenImage_IVT"]={varname="GamePlayerRightOpenImage_IVT"},
    ["WaitingText_TT"]={varname="WaitingText_TT"},
    ["HeadPanel_2"] = { varname = "HeadPanel", onEvent = "onShowPersonPanelTouchEvent" },
    ["NameText_2"] = { varname = "NameText" },
    ["HeadIcon_2"] = { varname = "HeadIcon" },
    ["HeadFrame"] = { varname = "HeadFrame"},
    ["HeadShade_2"] = {varname = "HeadShade"},
    ["GoldIcon_2"] = { varname = "GoldIcon" },
    ["GoldNum_2"] = { varname = "GoldNum" },
    ["GoldBg_2"] = { varname = "GoldBg" },
    ["VipImage_2"] = { varname = "VipImage"},
    ["GoldRollNum_2"]={varname="GoldRollNum_2"},
    ["OneselfSifterBg"]={varname="OneselfSifterBg"},
    ["VerticesNum"]={varname="VerticesNum"},
    ["VerticesImage"]={varname="VerticesImage"},
    ["OneselfSifter_1"] = { varname = "OneselfSifter_1" },
    ["OneselfSifter_2"] = { varname = "OneselfSifter_2" },
    ["OneselfSifter_3"] = { varname = "OneselfSifter_3" },
    ["OneselfSifter_4"] = { varname = "OneselfSifter_4" },
    ["OneselfSifter_5"] = { varname = "OneselfSifter_5" },
    ["OneselfSifterBg_1"] = { varname = "OneselfSifterBg_1" },
    ["OneselfSifterAnimationNode"]={varname="OneselfSifterAnimationNode"}
}

function M:playEffect(effect)
    if effect then
        effect:setPosition(cc.p(120,200))
        effect:setName("resulteffect")
        self:addChild(effect)
    end
end
function M:showIsMy(isMy)
    self.mIsMy = isMy
    local scale = isMy and MY_SCALE or OTHERNODE_SCALE
    self.OneselfSifter:setScale(scale)
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
function M:gameResult(points,callpoint,isCallOne)
    local isStraight = self:chkIsStraight(clone(points))
    local isLeopard = self:chkIsLeopard(points,isCallOne,callpoint)

    local function ShowResult()
        local isfirstsetblack = true
        for i, v in ipairs(points) do
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
    
    if  self.mIsMy  then
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

    self:showPoint(points)
end

function M:showPoint(points)
    self.OneselfSifterNode:setVisible(true)
    for i, v in ipairs(points) do
        if self.mDiceBoxItems[i] then
            self.mDiceBoxItems[i]:loadTexture("00_01_Common/3D_Dice_" .. v ..".png", ccui.TextureResType.plistType)
            if  self.mIsMy then
                self.mDiceBoxItems[i]:setOpacity(0)
                self.mDiceBoxItems[i]:runAction(cc.FadeIn:create(0.5))
            end
        end
    end
end

function M:openDiceHandle(dic)
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

function M:playNoviceGuideHandAnimation()
    local startEffectId = GSystem.NoviceGuideHandAnimation
    local _effect = Utils.onlyCreateEffect(startEffectId,cc.p(0,0),true)
    self.OneselfSifterAnimationNode:addChild(_effect)
end

function M:stopNoviceGuideHandAnimation()
    self.OneselfSifterAnimationNode:removeAllChildren()
end

function M:refreshData(player,type)
    self.mPlayer=player
    self.mType=type

    if 1==type then
        self.mIsMy=false
        self.OneselfPanel:setVisible(1==type)
        self.ResultNode:setVisible(1==type)
        self.OneselfSifterBg:loadTexture(Utils.getIconStr(PlistConfig.Icon.StaticDiceBox,tonumber(GSystem.GuideRobotDiceCupId_1)), ccui.TextureResType.plistType)
        self.NameText:setString(tostring(player:getNickName()))
        self.HeadIcon:removeAllChildren()
        local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
        
        avater:InitTexture(string.utf8len(player:getAvatar())<7,player:getAvatar(),player:getFriendUid())
        self.HeadIcon:addChild(avater)
        self.HeadFrame:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(player:getAvatarFrame())), ccui.TextureResType.plistType)
        local goldId = GSystem.GoldItemId
        local goldIcon = DataManager:getTbxData("Item",goldId).MiniItemIcon
        self.GoldIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.MiniItem,goldIcon), ccui.TextureResType.plistType)
        self.GoldNum:setString(Utils.getFormatNumber_MuitiLanguage(GSystem.GuideRobotInitGold_1))

        local vipLevel = player:getVipLevel()
        
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
    else
        self.mIsMy=true
    end

    self:showIsMy(self.mIsMy)
end

function M:doHandler(data)
    if 1==data.type then
        local arr=data.data
        self.VerticesNum:setString(tostring(arr[1]))
        self.VerticesImage:loadTexture("00_01_Common/2D_Small_" .. arr[2] ..".png", ccui.TextureResType.plistType)
        self.GamePlayerLeftCallPoint:setVisible(true)
    end
end

function M:hidePoint()
    self.GamePlayerLeftCallPoint:setVisible(false)
end

function M:startGame(onShakeEnded)
    SoundSystemManager:playSound008()
    
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

function M:onCreate()
    M.super.onCreate(self)

    self.OneselfPanel:setVisible(false)
    self.Result:setVisible(false)
    self.ResultNode:setVisible(false)
    self.OneselfSifterNode:setVisible(false)
    self.GamePlayerLeftCallPoint:setVisible(false)
    self.GamePlayerLeftOpenImage_IVT:setVisible(false)
    self.GamePlayerRightCallPoint:setVisible(false)
    self.GamePlayerRightOpenImage_IVT:setVisible(false)
    self.WaitingText_TT:setVisible(false)
    self.GoldRollNum_2:setVisible(false)

    self.mDiceBoxItems={
        [1]=self.OneselfSifter_1,
        [2]=self.OneselfSifter_2,
        [3]=self.OneselfSifter_3,
        [4]=self.OneselfSifter_4,
        [5]=self.OneselfSifter_5,
    }
end

function M:onInit()
    M.super.onInit(self)
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:OnUpdate(dt)
    
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
end

function M:onCleanup()
    M.super.onCleanup(self)
end

return M