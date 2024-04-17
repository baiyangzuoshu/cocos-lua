-- 包装节点，实现点击事件
local function supper()
    return cc.Node:create()
end
local M = class("ClickableNode", supper)

function M.create(target, clickListener, size)
    return M.new({ target = target, size = size, listener = clickListener })
end

function M:ctor(args)
    local target = args.target
    local size = args.size or target:getContentSize()
    self.mSize = size
    self.mClickListener = args.listener
    self:setContentSize(size)

    if target ~= nil then
        target:align(display.LEFT_BOTTOM, 0, 0)
        self:addChild(target)

        self.mTargetNode = target
    else
        self.mTargetNode = self
    end

    self:registerClickListener()
end

function M:setClickListener(listener)
    self.mClickListener = listener
end

-- 设置区域外点击事件
function M:setOutAreaClickListener(listener)
    self.mOutClickListener = listener
end

function M:setSize(size)
    self.mClickListener = args.listener
    self.mSize = size
    self.mClickArea = nil
end

-- 设置是否每次都计算点击区域
function M:recalcClickAreaEveryTime()
    self.mRecalcClickAreaEveryTime = true
end

function M:calculateClickArea()
    if self.mClickAreaRect == nil then
        self.mClickAreaRect = cc.rect(0, 0, self.mSize.width, self.mSize.height)
    end
    local pos = self:convertToWorldSpace(cc.p(self.mClickAreaRect.x, self.mClickAreaRect.y))
    local x = pos.x
    self.mClickArea = cc.rect(x, pos.y, self.mClickAreaRect.width, self.mClickAreaRect.height)
    -- sslog("NodeClickWidget:calculateClickArea, mClickArea: [%f, %f, %f, %f]", self.mClickArea.x, self.mClickArea.y, self.mClickArea.width, self.mClickArea.height)
end

-- 设置点击区域, 有些图片有白边，需要自定义点击区域
function M:setClickArea(rect)
    self.mClickAreaRect = rect
end

function M:setSwallowTouches(isSwallowTouches, excludeAreaRect)
    self.mEventListener:setSwallowTouches(isSwallowTouches)
    self.mExcludeAreaRect = excludeAreaRect
end

function M:registerClickListener()
    local function onTouchBegan(touch, event)
        if self.mClickArea == nil or self.mRecalcClickAreaEveryTime then
            self:calculateClickArea()
        end

        local location = touch:getLocation()

        if self.mExcludeAreaRect then
            -- 不吞噬事件区域
            if cc.rectContainsPoint(self.mExcludeAreaRect, location) then
                return false
            end
        end

        if self.mOutClickListener ~= nil then
            return true
        end

        if cc.rectContainsPoint(self.mClickArea, location) then
            return true
        end
        return false
    end


    -- 触摸结束
    local function onTouchEnded(touch, event)
        -- 获取点击位置
        local location = touch:getLocation()
        -- sslogWithTag("NodeWrapperWidget", "onTouchEnded location: %f, %f", location.x, location.y)

        local location = touch:getLocation()

        if cc.rectContainsPoint(self.mClickArea, location) then
            if self.mClickListener then
                self.mClickListener(self.mTargetNode)
            end
        elseif self.mOutClickListener ~= nil then
            self.mOutClickListener(self.mTargetNode)
        end
    end

    local listener = cc.EventListenerTouchOneByOne:create()
    self.mEventListener = listener
    -- 注册两个回调监听方法
    listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
    listener:registerScriptHandler(onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED )
    local eventDispatcher = self:getEventDispatcher()-- 事件派发器
    -- 绑定触摸事件到层当中
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, self)
end

return M
