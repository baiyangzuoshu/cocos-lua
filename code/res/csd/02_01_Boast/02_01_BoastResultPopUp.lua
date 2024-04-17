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
"ui/02_01_Boast/02_01_Boast_1.plist",	
"ui/02_01_Boast/02_01_Boast_2.plist",	
"ui/00_01_Common/00_01_Common_1.plist",	
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
layout:setSize({width = 323.0000, height = 134.0000})

--Create Result
local Result=cc.Node:create()
Result:setName("Result")
Result:setTag(754)
Result:setCascadeColorEnabled(true)
Result:setCascadeOpacityEnabled(true)
Result:setPosition(172.0000, 67.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Result)
layout:setPositionPercentX(0.5325)
layout:setPositionPercentY(0.5000)
layout:setLeftMargin(172.0000)
layout:setRightMargin(151.0000)
layout:setTopMargin(67.0000)
layout:setBottomMargin(67.0000)
Layer:addChild(Result)

--Create ResultBg
local ResultBg = ccui.ImageView:create()
ResultBg:ignoreContentAdaptWithSize(false)
ResultBg:loadTexture("02_01_Boast/frame_124.png", 1)
ResultBg:setLayoutComponentEnabled(true)
ResultBg:setName("ResultBg")
ResultBg:setTag(108)
ResultBg:setCascadeColorEnabled(true)
ResultBg:setCascadeOpacityEnabled(true)
ResultBg:setAnchorPoint(0.0000, 0.5000)
ResultBg:setPosition(-172.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ResultBg)
layout:setSize({width = 323.0000, height = 134.0000})
layout:setLeftMargin(-172.0000)
layout:setRightMargin(-151.0000)
layout:setTopMargin(-67.0000)
layout:setBottomMargin(-67.0000)
Result:addChild(ResultBg)

--Create ResultText_1_TT
local ResultText_1_TT = ccui.Text:create()
ResultText_1_TT:ignoreContentAdaptWithSize(true)
ResultText_1_TT:setTextAreaSize({width = 0, height = 0})
ResultText_1_TT:setFontName("font/Font001.ttf")
ResultText_1_TT:setFontSize(42)
ResultText_1_TT:setString([[Total]])
ResultText_1_TT:setTextHorizontalAlignment(1)
ResultText_1_TT:setTextVerticalAlignment(1)
ResultText_1_TT:setLayoutComponentEnabled(true)
ResultText_1_TT:setName("ResultText_1_TT")
ResultText_1_TT:setTag(611)
ResultText_1_TT:setCascadeColorEnabled(true)
ResultText_1_TT:setCascadeOpacityEnabled(true)
ResultText_1_TT:setAnchorPoint(1.0000, 0.5000)
ResultText_1_TT:setPosition(-47.5000, 2.5000)
ResultText_1_TT:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(ResultText_1_TT)
layout:setSize({width = 103.0000, height = 55.0000})
layout:setLeftMargin(-150.5000)
layout:setRightMargin(47.5000)
layout:setTopMargin(-30.0000)
layout:setBottomMargin(-25.0000)
Result:addChild(ResultText_1_TT)

--Create ResultNum
local ResultNum = ccui.Text:create()
ResultNum:ignoreContentAdaptWithSize(true)
ResultNum:setTextAreaSize({width = 0, height = 0})
ResultNum:setFontName("en/font/Font001.ttf")
ResultNum:setFontSize(50)
ResultNum:setString([[8]])
ResultNum:setTextHorizontalAlignment(2)
ResultNum:setTextVerticalAlignment(1)
ResultNum:setLayoutComponentEnabled(true)
ResultNum:setName("ResultNum")
ResultNum:setTag(614)
ResultNum:setCascadeColorEnabled(true)
ResultNum:setCascadeOpacityEnabled(true)
ResultNum:setPosition(-15.0000, 0.0002)
ResultNum:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(ResultNum)
layout:setSize({width = 30.0000, height = 59.0000})
layout:setLeftMargin(-30.0000)
layout:setTopMargin(-29.5002)
layout:setBottomMargin(-29.4998)
Result:addChild(ResultNum)

--Create ResultText_2_TT
local ResultText_2_TT = ccui.Text:create()
ResultText_2_TT:ignoreContentAdaptWithSize(true)
ResultText_2_TT:setTextAreaSize({width = 0, height = 0})
ResultText_2_TT:setFontName("en/font/Font001.ttf")
ResultText_2_TT:setFontSize(42)
ResultText_2_TT:setString([[×]])
ResultText_2_TT:setTextHorizontalAlignment(2)
ResultText_2_TT:setTextVerticalAlignment(1)
ResultText_2_TT:setLayoutComponentEnabled(true)
ResultText_2_TT:setName("ResultText_2_TT")
ResultText_2_TT:setTag(612)
ResultText_2_TT:setCascadeColorEnabled(true)
ResultText_2_TT:setCascadeOpacityEnabled(true)
ResultText_2_TT:setPosition(31.5000, 2.5000)
ResultText_2_TT:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(ResultText_2_TT)
layout:setSize({width = 24.0000, height = 49.0000})
layout:setLeftMargin(19.5000)
layout:setRightMargin(-43.5000)
layout:setTopMargin(-27.0000)
layout:setBottomMargin(-22.0000)
Result:addChild(ResultText_2_TT)

--Create ResultImage
local ResultImage = ccui.ImageView:create()
ResultImage:ignoreContentAdaptWithSize(false)
ResultImage:loadTexture("00_01_Common/2D_Small_2.png", 1)
ResultImage:setLayoutComponentEnabled(true)
ResultImage:setName("ResultImage")
ResultImage:setTag(757)
ResultImage:setCascadeColorEnabled(true)
ResultImage:setCascadeOpacityEnabled(true)
ResultImage:setPosition(85.0007, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ResultImage)
layout:setSize({width = 76.0000, height = 76.0000})
layout:setLeftMargin(47.0007)
layout:setRightMargin(-123.0007)
layout:setTopMargin(-38.0000)
layout:setBottomMargin(-38.0000)
Result:addChild(ResultImage)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result
