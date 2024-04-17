local M = class("HotData")

function M:ctor()
    self:init()
end

function M:init()
    self.guideStep=1
    self.otherHot={}
    self.hotList={}
    self.guideData={}
    self.guideGroup=2
    self.guideGroupStep=1
    self.guideNetData={}

    self:parseGuideData()
end

function M:clearAllData()
    self.guideData={}
    self.guideGroup=2
    self.guideGroupStep=1
    self.guideNetData={}
end

function M:initGuideData(netData)
    for _,v in ipairs(netData) do
        local data={}
        data.id=v.id
        data.status=v.status
        data.rewards=v.rewards or {}
        data.isGot=v.isGot
        self.guideNetData[data.id]=data
    end
end

function M:parseGuideData()
    self.guideData={}
    --吹牛模式
    self.guideData[2]={}
    table.insert(self.guideData[2],{type=0})--0
    table.insert(self.guideData[2],{type=1,arr={3,3},target=1})--1
    table.insert(self.guideData[2],{type=2})--2
    table.insert(self.guideData[2],{type=3,arr={1}})--3
    table.insert(self.guideData[2],{type=4,arr={1}})--4
    table.insert(self.guideData[2],{type=5,arr={3}})--5
    table.insert(self.guideData[2],{type=4,arr={2},number=3})--6
    table.insert(self.guideData[2],{type=6,arr={5}})--7
    table.insert(self.guideData[2],{type=4,arr={3},number=5})--8
    table.insert(self.guideData[2],{type=1,arr={3,5},target=2})--9
    table.insert(self.guideData[2],{type=1,arr={7,3},target=1})--10
    table.insert(self.guideData[2],{type=2})--11
    table.insert(self.guideData[2],{type=7})--13
    table.insert(self.guideData[2],{type=8})--14
    table.insert(self.guideData[2],{type=9})--15
    table.insert(self.guideData[2],{type=4,arr={4}})--16
    table.insert(self.guideData[2],{type=10})--17
end

function M:getCurGuideGroup()
    return self.guideGroup
end

function M:getCurGuideStep()
    return self.guideGroupStep
end

function M:nextGuideGroupStep()
    self.guideGroupStep=self.guideGroupStep+1
end

function M:getCurGuideData()
    if self.guideData[self.guideGroup] then
        local data=self.guideData[self.guideGroup][self.guideGroupStep]
        
        return data
    elseif self.guideGroupStep>table.getn(self.guideData[self.guideGroup]) then
        
    end

    return nil
end

function M:setGuideStep(step)
    if step>self.guideStep then
        self.guideStep=step
    end
end

function M:getGuideStep()
    return self.guideStep
end

function M:hasHot(subcategory)
    if self.otherHot[subcategory] or self.hotList[subcategory] then
        return true
    end
    return false
end

function M:removeHot(subcategory)
    if self.otherHot[subcategory] then
        self.otherHot[subcategory]=nil
    end
end

function M:addHot(subcategory)
    self.otherHot[subcategory]={}
    self.otherHot[subcategory].num=1
end

function M:searchGuideAward()
    for _,v in pairs(self.guideNetData) do
        if not v.isGot and #v.rewards>0 and v.status==4 then
            local panel=UIManager:getOrCreatePanel("UIGuideWinAwardLayer")
            panel:refreshData(v)
            panel:showToScene()
            break
        end
    end
end

function M:haveNeedGuide()
    for _,v in pairs(self.guideNetData) do
        if v.status<3 then
            return true
        end
    end

    return false
end
----------------------------------------网络消息---------------------------------------------
function M:C2S_guideStepUpdate(step)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_guideStepUpdate,{step=step})
end

function M:S2C_guideStepUpdateAck(data)
    local   step=data.step
    
end

function M:C2S_getRedPoint()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_getRedPoint)
end

function M:C2S_removeRedPoint(subcategory)
    if self:hasHot(subcategory) then
        Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_removeRedPoint,{subcategory=subcategory})
    end
end

function M:S2C_redPoint(data)
    local list=data.list or {}
    self.hotList={}
    for _,v in pairs(list) do
        self.hotList[v.subcategory]={}
        self.hotList[v.subcategory].num=v.num
    end

    DataManager:dispatchMessage(Constant.CustomEvent.UIInvitationPopUp_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.UIPersonalInfoLayer_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.UIHeadFrameLayer_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.UISettingAccountLayer_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.UISettingLayer_refreshHot)
    DataManager:dispatchMessage(Constant.CustomEvent.UIPackageLayer_refreshHot)
    g_TaskData:isShowMainInviteHot()
    g_UserData:isShowMainHot()
    
    g_PackageData:isShowMainHot()
end

function M:S2C_removeRedPointAck(data)
    local ok=data.ok
    local list=data.list
end


function M:c2sUpdateGuideGroup(id,status)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sUpdateGuideGroup,{id=id,status=status})
end

function M:c2sGetGuideGroupRewards(ids)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sGetGuideGroupRewards,{ids=ids})
end

function M:s2cGuideGroupUpdateAck(data)
    local guideInfos=data.guideInfos
    for _,v in ipairs(guideInfos) do
        local data={}
        data.id=v.id
        data.status=v.status
        data.rewards=v.rewards or {}
        data.isGot=v.isGot
        self.guideNetData[data.id]=data
    end
end


return M