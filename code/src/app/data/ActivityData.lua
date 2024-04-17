local M = class("ActivityData")

function M:ctor()
    self:init()
end

function M:init()
    self.popLayer={}
    self.curLayerName=""
end

function M:clearShowLayer()
    self:init()
end

function M:pushLayerName(name)
    for _,v in ipairs(self.popLayer) do
        if name==v then
            return
        end
    end

    table.insert(self.popLayer,#self.popLayer+1,name)

    if self.curLayerName=="" and 0~=g_UserData:getGuideTime() then
        self:showPopLayer()
    end
end

function M:popLayerName()
    local names={}
    local curLayer=self.popLayer[1] or ""
    for i=2,#self.popLayer,1 do
        table.insert(names,self.popLayer[i])
    end
    self.popLayer=names
    
    return curLayer
end

function M:showPopLayer()
    self.curLayerName=self:popLayerName()
    if "" ~= self.curLayerName then
        local panel=UIManager:getOrCreatePanel(self.curLayerName)
        if panel then
            panel:showToScene()
        end
    end
end
----------------------------------------网络消息---------------------------------------------
--领取注册礼包
function M:C2S_gainRegisterReward()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_gainRegisterReward)
end

function M:C2S_gainRescueGold()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_gainRescueGold)
end

return M     