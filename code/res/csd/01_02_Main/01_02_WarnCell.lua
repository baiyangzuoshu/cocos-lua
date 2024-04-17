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
"ui/01_02_Main/01_02_Main_1.plist",	
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
layout:setSize({width = 618.0000, height = 106.0000})

--Create Warn
local Warn=cc.Node:create()
Warn:setName("Warn")
Warn:setTag(187)
Warn:setCascadeColorEnabled(true)
Warn:setCascadeOpacityEnabled(true)
Warn:setPosition(309.0000, 53.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Warn)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setLeftMargin(309.0000)
layout:setRightMargin(309.0000)
layout:setTopMargin(53.0000)
layout:setBottomMargin(53.0000)
Layer:addChild(Warn)

--Create WarnBg
local WarnBg = cc.Sprite:createWithSpriteFrameName("01_02_Main/frame_092.png")
WarnBg:setName("WarnBg")
WarnBg:setTag(466)
WarnBg:setCascadeColorEnabled(true)
WarnBg:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(WarnBg)
layout:setSize({width = 618.0000, height = 106.0000})
layout:setLeftMargin(-309.0000)
layout:setRightMargin(-309.0000)
layout:setTopMargin(-53.0000)
layout:setBottomMargin(-53.0000)
WarnBg:setBlendFunc({src = 1, dst = 771})
Warn:addChild(WarnBg)

--Create WarnText
local WarnText = ccui.Text:create()
WarnText:ignoreContentAdaptWithSize(false)
WarnText:setFontName("font/Default.ttf")
WarnText:setFontSize(28)
WarnText:setString([[You have automatically stepped down as a dealer in High Low due to insuf]])
WarnText:setTextHorizontalAlignment(1)
WarnText:setTextVerticalAlignment(1)
WarnText:setLayoutComponentEnabled(true)
WarnText:setName("WarnText")
WarnText:setTag(183)
WarnText:setCascadeColorEnabled(true)
WarnText:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(WarnText)
layout:setSize({width = 580.0000, height = 74.0000})
layout:setLeftMargin(-290.0000)
layout:setRightMargin(-290.0000)
layout:setTopMargin(-37.0000)
layout:setBottomMargin(-37.0000)
Warn:addChild(WarnText)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

