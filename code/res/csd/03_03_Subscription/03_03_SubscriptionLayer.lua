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

--Create SubscriptionNode
local SubscriptionNode=cc.Node:create()
SubscriptionNode:setName("SubscriptionNode")
SubscriptionNode:setTag(49)
SubscriptionNode:setCascadeColorEnabled(true)
SubscriptionNode:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(SubscriptionNode)
layout:setRightMargin(720.0000)
layout:setTopMargin(1280.0000)
Layer:addChild(SubscriptionNode)

--Create SubscriptionListView
local SubscriptionListView = ccui.ListView:create()
SubscriptionListView:setDirection(2)
SubscriptionListView:setGravity(3)
SubscriptionListView:ignoreContentAdaptWithSize(false)
SubscriptionListView:setClippingEnabled(false)
SubscriptionListView:setBackGroundColorType(1)
SubscriptionListView:setBackGroundColor({r = 150, g = 150, b = 255})
SubscriptionListView:setBackGroundColorOpacity(102)
SubscriptionListView:setLayoutComponentEnabled(true)
SubscriptionListView:setName("SubscriptionListView")
SubscriptionListView:setTag(78)
SubscriptionListView:setCascadeColorEnabled(true)
SubscriptionListView:setCascadeOpacityEnabled(true)
SubscriptionListView:setPosition(0.0000, 187.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(SubscriptionListView)
layout:setSize({width = 720.0000, height = 850.0000})
layout:setRightMargin(-720.0000)
layout:setTopMargin(-1037.0000)
layout:setBottomMargin(187.0000)
SubscriptionNode:addChild(SubscriptionListView)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

