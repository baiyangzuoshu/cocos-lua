--------------------------------------------------------------
-- This file was automatically generated by Cocos Studio.
-- Do not make changes to this file.
-- All changes will be lost.
--------------------------------------------------------------

local luaExtend = require("csd.LuaScript.LuaExtend")

-- using for layout to decrease count of local variables
local layout = nil
local localLuaFile = nil
local innerCSD = nil
local innerProject = nil
local localFrame = nil

local Result = {}	
Result["MPLISTLISTDATA"] = { 	
"ui/00_01_Common/00_01_Common_1.plist",	
"ui/01_16_NoviceGuidance/01_16_NoviceGuidance_1.plist",	
"ui/Default/Default_1.plist",	
}	

------------------------------------------------------------
-- function call description
-- create function caller should provide a function to 
-- get a callback function in creating scene process.
-- the returned callback function will be registered to 
-- the callback event of the control.
-- the function provider is as below :
-- Callback callBackProvider(luaFileName, node, callbackName)
-- parameter description:
-- luaFileName  : a string, lua file name
-- node         : a Node, event source
-- callbackName : a string, callback function name
-- the return value is a callback function
------------------------------------------------------------
function Result.create(callBackProvider)

local result={}
setmetatable(result, luaExtend)

--Create Layer
local Layer=cc.Node:create()
Layer:setName("Layer")
layout = ccui.LayoutComponent:bindLayoutComponent(Layer)
layout:setSize({width = 720.0000, height = 1280.0000})

--Create NoviceStartGuide
local NoviceStartGuide=cc.Node:create()
NoviceStartGuide:setName("NoviceStartGuide")
NoviceStartGuide:setTag(500)
NoviceStartGuide:setCascadeColorEnabled(true)
NoviceStartGuide:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(NoviceStartGuide)
layout:setRightMargin(720.0000)
layout:setTopMargin(1280.0000)
Layer:addChild(NoviceStartGuide)

--Create MaskingBg_1
local MaskingBg_1 = ccui.ImageView:create()
MaskingBg_1:ignoreContentAdaptWithSize(false)
MaskingBg_1:loadTexture("00_01_Common/picture_056.png", 1)
MaskingBg_1:setScale9Enabled(true)
MaskingBg_1:setCapInsets({x = 0, y = 0, width = 1, height = 1})
MaskingBg_1:setLayoutComponentEnabled(true)
MaskingBg_1:setName("MaskingBg_1")
MaskingBg_1:setTag(98)
MaskingBg_1:setCascadeColorEnabled(true)
MaskingBg_1:setCascadeOpacityEnabled(true)
MaskingBg_1:setAnchorPoint(0.0000, 0.0000)
MaskingBg_1:setPosition(0.0000, 1.0000)
MaskingBg_1:setOpacity(127)
layout = ccui.LayoutComponent:bindLayoutComponent(MaskingBg_1)
layout:setSize({width = 720.0000, height = 1600.0000})
layout:setRightMargin(-720.0000)
layout:setTopMargin(-1601.0000)
layout:setBottomMargin(1.0000)
NoviceStartGuide:addChild(MaskingBg_1)

