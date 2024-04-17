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
"ui/01_04_Task/01_04_Task_1.plist",	
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
layout:setSize({width = 609.0000, height = 158.0000})

--Create Task
local Task=cc.Node:create()
Task:setName("Task")
Task:setTag(97)
Task:setCascadeColorEnabled(true)
Task:setCascadeOpacityEnabled(true)
Task:setPosition(304.5000, 79.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Task)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setLeftMargin(304.5000)
layout:setRightMargin(304.5000)
layout:setTopMargin(79.0000)
layout:setBottomMargin(79.0000)
Layer:addChild(Task)

--Create TaskImage
local TaskImage = ccui.ImageView:create()
TaskImage:ignoreContentAdaptWithSize(false)
TaskImage:loadTexture("01_04_Task/frame_057.png", 1)
TaskImage:setScale9Enabled(true)
TaskImage:setCapInsets({x = 17, y = 52, width = 18, height = 54})
TaskImage:setLayoutComponentEnabled(true)
TaskImage:setName("TaskImage")
TaskImage:setTag(99)
TaskImage:setCascadeColorEnabled(true)
TaskImage:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(TaskImage)
layout:setSize({width = 609.0000, height = 158.0000})
layout:setLeftMargin(-304.5000)
layout:setRightMargin(-304.5000)
layout:setTopMargin(-79.0000)
layout:setBottomMargin(-79.0000)
Task:addChild(TaskImage)

--Create ActivityPanel
local ActivityPanel = ccui.Layout:create()
ActivityPanel:ignoreContentAdaptWithSize(false)
ActivityPanel:setClippingEnabled(false)
ActivityPanel:setBackGroundColorOpacity(102)
ActivityPanel:setTouchEnabled(true);
ActivityPanel:setLayoutComponentEnabled(true)
ActivityPanel:setName("ActivityPanel")
ActivityPanel:setTag(38)
ActivityPanel:setCascadeColorEnabled(true)
ActivityPanel:setCascadeOpacityEnabled(true)
ActivityPanel:setAnchorPoint(0.5000, 0.5000)
ActivityPanel:setPosition(-227.0000, 2.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ActivityPanel)
layout:setSize({width = 84.0000, height = 96.0000})
layout:setLeftMargin(-269.0000)
layout:setRightMargin(185.0000)
layout:setTopMargin(-50.0000)
layout:setBottomMargin(-46.0000)
Task:addChild(ActivityPanel)

--Create ActivityIcon
local ActivityIcon = ccui.ImageView:create()
ActivityIcon:ignoreContentAdaptWithSize(false)
ActivityIcon:loadTexture("Default/ImageFile.png", 1)
ActivityIcon:setScale9Enabled(true)
ActivityIcon:setCapInsets({x = 19, y = 15, width = 8, height = 16})
ActivityIcon:setLayoutComponentEnabled(true)
ActivityIcon:setName("ActivityIcon")
ActivityIcon:setTag(100)
ActivityIcon:setCascadeColorEnabled(true)
ActivityIcon:setCascadeOpacityEnabled(true)
ActivityIcon:setPosition(42.0000, 48.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ActivityIcon)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 84.0000, height = 96.0000})
ActivityPanel:addChild(ActivityIcon)

--Create TaskText
local TaskText = ccui.Text:create()
TaskText:ignoreContentAdaptWithSize(true)
TaskText:setTextAreaSize({width = 0, height = 0})
TaskText:setFontName("font/Font001.ttf")
TaskText:setFontSize(26)
TaskText:setString([[每日登录游戏]])
TaskText:setTextVerticalAlignment(1)
TaskText:enableShadow({r = 127, g = 127, b = 127, a = 255}, {width = 0, height = -1}, 0)
TaskText:setLayoutComponentEnabled(true)
TaskText:setName("TaskText")
TaskText:setTag(101)
TaskText:setCascadeColorEnabled(true)
TaskText:setCascadeOpacityEnabled(true)
TaskText:setAnchorPoint(0.0000, 0.5000)
TaskText:setPosition(-158.0000, 40.0000)
TaskText:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(TaskText)
layout:setSize({width = 159.0000, height = 34.0000})
layout:setLeftMargin(-158.0000)
layout:setRightMargin(-1.0000)
layout:setTopMargin(-57.0000)
layout:setBottomMargin(23.0000)
Task:addChild(TaskText)

