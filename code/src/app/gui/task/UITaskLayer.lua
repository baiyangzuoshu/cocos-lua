local UITaskCell = require("app.gui.task.UITaskCell")

local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UITaskLayer", UIPanel)

local MIN_ROW = 1

M.GUI_FILE_NAME = "csd.01_04_Task.01_04_TaskPopUp.lua"

M.BINDGUIDATANODE = {
    ["InteractionPopups"] = { varname = "InteractionPopups" },

    ["WeekActivityNum"] = { varname = "WeekActivityNum" },

    ["ReceiveButton"] = { varname = "ReceiveButton", onClick = "onReciveAllBtnClick" },

    ["TaskPanel"] = { varname = "TaskPanel" },

    ["WeekTaskLoadingBar"] = { varname = "WeekTaskLoadingBar" },

    ["WeekResNode_1"] = { varname = "WeekResNode_1" },
    ["WeekResNode_2"] = { varname = "WeekResNode_2" },
    ["WeekResNode_3"] = { varname = "WeekResNode_3" },
    ["WeekResNode_4"] = { varname = "WeekResNode_4" },
    ["WeekResNode_5"] = { varname = "WeekResNode_5" },

    ["WeekTaskNum_1"] = { varname = "WeekTaskNum_1" },
    ["WeekTaskNum_2"] = { varname = "WeekTaskNum_2" },
    ["WeekTaskNum_3"] = { varname = "WeekTaskNum_3" },
    ["WeekTaskNum_4"] = { varname = "WeekTaskNum_4" },
    ["WeekTaskNum_5"] = { varname = "WeekTaskNum_5" },
}

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)

    self.mDayTaskData = {}
    self.mWeekTaskData = {}

    self.mRow = 0

    local size = self.TaskPanel:getContentSize()
    self.mTableView = cc.TableView:create(size)
    self.mTableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
    self.mTableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
    self.mTableView:setBounceable(true)
    self.mTableView:setIgnoreAnchorPointForPosition(false)
    self.mTableView:setAnchorPoint(0, 0)
    self.mTableView:setPosition(0, 0)

    self.TaskPanel:addChild(self.mTableView)

    self.mTableView:setDelegate()
    self.mTableView:registerScriptHandler(handler(self, self.getNumberOfCellsInTableView), cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
    self.mTableView:registerScriptHandler(handler(self, self.getTableCellSizeForIndex), cc.TABLECELL_SIZE_FOR_INDEX)
    self.mTableView:registerScriptHandler(handler(self, self.getTableCellSizeAtIndex), cc.TABLECELL_SIZE_AT_INDEX)

    self:initOutClickableArea()
end

function M:initOutClickableArea()
    local function onOutOfQuickBoxClick()
        self:closePanel()
    end

    UIUtils.addClickableNode(self.InteractionPopups, nil, onOutOfQuickBoxClick)
end

function M:onInit()
    M.super.onInit(self)
end

function M:onEnter()
    M.super.onEnter(self)

    self:refreshUI()
end

function M:refreshUI()
    self:refreshAllDayTaskData()
    self:refreshAllWeekTaskData()
end

function M:sortAllDayTask(a, b)
    --排序规则
    --已完成未领取 > 未完成(未领取) > (已完成)已领取 > 任务编号
    --a处于第一状态2种情况
    if (a.isFinished and (not a.received)) and ((not b.isFinished) or b.received) then 
        return true 
    elseif (a.isFinished and (not a.received)) and (b.isFinished and (not b.received)) then 
        if a.id < b.id then 
            return true 
        end
    end
    --a处于第二状态3种情况
    if (not a.isFinished) and b.received then 
        return true
    elseif (not a.isFinished) and (not b.isFinished) then 
        if a.id < b.id then 
            return true 
        end
    elseif (not a.isFinished) and (b.isFinished and (not b.received)) then 
        return false
    end
    --a处于第三状态2种情况
    if a.received and (not b.received) then 
        return false
    elseif a.received and b.received then 
        if a.id < b.id then 
            return true 
        end
    end
end

function M:refreshAllDayTaskData()
    self.mDayTaskData = g_TaskData:getTaskDataByType(Enum.TaskType.Day)
    --dump(self.mDayTaskData, "mDayTaskData", 3)
    if not Utils.isEmptyTable(self.mDayTaskData) then 
        self.mRow = math.ceil(table.getn(self.mDayTaskData) / UITaskCell.ITEM_COLUMN)
        if self.mRow < MIN_ROW then
            self.mRow = MIN_ROW 
        end

        table.sort(self.mDayTaskData, handler(self, self.sortAllDayTask))

        self.mTableView:reloadData()
    else
        Log.error("daily task is empty")
    end
end

function M:refreshAllWeekTaskData()
    self.mWeekTaskData = g_TaskData:getTaskDataByType(Enum.TaskType.Week)
    --dump(self.mWeekTaskData, "mWeekTaskData", 3)
    if not Utils.isEmptyTable(self.mWeekTaskData) then 
        table.sort(self.mWeekTaskData, function(a, b)
            if a.id < b.id then 
                return true
            end

            return false
        end)
        local len = table.getn(self.mWeekTaskData)
        for i = 1, len do 
            local str = string.format("WeekResNode_%d", i)
            self[str]:removeAllChildren(true)
            local item = UIManager:createPanelOnly("UITaskResItem")
            local size = item:getContentSize()
            item:setPosition(-size.width / 2 , -size.height / 2)
            item:setTouchCallBack(handler(self, self.onSelectItem))
            item:setWeekTaskInfo(self.mWeekTaskData[i])
            self[str]:addChild(item)
        end
        self:refreshWeekUI(self.mWeekTaskData)
    else
        Log.error("weekly task is empty")
        self:closePanel()
    end
end

function M:refreshWeekUI(weekTaskData)
    local len = table.getn(weekTaskData)
    for i = 1, len do 
        local str = string.format("WeekTaskNum_%d", i)
        local cmpNow = weekTaskData[i].cmpNow[1] or 0
        local cmpTotal = weekTaskData[i].cmpTotal[1]
        if cmpNow >= cmpTotal then 
            self[str]:setTextColor(cc.c3b(0, 0, 0))
        else
            self[str]:setTextColor(cc.c3b(255, 255, 255))
        end
        self[str]:setString(weekTaskData[i].cmpTotal[1])
    end
    local weekCmpNow = weekTaskData[5].cmpNow[1] or 0
    local weekCmpTotal = weekTaskData[5].cmpTotal[1]
    local percent = (weekCmpNow / weekCmpTotal) * 100
    if percent >= 100 then 
        percent = 100
    end
    self.WeekTaskLoadingBar:setPercent(percent)
    self.WeekActivityNum:setString(tostring(weekCmpNow))
end

function M:onSelectItem(item)
    if not item then return end 

    local taskInfo = item:getTaskInfo()

    if not taskInfo then return end 

    local taskId = taskInfo:getTaskId()

    if taskInfo:getTaskFinished() then 
        g_TaskData:requestReciveTask(taskId)
    else
        local cfgData = taskInfo:getCfgData()
        if cfgData then 
            local reward = cfgData.RewardInfo
            if not Utils.isEmptyTable(reward) then 
                for _,v in ipairs(reward) do 
                    local itemId = 0
                    local itemNum = 0
                    local itemType = v[1]
                    if itemType == Enum.ItemShowType.Diamond then
                        itemId = GSystem.DiamondItemId
                        itemNum = v[2][1]
                    elseif itemType == Enum.ItemShowType.Gold then
                        itemId = GSystem.GoldItemId
                        itemNum = v[2][1]
                    elseif itemType == Enum.ItemShowType.Material then
                        itemId = v[2][1]
                        itemNum = v[2][2]
                    elseif itemType == Enum.ItemShowType.DiceCup then
                        itemId = v[2][1]
                        itemNum = v[2][1] or 1
                    end
                    local netData = {}
                    netData.itemId = itemId
                    netData.itemType = itemType
                    netData.itemNum = itemNum
                    local itemInfo = require("app.bean.ItemInfo").new(netData, itemType)

                    if itemType ~= Enum.ItemShowType.DiceCup then 
                        local itemTips = UIManager:getOrCreatePanel("UIPackageShowItemTips")
                        if itemTips then 
                            itemTips:setItemInfo(itemInfo)
                            itemTips:showToScene()
                        end
                    else
                        local diceUpTips = UIManager:getOrCreatePanel("UIPackageShowDiceUp")
                        if diceUpTips then 
                            diceUpTips:setItemInfo(itemInfo)
                            diceUpTips:setIsCanUse(false)
                            diceUpTips:showToScene()
                        end
                    end
                    break
                end
            end
        end
    end
end

function M:onReciveAllBtnClick(ref)
    g_TaskData:requestReciveTaskAll()
end

function M:onCleanup()
    M.super.onCleanup(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.OnTaskDataUpdate, "refreshUI")
end

function M:getNumberOfCellsInTableView(tableview)
    return self.mRow
end

function M:getTableCellSizeForIndex(tableview, idx)
    return UITaskCell.CELL_WIDTH, UITaskCell.CELL_HEIGHT
end

function M:getTableCellSizeAtIndex(tableview, idx)
    local cell = tableview:dequeueCell()
    if nil == cell then
        cell = cc.TableViewCell:new()
    end

    local panel = cell:getChildByName("UITaskCell")
    if not panel then
        panel = UITaskCell.new()
        panel:setName("UITaskCell")

        local size = panel:getContentSize()
        panel:setPosition((UITaskCell.CELL_WIDTH - size.width) * 0.5, (UITaskCell.CELL_HEIGHT - size.height) * 0.5)
        cell:addChild(panel)
    end

    panel:refreshData(self.mDayTaskData, idx)

    return cell
end

return M