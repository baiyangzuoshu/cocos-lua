local M = class("TaskData")

function M:ctor()
    self.m_TaskData = {}
    self.m_taskPlayer={}
end

function M:getTaskData()
    return self.m_TaskData
end

function M:getTaskDataByType(taskType)
    local tasks = {}
    for _,v in ipairs(self.m_TaskData) do 
        if taskType == v.taskType then 
            table.insert(tasks, v)
        end
    end
    return tasks
end

function M:getCmpTotalByTaskId(taskId)
    local cmpTotal = {}
    local taskData = DataManager:getTbxData("Task", taskId)
    if taskData then 
        local cmpTotalArray = taskData.CompleteServerConditionArray
        --dump(cmpTotalArray, "cmpTotalArray", 3)
        if not Utils.isEmptyTable(cmpTotalArray) then 
            for _,v in ipairs(cmpTotalArray) do 
                local ServerConditionType = v[1]
                if ServerConditionType == Enum.ServerConditionType.Done_By_Default then 
                    table.insert(cmpTotal, v[2][1])
                elseif ServerConditionType == Enum.ServerConditionType.Any_GameType_Finish then 
                    table.insert(cmpTotal, v[2][1])
                elseif ServerConditionType == Enum.ServerConditionType.Any_GameType_Win then 
                    table.insert(cmpTotal, v[2][1])
                elseif ServerConditionType == Enum.ServerConditionType.Any_GameType_Lose then 
                    table.insert(cmpTotal, v[2][1])
                elseif ServerConditionType == Enum.ServerConditionType.Specify_GameType_Finish then 
                    table.insert(cmpTotal, v[2][2])
                elseif ServerConditionType == Enum.ServerConditionType.Specify_GameType_Win then 
                    table.insert(cmpTotal, v[2][2])
                elseif ServerConditionType == Enum.ServerConditionType.Specify_GameType_Lose then 
                    table.insert(cmpTotal, v[2][2])
                elseif ServerConditionType == Enum.ServerConditionType.Own_Item_Num then 
                    table.insert(cmpTotal, v[2][2])
                elseif ServerConditionType == Enum.ServerConditionType.Create_User_Days then 
                    table.insert(cmpTotal, v[2][1])
                elseif ServerConditionType == Enum.ServerConditionType.Invite_Valid_Click then 
                    table.insert(cmpTotal, v[2][1])
                elseif ServerConditionType == Enum.ServerConditionType.Invite_Valid_Sign then 
                    table.insert(cmpTotal, v[2][1])
                elseif ServerConditionType == Enum.ServerConditionType.Invite_Get_Commission then 
                    table.insert(cmpTotal, v[2][1])
                elseif ServerConditionType == Enum.ServerConditionType.Consume_Diamonds_Num then 
                    table.insert(cmpTotal, v[2][1])
                elseif ServerConditionType == Enum.ServerConditionType.Any_GameType_Quiz then 
                    table.insert(cmpTotal, v[2][1])
                end
            end
        end
    end
    
    return cmpTotal
end

function M:isTaskFinished(cmpNowArray, cmpTotalArray)
    if not cmpNowArray then 
        cmpNowArray = {}
    end
    local isFinished = false 
    local cmpNow = cmpNowArray[1] or 0 
    local cmpTotal = cmpTotalArray[1] or 0
    percent = (cmpNow / cmpTotal) * 100
    if percent >= 100 then 
        isFinished = true
    end 
    return isFinished
end

function M:createTask(v)
    local task = {}
    task.id = v.id 
    task.receivedCount=v.receivedCount
    task.received = v.received
    task.taskType = v.kind--Newcomer = 1;Day = 2;Week  = 3;Invite = 4;// 邀请 Season = 5;Events = 6; // 活动 7 登录有礼
    task.cmpNow = v.cmpNow or {}
    task.cmpTotal = self:getCmpTotalByTaskId(v.id)
    task.isFinished = self:isTaskFinished(task.cmpNow, task.cmpTotal)
    table.insert(self.m_TaskData, task)
end

function M:getKindPlayer(kind)
    return self.m_taskPlayer[kind]
end

function M:isShowSevenLogin()
    local is=false
    local serverData=g_TaskData:getTaskDataByType(Enum.TaskType.Login)
    for _,v in pairs(serverData) do
        local task=DataManager:getTbxData("Task",v.id)
        local CompleteServerConditionArray=task["CompleteServerConditionArray"]
        local day=CompleteServerConditionArray[1][2][1]
        if not v.received and  day<=v.cmpNow[1] then
            is=true
            break
        end
    end

    DataManager:dispatchMessage(Constant.CustomEvent.UpdateHotShow,{type=Enum.mainHotType.activity,is=is})

    return is
end

function M:isShowMainTaskHot()
    local num=self:getDayRewardNum()+self:getWeekRewardNum()
    
    DataManager:dispatchMessage(Constant.CustomEvent.UpdateHotShow,{type=Enum.mainHotType.task,num=num})
end

function M:getDayRewardNum()
    local num=0
    local data = g_TaskData:getTaskDataByType(Enum.TaskType.Day)
    for _,v in pairs(data) do
        if v.isFinished and (not v.received) then
            num=num+1
        end
    end
    return num
end

function M:getWeekRewardNum()
    local num=0
    local data = g_TaskData:getTaskDataByType(Enum.TaskType.Week)
    for _,v in pairs(data) do
        if v.isFinished and (not v.received) then
            num=num+1
        end
    end
    return num
end

