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
"ui/02_02_GuessSize/02_02_GuessSize_1.plist",	
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
layout:setSize({width = 302.0000, height = 36.0000})

--Create GuessSizeHintNode
local GuessSizeHintNode=cc.Node:create()
GuessSizeHintNode:setName("GuessSizeHintNode")
GuessSizeHintNode:setTag(209)
GuessSizeHintNode:setCascadeColorEnabled(true)
GuessSizeHintNode:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(GuessSizeHintNode)
layout:setRightMargin(302.0000)
layout:setTopMargin(36.0000)
Layer:addChild(GuessSizeHintNode)

--Create GuessSizeHintBg
local GuessSizeHintBg = cc.Sprite:createWithSpriteFrameName("02_02_GuessSize/frame_159.png")
GuessSizeHintBg:setName("GuessSizeHintBg")
GuessSizeHintBg:setTag(210)
GuessSizeHintBg:setCascadeColorEnabled(true)
GuessSizeHintBg:setCascadeOpacityEnabled(true)
GuessSizeHintBg:setAnchorPoint(0.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(GuessSizeHintBg)
layout:setSize({width = 302.0000, height = 36.0000})
layout:setRightMargin(-302.0000)
layout:setTopMargin(-36.0000)
GuessSizeHintBg:setBlendFunc({src = 1, dst = 771})
GuessSizeHintNode:addChild(GuessSizeHintBg)

--Create GuessSizeHintText
local GuessSizeHintText = ccui.Text:create()
GuessSizeHintText:ignoreContentAdaptWithSize(true)
GuessSizeHintText:setTextAreaSize({width = 0, height = 0})
GuessSizeHintText:setFontName("font/Default.ttf")
GuessSizeHintText:setFontSize(22)
GuessSizeHintText:setString([[一二三猜大小赢得了万金币]])
GuessSizeHintText:setLayoutComponentEnabled(true)
GuessSizeHintText:setName("GuessSizeHintText")
GuessSizeHintText:setTag(211)
GuessSizeHintText:setCascadeColorEnabled(true)
GuessSizeHintText:setCascadeOpacityEnabled(true)
GuessSizeHintText:setAnchorPoint(0.0000, 0.5000)
GuessSizeHintText:setPosition(6.0000, 18.0000)
GuessSizeHintText:setTextColor({r = 236, g = 215, b = 250})
layout = ccui.LayoutComponent:bindLayoutComponent(GuessSizeHintText)
layout:setSize({width = 266.0000, height = 29.0000})
layout:setLeftMargin(6.0000)
layout:setRightMargin(-272.0000)
layout:setTopMargin(-32.5000)
layout:setBottomMargin(3.5000)
GuessSizeHintNode:addChild(GuessSizeHintText)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result
