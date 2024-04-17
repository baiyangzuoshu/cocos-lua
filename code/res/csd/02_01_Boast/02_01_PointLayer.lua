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
"ui/02_01_Boast/02_01_Boast_1.plist",	
"ui/02_01_Boast/02_01_Boast_2.plist",	
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
layout:setSize({width = 120.0000, height = 120.0000})

--Create Node_16
local Node_16=cc.Node:create()
Node_16:setName("Node_16")
Node_16:setTag(79)
Node_16:setCascadeColorEnabled(true)
Node_16:setCascadeOpacityEnabled(true)
Node_16:setPosition(60.0000, 60.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_16)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setLeftMargin(60.0000)
layout:setRightMargin(60.0000)
layout:setTopMargin(60.0000)
layout:setBottomMargin(60.0000)
Layer:addChild(Node_16)

--Create PointBottom
local PointBottom = ccui.ImageView:create()
PointBottom:ignoreContentAdaptWithSize(false)
PointBottom:loadTexture("00_01_Common/2D_Dice_1.png", 1)
PointBottom:setLayoutComponentEnabled(true)
PointBottom:setName("PointBottom")
PointBottom:setTag(75)
PointBottom:setCascadeColorEnabled(true)
PointBottom:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(PointBottom)
layout:setSize({width = 120.0000, height = 120.0000})
layout:setLeftMargin(-60.0000)
layout:setRightMargin(-60.0000)
layout:setTopMargin(-60.0000)
layout:setBottomMargin(-60.0000)
Node_16:addChild(PointBottom)

--Create PointCheckBox
local PointCheckBox = cc.Sprite:createWithSpriteFrameName("02_01_Boast/frame_017.png")
PointCheckBox:setName("PointCheckBox")
PointCheckBox:setTag(490)
PointCheckBox:setCascadeColorEnabled(true)
PointCheckBox:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(PointCheckBox)
layout:setSize({width = 142.0000, height = 142.0000})
layout:setLeftMargin(-71.0000)
layout:setRightMargin(-71.0000)
layout:setTopMargin(-71.0000)
layout:setBottomMargin(-71.0000)
PointCheckBox:setBlendFunc({src = 1, dst = 771})
Node_16:addChild(PointCheckBox)

--Create PointPanel
local PointPanel = ccui.Layout:create()
PointPanel:ignoreContentAdaptWithSize(false)
PointPanel:setClippingEnabled(false)
PointPanel:setBackGroundColorOpacity(102)
PointPanel:setTouchEnabled(true);
PointPanel:setLayoutComponentEnabled(true)
PointPanel:setName("PointPanel")
PointPanel:setTag(78)
PointPanel:setCascadeColorEnabled(true)
PointPanel:setCascadeOpacityEnabled(true)
PointPanel:setAnchorPoint(0.5000, 0.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(PointPanel)
layout:setSize({width = 92.0000, height = 92.0000})
layout:setLeftMargin(-46.0000)
layout:setRightMargin(-46.0000)
layout:setTopMargin(-46.0000)
layout:setBottomMargin(-46.0000)
Node_16:addChild(PointPanel)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

