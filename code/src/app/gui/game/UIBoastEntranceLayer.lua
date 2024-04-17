local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIBoastEntranceLayer", UIPanel)

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_BoastEntranceLayer.lua"

M.BINDGUIDATANODE = {
    ["GradeOnePeopleNum"] = { varname = "GradeOnePeopleNum" },
    ["GradeOnePanel"] = { varname = "GradeOnePanel", onEvent = "onClickJoinRoomPanel" },
    ["GradeTwoPeopleNum"] = { varname = "GradeTwoPeopleNum" },
    ["GradeTwoPanel"] = { varname = "GradeTwoPanel", onEvent = "onClickJoinRoomPanel" },
    ["GradeThreePeopleNum"] = { varname = "GradeThreePeopleNum" },
    ["GradeThreePanel"] = { varname = "GradeThreePanel", onEvent = "onClickJoinRoomPanel" },
    ["PrivateRoomPanel"] = { varname = "PrivateRoomPanel", onEvent = "onClickPrivateRoomPanel" },
    ["GradeOneSpineATNode"] = { varname = "GradeOneSpineATNode" },
    ["GradeTwoSpineATNode"] = { varname = "GradeTwoSpineATNode" },
    ["GradeThreeSpineATNode"] = { varname = "GradeThreeSpineATNode" },
    ["GradeThreeSpineATNode_2"] = { varname = "GradeThreeSpineATNode_2" },
}

function M:onCreate()
    M.super.onCreate(self)

    self:setShadeShowModel(true)
    self.roomCanTouch = false
    self.GradeOnePanel:setTouchEnabled(true)
    self.GradeTwoPanel:setTouchEnabled(true)
    self.GradeThreePanel:setTouchEnabled(true)

    local BragOneInletSpine = Utils.onlyCreateEffect(GSystem.BragOneInletSpine,cc.p(0,0),true)
    -- local BragTwoInletSpine = Utils.onlyCreateEffect(GSystem.BragTwoInletSpine,cc.p(0,0),true)
    local BragThreeInletSpine = Utils.onlyCreateEffect(GSystem.BragThreeInletSpine,cc.p(0,0),true)
    self.GradeOneSpineATNode:addChild(BragOneInletSpine)
    -- self.GradeTwoSpineATNode:addChild(BragTwoInletSpine)
    self.GradeThreeSpineATNode:addChild(BragThreeInletSpine)

end

function M:onInit()
    M.super.onInit(self)
    self.GradeOnePanel.level = 1
    self.GradeTwoPanel.level = 2
    self.GradeThreePanel.level = 3
    self.isclose = false

    self.roomData = DataManager:getTbxData("Room")

    g_GameData:C2S_GetGamingPlayerNum()
    self:refreshGamingPlayerNum(g_GameData:getGamingPlayerNum())
end

function M:onEnter()
    M.super.onEnter(self)

    self:runTimelineAnimation("EnterIntoAnimation",false,function ()
        self:runTimelineAnimation("StandbyAnimation",true)
        self.roomCanTouch = true
        local BragThreeInletTapeSpine_2 = Utils.onlyCreateEffect(GSystem.BragThreeInletTapeSpine_2,cc.p(0,0),true)
        local BragThreeInletTapeSpine_1 = Utils.onlyCreateEffect(GSystem.BragThreeInletTapeSpine_1,cc.p(0,0),false)
        self.GradeThreeSpineATNode_2:addChild(BragThreeInletTapeSpine_1)
        if BragThreeInletTapeSpine_2 then
            BragThreeInletTapeSpine_2:setVisible(false)
        end
        self.GradeThreeSpineATNode_2:addChild(BragThreeInletTapeSpine_2)
        function EndAnimation()
            if BragThreeInletTapeSpine_1 then
                BragThreeInletTapeSpine_1:removeFromParent()
            end
            if BragThreeInletTapeSpine_2 then
                BragThreeInletTapeSpine_2:setVisible(true)
            end
        end
        self:runAction(cc.Sequence:create(cc.DelayTime:create(0.7),cc.CallFunc:create(EndAnimation)))
    end)
end

function M:onCloseEvent()
    if self.isclose or not self.roomCanTouch then
        return
    end
    self.isclose = true
    self._rootNode:stopAction(self._animation)
    self.mHasRunAction = false
    self:runTimelineAnimation("ExitAnimation",false,function ()
        self:closePanel(0)
    end)
end

function M:onClickJoinRoomPanel(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        if not self.roomCanTouch then
            return
        end
        if (data.node.level == 1 and g_UserData:getGold() < self.roomData["1010"].ChipGold) or
           (data.node.level == 2 and g_UserData:getGold() < self.roomData["1020"].ChipGold) or
           (data.node.level == 3 and g_UserData:getGold() < self.roomData["1030"].ChipGold) then
            local panel = UIManager:getOrCreatePanel("app.gui.game.BoastMiniTipPopUp_1")
            if panel then
                panel:showToScene()
            end
            return
        end
        g_GameData:enterChuiNiuRoom(data.node.level)
    end
end

function M:onClickPrivateRoomPanel(data)
    if data.event=="end" then
        SoundSystemManager:playSound004()
        local panel=UIManager:getOrCreatePanel("app.gui.game.private.UIPrivateRoomSetPopUp")
        if panel then
            panel:showToScene()
        end
    end
end

function M:refreshGamingPlayerNum(data)
    if data == nil then
        print("====没获取到场次人数=========")
        return
    end
    self.GradeOnePeopleNum:setString(data.nums[1])
    self.GradeTwoPeopleNum:setString(data.nums[2])
    self.GradeThreePeopleNum:setString(data.nums[3])
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
    self:doRegEvent("refreshGamingPlayerNum", "refreshGamingPlayerNum")
end

return M