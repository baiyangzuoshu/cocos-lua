local M = class("UIBase", kz.LayerCustom)

local director = cc.Director:getInstance()

function M:ctor()
    self.mListeners = {}

    self:registerScriptHandler(handler(self, self.onNodeEvent))

    if self.GUI_FILE_NAME and string.len(self.GUI_FILE_NAME) > 0 then
        local root = require(self.GUI_FILE_NAME)
        if root then

            self:addPlistResourceMap(root["MPLISTLISTDATA"])

            local result = root.create()
            if result then
                self._rootNode = result["root"]
                self._animation = result["animation"]

                self:setContentSize(self._rootNode:getContentSize())

                self._rootNode:setAnchorPoint(cc.p(0.5, 0.5))

                local size = cc.Director:getInstance():getWinSize()
                self._rootNode:setPosition(cc.p(size.width / 2, size.height / 2))

                self:addChild(self._rootNode)
                self.BINDGUIDATANODE["BelowLeftFit"]={varname="BelowLeftFit"}
                self.BINDGUIDATANODE["UpLeftFit"]={varname="UpLeftFit"}
                self.BINDGUIDATANODE["BelowRightFit"]={varname="BelowRightFit"}
                self.BINDGUIDATANODE["UpRightFit"]={varname="UpRightFit"}
                self.BINDGUIDATANODE["BelowLeftFit_1"]={varname="BelowLeftFit_1"}
                self.BINDGUIDATANODE["UpLeftFit_1"]={varname="UpLeftFit_1"}
                self.BINDGUIDATANODE["BelowRightFit_1"]={varname="BelowRightFit_1"}
                self.BINDGUIDATANODE["UpRightFit_1"]={varname="UpRightFit_1"}
                self.BINDGUIDATANODE["BelowLeftFit_2"]={varname="BelowLeftFit_2"}
                self.BINDGUIDATANODE["UpLeftFit_2"]={varname="UpLeftFit_2"}
                self.BINDGUIDATANODE["BelowRightFit_2"]={varname="BelowRightFit_2"}
                self.BINDGUIDATANODE["UpRightFit_2"]={varname="UpRightFit_2"}
                self.BINDGUIDATANODE["BelowLeftFit_3"]={varname="BelowLeftFit_3"}
                self.BINDGUIDATANODE["UpLeftFit_3"]={varname="UpLeftFit_3"}
                self.BINDGUIDATANODE["BelowRightFit_3"]={varname="BelowRightFit_3"}
                self.BINDGUIDATANODE["UpRightFit_3"]={varname="UpRightFit_3"}

                UIManager:bindingAllNode(self, self._rootNode, self.BINDGUIDATANODE)
            end

        end
    end

    if self.onCreate then self:onCreate() end
end

function M:reBindingAllNode()
    UIManager:bindingAllNode(self, self, self.BINDGUIDATANODE)--个别页面的子页面addchild在self上，为了切换多语言时正确重加载，需对self下的所有子节点处理
    self:refreshLanguageHandle()
end

function M:refreshLanguageHandle()
    
end
-- function M:getContentSize()
--     return self._rootNode:getContentSize()
-- end
function M:getFileName()
    local _names = string.split(self.GUI_FILE_NAME, ".")

    return _names[#_names - 1]
end

function M:addPlistResourceMap(data)
    for i, v in ipairs(data) do
        self:addPlistResource(v)
    end
end

function M:addPlistResource(path)
    self:appendPlist(path)
end

function M:resetRootNodePosition(worldPos)
    if self._rootNode then
        local localPos = self:convertToNodeSpace(worldPos)
        self._rootNode:setPosition(localPos)
    end
end

function M:resetRootNodeAnchorPoint(pos)
    if self._rootNode then
        self._rootNode:setAnchorPoint(pos)
    end
end

function M:resetCenterPosition()
    if self._rootNode then
        self._rootNode:setAnchorPoint(cc.p(0, 0))
        local size = self._rootNode:getContentSize()
        self._rootNode:setPosition(cc.p(-0.5 * size.width, -0.5 * size.height))
    end
end

function M:onCreate()
    -- pass
    self:regAllEventMsg()

    self:adaptationSize(director:getWinSize())
    self:refreshLanguageHandle()
end

function M:adaptationSize(size)
    -- pass
end

function M:onInit()
    -- pass
end

function M:onToBack()
    -- pass
end

function M:onEnter()
    
end

function M:onExit()
    
end

function M:onClose()
    -- pass
end

function M:closePanel(time)
    if self.onClose then self:onClose() end
    UIManager:closePanel(self, time)
end

function M:showToScene()
    UIManager:showPanel(self)
end

function M:onEnterTransitionFinish()
    -- pass
end

function M:onExitTransitionStart()
    -- pass
end

function M:onCleanup()
    -- pass
    self:unregAllEventMsg()
end

function M:onNodeEvent(eventName, callback)
    if "enter" == eventName then
        self:onEnter()
    elseif "exit" == eventName then
        self:onExit()
    elseif "enterTransitionFinish" == eventName then
        self:onEnterTransitionFinish()
    elseif "exitTransitionStart" == eventName then
        self:onExitTransitionStart()
    elseif "cleanup" == eventName then
        -- pass
    elseif "distroy" == eventName then
        self:onCleanup()
    end

end

function M:retainResource()
    self:retain()
    if self._animation then
        self._animation:retain()
    end
end

function M:releaseResource()
    if self._animation then
        self._animation:release()
    end

    self:release()
end

function M:runTimelineAnimation(animationName, isLoop,animationEndCallback)
    local info = self._animation:getAnimationInfo(animationName)
    Log.print_table(info)
    local loop = false
    if isLoop then
        loop = true
    end
    if info ~= nil then
        if not self.mHasRunAction then
            self._animation:gotoFrameAndPlay(info.startIndex,info.endIndex, loop)
            self.mHasRunAction = true
            self._rootNode:runAction(self._animation)
        end
        --self._animation:play(animationName, isLoop or false)
        local timeSpeed = self._animation:getTimeSpeed()
        local duration = (info.endIndex - info.startIndex) / (timeSpeed * 60)

        if not isLoop then
            local function onAnimationFinish()
                self._rootNode:stopAction(self._animation)
                self.mHasRunAction = false
                
                if animationEndCallback then
                    animationEndCallback()
                end
            end
            self._rootNode:runAction(cc.Sequence:create(cc.DelayTime:create(duration), cc.CallFunc:create(onAnimationFinish)))
        end

        return duration
    end
end

function M:regAllEventMsg()
end

function M:unregAllEventMsg()
    for name, state in pairs(self.mListeners) do
        if state then
            DataManager:unRegisterMessage(name, self)
        end
    end
    self.mListeners = {}
end

function M:doRegEvent(name, callbackName)
    if not self.mListeners[name] then
        DataManager:registerMessageListener(name, self, callbackName)
        self.mListeners[name] = true
    else
        Log.warn("UIBase:doRegEvent, event %s repeat registration", name)
    end
end

function M:unregEventMsg(name)
    DataManager:unRegisterMessage(name, self)
    self.mListeners[name] = false
end

return M