local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UINoviceStartGuideLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_16_NoviceGuide.01_16_NoviceStartGuideLayer.lua"

M.BINDGUIDATANODE = {
    ["StartPanel"]={varname="StartPanel",onClick="onClickEvent"},
    ["NoviceStartGuide"]={varname="NoviceStartGuide"},
    ["MaskingBg_1"]={varname="MaskingBg_1"},
    ["MaskingBg_2"]={varname="MaskingBg_2"},
    ["GuideImage_1"]={varname="GuideImage_1"},
    ["Bg_2"]={varname="Bg_2"},
    ["NoviceGuideText_1_TT"]={varname="NoviceGuideText_1_TT"},
    ["GuideAnimationNode"]={varname="GuideAnimationNode"},
    ["GuideImage_2"]={varname="GuideImage_2"}
}

function M:onClickEvent()
    self:closePanel()
    g_HotData:setGuideStep(3)
    g_HotData:C2S_guideStepUpdate(3)
    DataManager:dispatchMessage(Constant.CustomEvent.StartGame)
end

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true,0.75*1)
    self.GuideImage_2:setVisible(false)
    local _effect = Utils.onlyCreateEffect(GSystem.NoviceGuideHandAnimation,cc.p(-10,-10),true)
    if _effect then
        local size = self.GuideAnimationNode:getContentSize()
        _effect:setPosition(cc.p(size.width/2,size.height/2))
        self.GuideAnimationNode:addChild(_effect)
    end

    self.MaskingBg_1:setVisible(false)
    self.MaskingBg_2:setVisible(false)
    self.Bg_2:setLocalZOrder(9998)
    self.GuideImage_1:setLocalZOrder(9997)
    self.NoviceGuideText_1_TT:setLocalZOrder(9999)
    self.GuideAnimationNode:setLocalZOrder(9996)
    --模板
    local _x,_y=self.MaskingBg_2:getPosition()
    local _size=self.MaskingBg_2:getContentSize()
    local draw = cc.DrawNode:create()
    draw:drawSolidRect(cc.p(-100,-50), cc.p(80,30), cc.c4f(1,0,0,1))

    
    local bg = cc.Sprite:create()
    bg:initWithSpriteFrameName("00_01_Common/picture_056.png")
    bg:setContentSize(cc.size(4000,4000))
    bg:setOpacity(255*0.75)
    local m_clip = cc.ClippingNode:create()
    --设置模板
    m_clip:setStencil(draw)
    m_clip:setPosition(cc.p(_x,_y))
    --是否裁剪模板之外的内容
    m_clip:setInverted(true)
    --设置阿发值
    m_clip:setAlphaThreshold(1)
    self.NoviceStartGuide:addChild(m_clip)

    m_clip:addChild(bg)
end

function M:onInit()
    M.super.onInit(self)

end


function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
    
end

function M:onCleanup()
    M.super.onCleanup(self)
end

return M