function M:isShowMainInviteHot()
    local is=false
    local   taskData=g_TaskData:getTaskDataByType(Enum.TaskType.Invite)
    for _,data in ipairs(taskData) do
        local   taskId=data["id"]
        local   receivedCount=data["receivedCount"]
        local   cmpNow=data["cmpNow"][1]
        local   taskData = DataManager:getTbxData("Task", taskId)
        local   CompleteServerConditionArray=taskData["CompleteServerConditionArray"][1][2]
        self.taskId=taskId

        if 4001==taskId then
            local   time=cmpNow
            local   curTime=time-receivedCount*CompleteServerConditionArray[1]
            local   max=CompleteServerConditionArray[1]

            if curTime>=max then
                is=true
                break
            end
        elseif 4002==taskId then
            local   time=cmpNow
            local   curTime=time-receivedCount*CompleteServerConditionArray[1]
            local   max=CompleteServerConditionArray[1]

            if curTime>=max then
                is=true
                break
            end
        elseif 4003==taskId then
            local   time=cmpNow
            local   curTime=time-receivedCount*CompleteServerConditionArray[1]
            local   max=CompleteServerConditionArray[1]

            if curTime>=max then
                is=true
                break
            end
        end
    end

    if g_HotData:hasHot(Enum.redPointSubcategory.inviteFriendClick) then
        is=true
    end
    if g_HotData:hasHot(Enum.redPointSubcategory.inviteFriendRegister) then
        is=true
    end
    if g_HotData:hasHot(Enum.redPointSubcategory.inviteFriendCharge) then
        is=true
    end
    if g_HotData:hasHot(Enum.redPointSubcategory.inviteAwardButton) then
        is=true
    end

    DataManager:dispatchMessage(Constant.CustomEvent.UpdateHotShow,{type=Enum.mainHotType.invitation,is=is})
end
----------------------------------------网络消息---------------------------------------------
--请求任务数据
function M:requestTaskList()
    UIUtils.showLoadingLayer(5,10)

    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_GetTaskList)
    -- required int32 id       = 1;  // 任务id
	-- repeated int64 cmpNow   = 2;  // 当前完成进度
	-- required bool received  = 3;  // 已领取
	-- required TaskKind kind  = 4;  // 任务类型
end

function M:S2C_GetTaskList(data)
    UIUtils.closeLoadingLayer()

    if not data then return end
    
    self.m_TaskData = {}
    local list = data.tasks 
    if not Utils.isEmptyTable(list) then 
        for _,v in ipairs(list) do 
            self:createTask(v)
        end
    end

    DataManager:dispatchMessage(Constant.CustomEvent.OnTaskListArrive)
    self:isShowMainTaskHot()
end

--领取
function M:requestReciveTask(taskId)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_ReceiveTask, { id = taskId })
end

--一键领取
function M:requestReciveTaskAll()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_ReceiveTaskAll)
end

function M:S2C_TaskUpdate(data)
    local taskId = data.id 
    local cmpNow = data.cmpNow
    local receivedCount=data.receivedCount
    
    for _,v in ipairs(self.m_TaskData) do 
        if v.id == taskId then 
            v.cmpNow = cmpNow
            v.receivedCount=receivedCount
            
            v.isFinished = self:isTaskFinished(cmpNow, v.cmpTotal)
        end
    end
    DataManager:dispatchMessage(Constant.CustomEvent.OnTaskDataUpdate)
    self:isShowMainTaskHot()
    self:isShowMainInviteHot()
end

function M:S2C_ReceiveTask(data)
    if not data then return end

    local taskId = data.id
    for _,v in ipairs(self.m_TaskData) do 
        if v.id == taskId then 
            v.received = true
        end
    end

    DataManager:dispatchMessage(Constant.CustomEvent.OnTaskDataUpdate)
    DataManager:dispatchMessage(Constant.CustomEvent.refreshHotActivity)
    self:isShowSevenLogin()
    self:isShowMainTaskHot()
    self:isShowMainInviteHot()
end 

function M:taskInvitedPlayer(kind)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_taskInvitedPlayer, { kind = kind })
end

function M:S2C_taskInvitedPlayer(data)
    local   players=data.players or {}
    local   kind=data.kind
    local   dailyCount=data.dailyCount
    self.m_taskPlayer[kind]={}
    self.m_taskPlayer[kind].dailyCount=dailyCount
    self.m_taskPlayer[kind].data={}
    for _,v in ipairs(players) do
        local   playerInfo=v.playerInfo
        local   createdTime=v.createdTime
        local   itemInfo=v.items[1]

        local   data={}
        data.createdTime=createdTime
        data.itemInfo=itemInfo

        if playerInfo then
            data.avatar=playerInfo.avatar
            data.avatarFrame=playerInfo.avatarFrame
            data.fansNum=playerInfo.fansNum
            data.gold=playerInfo.gold
            data.isSystemAvatar=playerInfo.isSystemAvatar
            data.nickname=playerInfo.nickname
            data.onlineState=playerInfo.onlineState
            data.sex=playerInfo.sex
            data.slogan=playerInfo.slogan
            data.uid=playerInfo.uid
            data.vipLevel=playerInfo.vipLevel
        end
        
        table.insert(self.m_taskPlayer[kind].data,data)
    end

    DataManager:dispatchMessage(Constant.CustomEvent.UIInvitationPopUp_update)
end
--领取邀请奖励
function M:C2S_gainInvitedReward()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_gainInvitedReward, {  })
end

function M:C2S_getInvitedReward()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_getInvitedReward, {  })
end

function M:S2C_getInvitedReward(data)
    local   items=data.items or {}

    DataManager:dispatchMessage(Constant.CustomEvent.UIInvitationPopUp_getInvitedReward,{items=items})
end

return M    