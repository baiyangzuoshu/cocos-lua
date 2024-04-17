local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("InvitationTaskCell", UIPanel)

M.GUI_FILE_NAME = "csd.03_04_Invitation.03_04_InvitationTaskCell.lua"

M.BINDGUIDATANODE = {
    ["RewardIcon"]={varname="RewardIcon"},
    ["TaskLoadingBar"]={varname="TaskLoadingBar"},
    ["TaskNum"]={varname="TaskNum"},
    ["RewardText"]={varname="RewardText"},
    ["Click"]={varname="Click"},
    ["Register"]={varname="Register"},
    ["Recharge"]={varname="Recharge"},
    ["TaskPanel"]={varname = "TaskPanel", onClick = "onClickEvent"},
    ["TaskAnimation"]={varname="TaskAnimation"},
    ["RewardPanel"] = {varname = "RewardPanel", onEvent = "OnTouchTaskCellEvent"},
}

function M:onClickEvent()
    if self.TaskAnimation:isVisible() then
        SoundSystemManager:playSound004()
        g_TaskData:requestReciveTask(self.taskId)
        if 4001==self.taskId then
            g_HotData:C2S_removeRedPoint(Enum.redPointSubcategory.inviteClickNumButton)
        elseif 4002==self.taskId then
            g_HotData:C2S_removeRedPoint(Enum.redPointSubcategory.inviteRegisterNumButton)
        elseif 4003==self.taskId then
            g_HotData:C2S_removeRedPoint(Enum.redPointSubcategory.inviteChargeNumButton)
        end
    end
end

function M:OnTouchTaskCellEvent(data)
    if data.event == "end" then
        if self.TaskAnimation:isVisible() then
            return
        end
        SoundSystemManager:playSound004()
        local taskData = DataManager:getTbxData("Task", self.taskId)
        if taskData then 
            local rewardInfo = taskData.RewardInfo
            local netData = {}
            netData.itemType = rewardInfo[1][1]
            netData.itemNum = rewardInfo[1][2][1]
            if netData.itemType == Enum.ItemShowType.Diamond then
                netData.itemId = GSystem.DiamondItemId
            elseif netData.itemType == Enum.ItemShowType.Gold then
                netData.itemId = GSystem.GoldItemId
            end
            local itemInfo = require("app.bean.ItemInfo").new(netData, netData.itemType)
            local itemTips = UIManager:getOrCreatePanel("UIPackageShowItemTips")
            if itemTips then 
                itemTips:setItemInfo(itemInfo)
                itemTips:showToScene()
            end
        else
            Log.log("TaskData is not found. id : %s", self.taskId)
        end
    end
end

function M:onCreate()
    M.super.onCreate(self)

    local _effect = Utils.onlyCreateEffect(GSystem.InviteLightFrameAnimation,cc.p(0,0),true)
    if _effect then
        self.TaskAnimation:addChild(_effect)
    end

    self.TaskPanel:setSwallowTouches(false)
end

function M:init(taskId)
    self["Click"]:setVisible(4001==taskId)
    self["Register"]:setVisible(4002==taskId)
    self["Recharge"]:setVisible(4003==taskId)

    local diamondId = GSystem.DiamondItemId
    local goldId = GSystem.GoldItemId
    local diamondIcon = DataManager:getTbxData("Item", diamondId).BigItemIcon
    local goldIcon = DataManager:getTbxData("Item", goldId).BigItemIcon

    if 4001==taskId then
        self.RewardIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.BigItem, goldIcon), ccui.TextureResType.plistType)
    elseif 4002==taskId then
        self.RewardIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.BigItem, goldIcon), ccui.TextureResType.plistType)
    elseif 4003==taskId then
        self.RewardIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.BigItem, diamondIcon), ccui.TextureResType.plistType)
    end
end

function M:refreshData(data)
    local   taskId=data["id"]
    local   receivedCount=data["receivedCount"]
    local   cmpNow=data["cmpNow"][1]
    local   taskData = DataManager:getTbxData("Task", taskId)
    local   CompleteServerConditionArray=taskData["CompleteServerConditionArray"][1][2]
    local   RewardInfo=taskData["RewardInfo"]
    self.taskId=taskId

    if 4001==taskId then
        local   time=cmpNow
        local   curTime=time-receivedCount*CompleteServerConditionArray[1]
        local   v=RewardInfo[1][2][1]
        local   max=CompleteServerConditionArray[1]

        self.TaskNum:setString(tostring(curTime)..'/'..max)
        self.TaskLoadingBar:setPercent(curTime/max*100)
        self.RewardText:setString(Utils.getFormatNumber_MuitiLanguage(tostring(v)))

        self.TaskAnimation:setVisible(curTime>=max)
    elseif 4002==taskId then
        local   time=cmpNow
        local   curTime=time-receivedCount*CompleteServerConditionArray[1]
        local   v=RewardInfo[1][2][1]
        local   max=CompleteServerConditionArray[1]

        self.TaskNum:setString(tostring(curTime)..'/'..max)
        self.TaskLoadingBar:setPercent(curTime/max*100)
        self.RewardText:setString(Utils.getFormatNumber_MuitiLanguage(tostring(v)))

        self.TaskAnimation:setVisible(curTime>=max)
    elseif 4003==taskId then
        local   time=cmpNow
        local   curTime=time-receivedCount*CompleteServerConditionArray[1]
        local   v=RewardInfo[1][2][1]
        local   max=CompleteServerConditionArray[1]

        self.TaskNum:setString(tostring(curTime)..'/'..max)
        self.TaskLoadingBar:setPercent(curTime/max*100)
        self.RewardText:setString(Utils.getFormatNumber_MuitiLanguage(tostring(v)))

        self.TaskAnimation:setVisible(curTime>=max)
    end
end

function M:onInit()
    M.super.onInit(self)
end

return M