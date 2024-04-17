cc.exports.UIUtils = {}
local UIManagerConfig = require("app.config.UIManagerConfig")

function UIUtils.popToast(str)
    local panel = UIManager:createPanelOnly("UISystemTipsLayer") 
    if panel then
        panel:setPopToastStr(str)
        local zorder = UIManagerConfig.UIZOrderSeting["UISystemTipsLayer"]
        if zorder then 
            panel:setLocalZOrder(zorder)
        end
        display.getRunningScene():addChild(panel)
    end
end

function UIUtils.popToadtByMessageId(id)
    local SystemMessage = DataManager:getTbxData("SystemMessage",id)
    if SystemMessage then
        Log.print_table(SystemMessage,1)
        UIUtils.popToast(SystemMessage.Msg)
    end
end

function UIUtils.getMagicNodeInNode(node)
    local ret = node:getChildByName("KZ_MAGIC_ANIMATION")

    local scaleX = node:getScaleX()
    local scaleY = node:getScaleY()

    if not ret then
        ret = kz.MagicAnimation:create()
        node:addChild(ret, 1, "KZ_MAGIC_ANIMATION")
    end

    ret:setScale(scaleX, scaleY)

    return ret
end

function UIUtils.addClickableNode(container, onClickListener, onOutAreaClickListener)
    local ClickableNode = require("app.otherNode.ClickableNode")
    local node = ClickableNode.create(nil, onClickListener, container:getContentSize())
    node:setOutAreaClickListener(onOutAreaClickListener)
    container:addChild(node)

    return node
end

function UIUtils.showLoadingLayer(delay, time)
    local panel = UIManager:getOrCreatePanel("UILoadingLayer")
    if panel then
        panel:setDelayTime(delay)
        panel:setShowTime(time)
        panel:showToScene()
    end
end

function UIUtils.closeLoadingLayer()
    local panel = UIManager:getPanel("UILoadingLayer")
    if panel then
        panel:closePanel()
    end
end