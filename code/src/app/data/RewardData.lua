local M = class("RewardData")

function M:ctor()
    
end

function M:S2C_GetReward(data)
    if not data then return end

    local gainData = data.gain 
    
    if not gainData then return end
    
    local items = {}
    for _ , v in pairs(gainData) do
        local item = {}
        item.id = v.id
        item.num = v.num
        item.type = v.type
        table.insert(items, item)
    end

    --恭喜获得
    if not Utils.isEmptyTable(items) then 
        --获得弹窗
        --UIUtils.popToast("恭喜获得")
        local panel = UIManager:getOrCreatePanel("UIRewardLayer")
        if panel then 
            panel:showToScene()
            panel:showReward(items)
        end
    end
end


return M