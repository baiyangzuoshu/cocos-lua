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
"ui/01_17_GetRes/01_17_GetRes_1.plist",	
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

--Create Bg
local Bg=cc.Node:create()
Bg:setName("Bg")
Bg:setTag(24)
Bg:setCascadeColorEnabled(true)
Bg:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Bg)
layout:setRightMargin(720.0000)
layout:setTopMargin(1280.0000)
Layer:addChild(Bg)

--Create GetResPanel
local GetResPanel = ccui.Layout:create()
GetResPanel:ignoreContentAdaptWithSize(false)
GetResPanel:setClippingEnabled(false)
GetResPanel:setBackGroundColorOpacity(102)
GetResPanel:setTouchEnabled(true);
GetResPanel:setLayoutComponentEnabled(true)
GetResPanel:setName("GetResPanel")
GetResPanel:setTag(111)
GetResPanel:setCascadeColorEnabled(true)
GetResPanel:setCascadeOpacityEnabled(true)
GetResPanel:setAnchorPoint(0.0000, 1.0000)
GetResPanel:setPosition(0.0000, 1012.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(GetResPanel)
layout:setSize({width = 720.0000, height = 389.0000})
layout:setRightMargin(-720.0000)
layout:setTopMargin(-1012.0000)
layout:setBottomMargin(623.0000)
Bg:addChild(GetResPanel)

--Create Bg_1
local Bg_1 = ccui.ImageView:create()
Bg_1:ignoreContentAdaptWithSize(false)
Bg_1:loadTexture("01_17_GetRes/frame_040.png", 1)
Bg_1:setScale9Enabled(true)
Bg_1:setCapInsets({x = 234, y = 88, width = 242, height = 92})
Bg_1:setLayoutComponentEnabled(true)
Bg_1:setName("Bg_1")
Bg_1:setTag(32)
Bg_1:setCascadeColorEnabled(true)
Bg_1:setCascadeOpacityEnabled(true)
Bg_1:setAnchorPoint(0.5000, 0.0000)
Bg_1:setPosition(359.9995, 622.9988)
layout = ccui.LayoutComponent:bindLayoutComponent(Bg_1)
layout:setSize({width = 710.0000, height = 268.0000})
layout:setLeftMargin(4.9995)
layout:setRightMargin(-714.9995)
layout:setTopMargin(-890.9988)
layout:setBottomMargin(622.9988)
Bg:addChild(Bg_1)

--Create Middle
local Middle=cc.Node:create()
Middle:setName("Middle")
Middle:setTag(33)
Middle:setCascadeColorEnabled(true)
Middle:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Middle)
layout:setRightMargin(720.0000)
layout:setTopMargin(1280.0000)
Layer:addChild(Middle)

--Create GetResIcon_IVT
local GetResIcon_IVT = ccui.ImageView:create()
GetResIcon_IVT:ignoreContentAdaptWithSize(false)
GetResIcon_IVT:loadTexture("01_17_GetRes/picture_009_zh_TW.png", 1)
GetResIcon_IVT:setLayoutComponentEnabled(true)
GetResIcon_IVT:setName("GetResIcon_IVT")
GetResIcon_IVT:setTag(31)
GetResIcon_IVT:setCascadeColorEnabled(true)
GetResIcon_IVT:setCascadeOpacityEnabled(true)
GetResIcon_IVT:setAnchorPoint(0.5000, 1.0000)
GetResIcon_IVT:setPosition(359.0000, 1011.9990)
layout = ccui.LayoutComponent:bindLayoutComponent(GetResIcon_IVT)
layout:setSize({width = 390.0000, height = 218.0000})
layout:setLeftMargin(164.0000)
layout:setRightMargin(-554.0000)
layout:setTopMargin(-1011.9990)
layout:setBottomMargin(793.9988)
Middle:addChild(GetResIcon_IVT)

--Create ResPanel
local ResPanel = ccui.Layout:create()
ResPanel:ignoreContentAdaptWithSize(false)
ResPanel:setClippingEnabled(false)
ResPanel:setBackGroundColorOpacity(126)
ResPanel:setTouchEnabled(true);
ResPanel:setLayoutComponentEnabled(true)
ResPanel:setName("ResPanel")
ResPanel:setTag(34)
ResPanel:setCascadeColorEnabled(true)
ResPanel:setCascadeOpacityEnabled(true)
ResPanel:setPosition(113.0000, 680.9994)
ResPanel:setOpacity(0)
layout = ccui.LayoutComponent:bindLayoutComponent(ResPanel)
layout:setSize({width = 494.0000, height = 135.0000})
layout:setLeftMargin(113.0000)
layout:setRightMargin(-607.0000)
layout:setTopMargin(-815.9994)
layout:setBottomMargin(680.9994)
Middle:addChild(ResPanel)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

