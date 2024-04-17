local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIGuessingLayer", UIPanel)

local UIGuessingHeadCell = require("app.gui.game.UIGuessingHeadCell")

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_GuessingLayer.lua"
M.SCALE = 0.64
M.SCAELTIME=0.3

M.BINDGUIDATANODE = {
    ["TimeText_TT"]={varname="TimeNum"},
    ["EnoughChoosedImage_0"] = {varname = "EnoughChoosedImage"},
    ["NotEnoughChoosedImage"] = {varname = "NotEnoughChoosedImage"},
    ["EnoughButton"]={varname="EnoughButton",onClick="onClickEnough"},
    ["NotEnoughButton"]={varname="NotEnoughButton",onClick="onClickNotEnough"},
    ["EnoughText_TT"]={varname="EnoughText"},
    ["NotEnoughText_TT"]={varname="NotEnoughText"},
    ["GuessingNum"]={varname="GuessingNum"},
    ["GuessingIcon_1"]={varname="GuessingIcon_1"},
    ["TipNum"]={varname="TipNum"},
    ["TipNum_1"]={varname="TipNum_1"},
    ["TipBg"]={varname="TipBg"},
    ["TipBg_1"]={varname="TipBg_1"},
    ["StakeText_1_TT"]={varname="StakeText"},
    ["GuessingHeadPanel"]={varname = "GuessingHeadPanel"},

    ["LeftHeadFrame"]={varname = "LeftHeadFrame"},
    ["LeftHeadIcon"]={varname = "LeftHeadIcon"},
    ["RightHeadFrame"]={varname = "RightHeadFrame"},
    ["RightHeadIcon"]={varname = "RightHeadIcon"},
    ["VerticesImage"]={varname="VerticesImage"},
    ["LeftHeadPanel"]={varname="LeftHeadPanel",onClick="onClickEvent"},
    ["RightHeadPanel"]={varname="RightHeadPanel",onClick="onClickEvent"},
    ["VerticesNum"]={varname="VerticesNum"},

    ["Middle"]={varname="Middle"},
    ["ShrinkInterfacePanel"]={varname="ShrinkInterfacePanel",onEvent="onShrinkInterfacePanelTouchEvent"},
}

function M:onClickEvent(ref)
    local name=ref:getName()
    SoundSystemManager:playSound004()
    if "LeftHeadPanel"==name then
        if self.leftFriendInfo:getFriendUid() == g_UserData:getUserId() then
            local panel = UIManager:getOrCreatePanel("UIPersonalInfoLayer")
            if panel then
                panel:showToScene()
            end
        else
            local panel = UIManager:getOrCreatePanel("UIOtherPersonInfoLayer")
            if panel then 
                panel:setFriendInfo(self.leftFriendInfo)
                panel:showToScene()
            end
        end
    elseif "RightHeadPanel"==name then
        if self.rightFriendInfo:getFriendUid() == g_UserData:getUserId() then
            local panel = UIManager:getOrCreatePanel("UIPersonalInfoLayer")
            if panel then
                panel:showToScene()
            end
        else
            local panel = UIManager:getOrCreatePanel("UIOtherPersonInfoLayer")
            if panel then 
                panel:setFriendInfo(self.rightFriendInfo)
                panel:showToScene()
            end
        end
    end
end

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)
    self.GuessingNum:setVisible(false)
    self.GuessingIcon_1:setVisible(false)
    self.TipNum:setString(tostring(0))
    self.TipNum_1:setString(tostring(0))

    self.mCountDown = 0
    self.betUserNum = 0
    self.betGold = 0

    self.panelsize = self.GuessingHeadPanel:getContentSize()
    self.mRandomMaxPosX = self.panelsize.width - UIGuessingHeadCell.CELL_WIDTH*M.SCALE
    self.mRandomMaxPosY = self.panelsize.height - UIGuessingHeadCell.CELL_HEIGHT*M.SCALE
end