--Create TaskLoading
local TaskLoading=cc.Node:create()
TaskLoading:setName("TaskLoading")
TaskLoading:setTag(104)
TaskLoading:setCascadeColorEnabled(true)
TaskLoading:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(TaskLoading)
Task:addChild(TaskLoading)

--Create TaskLoadingBarImage
local TaskLoadingBarImage = cc.Sprite:createWithSpriteFrameName("01_04_Task/strip_013.png")
TaskLoadingBarImage:setName("TaskLoadingBarImage")
TaskLoadingBarImage:setTag(476)
TaskLoadingBarImage:setCascadeColorEnabled(true)
TaskLoadingBarImage:setCascadeOpacityEnabled(true)
TaskLoadingBarImage:setPosition(-15.0000, 3.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(TaskLoadingBarImage)
layout:setSize({width = 284.0000, height = 24.0000})
layout:setLeftMargin(-157.0000)
layout:setRightMargin(-127.0000)
layout:setTopMargin(-15.0000)
layout:setBottomMargin(-9.0000)
TaskLoadingBarImage:setBlendFunc({src = 1, dst = 771})
TaskLoading:addChild(TaskLoadingBarImage)

--Create TaskLoadingBar
local TaskLoadingBar = ccui.LoadingBar:create()
TaskLoadingBar:loadTexture("01_04_Task/strip_012.png", 1)
TaskLoadingBar:ignoreContentAdaptWithSize(false)
TaskLoadingBar:setLayoutComponentEnabled(true)
TaskLoadingBar:setName("TaskLoadingBar")
TaskLoadingBar:setTag(102)
TaskLoadingBar:setCascadeColorEnabled(true)
TaskLoadingBar:setCascadeOpacityEnabled(true)
TaskLoadingBar:setPosition(-15.0000, 3.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(TaskLoadingBar)
layout:setSize({width = 284.0000, height = 24.0000})
layout:setLeftMargin(-157.0000)
layout:setRightMargin(-127.0000)
layout:setTopMargin(-15.0000)
layout:setBottomMargin(-9.0000)
TaskLoading:addChild(TaskLoadingBar)

--Create TaskLoadingNum
local TaskLoadingNum = ccui.Text:create()
TaskLoadingNum:ignoreContentAdaptWithSize(true)
TaskLoadingNum:setTextAreaSize({width = 0, height = 0})
TaskLoadingNum:setFontName("font/Font003.ttf")
TaskLoadingNum:setFontSize(24)
TaskLoadingNum:setString([[1/1]])
TaskLoadingNum:setTextHorizontalAlignment(1)
TaskLoadingNum:setTextVerticalAlignment(1)
TaskLoadingNum:setLayoutComponentEnabled(true)
TaskLoadingNum:setName("TaskLoadingNum")
TaskLoadingNum:setTag(105)
TaskLoadingNum:setCascadeColorEnabled(true)
TaskLoadingNum:setCascadeOpacityEnabled(true)
TaskLoadingNum:setPosition(-16.0000, 3.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(TaskLoadingNum)
layout:setSize({width = 31.0000, height = 28.0000})
layout:setLeftMargin(-31.5000)
layout:setRightMargin(0.5000)
layout:setTopMargin(-17.0000)
layout:setBottomMargin(-11.0000)
TaskLoading:addChild(TaskLoadingNum)

--Create TaskLoadingText_TT
local TaskLoadingText_TT = ccui.Text:create()
TaskLoadingText_TT:ignoreContentAdaptWithSize(true)
TaskLoadingText_TT:setTextAreaSize({width = 0, height = 0})
TaskLoadingText_TT:setFontName("font/Font001.ttf")
TaskLoadingText_TT:setFontSize(22)
TaskLoadingText_TT:setString([[完成]])
TaskLoadingText_TT:setTextVerticalAlignment(1)
TaskLoadingText_TT:setLayoutComponentEnabled(true)
TaskLoadingText_TT:setName("TaskLoadingText_TT")
TaskLoadingText_TT:setTag(113)
TaskLoadingText_TT:setCascadeColorEnabled(true)
TaskLoadingText_TT:setCascadeOpacityEnabled(true)
TaskLoadingText_TT:setPosition(-16.0000, 3.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(TaskLoadingText_TT)
layout:setSize({width = 47.0000, height = 29.0000})
layout:setLeftMargin(-39.5000)
layout:setRightMargin(-7.5000)
layout:setTopMargin(-17.5000)
layout:setBottomMargin(-11.5000)
TaskLoading:addChild(TaskLoadingText_TT)

--Create TaskState
local TaskState=cc.Node:create()
TaskState:setName("TaskState")
TaskState:setTag(106)
TaskState:setCascadeColorEnabled(true)
TaskState:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(TaskState)
Task:addChild(TaskState)

--Create Start
local Start=cc.Node:create()
Start:setName("Start")
Start:setTag(108)
Start:setCascadeColorEnabled(true)
Start:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Start)
TaskState:addChild(Start)

--Create StartButton

local luaScript = require("csd.LuaScript.newButton")
local StartButton = luaScript.CreateCustomNode()
StartButton:ignoreContentAdaptWithSize(false)
StartButton:loadTextureNormal("01_04_Task/button_045.png", 1)
StartButton:loadTexturePressed("01_04_Task/button_045.png", 1)
StartButton:loadTextureDisabled("01_04_Task/button_045.png", 1)
StartButton:setTitleFontSize(14)
StartButton:setScale9Enabled(true)
StartButton:setCapInsets({x = 15, y = 11, width = 18, height = 56})
StartButton:setLayoutComponentEnabled(true)
StartButton:setName("StartButton")
StartButton:setTag(111)
StartButton:setCascadeColorEnabled(true)
StartButton:setCascadeOpacityEnabled(true)
StartButton:setPosition(209.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(StartButton)
layout:setSize({width = 138.0000, height = 78.0000})
layout:setLeftMargin(140.0000)
layout:setRightMargin(-278.0000)
layout:setTopMargin(-39.0000)
layout:setBottomMargin(-39.0000)

luaScript.SetDownScele(StartButton, "0.9800")
luaScript.SetClickEffect(StartButton, "Sound004")
luaScript.SetDownColor(StartButton, {r = 65, g = 65, b = 70})
Start:addChild(StartButton)

--Create StartText_TT
local StartText_TT = ccui.Text:create()
StartText_TT:ignoreContentAdaptWithSize(true)
StartText_TT:setTextAreaSize({width = 0, height = 0})
StartText_TT:setFontName("font/Font001.ttf")
StartText_TT:setFontSize(24)
StartText_TT:setString([[前往]])
StartText_TT:setTextHorizontalAlignment(1)
StartText_TT:setTextVerticalAlignment(1)
StartText_TT:enableShadow({r = 42, g = 42, b = 57, a = 255}, {width = 0, height = -1}, 0)
StartText_TT:setLayoutComponentEnabled(true)
StartText_TT:setName("StartText_TT")
StartText_TT:setTag(110)
StartText_TT:setCascadeColorEnabled(true)
StartText_TT:setCascadeOpacityEnabled(true)
StartText_TT:setPosition(69.0000, 43.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(StartText_TT)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5513)
layout:setPercentWidth(0.3696)
layout:setPercentHeight(0.4103)
layout:setSize({width = 51.0000, height = 32.0000})
layout:setLeftMargin(43.5000)
layout:setRightMargin(43.5000)
layout:setTopMargin(19.0000)
layout:setBottomMargin(27.0000)
StartButton:addChild(StartText_TT)

--Create Receive
local Receive=cc.Node:create()
Receive:setName("Receive")
Receive:setTag(114)
Receive:setCascadeColorEnabled(true)
Receive:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Receive)
TaskState:addChild(Receive)

--Create ReceiveButton

local luaScript = require("csd.LuaScript.newButton")
local ReceiveButton = luaScript.CreateCustomNode()
ReceiveButton:ignoreContentAdaptWithSize(false)
ReceiveButton:loadTextureNormal("01_04_Task/button_085.png", 1)
ReceiveButton:loadTexturePressed("01_04_Task/button_085.png", 1)
ReceiveButton:loadTextureDisabled("01_04_Task/button_085.png", 1)
ReceiveButton:setTitleFontSize(14)
ReceiveButton:setLayoutComponentEnabled(true)
ReceiveButton:setName("ReceiveButton")
ReceiveButton:setTag(115)
ReceiveButton:setCascadeColorEnabled(true)
ReceiveButton:setCascadeOpacityEnabled(true)
ReceiveButton:setPosition(210.0000, 4.0001)
layout = ccui.LayoutComponent:bindLayoutComponent(ReceiveButton)
layout:setSize({width = 138.0000, height = 84.0000})
layout:setLeftMargin(141.0000)
layout:setRightMargin(-279.0000)
layout:setTopMargin(-46.0001)
layout:setBottomMargin(-37.9999)

luaScript.SetDownScele(ReceiveButton, "0.9800")
luaScript.SetClickEffect(ReceiveButton, "Sound004")
luaScript.SetDownColor(ReceiveButton, {r = 65, g = 65, b = 70})
Receive:addChild(ReceiveButton)

--Create ReceiveText_TT
local ReceiveText_TT = ccui.Text:create()
ReceiveText_TT:ignoreContentAdaptWithSize(true)
ReceiveText_TT:setTextAreaSize({width = 0, height = 0})
ReceiveText_TT:setFontName("font/Font001.ttf")
ReceiveText_TT:setFontSize(24)
ReceiveText_TT:setString([[领取]])
ReceiveText_TT:setTextHorizontalAlignment(1)
ReceiveText_TT:setTextVerticalAlignment(1)
ReceiveText_TT:enableShadow({r = 42, g = 42, b = 57, a = 255}, {width = 0, height = -1}, 0)
ReceiveText_TT:setLayoutComponentEnabled(true)
ReceiveText_TT:setName("ReceiveText_TT")
ReceiveText_TT:setTag(116)
ReceiveText_TT:setCascadeColorEnabled(true)
ReceiveText_TT:setCascadeOpacityEnabled(true)
ReceiveText_TT:setPosition(69.0000, 42.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ReceiveText_TT)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.3696)
layout:setPercentHeight(0.3810)
layout:setSize({width = 51.0000, height = 32.0000})
layout:setLeftMargin(43.5000)
layout:setRightMargin(43.5000)
layout:setTopMargin(26.0000)
layout:setBottomMargin(26.0000)
ReceiveButton:addChild(ReceiveText_TT)

--Create Received
local Received=cc.Node:create()
Received:setName("Received")
Received:setTag(117)
Received:setCascadeColorEnabled(true)
Received:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Received)
TaskState:addChild(Received)

--Create ReceivedText_TT
local ReceivedText_TT = ccui.Text:create()
ReceivedText_TT:ignoreContentAdaptWithSize(true)
ReceivedText_TT:setTextAreaSize({width = 0, height = 0})
ReceivedText_TT:setFontName("font/Font001.ttf")
ReceivedText_TT:setFontSize(24)
ReceivedText_TT:setString([[已领取]])
ReceivedText_TT:setTextHorizontalAlignment(1)
ReceivedText_TT:setTextVerticalAlignment(1)
ReceivedText_TT:setLayoutComponentEnabled(true)
ReceivedText_TT:setName("ReceivedText_TT")
ReceivedText_TT:setTag(118)
ReceivedText_TT:setCascadeColorEnabled(true)
ReceivedText_TT:setCascadeOpacityEnabled(true)
ReceivedText_TT:setPosition(207.6440, 3.7274)
ReceivedText_TT:setTextColor({r = 193, g = 189, b = 237})
layout = ccui.LayoutComponent:bindLayoutComponent(ReceivedText_TT)
layout:setSize({width = 75.0000, height = 32.0000})
layout:setLeftMargin(170.1440)
layout:setRightMargin(-245.1440)
layout:setTopMargin(-19.7274)
layout:setBottomMargin(-12.2726)
Received:addChild(ReceivedText_TT)

--Create Reward
local Reward=cc.Node:create()
Reward:setName("Reward")
Reward:setTag(167)
Reward:setCascadeColorEnabled(true)
Reward:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Reward)
Task:addChild(Reward)

