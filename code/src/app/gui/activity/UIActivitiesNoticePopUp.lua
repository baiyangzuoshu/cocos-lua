local UIPanel = require("app.gui.basegui.UIPanel")

local M = class("UIActivitiesNoticePopUp", UIPanel)

M.GUI_FILE_NAME = "csd.01_11_ActivitiesBulletin.01_11_ActivitiesNoticePopUp.lua"

M.BINDGUIDATANODE = {
    ["CloseButton"]={varname="CloseButton",onClick="onClickEvent"},
    ["ContenetText"]={varname="ContenetText"},
    ["NoticeSlider"]={varname="NoticeSlider"},
}

function M:onClickEvent(ref)
    local   name=ref:getName()
    if "CloseButton"==name then
        self:closePanel()
    end
end

function M:showNotice(str)
    self.txtScrollView:removeAllChildren()
    local txt=self.ContenetText:clone()
    txt:setVisible(true)
    txt:setAnchorPoint(cc.p(0,1))
    txt:setPosition(cc.p(0,0))
    txt:setString(str)
    txt:ignoreContentAdaptWithSize(false)
    self.txtScrollView:addChild(txt)

    local lineWidthSize=math.ceil(265/8)
    local lineSizeHeight=math.ceil(190/8)
    local len=Utils.getCharacters(str,2)
    local curRow=math.ceil(len/lineWidthSize)+3--预留3行高度
    local curHeight=curRow*lineSizeHeight;
    if curHeight<self.ContenetText:getContentSize().height then
        curHeight=self.ContenetText:getContentSize().height
    end
    txt:setPosition(cc.p(0,curHeight))
    txt:setContentSize(cc.size(self.ContenetText:getContentSize().width,curHeight))
    self.txtScrollView:setInnerContainerSize(cc.size(self.ContenetText:getContentSize().width,curHeight))
end

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)
    self.ContenetText:setVisible(false)
    self.NoticeSlider:setVisible(false)
    --邮件详情文本滚动ScrollView
    local parent=self.ContenetText:getParent()
    self.txtScrollView = ccui.ScrollView:create()
    self.txtScrollView:setTouchEnabled(true)
    self.txtScrollView:setBounceEnabled(true)
    self.txtScrollView:setDirection(ccui.ScrollViewDir.vertical)
    self.txtScrollView:setScrollBarEnabled(false)
    self.txtScrollView:setContentSize(self.ContenetText:getContentSize())
    self.txtScrollView:setPosition(cc.p(50,150))
    self.txtScrollView:setAnchorPoint(cc.p(0,0))
    parent:addChild(self.txtScrollView)
end

function M:onInit()
    M.super.onInit(self)
end

return M