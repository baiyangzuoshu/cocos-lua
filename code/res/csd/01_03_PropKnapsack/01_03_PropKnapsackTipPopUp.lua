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
"ui/03_01_Shop/03_01_Shop_1.plist",	
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
layout:setSize({width = 580.0000, height = 646.0000})

--Create Bg
local Bg=cc.Node:create()
Bg:setName("Bg")
Bg:setTag(64)
Bg:setCascadeColorEnabled(true)
Bg:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Bg)
layout:setRightMargin(580.0000)
layout:setTopMargin(646.0000)
Layer:addChild(Bg)

--Create InteractionPopups
local InteractionPopups = ccui.Layout:create()
InteractionPopups:ignoreContentAdaptWithSize(false)
InteractionPopups:setClippingEnabled(false)
InteractionPopups:setBackGroundColorOpacity(102)
InteractionPopups:setTouchEnabled(true);
InteractionPopups:setLayoutComponentEnabled(true)
InteractionPopups:setName("InteractionPopups")
InteractionPopups:setTag(65)
InteractionPopups:setCascadeColorEnabled(true)
InteractionPopups:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(InteractionPopups)
layout:setSize({width = 580.0000, height = 646.0000})
layout:setRightMargin(-580.0000)
layout:setTopMargin(-646.0000)
Bg:addChild(InteractionPopups)

--Create Bg_1
local Bg_1 = ccui.ImageView:create()
Bg_1:ignoreContentAdaptWithSize(false)
Bg_1:loadTexture("03_01_Shop/frame_122.png", 1)
Bg_1:setLayoutComponentEnabled(true)
Bg_1:setName("Bg_1")
Bg_1:setTag(568)
Bg_1:setCascadeColorEnabled(true)
Bg_1:setCascadeOpacityEnabled(true)
Bg_1:setAnchorPoint(0.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Bg_1)
layout:setSize({width = 580.0000, height = 646.0000})
layout:setRightMargin(-580.0000)
layout:setTopMargin(-646.0000)
Bg:addChild(Bg_1)

--Create MIddle
local MIddle=cc.Node:create()
MIddle:setName("MIddle")
MIddle:setTag(67)
MIddle:setCascadeColorEnabled(true)
MIddle:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(MIddle)
layout:setRightMargin(580.0000)
layout:setTopMargin(646.0000)
Layer:addChild(MIddle)

--Create TitleText
local TitleText = ccui.Text:create()
TitleText:ignoreContentAdaptWithSize(true)
TitleText:setTextAreaSize({width = 0, height = 0})
TitleText:setFontName("font/Font001.ttf")
TitleText:setFontSize(32)
TitleText:setString([[道具名]])
TitleText:setLayoutComponentEnabled(true)
TitleText:setName("TitleText")
TitleText:setTag(577)
TitleText:setCascadeColorEnabled(true)
TitleText:setCascadeOpacityEnabled(true)
TitleText:setPosition(290.0000, 162.0001)
layout = ccui.LayoutComponent:bindLayoutComponent(TitleText)
layout:setSize({width = 96.0000, height = 42.0000})
layout:setLeftMargin(242.0000)
layout:setRightMargin(-338.0000)
layout:setTopMargin(-183.0001)
layout:setBottomMargin(141.0001)
MIddle:addChild(TitleText)

--Create PropIcon
local PropIcon = ccui.ImageView:create()
PropIcon:ignoreContentAdaptWithSize(false)
PropIcon:loadTexture("Default/ImageFile.png", 1)
PropIcon:setLayoutComponentEnabled(true)
PropIcon:setName("PropIcon")
PropIcon:setTag(69)
PropIcon:setCascadeColorEnabled(true)
PropIcon:setCascadeOpacityEnabled(true)
PropIcon:setPosition(290.0000, 425.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(PropIcon)
layout:setSize({width = 336.0000, height = 320.0000})
layout:setLeftMargin(122.0000)
layout:setRightMargin(-458.0000)
layout:setTopMargin(-585.0000)
layout:setBottomMargin(265.0000)
MIddle:addChild(PropIcon)

--Create PropNum
local PropNum = ccui.Text:create()
PropNum:ignoreContentAdaptWithSize(true)
PropNum:setTextAreaSize({width = 0, height = 0})
PropNum:setFontName("font/Default.ttf")
PropNum:setFontSize(28)
PropNum:setString([[5000]])
PropNum:setTextHorizontalAlignment(2)
PropNum:setTextVerticalAlignment(1)
PropNum:setLayoutComponentEnabled(true)
PropNum:setName("PropNum")
PropNum:setTag(70)
PropNum:setCascadeColorEnabled(true)
PropNum:setCascadeOpacityEnabled(true)
PropNum:setPosition(290.0001, 85.0000)
PropNum:setOpacity(127)
layout = ccui.LayoutComponent:bindLayoutComponent(PropNum)
layout:setSize({width = 66.0000, height = 37.0000})
layout:setLeftMargin(257.0001)
layout:setRightMargin(-323.0001)
layout:setTopMargin(-103.5000)
layout:setBottomMargin(66.5000)
MIddle:addChild(PropNum)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

