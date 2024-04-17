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
"ui/03_04_Invitation/03_04_Invitation_1.plist",	
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
layout:setSize({width = 96.0000, height = 96.0000})

--Create Reward
local Reward=cc.Node:create()
Reward:setName("Reward")
Reward:setTag(161)
Reward:setCascadeColorEnabled(true)
Reward:setCascadeOpacityEnabled(true)
Reward:setPosition(48.0000, 48.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Reward)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setLeftMargin(48.0000)
layout:setRightMargin(48.0000)
layout:setTopMargin(48.0000)
layout:setBottomMargin(48.0000)
Layer:addChild(Reward)

--Create RewardPanel
local RewardPanel = ccui.Layout:create()
RewardPanel:ignoreContentAdaptWithSize(false)
RewardPanel:setClippingEnabled(false)
RewardPanel:setBackGroundColorOpacity(102)
RewardPanel:setTouchEnabled(true);
RewardPanel:setLayoutComponentEnabled(true)
RewardPanel:setName("RewardPanel")
RewardPanel:setTag(165)
RewardPanel:setCascadeColorEnabled(true)
RewardPanel:setCascadeOpacityEnabled(true)
RewardPanel:setAnchorPoint(0.5000, 0.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(RewardPanel)
layout:setSize({width = 96.0000, height = 96.0000})
layout:setLeftMargin(-48.0000)
layout:setRightMargin(-48.0000)
layout:setTopMargin(-48.0000)
layout:setBottomMargin(-48.0000)
Reward:addChild(RewardPanel)

--Create RewardBg
local RewardBg = ccui.ImageView:create()
RewardBg:ignoreContentAdaptWithSize(false)
RewardBg:loadTexture("03_04_Invitation/frame_070.png", 1)
RewardBg:setScale9Enabled(true)
RewardBg:setCapInsets({x = 31, y = 31, width = 34, height = 34})
RewardBg:setLayoutComponentEnabled(true)
RewardBg:setName("RewardBg")
RewardBg:setTag(162)
RewardBg:setCascadeColorEnabled(true)
RewardBg:setCascadeOpacityEnabled(true)
RewardBg:setPosition(48.0000, 48.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(RewardBg)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 96.0000, height = 96.0000})
RewardPanel:addChild(RewardBg)

--Create RewardIcon
local RewardIcon = ccui.ImageView:create()
RewardIcon:ignoreContentAdaptWithSize(false)
RewardIcon:loadTexture("Default/ImageFile.png", 1)
RewardIcon:setLayoutComponentEnabled(true)
RewardIcon:setName("RewardIcon")
RewardIcon:setTag(163)
RewardIcon:setCascadeColorEnabled(true)
RewardIcon:setCascadeOpacityEnabled(true)
RewardIcon:setPosition(48.0000, 51.0000)
RewardIcon:setScaleX(0.6400)
RewardIcon:setScaleY(0.6400)
layout = ccui.LayoutComponent:bindLayoutComponent(RewardIcon)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5313)
layout:setPercentWidth(1.0417)
layout:setPercentHeight(1.0417)
layout:setSize({width = 100.0000, height = 100.0000})
layout:setLeftMargin(-2.0000)
layout:setRightMargin(-2.0000)
layout:setTopMargin(-5.0000)
layout:setBottomMargin(1.0000)
RewardPanel:addChild(RewardIcon)

--Create RewardNum
local RewardNum = ccui.Text:create()
RewardNum:ignoreContentAdaptWithSize(true)
RewardNum:setTextAreaSize({width = 0, height = 0})
RewardNum:setFontName("font/Font003.ttf")
RewardNum:setFontSize(24)
RewardNum:setString([[9]])
RewardNum:setTextVerticalAlignment(1)
RewardNum:setLayoutComponentEnabled(true)
RewardNum:setName("RewardNum")
RewardNum:setTag(166)
RewardNum:setCascadeColorEnabled(true)
RewardNum:setCascadeOpacityEnabled(true)
RewardNum:setAnchorPoint(0.9000, 0.5000)
RewardNum:setPosition(80.6000, 27.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(RewardNum)
layout:setPositionPercentX(0.8396)
layout:setPositionPercentY(0.2813)
layout:setPercentWidth(0.1458)
layout:setPercentHeight(0.2917)
layout:setSize({width = 14.0000, height = 28.0000})
layout:setLeftMargin(68.0000)
layout:setRightMargin(14.0000)
layout:setTopMargin(55.0000)
layout:setBottomMargin(13.0000)
RewardPanel:addChild(RewardNum)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

