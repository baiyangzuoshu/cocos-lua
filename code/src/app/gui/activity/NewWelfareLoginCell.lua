local UIPanel = require("app.gui.basegui.UIPanel")

local M = class("NewWelfareLoginCell", UIPanel)

M.GUI_FILE_NAME = "csd.03_08_NewWelfare.03_08_NewWelfareLoginCell.lua"

M.BINDGUIDATANODE = {
    ["DayImage_1_IVT"]={varname="DayImage_1_IVT"},
    ["DayImage_2_IVT"]={varname="DayImage_2_IVT"},
    ["DayImage_3_IVT"]={varname="DayImage_3_IVT"},
    ["DayImage_4_IVT"]={varname="DayImage_4_IVT"},
    ["DayImage_5_IVT"]={varname="DayImage_5_IVT"},
    ["DayImage_6_IVT"]={varname="DayImage_6_IVT"},
    ["State_1"]={varname="State_1"},
    ["State_2"]={varname="State_2"},
    ["State_3"]={varname="State_3"},
    ["Res"]={varname="ResPanel"},
    ["ResNum"]={varname="ResNum"},
    ["Common"]={varname="Common"},
    ["LoginPanel"]={varname="LoginPanel",onClick="onLoginPanel"}
}

function M:onLoginPanel()
    if self["State_2"]:isVisible() then
        g_TaskData:requestReciveTask(self.data.TaskId)
    end
end

function M:itemCb(item)
    if self["State_2"]:isVisible() then
        g_TaskData:requestReciveTask(self.data.TaskId)
    else
        item:showInfo()
    end
end

function M:refreshUI(data)
    self:initShow()
    self[string.format("DayImage_%d_IVT",data.day)]:setVisible(true)

    self.data=data
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
    item:resetIcon(self.ResPanel)
    item:resetIconNum(self.ResNum)
    item:setItemInfo(itemInfo)
    item:resetCenterPosition()
    item:setPosition(cc.p(-23,-30))
    item:setTouchCallBack(handler(self,self.itemCb))
    item:setPropFrameVisible(false)
    self.Common:addChild(item)

    local serverData=g_TaskData:getTaskDataByType(Enum.TaskType.Login)
    for _,v in pairs(serverData) do
        if v.id==data.TaskId then
            if v.received then
                self["State_3"]:setVisible(true)
            else
                self["State_1"]:setVisible(true)
                if data.day<=v.cmpNow[1] then
                    self["State_2"]:setVisible(true)
                end
            end
            break
        end
    end
end

function M:initShow()
    for i=1,6,1 do
        self[string.format("DayImage_%d_IVT",i)]:setVisible(false)
    end
    for i=1,3,1 do
        self["State_"..i]:setVisible(false)
    end
end

function M:onCreate()
    M.super.onCreate(self)
end

function M:onInit()
    
end

return M