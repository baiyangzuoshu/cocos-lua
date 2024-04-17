--[[
    author:{Vstar}
    time:2020-07-27 14:11:24
	说明：
]]
local M = class("NomalEffect", ccui.Layout)

function M:ctor()
    if self.onCreate then self:onCreate() end
    self.m_LastFrameRemove= false

end

function M:onCreate()
    --self.m_effectNode = px.ExtMagicManager:instance():creatMagic(path, frames / 1000, loop or false)
end
function M:setLastFrameIsNeedDie(value)
    self.m_LastFrameRemove = value
end
function M:setDie(isDie)
    self.m_effectNode:setDie(isDie)
end
function M:createEffect(path,frames,loop)
    self.m_effectNode = kz.ExtMagicManager:instance():creatMagic(path, frames, loop or false)
    if not loop then
        if self.m_effectNode then
            self.m_effectNode:setLastFrameCallFunc(handler(self,self.defautLastFrameCallback))
        end
    end
    self:addChild(self.m_effectNode)
    
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
function M:defautLastFrameCallback()
    -- self:removeFromParent() 当前帧下C++回调中不能对节点进行移除操作
    self:runAction(cc.Sequence:create(
        cc.DelayTime:create(1.0/60.0),
        cc.CallFunc:create(
            function (node)
                node:removeFromParent()
            end
        )
    ))

    if self.m_lastFrameCallBack and type(self.m_lastFrameCallBack)=="function" then
        self.m_lastFrameCallBack()
    end
end
function M:setLastFrameCallFunc(func)
    if self.m_effectNode then
        self.m_effectNode:setLastFrameCallFunc(func)
    end

    self.m_lastFrameCallBack = func
end

function M:setStop()
    if self.m_effectNode then
        self.m_effectNode:setStop()
    end
end

function M:play(isloop)

end


return M