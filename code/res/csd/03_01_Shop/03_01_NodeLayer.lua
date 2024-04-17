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
layout:setSize({width = 691.0000, height = 278.0000})

--Create GoldRechargeNode_3
local GoldRechargeNode_3=cc.Node:create()
GoldRechargeNode_3:setName("GoldRechargeNode_3")
GoldRechargeNode_3:setTag(205)
GoldRechargeNode_3:setCascadeColorEnabled(true)
GoldRechargeNode_3:setCascadeOpacityEnabled(true)
GoldRechargeNode_3:setPosition(572.0000, 139.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(GoldRechargeNode_3)
layout:setPositionPercentX(0.8278)
layout:setPositionPercentY(0.5000)
layout:setLeftMargin(572.0000)
layout:setRightMargin(119.0000)
layout:setTopMargin(139.0000)
layout:setBottomMargin(139.0000)
Layer:addChild(GoldRechargeNode_3)

--Create GoldRechargeNode_2
local GoldRechargeNode_2=cc.Node:create()
GoldRechargeNode_2:setName("GoldRechargeNode_2")
GoldRechargeNode_2:setTag(204)
GoldRechargeNode_2:setCascadeColorEnabled(true)
GoldRechargeNode_2:setCascadeOpacityEnabled(true)
GoldRechargeNode_2:setPosition(345.5000, 139.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(GoldRechargeNode_2)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setLeftMargin(345.5000)
layout:setRightMargin(345.5000)
layout:setTopMargin(139.0000)
layout:setBottomMargin(139.0000)
Layer:addChild(GoldRechargeNode_2)

--Create GoldRechargeNode_1
local GoldRechargeNode_1=cc.Node:create()
GoldRechargeNode_1:setName("GoldRechargeNode_1")
GoldRechargeNode_1:setTag(203)
GoldRechargeNode_1:setCascadeColorEnabled(true)
GoldRechargeNode_1:setCascadeOpacityEnabled(true)
GoldRechargeNode_1:setPosition(119.0000, 139.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(GoldRechargeNode_1)
layout:setPositionPercentX(0.1722)
layout:setPositionPercentY(0.5000)
layout:setLeftMargin(119.0000)
layout:setRightMargin(572.0000)
layout:setTopMargin(139.0000)
layout:setBottomMargin(139.0000)
Layer:addChild(GoldRechargeNode_1)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result