function M:refreshLanguageHandle()
    --self.mVerticesText = self.VerticesText:getString()
    self.mStakeText = self.StakeText:getString()
    self.mTimeNum = self.TimeNum:getString()

    if self.betGold then
        self.StakeText:setString(Utils.getFormatString(self.mStakeText, tostring(self.betGold)))
    end
    
    if self.mCountDown then
        self.TimeNum:setString(Utils.getFormatString(self.mTimeNum, tostring(math.floor(self.mCountDown))))
    end
end

function M:onEnter()
    M.super.onEnter(self)

    if self.bIsNarrow then
        self._rootNode:setPosition(self.MovePos)
        self._rootNode:setScale(0)
        self.Middle:setOpacity(0)
        self.m_layerColor:setVisible(false)
        self.m_layerColor:setOpacity(0)
    else
        local size = cc.Director:getInstance():getWinSize()
        self._rootNode:setPosition(cc.p(size.width / 2, size.height / 2))
        self._rootNode:setScale(1)
        self.Middle:setOpacity(255)
        self.m_layerColor:setVisible(true)
        self.m_layerColor:setOpacity(255)
    end
    

    local openInfo = g_GameData:getOpenDiceBoxInfo()

    local players = g_GameData:getGamePlayers()
    local openplayer = players[openInfo.openSeatId]
    local callplayer = players[openInfo.callSeatId]

    if callplayer then
        self.LeftHeadIcon:removeAllChildren()
        local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
        avater:InitTexture(string.utf8len(callplayer:getUserInfo():getHead())<7,callplayer:getUserInfo():getHead(),callplayer:getUserInfo():getUserId())
        self.LeftHeadIcon:addChild(avater)
        self.LeftHeadFrame:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(callplayer:getUserInfo():getHeadBox())), ccui.TextureResType.plistType)

        local friendData={}
        friendData.uid = callplayer:getUserInfo():getUserId()
        friendData.nickname = callplayer:getUserInfo():getNickName()
        friendData.sex = callplayer:getUserInfo():getSex()
        friendData.avatar = callplayer:getUserInfo():getHead()
        friendData.vipLevel = callplayer:getUserInfo():getVipLevel()
        friendData.mAvatarFrame = callplayer:getUserInfo():getHeadBox()

        local friendInfo = require("app.bean.FriendInfo").new(friendData)
        self.leftFriendInfo=friendInfo
    end
 
    --callplayer:getUserInfo():getHeadIcon(handler(self,self.refreshLeftHeadIcon))
    
    if openplayer then
        self.RightHeadIcon:removeAllChildren()
        local Rightavater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
        Rightavater:InitTexture(string.utf8len(openplayer:getUserInfo():getHead())<7,openplayer:getUserInfo():getHead(),openplayer:getUserInfo():getUserId())
        self.RightHeadIcon:addChild(Rightavater)
        self.RightHeadFrame:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(openplayer:getUserInfo():getHeadBox())), ccui.TextureResType.plistType)

        local friendData={}
        friendData.uid = openplayer:getUserInfo():getUserId()
        friendData.nickname = openplayer:getUserInfo():getNickName()
        friendData.sex = openplayer:getUserInfo():getSex()
        friendData.avatar = openplayer:getUserInfo():getHead()
        friendData.vipLevel = openplayer:getUserInfo():getVipLevel()
        friendData.mAvatarFrame = openplayer:getUserInfo():getHeadBox()

        local friendInfo = require("app.bean.FriendInfo").new(friendData)
        self.rightFriendInfo=friendInfo
    end
   
    --openplayer:getUserInfo():getHeadIcon(handler(self,self.refreshRightHeadIcon))

   
    local callInfo = g_GameData:getCallInfo()
    self:setCallNumAndPoint(callInfo.num, callInfo.point)

    self:setMultiple(openInfo.multiple)

    self.EnoughText:setTextColor({r = 0, g = 0, b = 0})
    self.EnoughText:setOpacity(255)
    self.NotEnoughText:setTextColor({r = 0, g = 0, b = 0})
    self.NotEnoughText:setOpacity(255)
    self.EnoughButton:setTouchEnabled(true)
    self.EnoughButton:setBright(true)
    self.EnoughButton:setVisible(true)
    self.NotEnoughButton:setTouchEnabled(true)
    self.NotEnoughButton:setBright(true)
    self.NotEnoughButton:setVisible(true)
    self.TipBg:setVisible(false)
    self.TipBg_1:setVisible(false)