--Create Reward_1
local Reward_1=cc.Node:create()
Reward_1:setName("Reward_1")
Reward_1:setTag(164)
Reward_1:setCascadeColorEnabled(true)
Reward_1:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Reward_1)
Reward:addChild(Reward_1)

--Create RewardNode_1
local RewardNode_1=cc.Node:create()
RewardNode_1:setName("RewardNode_1")
RewardNode_1:setTag(169)
RewardNode_1:setCascadeColorEnabled(true)
RewardNode_1:setCascadeOpacityEnabled(true)
RewardNode_1:setPosition(-140.0000, -32.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(RewardNode_1)
layout:setLeftMargin(-140.0000)
layout:setRightMargin(140.0000)
layout:setTopMargin(32.0000)
layout:setBottomMargin(-32.0000)
Reward_1:addChild(RewardNode_1)

--Create RewardText_1
local RewardText_1 = ccui.Text:create()
RewardText_1:ignoreContentAdaptWithSize(true)
RewardText_1:setTextAreaSize({width = 0, height = 0})
RewardText_1:setFontName("font/Font003.ttf")
RewardText_1:setFontSize(32)
RewardText_1:setString([[×]])
RewardText_1:setTextHorizontalAlignment(1)
RewardText_1:setTextVerticalAlignment(1)
RewardText_1:setLayoutComponentEnabled(true)
RewardText_1:setName("RewardText_1")
RewardText_1:setTag(171)
RewardText_1:setCascadeColorEnabled(true)
RewardText_1:setCascadeOpacityEnabled(true)
RewardText_1:setPosition(-112.4256, -33.2131)
RewardText_1:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(RewardText_1)
layout:setSize({width = 21.0000, height = 37.0000})
layout:setLeftMargin(-122.9256)
layout:setRightMargin(101.9256)
layout:setTopMargin(14.7131)
layout:setBottomMargin(-51.7131)
Reward_1:addChild(RewardText_1)

--Create RewardNum_1
local RewardNum_1 = ccui.Text:create()
RewardNum_1:ignoreContentAdaptWithSize(true)
RewardNum_1:setTextAreaSize({width = 0, height = 0})
RewardNum_1:setFontName("font/Font003.ttf")
RewardNum_1:setFontSize(32)
RewardNum_1:setString([[1000]])
RewardNum_1:setLayoutComponentEnabled(true)
RewardNum_1:setName("RewardNum_1")
RewardNum_1:setTag(172)
RewardNum_1:setCascadeColorEnabled(true)
RewardNum_1:setCascadeOpacityEnabled(true)
RewardNum_1:setAnchorPoint(0.0000, 0.5000)
RewardNum_1:setPosition(-106.0011, -33.0000)
RewardNum_1:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(RewardNum_1)
layout:setSize({width = 63.0000, height = 37.0000})
layout:setLeftMargin(-106.0011)
layout:setRightMargin(43.0011)
layout:setTopMargin(14.5000)
layout:setBottomMargin(-51.5000)
Reward_1:addChild(RewardNum_1)

--Create Reward_2
local Reward_2=cc.Node:create()
Reward_2:setName("Reward_2")
Reward_2:setTag(165)
Reward_2:setCascadeColorEnabled(true)
Reward_2:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Reward_2)
Reward:addChild(Reward_2)

