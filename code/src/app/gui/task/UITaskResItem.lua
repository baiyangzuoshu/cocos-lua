local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UITaskResItem", UIPanel)

M.GUI_FILE_NAME = "csd.01_04_Task.01_04_TaskResCell.lua"

M.BINDGUIDATANODE = {
    ["ResImage"] = { varname = "ResImage" },
    ["ResImage_2"] = { varname = "ResImage_2" },
    ["ResIcon"] = { varname = "ResIcon" },
    ["ResTipIcon"] = { varname = "ResTipIcon" },
    ["ResNum"] = { varname = "ResNum" },
    ["ResAnimation"]={varname="ResAnimation"},
    ["ResPanel"] = { varname = "ResPanel", onEvent = "onTouchEvent" },
}

function M:onCreate()
    M.super.onCreate(self)

    local _effect = Utils.onlyCreateEffect(GSystem.TaskLightFrameAnimation,cc.p(0,0),true)
    if _effect then
        self.ResAnimation:addChild(_effect)
    end

    self:resetRootNodePosition(cc.p(0, 0))
    self:resetRootNodeAnchorPoint(cc.p(0.5, 0.5))

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.BigItem))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.MiniItem))

    self.mTaskInfo = nil
end

function M:getTaskInfo()
    return self.mTaskInfo
end

function M:setWeekTaskInfo(data)
    self.mTaskInfo = require("app.bean.TaskInfo").new(data)
end

function M:onEnter()
    M.super.onEnter(self)

    self:refreshUI()
end

function M:refreshUI()
    if not self.mTaskInfo then return end

    self.ResTipIcon:setVisible(false)
    self.ResImage_2:setVisible(false)
    self.ResAnimation:setVisible(false)
    if self.mTaskInfo:getIsReceived() then 
        self.ResTipIcon:setVisible(true)
    else
        if self.mTaskInfo:getTaskFinished() then 
            self.ResImage_2:setVisible(true)
            self.ResAnimation:setVisible(true)
        end
    end

    local taskData = DataManager:getTbxData("Task", self.mTaskInfo:getTaskId())
    if taskData then 
        local reward = taskData.RewardInfo
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
                end
                self.ResNum:setString(Utils.getFormatNumber_MuitiLanguage(itemNum))
                local itemData = DataManager:getTbxData("Item", itemId)
                if itemData then 
                    --self.ResIcon:setScale(0.64)
                    self.ResIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.BigItem, itemData.ItemIcon), ccui.TextureResType.plistType)
                end
                break
            end
        end
    end
end

function M:setTouchCallBack(cb)
    self.mTouchCallBack = cb
end

function M:onTouchEvent(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        if self.mTouchCallBack and self.mTaskInfo then 
            if self.mTaskInfo:getIsReceived() then 
                return
            end
            self:mTouchCallBack()
        end
    end
end

function M:onCleanup()
    M.super.onCleanup(self)
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
end

return M