end

-- function M:refreshLeftHeadIcon(path,iconType)
--     local avater = self.LeftHeadIcon:getChildByTag(10001)
--     if avater then
--         avater:loadTexture(path,iconType)
--     end
-- end

-- function M:refreshRightHeadIcon(path,iconType)
--     local avater = self.RightHeadIcon:getChildByTag(10001)
--     if avater then
--         avater:loadTexture(path,iconType)
--     end
-- end

function M:onInit()
    M.super.onInit(self)
    -- self.GuessingNum:setString(tostring(0))
    self.GuessingNum:setVisible(false)
    self.GuessingIcon_1:setVisible(false)
    self.TipNum:setString(tostring(0))
    self.TipNum_1:setString(tostring(0))
    self:initHeadPanel()
end

function M:initHeadPanel()
    self.GuessingHeadPanel:removeAllChildren()
    self.betUserNum = 0

    local betUserList = g_GameData:getBetUserList()
    if betUserList then
        for _,v in ipairs(betUserList) do
            if self.betUserNum >= 9 then
                break
            end
            self:insertHeadInPanel(v)
        end

        self:setAllHeadCellPos()
    end
end

--插入头像
function M:insertHeadInPanel(betuserinfo)
    local HeadCell = UIGuessingHeadCell.new()
    HeadCell:setHeadScale(M.SCALE)
    HeadCell:resetCenterPosition()
    if HeadCell:initData(betuserinfo) then
        self.betUserNum = self.betUserNum+1
        HeadCell:setTag(self.betUserNum)
        self.GuessingHeadPanel:addChild(HeadCell)
    end
end

function M:setAllHeadCellPos()
    local allchailds = self.GuessingHeadPanel:getChildren()
    for _, v in ipairs(allchailds) do
        local tag = v:getTag()
        local x = math.floor(tag/2)*((-1)^tag)-((self.betUserNum+1)%2)*0.5
        local dx = self.panelsize.width/2 + x*(self.panelsize.width/9)
        local dy = UIGuessingHeadCell.CELL_HEIGHT/2+(self.panelsize.width/9)*(1/36)*x^2
        v:setPosition(cc.p(dx,dy))
    end
end

function M:setBackTime(time)
    self.mCountDown = time/1000
end

function M:setCallNumAndPoint(num,point)
    self.VerticesNum:setString(tostring(num))
    --self.VerticesText:setString(Utils.getFormatString(self.mVerticesText, tostring(num)))
    self.VerticesImage:loadTexture("00_01_Common/2D_Small_" .. point ..".png", ccui.TextureResType.plistType)
end

function M:setMultiple(multiple)
    self.betGold = multiple*g_GameData:getBetBase()
    local goldText = Utils.getFormatString(self.mStakeText, Utils.getFormatNumber_MuitiLanguage(self.betGold))
    self.StakeText:setString(goldText)
end

function M:setHandleCallback(callFunc)
    self.mCallFunc = callFunc
end

function M:OnUpdate(dt)
    self.mCountDown = self.mCountDown - dt

    self.TimeNum:setString(Utils.getFormatString(self.mTimeNum, tostring(math.floor(self.mCountDown))))
    if self.mCountDown<=0 then
        self.mCloseCallBackFunc(false,false)
        self:closePanel()
    end
end

