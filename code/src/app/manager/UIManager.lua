local UIManagerConfig = require("app.config.UIManagerConfig")

local M = {}

local CONST_RELEASE_TIME = 30

local GlobleZorder = 0

local m_AllPanels = {}

function M:getPanel(name)
    if m_AllPanels[name] then
        m_AllPanels[name]._closeTime = CONST_RELEASE_TIME
        return m_AllPanels[name]
    end
end

function M:createPanel(name)
    local path = UIManagerConfig.UIFilePath[name]
    local file = ""
    if path then
        file = path .. "." .. name
    else
        file = name
    end

    local panel = require(file).create()

    if panel then
        if panel.setName then
            panel:setName(name)
        end
    else
        Log.error("UIManager:createPanel(name) name %s 加载失败", name)
    end

    return panel
end

function M:createPanelOnly(name)
    local node = self:createPanel(name)
    node:resetRootNodePosition(cc.p(0, 0))
    node:resetRootNodeAnchorPoint(cc.p(0, 0))

    if not node then return end

    node["showToScene"] = function()
    end

    node["closePanel"] = function()
    end

    return node
end

function M:getOrCreatePanel(name)

    local panel = self:getPanel(name)
    if panel then
        return panel
    end

    local node = self:createPanel(name)

    if node then
        node:retainResource()
    end

    return node

end

