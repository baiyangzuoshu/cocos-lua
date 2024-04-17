local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIGameRulesLayer", UIPanel)

M.GUI_FILE_NAME = "csd.0_general.0_02_rule.0_02_1_RuleLayer.lua"

M.BINDGUIDATANODE = {
    ["DeleteButton"] = { varname = "CloseButton", onClick = "onCloseButtonClick" },

    ["ContentListView"] = { varname = "ContentListView", onEvent = "onContentListViewEventCallback" },
    ["ContentBg"] = { varname = "ContentNode" },

    ["VerticalSlider"] = { varname = "VerticalSlider", onEvent = "onVerticalSliderClick" },

}

local min_slider_percent = 7
local max_slider_percent = 93

local ChangeType = {
    NULL = -1,
    SLIDER_BAR = 1,
    SCROLL_VIEW = 2,
}

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)

    local ContentSize = self.ContentNode:getContentSize()
    self.ContentListView:setInnerContainerSize(ContentSize)
    self.ContentListView:setScrollBarEnabled(false)

    self.ContentNode:setAnchorPoint(0, 0)
    self.ContentNode:setPosition(0, 0)
end

function M:onEnter()
    M.super.onEnter(self)

    self.mScrollBarState = ChangeType.NULL

end

function M:onCloseButtonClick()
    self:closePanel()
end

function M:getPercentBySlider(slider)
    local percent = slider:getPercent()
    if percent < min_slider_percent then
        slider:setPercent(min_slider_percent)
        percent = min_slider_percent
    elseif percent > max_slider_percent then
        slider:setPercent(max_slider_percent)
        percent = max_slider_percent
    end

    local newPercent = math.ceil((percent - min_slider_percent) * 100 / (max_slider_percent - min_slider_percent))
    if newPercent < 0 then
        newPercent = 0
    elseif newPercent > 100 then
        newPercent = 100
    end

    return newPercent
end

function M:getPercentByScrollView(scrollView)
    local percent = scrollView:getScrolledPercentVertical()
    Log.log("percent %d", percent)

    local newPercent = math.ceil(percent * (max_slider_percent - min_slider_percent) / 100) + min_slider_percent
    if newPercent < min_slider_percent then
        newPercent = min_slider_percent
    elseif newPercent > max_slider_percent then
        newPercent = max_slider_percent
    end
    Log.log("newPercent %d", newPercent)

    return newPercent
end

function M:onVerticalSliderClick(sender, eventType)
    if eventType == ccui.SliderEventType.slideBallUp or eventType == ccui.SliderEventType.slideBallCancel then
        self.mScrollBarState = ChangeType.NULL
    elseif eventType == ccui.SliderEventType.slideBallDown then
        self.mScrollBarState = ChangeType.SLIDER_BAR
    end

    if self.mScrollBarState == ChangeType.SLIDER_BAR then
        local percent = self:getPercentBySlider(sender)
        self.ContentListView:jumpToPercentVertical(percent)
    end
end

function M:onContentListViewEventCallback(sender, eventType)
    if self.mScrollBarState ~= ChangeType.SLIDER_BAR then
        self.mScrollBarState = ChangeType.SCROLL_VIEW
    end

    if self.mScrollBarState == ChangeType.SCROLL_VIEW then
        local percent = self:getPercentByScrollView(sender)
        self.VerticalSlider:setPercent(percent)
    end
end

return M