--Create RewardNode_2
local RewardNode_2=cc.Node:create()
RewardNode_2:setName("RewardNode_2")
RewardNode_2:setTag(173)
RewardNode_2:setCascadeColorEnabled(true)
RewardNode_2:setCascadeOpacityEnabled(true)
RewardNode_2:setPosition(10.0004, -32.0004)
layout = ccui.LayoutComponent:bindLayoutComponent(RewardNode_2)
layout:setLeftMargin(10.0004)
layout:setRightMargin(-10.0004)
layout:setTopMargin(32.0004)
layout:setBottomMargin(-32.0004)
Reward_2:addChild(RewardNode_2)

--Create RewardText_2
local RewardText_2 = ccui.Text:create()
RewardText_2:ignoreContentAdaptWithSize(true)
RewardText_2:setTextAreaSize({width = 0, height = 0})
RewardText_2:setFontName("font/Font003.ttf")
RewardText_2:setFontSize(32)
RewardText_2:setString([[×]])
RewardText_2:setTextHorizontalAlignment(1)
RewardText_2:setTextVerticalAlignment(1)
RewardText_2:setLayoutComponentEnabled(true)
RewardText_2:setName("RewardText_2")
RewardText_2:setTag(174)
RewardText_2:setCascadeColorEnabled(true)
RewardText_2:setCascadeOpacityEnabled(true)
RewardText_2:setPosition(37.5743, -33.2131)
RewardText_2:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(RewardText_2)
layout:setSize({width = 21.0000, height = 37.0000})
layout:setLeftMargin(27.0743)
layout:setRightMargin(-48.0743)
layout:setTopMargin(14.7131)
layout:setBottomMargin(-51.7131)
Reward_2:addChild(RewardText_2)

