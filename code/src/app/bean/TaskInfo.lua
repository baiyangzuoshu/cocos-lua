local M = class("TaskInfo")

function M:ctor(netData)
    self.mNetData = netData

    self.mTaskId = netData.id 
    self.mIsReceived = netData.received
    self.mTaskType = netData.taskType
    self.mTaskCmpNow = netData.cmpNow
    self.mTaskCmpTotal = netData.cmpTotal
    self.mTaskFinished = netData.isFinished

    self.mCfgData = nil
end

function M:getNetData()
    return self.mNetData
end

function M:setNetData(netData)
    self.mNetData = netData
end

function M:getTaskId()
    return self.mTaskId
end

function M:getIsReceived()
    return self.mIsReceived
end

function M:getTaskType()
    return self.mTaskType
end

function M:getTaskCmpNow()
    return self.mTaskCmpNow
end

function M:getTaskCmpTotal()
    return self.mTaskCmpTotal
end

function M:getTaskFinished()
    return self.mTaskFinished
end

function M:getCfgData()
    if self.mCfgData == nil then
        self.mCfgData = DataManager:getTbxData("Task", tostring(self:getTaskId()))
    end

    return self.mCfgData or {}
end

return M