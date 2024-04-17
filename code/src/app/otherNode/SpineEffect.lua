--[[
    author:{Vstar}
    time:2020-07-27 14:11:24
	说明：
]]
local M = class("SpineEffect", ccui.Layout)

function M:ctor(isLastFrameRemove)
    if self.onCreate then self:onCreate() end
    self.m_isDie = false
    self.m_callFunc = nil
    self.m_LastFrameRemove = false
    if isLastFrameRemove then
        self.m_LastFrameRemove = true
    end
    self.mSpineEffect = nil;
end
function M:setLastFrameIsNeedDie(value)
    self.m_LastFrameRemove = value
end
function M:onCreate()
    
end

function M:loadCsd(res,func)
    if func then self:setLastFrameCallFunc(func) return end
    local spineAtlas = res..".atlas"
    local spineJson = res..".json"
    self.mSpineEffect = sp.SkeletonAnimation:create(spineJson,spineAtlas)
    if self.mSpineEffect then
        self:addChild(self.mSpineEffect)
        --self.mSpineEffect:registerSpineEventHandler(handler(self,self.animationRunListenerEvent))
        self.mSpineEffect:registerSpineEventHandler(function (event)
            --print(string.format("[spine] %d start: %s", event.trackIndex, event.animation))
       end, sp.EventType.ANIMATION_START)
       
       self.mSpineEffect:registerSpineEventHandler(function (event)
            --print(string.format("[spine] %d end:", event.trackIndex))
       end, sp.EventType.ANIMATION_END)
               
       self.mSpineEffect:registerSpineEventHandler(function (event)
            --print(string.format("[spine] %d complete: %d", event.trackIndex, event.loopCount))
            self:lastFrameCallFunc(event)
       end, sp.EventType.ANIMATION_COMPLETE)
       
       self.mSpineEffect:registerSpineEventHandler(function (event)
            local data = event.eventData
            --print(string.format("[spine]%d event: %s,%d,%f,%s", event.trackIndex,data.name,data.intValue,data.floatValue,data.stringValue)) 
       end, sp.EventType.ANIMATION_EVENT)
    end
    return false
end
function M:setContentSizeAndApos(size,apos)
    if size then
        self:setContentSize(size)
        self.mSpineEffect:setPosition(cc.p(size.width/2,size.height/2))
        if apos then
            self:setAnchorPoint(cc.p(0.5,0.5))
        else    
            self:setAnchorPoint(cc.p(0.5,0.5))
        end

    end
end
function M:lastFrameCallFunc(event)
    
    if self.m_callFunc then
        self.m_callFunc(event)
    end
    if self.m_LastFrameRemove then
        self:setDie(true)
    end
end
function M:setLastFrameCallFunc(func)
    self.m_callFunc = func
    
end
function M:setDie(isDie)
    if isDie and not self.m_isDie then
        self:getParent():removeChild(self)
        self.m_isDie=true
    end
end
function M:play(isloop)
    if self.mSpineEffect then
        self.mSpineEffect:setAnimation(0,"RootAnimation",isloop)        
    end
end
--[[
    actionname: 动画名字
    isloop:是不是循环播放
]]
function M:playActionName(actionname,isloop)
    if self.mSpineEffect then
        self.mSpineEffect:setAnimation(0,actionname,isloop)
    end
end

function    M:getAnimationChildByName(node,name)
    local   ret=nil
    -- for _,v in ipairs(node:getChildren()) do
    --     if name==v:getName() then
    --         return  v
    --     end
    --     ret=self:getAnimationChildByName(v,name)
    -- end
    return ret
end

return M