--Create RewardNum_2
local RewardNum_2 = ccui.Text:create()
RewardNum_2:ignoreContentAdaptWithSize(true)
RewardNum_2:setTextAreaSize({width = 0, height = 0})
RewardNum_2:setFontName("font/Font003.ttf")
RewardNum_2:setFontSize(32)
RewardNum_2:setString([[1000]])
RewardNum_2:setLayoutComponentEnabled(true)
RewardNum_2:setName("RewardNum_2")
RewardNum_2:setTag(175)
RewardNum_2:setCascadeColorEnabled(true)
RewardNum_2:setCascadeOpacityEnabled(true)
RewardNum_2:setAnchorPoint(0.0000, 0.5000)
RewardNum_2:setPosition(43.9991, -33.0003)
RewardNum_2:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(RewardNum_2)
layout:setSize({width = 63.0000, height = 37.0000})
layout:setLeftMargin(43.9991)
layout:setRightMargin(-106.9991)
layout:setTopMargin(14.5003)
layout:setBottomMargin(-51.5003)
Reward_2:addChild(RewardNum_2)

--Create TaskPanel
local TaskPanel = ccui.Layout:create()
TaskPanel:ignoreContentAdaptWithSize(false)
TaskPanel:setClippingEnabled(false)
TaskPanel:setBackGroundColorType(1)
TaskPanel:setBackGroundColor({r = 0, g = 0, b = 0})
TaskPanel:setBackGroundColorOpacity(102)
TaskPanel:setTouchEnabled(true);
TaskPanel:setLayoutComponentEnabled(true)
TaskPanel:setName("TaskPanel")
TaskPanel:setTag(67)
TaskPanel:setCascadeColorEnabled(true)
TaskPanel:setCascadeOpacityEnabled(true)
TaskPanel:setPosition(9.0000, 12.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(TaskPanel)
layout:setPositionPercentX(0.0148)
layout:setPositionPercentY(0.0759)
layout:setPercentWidth(0.9688)
layout:setPercentHeight(0.8861)
layout:setSize({width = 590.0000, height = 140.0000})
layout:setLeftMargin(9.0000)
layout:setRightMargin(10.0000)
layout:setTopMargin(6.0000)
layout:setBottomMargin(12.0000)
Layer:addChild(TaskPanel)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result