function M:bindingAllNode(node, rootNode, events)
    local nodes = rootNode:getChildren()
    local _file = node:getFileName()
    for i, value in ipairs(nodes) do
        local name = value:getName()
        local _names=string.split(name, "_")
        local _len=#_names
        if value.setCascadeOpacityEnabled then
            --print("初始化节点的透明的可以设置")
            value:setCascadeOpacityEnabled(true)
            value:setCascadeColorEnabled(true)
        end
        if _names[_len] then
            if _names[_len] == "TT" then
                local data = DataManager:getTbxData("UIMultiLanguage",_file..name)
                if data then
    
                    value:setString(data.Text)
                else
                    --Log.info("不需要多语言 节点：",_file,name)
                end
                --更换字体
                local _fontName=value:getFontName()
                local _fonts=string.split(_fontName,"/")
                if g_UserData and g_UserData:getSystemLanguage() == Enum.LanguageType.en then
                    value:setFontName("font/en/font/".._fonts[#_fonts])
                else
                    value:setFontName("font/".._fonts[#_fonts])
                end
            elseif _names[_len] == "S" then
                --使用系统字体
                value:setFontName("Thonburi")
                value:setFontSize(24)
            elseif _names[_len] == "O" then
                --不更换字体
            elseif _names[_len] == "IVT" then
                local fileName = value:getImageFileName()
                --Log.info("IVT图片节点资源名"..fileName)
                --Log.info("IVT当前选择语言："..g_UserData:getSystemLanguage())
                if g_UserData:getSystemLanguage() == Enum.LanguageType.zh_tw then
                    local newFimename = string.gsub(fileName,"_[a-zA-z]+.png","_zh_TW.png",1);
                    if cc.SpriteFrameCache:getInstance():getSpriteFrame(newFimename) then
                        value:loadTexture(newFimename, ccui.TextureResType.plistType)
                    end
                elseif g_UserData:getSystemLanguage() == Enum.LanguageType.en  then
                    local newFimename = string.gsub(fileName,"_[a-zA-z]+.png","_en.png",1);
                    --Log.info("图片节点资源名"..newFimename)
                    if cc.SpriteFrameCache:getInstance():getSpriteFrame(newFimename) then
                        value:loadTexture(newFimename, ccui.TextureResType.plistType)
                    end
                elseif g_UserData:getSystemLanguage() == Enum.LanguageType.zh_cn  then
                    local newFimename = string.gsub(fileName,"_[a-zA-z]+.png","_zh_CN.png",1);
                    --Log.info("图片节点资源名"..newFimename)
                    if cc.SpriteFrameCache:getInstance():getSpriteFrame(newFimename) then
                        value:loadTexture(newFimename, ccui.TextureResType.plistType)
                    end
                end
            elseif _names[_len] == "SVT" then
                local fileName = value:getImageFileName()
                --Log.info("SVT图片节点资源名"..fileName)
                --Log.info("SVT当前选择语言："..g_UserData:getSystemLanguage())
                if g_UserData and g_UserData:getSystemLanguage() == Enum.LanguageType.zh_tw then
                    local newFimename = string.gsub(fileName,"_[a-zA-z]+.png","_zh_TW.png",1);
                    --Log.info("图片节点资源名"..newFimename)
                    if cc.SpriteFrameCache:getInstance():getSpriteFrame(newFimename) then
                        value:initWithSpriteFrameName(newFimename)
                    end
                elseif g_UserData and g_UserData:getSystemLanguage() == Enum.LanguageType.en  then
                    local newFimename = string.gsub(fileName,"_[a-zA-z]+.png","_en.png",1);
                    --Log.info("图片节点资源名"..newFimename)
                    if cc.SpriteFrameCache:getInstance():getSpriteFrame(newFimename) then
                        value:initWithSpriteFrameName(newFimename)
                    end
                elseif g_UserData and g_UserData:getSystemLanguage() == Enum.LanguageType.zh_cn  then
                    local newFimename = string.gsub(fileName,"_[a-zA-z]+.png","_zh_CN.png",1);
                    --Log.info("图片节点资源名"..newFimename)
                    if cc.SpriteFrameCache:getInstance():getSpriteFrame(newFimename) then
                        value:initWithSpriteFrameName(newFimename)
                    end
                end
            else
                if "Label"==value:getDescription() then
                    local _fontName=value:getFontName()
                    local _fonts=string.split(_fontName,"/")

                    if g_UserData and g_UserData:getSystemLanguage() == Enum.LanguageType.en then
                        value:setFontName("font/en/font/".._fonts[#_fonts])
                    else
                        value:setFontName("font/".._fonts[#_fonts])
                    end
                end
            end
        end
        if events[name] then
            if events[name]["varname"] then
                node[events[name]["varname"]] = value
            end
            if events[name]["onClick"] then
                value:addClickEventListener(handler(node, node[events[name].onClick]))
            end
            --if events[name]["onTouch"] then
            --    value:addTouchEventListener(handler(node, node[events[name].onTouch]))
            --end
            if events[name]["onEvent"] then
                value:addTouchEventListener(function(ref,type)
                    local data = {}
                    local beginPos = ref
                    data.node = ref
                    if type == 0 then
                        data.event = "begin"
                    elseif type ==1 then
                        data.event = "move"
                    elseif type ==2 then
                        local touchBeginPos = ref:getTouchBeganPosition()
                        local touchEndPos = ref:getTouchEndPosition()
                        local dis = ccpDistance(touchBeginPos,touchEndPos)
                        data.event = "end"
                        if dis > 10 then
                            data.event = "cancel"
                        end
                    else
                        data.event = "cancel"
                    end
                    local func = handler(node, node[events[name].onEvent])
                    func(data)
                    --return true
                end)
            end
        end
        if value["reBindingAllNode"] then 
            value:reBindingAllNode()
        else
            self:bindingAllNode(node, value, events)
        end
    end
end

function M:closePanel(panel, time)
    if not panel then return end
    local name = panel:getName()
    if not name then return end

    --防止重复关闭界面
    if (not m_AllPanels[name]) or (not m_AllPanels[name]._isOpening and not m_AllPanels[name]._isOpen) then 
        return
    end

    Log.log("关闭界面:%s", tostring(name))

    m_AllPanels[name]._isOpen = false
    m_AllPanels[name]._isOpening = false
    m_AllPanels[name]._closeTime = CONST_RELEASE_TIME

    if time then
        m_AllPanels[name]._closeTime = time
    end

    local zorder = UIManagerConfig.UIZOrderSeting[name]
    if zorder then
        -- pass
    else
        GlobleZorder = GlobleZorder - 1
    end

    SceneManager:getRunScene():removePanel(name, panel)

    panel:onToBack()
    panel:removeFromParent()

end

function M:closeAllPanel()
    for name, panel in pairs(m_AllPanels) do
        self:closePanel(panel, 0)
    end
end

function M:reloadPanel(name)
    local path = UIManagerConfig.UIFilePath[name]
    if path then
        local panel = path .. "." .. name
        package.loaded[panel] = nil
        require(panel) 
    else
        Log.log("reload %s error, no config path", name)
    end
end

function M:reloadAllPanel()
    for name, panel in pairs(m_AllPanels) do
        self:reloadPanel(name)
    end
end
function M:reBindAllNode()
    --reBindingAllNode
    for name, panel in pairs(m_AllPanels) do
        --self:reloadPanel(name)
        
        if panel and panel ~=nil then
            if panel._isOpen then
                panel:reBindingAllNode()
            else
                panel._closeTime = 0
            end
        end
    end
end

function M:isPanelOpenOrOpening(name)
    local panel = self:getPanel(name)
    if panel then
        return panel._isOpen or panel._isOpening
    else
        return false
    end
end

function M:showPanel(panel)
    if not panel then return end

    if panel._isOpening then return end

    panel._isOpen = true
    panel._closeTime = 0
    panel._isOpening = false

    local name = panel:getName()
    Log.log("打开界面:%s", tostring(name))
    if not m_AllPanels[name] then
        m_AllPanels[name] = panel
    end

    local zorder = UIManagerConfig.UIZOrderSeting[name]
    if zorder then
        panel:setLocalZOrder(zorder)
    else
        panel:setLocalZOrder(GlobleZorder)
        GlobleZorder = GlobleZorder + 1
    end

    SceneManager:getRunScene():addPanel(name, panel)

    panel:onInit()
end


function M:onUpdate(dt)
    self:handlerAllPanelEvent(dt)
end

function M:handlerAllPanelEvent(dt)
    for k, v in pairs(m_AllPanels) do

        local _isopen = v._isOpen
        local _isOpening = v._isOpening
        local _closeTime = v._closeTime

        if _isopen and not _isOpening then
            local scene = display.getRunningScene()
            if scene then
                if _isOpening then
                    -- pass
                else
                    scene:addChild(v)
                    v._isOpening = true
                end
            end
        elseif not _isopen then
            if _closeTime > 0 then
                v._closeTime = v._closeTime - dt
            else
                Log.log("界面开始卸载:%s", tostring(k))
                v:releaseResource()
                m_AllPanels[k] = nil
            end
        end

        if v["OnUpdate"] and type(v["OnUpdate"]) == "function" and v._isOpen then
            v:OnUpdate(dt)
        end

    end
end


return M