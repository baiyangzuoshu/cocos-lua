local M = class("PackageData")

function M:ctor()
    self.mPackageData = {}
end

function M:getPackageData()
    return self.mPackageData
end

function M:getPackageDataByTabIndex(itemTypes)
    local PackageData = {}
    if not Utils.isEmptyTable(self.mPackageData) then 
        for i,v in ipairs(self.mPackageData) do
            for k,itemType in ipairs(itemTypes) do 
                if v.itemType == itemType then 
                    table.insert(PackageData, clone(v))
                end
            end 
        end
    end
    return PackageData
end

function M:isShowMainHot()
    local is=false
    if g_HotData:hasHot(Enum.redPointSubcategory.diceList) then
        is=true
    end
    DataManager:dispatchMessage(Constant.CustomEvent.UpdateHotShow,{type=Enum.mainHotType.bag,is=is})
end

function M:updateItemInfo(v)
    for _,item in ipairs(self.mPackageData) do
        if item.itemId==v.itemId then
            item.itemNum = v.itemNum
            item.isNew = v.isNew
            return true
        end
    end

    return false
end

function M:getItemById(itemId)
    for _,item in ipairs(self.mPackageData) do
        if item.itemId==itemId then
            return item
        end
    end

    return nil
end
----------------------------------------网络消息---------------------------------------------
function M:requestGetBagList()
    UIUtils.showLoadingLayer(5,10)

    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_GetBagList)
end

function M:S2C_GetBagList(data)
    UIUtils.closeLoadingLayer()
    if not data then return end 

    local bagList = data.itemInfo
    self.mPackageData = {}
    if not Utils.isEmptyTable(bagList) then 
        for i,v in ipairs(bagList) do 
            if not (v.type == Enum.ItemShowType.WeeklyActivity) then 
                local item = {}
                item.itemId = v.itemId
                item.itemType = v.itemType
                item.itemNum = v.itemNum
                item.isNew = v.isNew
                table.insert(self.mPackageData, item)
            end
        end
    end

    DataManager:dispatchMessage(Constant.CustomEvent.OnBagListArrive)
end

function M:S2C_UpdateUserItems(data)
    if not data then return end 

    local bagList = data.itemInfo
    for _,v in ipairs(bagList) do
        self:updateItemInfo(v)
    end
    
    DataManager:dispatchMessage(Constant.CustomEvent.UIPackageItem_refreshHot)
end

return M