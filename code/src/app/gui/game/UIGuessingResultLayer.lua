local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIGuessingResultLayer", UIPanel)

local UIGuessingResultHeadCell = require("app.gui.game.UIGuessingResultHeadCell")

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_GuessingResultLayer.lua"

M.BINDGUIDATANODE = {
    ["GuessWrongImage_IVT"]={varname="GuessWrongImage"},
    ["BingoImage_IVT"] = {varname="BingoImage"},
    ["CancelImage_IVT"] = {varname="CancelImage"},
    ["ResultImage_IVT"] = {varname="ResultImage"},
    ["ReturnBg_1"]={varname="ReturnBg"},

    ["ReturnGoldNum"] = {varname="ReturnGoldNum"},

    ["GuessingNode_1"]={varname="EnoughWinNode"},
    ["GuessingNode_2"]={varname="UnEnoughWinNode"},

    ["LeftHeadPanel"]={varname="EnoughHeadPanel"},
    ["RightHeadPanel"] = {varname="UnEnoughHeadPanel"},
}

M.CELL_WIDTH = 100
M.CELL_HEIGHT = 117
M.OTHER_SCALE = 0.64
M.RANDOM_COEFFICIENT = 1/3

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)
    self.mCountTime = 0
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.MiniItem))
    self.PanelSize = self.EnoughHeadPanel:getContentSize()

    self.EnoughHeadPanel:setTouchEnabled(false)
    self.UnEnoughHeadPanel:setTouchEnabled(false)
end

function M:onEnter()
    M.super.onEnter(self)
end

