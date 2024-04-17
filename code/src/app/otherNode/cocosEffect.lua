--[[
    author:{Vstar}
    time:2020-07-27 14:11:24
	说明：
]]
local M = class("cocosEffect", ccui.Layout)

function M:ctor(isLastFrameRemove)
    if self.onCreate then self:onCreate() end
    self.m_isDie = false
    self:setCascadeOpacityEnabled(true)
    self.m_callFunc = nil
    self.m_LastFrameRemove = false
    if isLastFrameRemove then
        self.m_LastFrameRemove = true
    end
end
function M:setLastFrameIsNeedDie(value)
    self.m_LastFrameRemove = value
end
function M:onCreate()
    self.m_effectNode = kz.ExtCocosEffect:create()
    if self.m_effectNode then
        self.m_effectNode:addTo(self)
        self.m_effectNode:setCascadeOpacityEnabled(true)
        if self.m_effectNode then
            self.m_effectNode:setLastFrameCallBack(handler(self, self.lastFrameCallFunc))
        end
    end
end

function M:loadCsd(res)
    if self.m_effectNode then
        return self.m_effectNode:loadCsd(res)
        
    end
    return false
end
function M:setContentSizeAndApos(size,apos)
    if size then
        self:setContentSize(size)
        self.m_effectNode:setPosition(cc.p(size.width/2,size.height/2))
        if apos then
            self:setAnchorPoint(cc.p(0.5,0.5))
        else    
            self:setAnchorPoint(cc.p(0.5,0.5))
        end

    end
end
function M:lastFrameCallFunc()
    
    if self.m_callFunc then
        self.m_callFunc()
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
    if self.m_effectNode then
        self.m_effectNode:play(isloop)        
    end
end
--[[
    actionname: 动画名字
    isloop:是不是循环播放
]]
function M:playActionName(actionname,isloop)
    if self.m_effectNode then
        self.m_effectNode:playActionName(actionname,isloop)
    end
end

function    M:getAnimationChildByName(node,name)
    local   ret=nil
    for _,v in ipairs(node:getChildren()) do
        if name==v:getName() then
            return  v
        end
        ret=self:getAnimationChildByName(v,name)
    end
    return ret
end

return M