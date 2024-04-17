local UIPanel = require("app.gui.basegui.UIPanel")

local M = class("UINewWelfareLoginPopUp", UIPanel)

M.GUI_FILE_NAME = "csd.03_08_NewWelfare.03_08_NewWelfareLoginPopUp.lua"

M.BINDGUIDATANODE = {
    ["DayNode_1"]={varname="DayNode_1"},
    ["DayNode_2"]={varname="DayNode_2"},
    ["DayNode_3"]={varname="DayNode_3"},
    ["DayNode_4"]={varname="DayNode_4"},
    ["DayNode_5"]={varname="DayNode_5"},
    ["DayNode_6"]={varname="DayNode_6"},
    ["State_1"]={varname="State_1"},
    ["State_2"]={varname="State_2"},
    ["State_3"]={varname="State_3"},
    ["ResIcon"]={varname="ResIcon"},
    ["Common"]={varname="Common"},
    ["ResNum"]={varname="ResNum"},
    ["SeventhDayPanel"]={varname="SeventhDayPanel",onClick="onSeventhDayPanel"}
}

function M:onSeventhDayPanel()
    SoundSystemManager:playSound004()
    if self["State_2"]:isVisible() then
        local data=self.taskData[7]
        g_TaskData:requestReciveTask(data.TaskId)
    else
        if self.seventhItem then 
            self.seventhItem:showInfo()
        end
    end
end

function M:onCloseEvent()
    self:closePanel()
    g_HotData:setGuideStep(4)
    g_HotData:C2S_guideStepUpdate(4)
    g_ActivityData:showPopLayer()
end

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)
    
    self.taskData={}
    local task=DataManager:getTbxData("Task","TaskType",Enum.TaskType.Login)
    for _,data in pairs(task) do
        local CompleteServerConditionArray=data["CompleteServerConditionArray"]
        local day=CompleteServerConditionArray[1][2][1]
        self.taskData[day]={}
        self.taskData[day].TaskId=data.TaskId
        self.taskData[day].day=day
        self.taskData[day].RewardInfo=data.RewardInfo
    end

    local data=self.taskData[7]
    local RewardInfo=data.RewardInfo
    local v=RewardInfo[1]
    local itemId,itemNum=Utils.parseItemData(v)
    
    local item=DataManager:getTbxData("Item",itemId)
    local netData = {}
    netData.itemShowType = item.ItemType
    netData.itemId = item.ItemId
    netData.itemNum = itemNum

    local itemInfo = require("app.bean.ItemInfo").new(netData, item.ItemType)
    local item = UIManager:createPanelOnly("UIItem")
    item:resetIcon(self.ResIcon)
    item:resetIconNum(self.ResNum)
    item:setItemInfo(itemInfo)
    item:resetCenterPosition()
    item:setPosition(cc.p(-23,-30))
    item:setTouchCallBack(handler(self,self.itemCb))
    item:setPropFrameVisible(false)
    self.Common:addChild(item)
    self.seventhItem=item

    self.itemArray={}
    for i=1,6,1 do
        local item=UIManager:createPanelOnly("NewWelfareLoginCell")
        item:resetCenterPosition()
        self["DayNode_"..i]:addChild(item)
        self.itemArray[i]=item
    end
    for i=1,3,1 do
        self["State_"..i]:setVisible(false)
    end
end

function M:itemCb(item)
    if self["State_2"]:isVisible() then
        local data=self.taskData[7]
        g_TaskData:requestReciveTask(data.TaskId)
    else
        item:showInfo()
    end
end

function M:refreshUI()
    local serverData=g_TaskData:getTaskDataByType(Enum.TaskType.Login)
    
    for i=1,6,1 do
        local item=self.itemArray[i]
        item:refreshUI(self.taskData[i])
    end
    --
    local data=self.taskData[7]
    for _,v in pairs(serverData) do
        if v.id==data.TaskId then
            if v.received then
                self["State_3"]:setVisible(true)
            else
                if data.day<=v.cmpNow[1] then
                    self["State_2"]:setVisible(true)
                else
                    self["State_1"]:setVisible(true)
                end
            end
            
            break
        end
    end
end

function M:onInit()
    M.super.onInit(self)
    for i=1,6,1 do
        self.itemArray[i]:reBindingAllNode()
    end
    self:refreshUI()
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.OnTaskDataUpdate, "refreshUI")
end

return M