--Create GuideImage_1
local GuideImage_1 = ccui.ImageView:create()
GuideImage_1:ignoreContentAdaptWithSize(false)
GuideImage_1:loadTexture("01_16_NoviceGuidance/picture_103.png", 1)
GuideImage_1:setScale9Enabled(true)
GuideImage_1:setCapInsets({x = 143, y = 285, width = 363, height = 236})
GuideImage_1:setLayoutComponentEnabled(true)
GuideImage_1:setName("GuideImage_1")
GuideImage_1:setTag(19)
GuideImage_1:setCascadeColorEnabled(true)
GuideImage_1:setCascadeOpacityEnabled(true)
GuideImage_1:setPosition(251.0000, 622.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(GuideImage_1)
layout:setSize({width = 649.0000, height = 806.0000})
layout:setLeftMargin(-73.5000)
layout:setRightMargin(-575.5000)
layout:setTopMargin(-1025.0000)
layout:setBottomMargin(219.0000)
NoviceStartGuide:addChild(GuideImage_1)

--Create MaskingBg_2
local MaskingBg_2 = ccui.ImageView:create()
MaskingBg_2:ignoreContentAdaptWithSize(false)
MaskingBg_2:loadTexture("Default/ImageFile.png", 1)
MaskingBg_2:setScale9Enabled(true)
MaskingBg_2:setCapInsets({x = 2, y = 2, width = 42, height = 42})
MaskingBg_2:setLayoutComponentEnabled(true)
MaskingBg_2:setName("MaskingBg_2")
MaskingBg_2:setTag(99)
MaskingBg_2:setCascadeColorEnabled(true)
MaskingBg_2:setCascadeOpacityEnabled(true)
MaskingBg_2:setPosition(526.9999, 165.0002)
layout = ccui.LayoutComponent:bindLayoutComponent(MaskingBg_2)
layout:setSize({width = 680.0000, height = 420.0000})
layout:setLeftMargin(186.9999)
layout:setRightMargin(-866.9999)
layout:setTopMargin(-375.0002)
layout:setBottomMargin(-44.9998)
NoviceStartGuide:addChild(MaskingBg_2)

--Create Bg_2
local Bg_2 = ccui.ImageView:create()
Bg_2:ignoreContentAdaptWithSize(false)
Bg_2:loadTexture("01_16_NoviceGuidance/frame_118.png", 1)
Bg_2:setScale9Enabled(true)
Bg_2:setCapInsets({x = 17, y = 55, width = 328, height = 58})
Bg_2:setLayoutComponentEnabled(true)
Bg_2:setName("Bg_2")
Bg_2:setTag(502)
Bg_2:setCascadeColorEnabled(true)
Bg_2:setCascadeOpacityEnabled(true)
Bg_2:setPosition(386.0000, 657.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Bg_2)
layout:setSize({width = 362.0000, height = 168.0000})
layout:setLeftMargin(205.0000)
layout:setRightMargin(-567.0000)
layout:setTopMargin(-741.0000)
layout:setBottomMargin(573.0000)
NoviceStartGuide:addChild(Bg_2)

--Create NoviceGuideText_1_TT
local NoviceGuideText_1_TT = ccui.Text:create()
NoviceGuideText_1_TT:ignoreContentAdaptWithSize(false)
NoviceGuideText_1_TT:setFontName("font/Default.ttf")
NoviceGuideText_1_TT:setFontSize(24)
NoviceGuideText_1_TT:setString([[    点击吹牛模式开始按钮]])
NoviceGuideText_1_TT:setTextVerticalAlignment(1)
NoviceGuideText_1_TT:setLayoutComponentEnabled(true)
NoviceGuideText_1_TT:setName("NoviceGuideText_1_TT")
NoviceGuideText_1_TT:setTag(503)
NoviceGuideText_1_TT:setCascadeColorEnabled(true)
NoviceGuideText_1_TT:setCascadeOpacityEnabled(true)
NoviceGuideText_1_TT:setAnchorPoint(0.0000, 0.5000)
NoviceGuideText_1_TT:setPosition(228.0000, 659.0000)
NoviceGuideText_1_TT:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(NoviceGuideText_1_TT)
layout:setSize({width = 313.0000, height = 100.0000})
layout:setLeftMargin(228.0000)
layout:setRightMargin(-541.0000)
layout:setTopMargin(-709.0000)
layout:setBottomMargin(609.0000)
NoviceStartGuide:addChild(NoviceGuideText_1_TT)

--Create StartPanel
local StartPanel = ccui.Layout:create()
StartPanel:ignoreContentAdaptWithSize(false)
StartPanel:setClippingEnabled(false)
StartPanel:setBackGroundColorOpacity(102)
StartPanel:setTouchEnabled(true);
StartPanel:setLayoutComponentEnabled(true)
StartPanel:setName("StartPanel")
StartPanel:setTag(39)
StartPanel:setCascadeColorEnabled(true)
StartPanel:setCascadeOpacityEnabled(true)
StartPanel:setAnchorPoint(0.5000, 0.5000)
StartPanel:setPosition(531.4990, 83.9995)
layout = ccui.LayoutComponent:bindLayoutComponent(StartPanel)
layout:setSize({width = 241.0000, height = 136.0000})
layout:setLeftMargin(410.9990)
layout:setRightMargin(-651.9990)
layout:setTopMargin(-151.9995)
layout:setBottomMargin(15.9995)
NoviceStartGuide:addChild(StartPanel)

--Create GuideAnimationNode
local GuideAnimationNode=cc.Node:create()
GuideAnimationNode:setName("GuideAnimationNode")
GuideAnimationNode:setTag(146)
GuideAnimationNode:setCascadeColorEnabled(true)
GuideAnimationNode:setCascadeOpacityEnabled(true)
GuideAnimationNode:setPosition(558.9988, 77.9990)
layout = ccui.LayoutComponent:bindLayoutComponent(GuideAnimationNode)
layout:setLeftMargin(558.9988)
layout:setRightMargin(-558.9988)
layout:setTopMargin(-77.9990)
layout:setBottomMargin(77.9990)
NoviceStartGuide:addChild(GuideAnimationNode)

--Create GuideImage_2
local GuideImage_2 = ccui.ImageView:create()
GuideImage_2:ignoreContentAdaptWithSize(false)
GuideImage_2:loadTexture("01_16_NoviceGuidance/icon_067.png", 1)
GuideImage_2:setScale9Enabled(true)
GuideImage_2:setCapInsets({x = 41, y = 44, width = 44, height = 48})
GuideImage_2:setLayoutComponentEnabled(true)
GuideImage_2:setName("GuideImage_2")
GuideImage_2:setTag(41)
GuideImage_2:setCascadeColorEnabled(true)
GuideImage_2:setCascadeOpacityEnabled(true)
GuideImage_2:setPosition(615.9990, 17.9987)
layout = ccui.LayoutComponent:bindLayoutComponent(GuideImage_2)
layout:setSize({width = 126.0000, height = 136.0000})
layout:setLeftMargin(552.9990)
layout:setRightMargin(-678.9990)
layout:setTopMargin(-85.9987)
layout:setBottomMargin(-50.0013)
NoviceStartGuide:addChild(GuideImage_2)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result
