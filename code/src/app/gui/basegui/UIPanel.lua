local UIBase = require("app.gui.basegui.UIBase")
local M = class("UIPanel", UIBase)

function M:onCreate()
    M.super.onCreate(self)

    self.m_layerColor = nil

    local listener = cc.EventListenerTouchOneByOne:create()
    listener:registerScriptHandler(handler(self, self.onToucheBegan), cc.Handler.EVENT_TOUCH_BEGAN)
    listener:registerScriptHandler(handler(self, self.onTouchMoved), cc.Handler.EVENT_TOUCH_MOVED)
    listener:registerScriptHandler(handler(self, self.onTouchEnded), cc.Handler.EVENT_TOUCH_ENDED)
    listener:registerScriptHandler(handler(self, self.onTouchCanceled), cc.Handler.EVENT_TOUCH_CANCELLED)
    local eventDispatcher = self:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, self)
end

function M:setShadeShowModel(isShow, opacity)

    if not isShow then return end

    if (not self.m_layerColor or self.m_layerColor ~= nil) then
        local s = cc.size(display.width, display.height)
        self.m_layerColor = ccui.Layout:create()
        self.m_layerColor:setContentSize(s.width, s.height)
        self.m_layerColor:setBackGroundColorType(ccui.LayoutBackGroundColorType.solid)
        self.m_layerColor:setBackGroundColor(cc.c3b(0, 0, 0))

        if isShow then
            if opacity then
                self.m_layerColor:setBackGroundColorOpacity(opacity)
            else
                --默认70%
                self.m_layerColor:setBackGroundColorOpacity(178)
            end
        else
            self.m_layerColor:setBackGroundColorOpacity(0)
        end

        self.m_layerColor:setLocalZOrder(-1)
        self.m_layerColor:setTouchEnabled(true)
        self.m_layerColor:addTouchEventListener(handler(self, self.onScreenTouchEvent))

        self:addChild(self.m_layerColor)
    end

end

function M:onScreenTouchEvent(ref, event)
    if event == 0 then
        if self.onCloseEvent and type(self.onCloseEvent) == "function" then 
            self:onCloseEvent()
        end
    end
end

function M:onToucheBegan(touch, event)
    if self.onGameTouchBegin and type(self.onGameTouchBegin) == "function" then
        local pos = touch:getLocation()
        return self:onGameTouchBegin(pos)
    end

    return false
end

function M:onTouchMoved(touch, event)
    if self.onGameTouchMoved and type(self.onGameTouchMoved) == "function" then
        local pos = touch:getLocation()
        self:onGameTouchMoved(pos)
        return true
    end
    return false
end

function M:onTouchEnded(touch, event)
    if self.onGameTouchEnded and type(self.onGameTouchEnded) == "function" then
        local pos = touch:getLocation()
        self:onGameTouchEnded(pos)
        return true
    end
    return false
end

function M:onTouchCanceled(touch, event)
    if self.onGameTouchCanceled and type(self.onGameTouchCanceled) == "function" then
        local pos = touch:getLocation()
        self:onGameTouchCanceled(pos)
    end
    return true
end

function M:adaptationSize(size)
    M.super.adaptationSize(self, size)
    if not g_GameSettingData then return end
    
    local friangeTop = g_GameSettingData:getFringeScreenTop()
    local dyw = (size.height - 1280) / 2
    if dyw > 0 then
        if self.BelowLeftFit then
            self.BelowLeftFit:setPositionY(-dyw)
        end

        if self.UpLeftFit then
            self.UpLeftFit:setPositionY(dyw-friangeTop)
        end

        if self.BelowRightFit then
            self.BelowRightFit:setPositionY(-dyw)
        end

        if self.UpRightFit then
            self.UpRightFit:setPositionY(dyw-friangeTop)
        end
        if self.BelowLeftFit_1 then
            self.BelowLeftFit_1:setPositionY(-dyw)
        end

        if self.UpLeftFit_1 then
            self.UpLeftFit_1:setPositionY(dyw-friangeTop)
        end

        if self.BelowRightFit_1 then
            self.BelowRightFit_1:setPositionY(-dyw)
        end

        if self.UpRightFit_1 then
            self.UpRightFit_1:setPositionY(dyw-friangeTop)
        end
        if self.BelowLeftFit_2 then
            self.BelowLeftFit_2:setPositionY(-dyw)
        end

        if self.UpLeftFit_2 then
            self.UpLeftFit_2:setPositionY(dyw-friangeTop)
        end

        if self.BelowRightFit_2 then
            self.BelowRightFit_2:setPositionY(-dyw)
        end

        if self.UpRightFit_2 then
            self.UpRightFit_2:setPositionY(dyw-friangeTop)
        end
        if self.BelowLeftFit_3 then
            self.BelowLeftFit_3:setPositionY(-dyw)
        end

        if self.UpLeftFit_3 then
            self.UpLeftFit_3:setPositionY(dyw-friangeTop)
        end

        if self.BelowRightFit_3 then
            self.BelowRightFit_3:setPositionY(-dyw)
        end

        if self.UpRightFit_3 then
            self.UpRightFit_3:setPositionY(dyw-friangeTop)
        end
    end
end

return M