--返回本人的竞猜结果myResult（为了判断播放的音效）
function M:setData(isEnoughWin,prizeInfoList,multiple,hasBetResult)
    self.EnoughHeadPanel:removeAllChildren()
    self.UnEnoughHeadPanel:removeAllChildren()

    local myResult = 0--0本人没押注，1竞猜取消，2盈利，3损失

    local winlist,loselist = {},{}
    --头像初始化
    for _,v in ipairs(prizeInfoList) do
        if v.betGold ~= 0 then
            local head = UIGuessingResultHeadCell.new() --生成头像,设置数据、坐标
            head:resetCenterPosition()
            if head:initData(v.uid,v.avatar,v.goldChangeBeforeTax) then
                if head:isMe() then
                    --设置本人头像层级高于其他头像
                    head:setLocalZOrder(2)
                    if v.goldChangeBeforeTax == 0 then
                        myResult=1
                        self.ReturnGoldNum:setTextColor(cc.c3b(252,255,0))
                        self.ReturnGoldNum:setString("+"..Utils.getFormatNumber_MuitiLanguage(v.betGold))
                    elseif v.goldChangeBeforeTax > 0 then
                        myResult=2
                        self.ReturnGoldNum:setTextColor(cc.c3b(252,255,0))
                        self.ReturnGoldNum:setString("+"..Utils.getFormatNumber_MuitiLanguage(v.goldChangeBeforeTax))
                    else
                        myResult=3
                        self.ReturnGoldNum:setTextColor(cc.c3b(255,255,255))
                        self.ReturnGoldNum:setString("-"..Utils.getFormatNumber_MuitiLanguage(-v.goldChangeBeforeTax))
                    end
                else
                    --其他头像缩放
                    head:setScale(M.OTHER_SCALE)
                    head:setLocalZOrder(1)
                end

                if v.believeEnough then--确定头像放置区域
                    self.EnoughHeadPanel:addChild(head)
                else
                    self.UnEnoughHeadPanel:addChild(head)
                end

                if v.goldChangeBeforeTax > 0 then
                    table.insert(winlist,head)
                elseif v.goldChangeBeforeTax < 0 then
                    table.insert(loselist,head)
                end
            end
        end
    end

    --头像坐标设置及确定所有头像所在区域划定
    local function setHeadPosition(headpanel)
        local HeadList = headpanel:getChildren()
        local HeadAxisList,maxOrder = self:GetAllHeadAxisAndMaxOrder(#HeadList)
        local gridSize = cc.size((self.PanelSize.width-M.CELL_WIDTH*M.OTHER_SCALE)/5,(self.PanelSize.height-M.CELL_HEIGHT*M.OTHER_SCALE)/5)--每个单元格的尺寸
        local leftTopPos = cc.p(self.PanelSize.width/2-maxOrder*gridSize.width/2,self.PanelSize.height/2+maxOrder*gridSize.height/2)--头像分布格子区域的左上角坐标
        local HeadFeild ={minx=0,maxx=0,miny=0,maxy=0}--所有头像的区域范围
        local idx=0
        for _,v in pairs(HeadList)do
            idx = idx + 1
            local axisInfo--[行，列]
            if v:isMe() then
                axisInfo = table.remove(HeadAxisList,1)
            else
                axisInfo = table.remove(HeadAxisList,#HeadAxisList)
            end
            
            local _scale = v:getScale()
            local _dx = math.random(-1,1)*M.RANDOM_COEFFICIENT
            local _dy = math.random(-1,1)*M.RANDOM_COEFFICIENT
            local pos = cc.p(leftTopPos.x+(_dx+axisInfo[2]-1/2)*gridSize.width,leftTopPos.y-(_dy+axisInfo[1]-1/2)*gridSize.height)--宽、高对应列、行
            pos.x = pos.x+(_scale-1)*M.CELL_WIDTH/2--头像缩放后的坐标位置会有偏移，需纠正
            pos.y = pos.y+(_scale-1)*M.CELL_HEIGHT/2
            v:setPosition(pos)
            
            local headpos = self:convertToNodeSpace(v:getHeadWorldPosition())
            local minx = headpos.x - M.CELL_WIDTH*_scale/2
            local maxx = headpos.x + M.CELL_WIDTH*_scale/2
            local miny= headpos.y - M.CELL_HEIGHT*_scale/2
            local maxy= headpos.y + M.CELL_HEIGHT*_scale/2
            if idx == 1 then
                HeadFeild.minx = minx
                HeadFeild.maxx = maxx
                HeadFeild.miny = miny
                HeadFeild.maxy = maxy
            else
                HeadFeild.minx = minx < HeadFeild.minx and minx or HeadFeild.minx
                HeadFeild.maxx = maxx > HeadFeild.maxx and maxx or HeadFeild.maxx
                HeadFeild.miny = miny < HeadFeild.miny and miny or HeadFeild.miny
                HeadFeild.maxy = maxy > HeadFeild.maxy and maxy or HeadFeild.maxy
            end
        end

        return HeadFeild
    end

    local enoughHeadFeild = setHeadPosition(self.EnoughHeadPanel)
    local unenoughHeadFeild = setHeadPosition(self.UnEnoughHeadPanel)

    self.GuessWrongImage:setVisible(hasBetResult and myResult==3)
    self.BingoImage:setVisible(hasBetResult and myResult==2)
    self.CancelImage:setVisible(not hasBetResult and myResult~=0)
    self.ResultImage:setVisible(myResult==0)
    self.ReturnBg:setVisible(myResult~=0)

    self.EnoughWinNode:setVisible(isEnoughWin)
    self.UnEnoughWinNode:setVisible(not isEnoughWin)
    if myResult == 2 then
        SoundSystemManager:playSound0012()
    elseif myResult == 3 then
        SoundSystemManager:playSound006()
    -- else
    --     SoundSystemManager:playSound026()
    end
    

    if not hasBetResult then
        self.mCountTime = 2
        return myResult == 2 or myResult == 3
    end
 
    --金币起始、终点区域设置
    local goldFlyStartFeild = {pos=cc.p(0,0),size={width=100,height=100}}--金币起始区域
    local goldFlyEndFeild = {pos=cc.p(0,0),size={width=100,height=100}}--金币终点区域

    if isEnoughWin then
        goldFlyStartFeild.pos = cc.p(unenoughHeadFeild.minx,unenoughHeadFeild.miny)
        goldFlyStartFeild.size = cc.size(unenoughHeadFeild.maxx-unenoughHeadFeild.minx,unenoughHeadFeild.maxy-unenoughHeadFeild.miny)
        goldFlyEndFeild.pos = cc.p(enoughHeadFeild.minx,enoughHeadFeild.miny)
        goldFlyEndFeild.size = cc.size(enoughHeadFeild.maxx-enoughHeadFeild.minx,enoughHeadFeild.maxy-enoughHeadFeild.miny)
    else
        goldFlyEndFeild.pos = cc.p(unenoughHeadFeild.minx,unenoughHeadFeild.miny)
        goldFlyEndFeild.size = cc.size(unenoughHeadFeild.maxx-unenoughHeadFeild.minx,unenoughHeadFeild.maxy-unenoughHeadFeild.miny)
        goldFlyStartFeild.pos = cc.p(enoughHeadFeild.minx,enoughHeadFeild.miny)
        goldFlyStartFeild.size = cc.size(enoughHeadFeild.maxx-enoughHeadFeild.minx,enoughHeadFeild.maxy-enoughHeadFeild.miny)
    end

    --金币动画相关参数设置
    self.mCountTime = 4
    local flyIconId = GSystem.ResultShowItmeId
    local num = 1--根据multiple确定每个赢的头像飞入的金币数
    local FlyGoldSpeed = 1750--飞行速度
    local FlyGoldDelay = 0.45--第一个金币和最后一个金币飞行间隔
    local FlyGoldCreateFadeIn = 0.2--淡入时间
    local FlyGoldCreatedDelay = 0.3--初始飞行delay
    local goldchgtime= GSystem.RollWordExtraTime or 0.5--金币数额变动动画时间
    local flygoldconfig =DataManager:getTbxData("FlyGold","FlyGoldType",3)
    for _,v in ipairs(flygoldconfig) do
        if v.FlyGoldValue == multiple then
            num = v.FlyGoldNum
            FlyGoldSpeed = v.FlyGoldSpeed
            FlyGoldDelay = v.FlyGoldInterval/1000
            FlyGoldCreateFadeIn = v.GoldCreateFadeIn/1000
            FlyGoldCreatedDelay = v.GoldCreatedDelay/1000
            goldchgtime = goldchgtime + v.FlyGoldInterval/1000
        end
    end
    local winnum = #winlist
    local losenum = #loselist

    local totalnum = num*losenum--金币总数量
    if GSystem.FlyGoldUpperLimit then
        totalnum = totalnum > GSystem.FlyGoldUpperLimit and GSystem.FlyGoldUpperLimit or totalnum
    end

    -- local flyGoldList = {}
    for i=1,totalnum do
        local flyIcon = DataManager:getTbxData("Item",flyIconId).MiniItemIcon
        local goldsprite = cc.Sprite:createWithSpriteFrameName(Utils.getIconStr(PlistConfig.Icon.MiniItem,flyIcon))
        if goldsprite then
            self:addChild(goldsprite)
            local goldStartPosList = Utils.getRandomFeildPosList(goldFlyStartFeild.size,{goldsprite},true)
            local goldEndPosList = Utils.getRandomFeildPosList(goldFlyEndFeild.size,{goldsprite},true)
            local startpos = cc.p(goldStartPosList[1].x+goldFlyStartFeild.pos.x,goldStartPosList[1].y+goldFlyStartFeild.pos.y)--起点坐标
            local endpos = cc.p(goldEndPosList[1].x+goldFlyEndFeild.pos.x,goldEndPosList[1].y+goldFlyEndFeild.pos.y)--终点坐标
            local flytime = cc.pGetDistance(startpos,endpos)/FlyGoldSpeed--金币移动所需时间
            local _delaytime = 0
            if i==totalnum then
                _delaytime = FlyGoldDelay
            elseif i>1 then
                _delaytime = math.random()*FlyGoldDelay
            end
            goldsprite:setPosition(startpos)
            goldsprite:setVisible(false)
            goldsprite:setOpacity(0)
            -- table.insert(flyGoldList,goldsprite)
            goldsprite:runAction(cc.Sequence:create(cc.DelayTime:create(0.5)--所有金币在界面打开0.5s后在出现
                ,cc.CallFunc:create(function ()
                    goldsprite:setVisible(true)
                end)
                ,cc.FadeIn:create(FlyGoldCreateFadeIn)
                ,cc.DelayTime:create(_delaytime+FlyGoldCreatedDelay)
                ,cc.CallFunc:create(function()
                    SoundSystemManager:playSound005()
                end)
                ,cc.MoveTo:create(flytime,endpos)
                ,cc.CallFunc:create(function()
                    if i==1 then
                        for j=1,winnum do
                            winlist[j]:showGoldNumAni(goldchgtime)
                        end
                    end
                end)
                ,cc.ScaleTo:create(0.05,1.2)
                ,cc.ScaleTo:create(0.05,1)
                ,cc.FadeOut:create(FlyGoldCreateFadeIn)
                ,cc.CallFunc:create(function()
                    goldsprite:removeFromParent()
                end)
            ))
        end
    end

    return myResult == 2 or myResult == 3
end

--|——|——|——|——|——|
--|——|——|——|——|——|
--|——|——|——|——|——|
--|——|——|——|——|——|
--|——|——|——|——|——|
--|——|——|——|——|——|
--所有头像满足分布于一个行列数相同的矩阵内，计算所有头像在矩阵内的位置及矩阵的行数
function M:GetAllHeadAxisAndMaxOrder(num)
    --获得order阶矩阵外环元素下标列表
    local function getCircleListByOrder(order,startAxisx,startAxisy)
        if order == 1 then
            return {{startAxisx,startAxisy}}
        end
        local retlist = {}
        local innerOrder = order-2 > 0 and order-2 or 0
        local outNum = order^2-innerOrder^2
        for i=1,outNum do
            local axisx,axisy
            if i<=order-1 then--最上一行
                axisx=1
                axisy=i
            elseif i<=2*order-2 then--最右一列
                axisx=i-order+1
                axisy=order
            elseif i<=3*order-3 then--最下一行
                axisx=order
                axisy=3*order-1-i
            else--最左一列
                axisx=4*order-2-i
                axisy=1
            end

            table.insert(retlist,{axisx+startAxisx-1,axisy+startAxisy-1})
        end

        return retlist
    end

    local layerlist = {}--头像分布层级列表
    local axislist = {}--头像具体坐标列表
    local maxOrder = math.ceil(math.sqrt(num))
    maxOrder = maxOrder > 5 and 5 or maxOrder --最多5阶
    local circlenum = math.ceil(maxOrder/2)--每层的环数

    local templist = {}
    for j=1,circlenum do
        local _order = maxOrder-(circlenum-j)*2
        local startAxisx = circlenum-j+1
        local startAxisy = startAxisx
        local circlelist = getCircleListByOrder(_order,startAxisx,startAxisy)
        table.insert(templist,circlelist)
    end
    table.insert(layerlist,templist)--先放第一层

    local layernum = math.ceil(num/25)--每25个放一层

    if layernum>1 then--后续层直接拷贝第一层的数据
        for i=2,layernum do
            if i==layernum then--最后一层根据具体数量选择性拷贝
                local tempnum = num%25
                local _list = {}
                for j=1,circlenum do
                    table.insert(_list,clone(templist[j]))
                    tempnum = tempnum - #templist[j]
                    if tempnum<=0 then
                        table.insert(layerlist,_list)--格数足够则停止拷贝
                        break
                    end
                end
            else
                table.insert(layerlist,clone(templist))--最后一层前的数据直接复用
            end
        end
    end

    for i=1,#layerlist do --确定每个头像的位置
        for j=1,#layerlist[i] do
            local circlelist = layerlist[i][j]
            local _circlenum = #circlelist
            if i==#layerlist and j==#layerlist[i] then
                local residualnum = num-#axislist--最后一环的头像数量
                local randomStartIdx = math.random(_circlenum)
                for k=1,residualnum do
                    local checkidx = (randomStartIdx+math.ceil(_circlenum*(k-1)/residualnum))%_circlenum+1--最后一环的头像要疏松随机排列
                    table.insert(axislist,circlelist[checkidx])
                end
            else
                for k=1,_circlenum do
                    table.insert(axislist,circlelist[k])
                end
            end
        end
    end

    return axislist,maxOrder
end

function M:OnUpdate(dt)
    if self.mCountTime<=0 then
        self:closePanel()
    end

    self.mCountTime=self.mCountTime-dt
end

return M