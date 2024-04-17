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
layout:setSize({width = 377.0000, height = 135.0000})

--Create FriendListCellNode_1
local FriendListCellNode_1=cc.Node:create()
FriendListCellNode_1:setName("FriendListCellNode_1")
FriendListCellNode_1:setTag(287)
FriendListCellNode_1:setCascadeColorEnabled(true)
FriendListCellNode_1:setCascadeOpacityEnabled(true)
FriendListCellNode_1:setPosition(60.0000, 67.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(FriendListCellNode_1)
layout:setPositionPercentX(0.1592)
layout:setPositionPercentY(0.5000)
layout:setLeftMargin(60.0000)
layout:setRightMargin(317.0000)
layout:setTopMargin(67.5000)
layout:setBottomMargin(67.5000)
Layer:addChild(FriendListCellNode_1)

--Create FriendListCellNode_2
local FriendListCellNode_2=cc.Node:create()
FriendListCellNode_2:setName("FriendListCellNode_2")
FriendListCellNode_2:setTag(299)
FriendListCellNode_2:setCascadeColorEnabled(true)
FriendListCellNode_2:setCascadeOpacityEnabled(true)
FriendListCellNode_2:setPosition(248.0000, 67.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(FriendListCellNode_2)
layout:setPositionPercentX(0.6578)
layout:setPositionPercentY(0.5000)
layout:setLeftMargin(248.0000)
layout:setRightMargin(129.0000)
layout:setTopMargin(67.5000)
layout:setBottomMargin(67.5000)
Layer:addChild(FriendListCellNode_2)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

