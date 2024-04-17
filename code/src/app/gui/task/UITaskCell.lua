local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UITaskCell", UIPanel)

M.ITEM_COLUMN = 1

M.CELL_WIDTH = 610
M.CELL_HEIGHT = 160

M.GUI_FILE_NAME = "csd.01_04_Task.01_04_TaskCell.lua"

M.BINDGUIDATANODE = {
    ["TaskText"] = { varname = "taskNameText" },

    ["TaskLoadingBar"] = { varname = "TaskLoadingBar" },
    ["TaskLoadingNum"] = { varname = "TaskLoadingNum" },
    ["TaskLoadingText_TT"] = { varname = "TaskLoadingText" },

    ["ActivityIcon"] = { varname = "ActivityIcon" },

    ["Reward"] = { varname = "Reward" },
    ["Reward_1"] = { varname = "Reward_1" },
    ["Reward_2"] = { varname = "Reward_2" },
    ["RewardNode_1"] = { varname = "RewardNode_1" },
    ["RewardNode_2"] = { varname = "RewardNode_2" },
    ["RewardNum_1"] = { varname = "RewardNum_1" },
    ["RewardNum_2"] = { varname = "RewardNum_2" },

    ["Start"] = { varname = "Start" },
    ["Receive"] = { varname = "Receive" },
    ["Received"] = { varname = "Received" },

    ["StartButton"] = { varname = "StartButton", onClick = "onGotoBtnClick" },
    ["ReceiveButton"] = { varname = "ReceiveButton", onClick = "onReciveBtnClick" },

    ["TaskPanel"] = { varname = "TaskPanel" },
}

function M:onCreate()
    M.super.onCreate(self)

    self:resetRootNodePosition(cc.p(0, 0))
    self:resetRootNodeAnchorPoint(cc.p(0, 0))

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.MiniItem))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.TaskIcon))

    self.TaskPanel:setSwallowTouches(false)

    self.mAllNodes = {
        self.Start,
        self.Receive,
        self.Received,
    }
end

function M:onlyShowNode(showNode)
    for _ , v in pairs(self.mAllNodes) do 
        if showNode == v then 
            v:setVisible(true)
        else
            v:setVisible(false)
        end
    end
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:refreshData(data, idx)
    local task = data[idx + 1]
    self.mTaskInfo = require("app.bean.TaskInfo").new(task)

    if not self.mTaskInfo then return end

    local taskData = DataManager:getTbxData("Task", self.mTaskInfo:getTaskId())
    if taskData then 
        --showName
        self:showTaskName(taskData)
        --奖励展示
        self:showTaskReward(taskData)
        --完成度
        local showNode = nil
        self.TaskPanel:setVisible(false)
        if self.mTaskInfo:getIsReceived() then 
            showNode = self.Received
            self.TaskPanel:setVisible(true)
            self.TaskLoadingNum:setVisible(false)
            self.TaskLoadingText:setVisible(true)
            self.TaskLoadingBar:setPercent(100)
        else
            local cmpNowArray = self.mTaskInfo:getTaskCmpNow()
            local cmpTotalArray = self.mTaskInfo:getTaskCmpTotal()
            if self.mTaskInfo:getTaskFinished() then
                showNode = self.Receive
                self.TaskLoadingNum:setVisible(false)
                self.TaskLoadingText:setVisible(true)
                self.TaskLoadingBar:setPercent(100)
            else
                showNode = self.Start
                self.TaskLoadingNum:setVisible(true)
                local cmpNow = cmpNowArray[1] or 0
                local cmpTotal = cmpTotalArray[1] or 0
                percent = (cmpNow / cmpTotal) * 100
                if percent >= 100 then 
                    percent = 100
                end
                self.TaskLoadingBar:setPercent(percent)
                self.TaskLoadingNum:setString(tostring(cmpNow).."/"..tostring(cmpTotal))
                self.TaskLoadingText:setVisible(false)
            end
        end
        self:onlyShowNode(showNode)
        if taskData.UISkipType == Enum.UISkipType.Unknow then 
            self.Start:setVisible(false)
        end
    else
        Log.log("number %d Task TbxData not found", self.mTaskInfo:getTaskId())
    end
end

function M:showTaskName(taskData)
    local showName = ""
    local showNameValueArray = taskData.ShowNameValueArray
    if Utils.isEmptyTable(showNameValueArray) then 
        showName = taskData.ShowName
    else
        local len = table.getn(showNameValueArray)
        local str = tostring(showNameValueArray[1])
        for i = 1 + 1, len do
            str = str..";"..tostring(showNameValueArray[i])
        end
        showName = Utils.getFormatString(taskData.ShowName, str)
    end
    self.taskNameText:setString(showName)
end

function M:showTaskReward(taskData)
    self.Reward:setVisible(true)
    local reward = taskData.RewardInfo
    if not Utils.isEmptyTable(reward) then 
        --重置所有为显示
        for i = 1, 2 do 
            local str = string.format("Reward_%d", i)
            self[str]:setVisible(true)
        end

        --更换奖励活跃点，并移除
        for _,v in ipairs(reward) do 
            local itemType = v[1]
            if itemType == Enum.ItemShowType.WeeklyActivity then 
                table.removebyvalue(reward, v)        
            end
        end

        local icon = tonumber(taskData.TaskIcon)
        self.ActivityIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.TaskIcon, icon), ccui.TextureResType.plistType)

        for i,v in ipairs(reward) do 
            if i <= 2 then 
                local itemType = v[1]
                local itemId = 0
                local text = string.format("RewardNum_%d", i)
                if itemType == Enum.ItemShowType.Diamond then
                    self[text]:setString(Utils.getFormatNumber_MuitiLanguage(tostring(v[2][1])))
                    itemId = GSystem.DiamondItemId
                elseif itemType == Enum.ItemShowType.Gold then
                    self[text]:setString(Utils.getFormatNumber_MuitiLanguage(tostring(v[2][1])))
                    itemId = GSystem.GoldItemId
                elseif itemType == Enum.ItemShowType.Material then
                    self[text]:setString(Utils.getFormatNumber_MuitiLanguage(tostring(v[2][2])))
                    itemId = v[2][1]
                end
                local node = string.format("RewardNode_%d", i)
                local itemData = DataManager:getTbxData("Item", itemId)
                if itemData then 
                    local sprite = cc.Sprite:createWithSpriteFrameName(Utils.getIconStr(PlistConfig.Icon.MiniItem, itemData.MiniItemIcon))
                    self[node]:addChild(sprite)
                end
            end
        end

        local len = table.getn(reward) 
        if len == 1 then 
            self.Reward_2:setVisible(false)
        end
    else
        self.Reward:setVisible(false)
    end
end

--前往
function M:onGotoBtnClick(ref)
    if not self.mTaskInfo then
        Log.log("TaskInfo is Null")
        return 
    end
    local taskData = DataManager:getTbxData("Task", self.mTaskInfo:getTaskId())
    if taskData then
        DataManager:dispatchMessage(Constant.CustomEvent.RunSkipEvent, taskData.UISkipType)
    else
        Log.log("TaskData is Null")
    end
end

--领取
function M:onReciveBtnClick(ref)
    g_TaskData:requestReciveTask(self.mTaskInfo:getTaskId())
end

function M:onCleanup()
    M.super.onCleanup(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
end

return M