function M:onClickEnough(ref)
    g_GameData:C2S_ExtraCompareChoose(true)
    self.mCallFunc(false)
end

function M:onClickNotEnough(ref)
    g_GameData:C2S_ExtraCompareChoose(false)
    self.mCallFunc(false)
    -- self:closePanel()
end

function M:onGameUpdateComparePool(data)
    self.GuessingNum:setVisible(true)
    self.GuessingIcon_1:setVisible(true)
    self.GuessingNum:setString(Utils.getFormatNumber_MuitiLanguage(tostring(data.goldNum)))

    if not data.isbet and self.betUserNum < 9 then
        --SoundSystemManager:playSound003()
        g_GameData:guessingSound(data.currentBetUser.sex)
        self:insertHeadInPanel(data.currentBetUser)
        self:setAllHeadCellPos()
    end
end

function M:GameExtraCallback(data)
    self.TipNum:setString(tostring(data.believeEnoughGold))
    self.TipNum_1:setString(tostring(data.believeNotEnoughGold))
    if data.believeEnoughGold>0 then
        self.NotEnoughText:setTextColor({r = 68, g = 68, b = 68})
        self.NotEnoughText:setOpacity(255*0.8)
        self.TipBg:setVisible(true)
        self.NotEnoughButton:setTouchEnabled(false)
        self.NotEnoughButton:setBright(false)
        self.EnoughButton:setVisible(false)
        -- self.EnoughButton:loadTexturePressed("ui/02_01_Boast/button_013.png")
    else
        self.EnoughText:setOpacity(255*0.8)
        self.NotEnoughText:setTextColor({r = 68, g = 68, b = 68})
        self.TipBg_1:setVisible(true)
        self.EnoughButton:setTouchEnabled(false)
        self.EnoughButton:setBright(false)
        self.NotEnoughButton:setVisible(false)
        --self.NotEnoughButton:loadTexturePressed("ui/02_01_Boast/button_013.png")
    end
end

function M:updateTime(time)
    self.mCountDown = self.mCountDown - time
end

function M:setCloseCallBack(worldpos,callfunc)
    self.MovePos = self:convertToNodeSpace(worldpos)
    self.mCloseCallBackFunc = callfunc
end

function M:onShrinkInterfacePanelTouchEvent(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        --self.m_layerColor:setVisible(false)
        self._rootNode:runAction(
            cc.Sequence:create(
                cc.Spawn:create(cc.MoveTo:create(M.SCAELTIME, self.MovePos),cc.ScaleTo:create(M.SCAELTIME,0)),
                cc.CallFunc:create(
                    function()
                        if UIManager:isPanelOpenOrOpening("UIGuessingLayer") then
                            self.mCloseCallBackFunc(true,true)
                        end
                    end
                )
            )
        )
        self.Middle:runAction(cc.FadeOut:create(M.SCAELTIME))
        self.m_layerColor:runAction(
            cc.Sequence:create(
                cc.FadeOut:create(M.SCAELTIME),
                cc.CallFunc:create(
                    function()
                        self.m_layerColor:setVisible(false)
                    end
                )
            )
        )
    end
end

function M:reShowAllNode()
    local size = cc.Director:getInstance():getWinSize()
    self._rootNode:runAction(
        cc.Sequence:create(
            cc.Spawn:create(cc.MoveTo:create(M.SCAELTIME, cc.p(size.width / 2, size.height / 2)),cc.ScaleTo:create(M.SCAELTIME,1))
        )
    )
    self.Middle:runAction(cc.FadeIn:create(M.SCAELTIME))
    self.m_layerColor:setVisible(true)
    self.m_layerColor:runAction(cc.FadeIn:create(M.SCAELTIME))
end

function M:setIsNarrowAllNode(narrow)
    self.bIsNarrow = narrow
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.GameUpdateComparePool, "onGameUpdateComparePool")
    self:doRegEvent(Constant.CustomEvent.GameExtraCallback,"GameExtraCallback")
end

return M