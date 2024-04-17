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
layout:setSize({width = 646.0000, height = 1115.0000})

--Create Bg
local Bg=cc.Node:create()
Bg:setName("Bg")
Bg:setTag(21)
Bg:setCascadeColorEnabled(true)
Bg:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Bg)
layout:setRightMargin(646.0000)
layout:setTopMargin(1115.0000)
Layer:addChild(Bg)

--Create InteractionPopups
local InteractionPopups = ccui.Layout:create()
InteractionPopups:ignoreContentAdaptWithSize(false)
InteractionPopups:setClippingEnabled(false)
InteractionPopups:setBackGroundColorOpacity(102)
InteractionPopups:setTouchEnabled(true);
InteractionPopups:setLayoutComponentEnabled(true)
InteractionPopups:setName("InteractionPopups")
InteractionPopups:setTag(60)
InteractionPopups:setCascadeColorEnabled(true)
InteractionPopups:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(InteractionPopups)
layout:setSize({width = 646.0000, height = 1078.0000})
layout:setRightMargin(-646.0000)
layout:setTopMargin(-1078.0000)
Bg:addChild(InteractionPopups)

--Create Bg_1
local Bg_1 = ccui.ImageView:create()
Bg_1:ignoreContentAdaptWithSize(false)
Bg_1:loadTexture("01_04_Task/frame_056.png", 1)
Bg_1:setScale9Enabled(true)
Bg_1:setCapInsets({x = 18, y = 355, width = 20, height = 368})
Bg_1:setLayoutComponentEnabled(true)
Bg_1:setName("Bg_1")
Bg_1:setTag(23)
Bg_1:setCascadeColorEnabled(true)
Bg_1:setCascadeOpacityEnabled(true)
Bg_1:setPosition(322.9995, 539.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Bg_1)
layout:setSize({width = 646.0000, height = 1078.0000})
layout:setLeftMargin(-0.0005)
layout:setRightMargin(-645.9995)
layout:setTopMargin(-1078.0000)
Bg:addChild(Bg_1)

--Create Middle
local Middle=cc.Node:create()
Middle:setName("Middle")
Middle:setTag(33)
Middle:setCascadeColorEnabled(true)
Middle:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Middle)
layout:setRightMargin(646.0000)
layout:setTopMargin(1115.0000)
Layer:addChild(Middle)

--Create TaskPanel
local TaskPanel = ccui.Layout:create()
TaskPanel:ignoreContentAdaptWithSize(false)
TaskPanel:setClippingEnabled(false)
TaskPanel:setBackGroundColorOpacity(102)
TaskPanel:setTouchEnabled(true);
TaskPanel:setLayoutComponentEnabled(true)
TaskPanel:setName("TaskPanel")
TaskPanel:setTag(54)
TaskPanel:setCascadeColorEnabled(true)
TaskPanel:setCascadeOpacityEnabled(true)
TaskPanel:setAnchorPoint(0.5000, 1.0000)
TaskPanel:setPosition(323.4998, 818.0022)
layout = ccui.LayoutComponent:bindLayoutComponent(TaskPanel)
layout:setSize({width = 609.0000, height = 687.0000})
layout:setLeftMargin(18.9998)
layout:setRightMargin(-627.9998)
layout:setTopMargin(-818.0022)
layout:setBottomMargin(131.0022)
Middle:addChild(TaskPanel)

--Create TaskImage_IVT
local TaskImage_IVT = ccui.ImageView:create()
TaskImage_IVT:ignoreContentAdaptWithSize(false)
TaskImage_IVT:loadTexture("01_04_Task/picture_021_zh_CN.png", 1)
TaskImage_IVT:setLayoutComponentEnabled(true)
TaskImage_IVT:setName("TaskImage_IVT")
TaskImage_IVT:setTag(25)
TaskImage_IVT:setCascadeColorEnabled(true)
TaskImage_IVT:setCascadeOpacityEnabled(true)
TaskImage_IVT:setPosition(171.9985, 1077.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(TaskImage_IVT)
layout:setSize({width = 284.0000, height = 108.0000})
layout:setLeftMargin(29.9985)
layout:setRightMargin(-313.9985)
layout:setTopMargin(-1131.0000)
layout:setBottomMargin(1023.0000)
Middle:addChild(TaskImage_IVT)

--Create RefreshText_TT
local RefreshText_TT = ccui.Text:create()
RefreshText_TT:ignoreContentAdaptWithSize(true)
RefreshText_TT:setTextAreaSize({width = 0, height = 0})
RefreshText_TT:setFontName("font/Default.ttf")
RefreshText_TT:setFontSize(24)
RefreshText_TT:setString([[本周日24:00点刷新]])
RefreshText_TT:setTextHorizontalAlignment(2)
RefreshText_TT:setTextVerticalAlignment(1)
RefreshText_TT:setLayoutComponentEnabled(true)
RefreshText_TT:setName("RefreshText_TT")
RefreshText_TT:setTag(330)
RefreshText_TT:setCascadeColorEnabled(true)
RefreshText_TT:setCascadeOpacityEnabled(true)
RefreshText_TT:setAnchorPoint(1.0000, 0.5000)
RefreshText_TT:setPosition(620.0012, 1030.0000)
RefreshText_TT:setTextColor({r = 193, g = 189, b = 237})
layout = ccui.LayoutComponent:bindLayoutComponent(RefreshText_TT)
layout:setSize({width = 209.0000, height = 32.0000})
layout:setLeftMargin(411.0012)
layout:setRightMargin(-620.0012)
layout:setTopMargin(-1046.0000)
layout:setBottomMargin(1014.0000)
Middle:addChild(RefreshText_TT)

--Create Week
local Week=cc.Node:create()
Week:setName("Week")
Week:setTag(47)
Week:setCascadeColorEnabled(true)
Week:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Week)
Middle:addChild(Week)

--Create WeekActivity
local WeekActivity=cc.Node:create()
WeekActivity:setName("WeekActivity")
WeekActivity:setTag(30)
WeekActivity:setCascadeColorEnabled(true)
WeekActivity:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(WeekActivity)
Week:addChild(WeekActivity)

--Create WeekActivityIcon_IVT
local WeekActivityIcon_IVT = ccui.ImageView:create()
WeekActivityIcon_IVT:ignoreContentAdaptWithSize(false)
WeekActivityIcon_IVT:loadTexture("01_04_Task/icon_043.png", 1)
WeekActivityIcon_IVT:setLayoutComponentEnabled(true)
WeekActivityIcon_IVT:setName("WeekActivityIcon_IVT")
WeekActivityIcon_IVT:setTag(31)
WeekActivityIcon_IVT:setCascadeColorEnabled(true)
WeekActivityIcon_IVT:setCascadeOpacityEnabled(true)
WeekActivityIcon_IVT:setPosition(75.9993, 919.9930)
layout = ccui.LayoutComponent:bindLayoutComponent(WeekActivityIcon_IVT)
layout:setSize({width = 94.0000, height = 106.0000})
layout:setLeftMargin(28.9993)
layout:setRightMargin(-122.9993)
layout:setTopMargin(-972.9930)
layout:setBottomMargin(866.9930)
WeekActivity:addChild(WeekActivityIcon_IVT)

--Create WeekActivityNum
local WeekActivityNum = ccui.Text:create()
WeekActivityNum:ignoreContentAdaptWithSize(true)
WeekActivityNum:setTextAreaSize({width = 0, height = 0})
WeekActivityNum:setFontName("font/Font003.ttf")
WeekActivityNum:setFontSize(36)
WeekActivityNum:setString([[20]])
WeekActivityNum:setLayoutComponentEnabled(true)
WeekActivityNum:setName("WeekActivityNum")
WeekActivityNum:setTag(34)
WeekActivityNum:setCascadeColorEnabled(true)
WeekActivityNum:setCascadeOpacityEnabled(true)
WeekActivityNum:setPosition(75.9993, 930.0046)
WeekActivityNum:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(WeekActivityNum)
layout:setSize({width = 36.0000, height = 42.0000})
layout:setLeftMargin(57.9993)
layout:setRightMargin(-93.9993)
layout:setTopMargin(-951.0046)
layout:setBottomMargin(909.0046)
WeekActivity:addChild(WeekActivityNum)

--Create WeekActivityText_TT
local WeekActivityText_TT = ccui.Text:create()
WeekActivityText_TT:ignoreContentAdaptWithSize(true)
WeekActivityText_TT:setTextAreaSize({width = 0, height = 0})
WeekActivityText_TT:setFontName("font/Font001.ttf")
WeekActivityText_TT:setFontSize(20)
WeekActivityText_TT:setString([[周活跃]])
WeekActivityText_TT:setTextHorizontalAlignment(1)
WeekActivityText_TT:setTextVerticalAlignment(1)
WeekActivityText_TT:setLayoutComponentEnabled(true)
WeekActivityText_TT:setName("WeekActivityText_TT")
WeekActivityText_TT:setTag(35)
WeekActivityText_TT:setCascadeColorEnabled(true)
WeekActivityText_TT:setCascadeOpacityEnabled(true)
WeekActivityText_TT:setPosition(76.0000, 886.9999)
WeekActivityText_TT:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(WeekActivityText_TT)
layout:setSize({width = 63.0000, height = 26.0000})
layout:setLeftMargin(44.5000)
layout:setRightMargin(-107.5000)
layout:setTopMargin(-899.9999)
layout:setBottomMargin(873.9999)
WeekActivity:addChild(WeekActivityText_TT)

--Create WeekTask
local WeekTask=cc.Node:create()
WeekTask:setName("WeekTask")
WeekTask:setTag(39)
WeekTask:setCascadeColorEnabled(true)
WeekTask:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(WeekTask)
Week:addChild(WeekTask)

--Create WeekResNode
local WeekResNode=cc.Node:create()
WeekResNode:setName("WeekResNode")
WeekResNode:setTag(37)
WeekResNode:setCascadeColorEnabled(true)
WeekResNode:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(WeekResNode)
WeekTask:addChild(WeekResNode)

--Create WeekResNode_1
local WeekResNode_1=cc.Node:create()
WeekResNode_1:setName("WeekResNode_1")
WeekResNode_1:setTag(87)
WeekResNode_1:setCascadeColorEnabled(true)
WeekResNode_1:setCascadeOpacityEnabled(true)
WeekResNode_1:setPosition(204.9997, 927.9995)
layout = ccui.LayoutComponent:bindLayoutComponent(WeekResNode_1)
layout:setLeftMargin(204.9997)
layout:setRightMargin(-204.9997)
layout:setTopMargin(-927.9995)
layout:setBottomMargin(927.9995)
WeekResNode:addChild(WeekResNode_1)

--Create WeekResNode_2
local WeekResNode_2=cc.Node:create()
WeekResNode_2:setName("WeekResNode_2")
WeekResNode_2:setTag(88)
WeekResNode_2:setCascadeColorEnabled(true)
WeekResNode_2:setCascadeOpacityEnabled(true)
WeekResNode_2:setPosition(299.9993, 927.9995)
layout = ccui.LayoutComponent:bindLayoutComponent(WeekResNode_2)
layout:setLeftMargin(299.9993)
layout:setRightMargin(-299.9993)
layout:setTopMargin(-927.9995)
layout:setBottomMargin(927.9995)
WeekResNode:addChild(WeekResNode_2)

--Create WeekResNode_3
local WeekResNode_3=cc.Node:create()
WeekResNode_3:setName("WeekResNode_3")
WeekResNode_3:setTag(89)
WeekResNode_3:setCascadeColorEnabled(true)
WeekResNode_3:setCascadeOpacityEnabled(true)
WeekResNode_3:setPosition(394.9991, 927.9995)
layout = ccui.LayoutComponent:bindLayoutComponent(WeekResNode_3)
layout:setLeftMargin(394.9991)
layout:setRightMargin(-394.9991)
layout:setTopMargin(-927.9995)
layout:setBottomMargin(927.9995)
WeekResNode:addChild(WeekResNode_3)

--Create WeekResNode_4
local WeekResNode_4=cc.Node:create()
WeekResNode_4:setName("WeekResNode_4")
WeekResNode_4:setTag(90)
WeekResNode_4:setCascadeColorEnabled(true)
WeekResNode_4:setCascadeOpacityEnabled(true)
WeekResNode_4:setPosition(488.9984, 927.9995)
layout = ccui.LayoutComponent:bindLayoutComponent(WeekResNode_4)
layout:setLeftMargin(488.9984)
layout:setRightMargin(-488.9984)
layout:setTopMargin(-927.9995)
layout:setBottomMargin(927.9995)
WeekResNode:addChild(WeekResNode_4)

--Create WeekResNode_5
local WeekResNode_5=cc.Node:create()
WeekResNode_5:setName("WeekResNode_5")
WeekResNode_5:setTag(91)
WeekResNode_5:setCascadeColorEnabled(true)
WeekResNode_5:setCascadeOpacityEnabled(true)
WeekResNode_5:setPosition(581.9987, 927.9995)
layout = ccui.LayoutComponent:bindLayoutComponent(WeekResNode_5)
layout:setLeftMargin(581.9987)
layout:setRightMargin(-581.9987)
layout:setTopMargin(-927.9995)
layout:setBottomMargin(927.9995)
WeekResNode:addChild(WeekResNode_5)

--Create WeekTaskLoadingBarImage
local WeekTaskLoadingBarImage = ccui.ImageView:create()
WeekTaskLoadingBarImage:ignoreContentAdaptWithSize(false)
WeekTaskLoadingBarImage:loadTexture("01_04_Task/strip_015.png", 1)
WeekTaskLoadingBarImage:setScale9Enabled(true)
WeekTaskLoadingBarImage:setCapInsets({x = 93, y = 7, width = 288, height = 14})
WeekTaskLoadingBarImage:setLayoutComponentEnabled(true)
WeekTaskLoadingBarImage:setName("WeekTaskLoadingBarImage")
WeekTaskLoadingBarImage:setTag(40)
WeekTaskLoadingBarImage:setCascadeColorEnabled(true)
WeekTaskLoadingBarImage:setCascadeOpacityEnabled(true)
WeekTaskLoadingBarImage:setPosition(365.9998, 870.0002)
layout = ccui.LayoutComponent:bindLayoutComponent(WeekTaskLoadingBarImage)
layout:setSize({width = 474.0000, height = 28.0000})
layout:setLeftMargin(128.9998)
layout:setRightMargin(-602.9998)
layout:setTopMargin(-884.0002)
layout:setBottomMargin(856.0002)
WeekTask:addChild(WeekTaskLoadingBarImage)

--Create WeekTaskLoadingBar
local WeekTaskLoadingBar = ccui.LoadingBar:create()
WeekTaskLoadingBar:loadTexture("01_04_Task/strip_014.png", 1)
WeekTaskLoadingBar:ignoreContentAdaptWithSize(false)
WeekTaskLoadingBar:setPercent(60)
WeekTaskLoadingBar:setLayoutComponentEnabled(true)
WeekTaskLoadingBar:setName("WeekTaskLoadingBar")
WeekTaskLoadingBar:setTag(38)
WeekTaskLoadingBar:setCascadeColorEnabled(true)
WeekTaskLoadingBar:setCascadeOpacityEnabled(true)
WeekTaskLoadingBar:setPosition(365.9998, 870.0002)
layout = ccui.LayoutComponent:bindLayoutComponent(WeekTaskLoadingBar)
layout:setSize({width = 474.0000, height = 28.0000})
layout:setLeftMargin(128.9998)
layout:setRightMargin(-602.9998)
layout:setTopMargin(-884.0002)
layout:setBottomMargin(856.0002)
WeekTask:addChild(WeekTaskLoadingBar)

--Create WeekTaskNum
local WeekTaskNum=cc.Node:create()
WeekTaskNum:setName("WeekTaskNum")
WeekTaskNum:setTag(48)
WeekTaskNum:setCascadeColorEnabled(true)
WeekTaskNum:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(WeekTaskNum)
WeekTask:addChild(WeekTaskNum)

--Create WeekTaskNum_1
local WeekTaskNum_1 = ccui.Text:create()
WeekTaskNum_1:ignoreContentAdaptWithSize(true)
WeekTaskNum_1:setTextAreaSize({width = 0, height = 0})
WeekTaskNum_1:setFontName("font/Font003.ttf")
WeekTaskNum_1:setFontSize(22)
WeekTaskNum_1:setString([[20]])
WeekTaskNum_1:setLayoutComponentEnabled(true)
WeekTaskNum_1:setName("WeekTaskNum_1")
WeekTaskNum_1:setTag(49)
WeekTaskNum_1:setCascadeColorEnabled(true)
WeekTaskNum_1:setCascadeOpacityEnabled(true)
WeekTaskNum_1:setPosition(204.9997, 870.0015)
WeekTaskNum_1:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(WeekTaskNum_1)
layout:setSize({width = 24.0000, height = 26.0000})
layout:setLeftMargin(192.9997)
layout:setRightMargin(-216.9997)
layout:setTopMargin(-883.0015)
layout:setBottomMargin(857.0015)
WeekTaskNum:addChild(WeekTaskNum_1)

--Create WeekTaskNum_2
local WeekTaskNum_2 = ccui.Text:create()
WeekTaskNum_2:ignoreContentAdaptWithSize(true)
WeekTaskNum_2:setTextAreaSize({width = 0, height = 0})
WeekTaskNum_2:setFontName("font/Font003.ttf")
WeekTaskNum_2:setFontSize(22)
WeekTaskNum_2:setString([[40]])
WeekTaskNum_2:setLayoutComponentEnabled(true)
WeekTaskNum_2:setName("WeekTaskNum_2")
WeekTaskNum_2:setTag(50)
WeekTaskNum_2:setCascadeColorEnabled(true)
WeekTaskNum_2:setCascadeOpacityEnabled(true)
WeekTaskNum_2:setPosition(299.9994, 869.9999)
WeekTaskNum_2:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(WeekTaskNum_2)
layout:setSize({width = 24.0000, height = 26.0000})
layout:setLeftMargin(287.9994)
layout:setRightMargin(-311.9994)
layout:setTopMargin(-882.9999)
layout:setBottomMargin(856.9999)
WeekTaskNum:addChild(WeekTaskNum_2)

--Create WeekTaskNum_3
local WeekTaskNum_3 = ccui.Text:create()
WeekTaskNum_3:ignoreContentAdaptWithSize(true)
WeekTaskNum_3:setTextAreaSize({width = 0, height = 0})
WeekTaskNum_3:setFontName("font/Font003.ttf")
WeekTaskNum_3:setFontSize(22)
WeekTaskNum_3:setString([[60]])
WeekTaskNum_3:setLayoutComponentEnabled(true)
WeekTaskNum_3:setName("WeekTaskNum_3")
WeekTaskNum_3:setTag(51)
WeekTaskNum_3:setCascadeColorEnabled(true)
WeekTaskNum_3:setCascadeOpacityEnabled(true)
WeekTaskNum_3:setPosition(394.9989, 869.9996)
WeekTaskNum_3:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(WeekTaskNum_3)
layout:setSize({width = 24.0000, height = 26.0000})
layout:setLeftMargin(382.9989)
layout:setRightMargin(-406.9989)
layout:setTopMargin(-882.9996)
layout:setBottomMargin(856.9996)
WeekTaskNum:addChild(WeekTaskNum_3)

--Create WeekTaskNum_4
local WeekTaskNum_4 = ccui.Text:create()
WeekTaskNum_4:ignoreContentAdaptWithSize(true)
WeekTaskNum_4:setTextAreaSize({width = 0, height = 0})
WeekTaskNum_4:setFontName("font/Font003.ttf")
WeekTaskNum_4:setFontSize(22)
WeekTaskNum_4:setString([[80]])
WeekTaskNum_4:setLayoutComponentEnabled(true)
WeekTaskNum_4:setName("WeekTaskNum_4")
WeekTaskNum_4:setTag(52)
WeekTaskNum_4:setCascadeColorEnabled(true)
WeekTaskNum_4:setCascadeOpacityEnabled(true)
WeekTaskNum_4:setPosition(488.9991, 870.0006)
WeekTaskNum_4:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(WeekTaskNum_4)
layout:setSize({width = 24.0000, height = 26.0000})
layout:setLeftMargin(476.9991)
layout:setRightMargin(-500.9991)
layout:setTopMargin(-883.0006)
layout:setBottomMargin(857.0006)
WeekTaskNum:addChild(WeekTaskNum_4)

--Create WeekTaskNum_5
local WeekTaskNum_5 = ccui.Text:create()
WeekTaskNum_5:ignoreContentAdaptWithSize(true)
WeekTaskNum_5:setTextAreaSize({width = 0, height = 0})
WeekTaskNum_5:setFontName("font/Font003.ttf")
WeekTaskNum_5:setFontSize(22)
WeekTaskNum_5:setString([[100]])
WeekTaskNum_5:setLayoutComponentEnabled(true)
WeekTaskNum_5:setName("WeekTaskNum_5")
WeekTaskNum_5:setTag(53)
WeekTaskNum_5:setCascadeColorEnabled(true)
WeekTaskNum_5:setCascadeOpacityEnabled(true)
WeekTaskNum_5:setPosition(578.9996, 869.9999)
WeekTaskNum_5:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(WeekTaskNum_5)
layout:setSize({width = 35.0000, height = 26.0000})
layout:setLeftMargin(561.4996)
layout:setRightMargin(-596.4996)
layout:setTopMargin(-882.9999)
layout:setBottomMargin(856.9999)
WeekTaskNum:addChild(WeekTaskNum_5)

--Create Receive
local Receive=cc.Node:create()
Receive:setName("Receive")
Receive:setTag(70)
Receive:setCascadeColorEnabled(true)
Receive:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Receive)
Middle:addChild(Receive)

--Create ReceiveButton

local luaScript = require("csd.LuaScript.newButton")
local ReceiveButton = luaScript.CreateCustomNode()
ReceiveButton:ignoreContentAdaptWithSize(false)
ReceiveButton:loadTextureNormal("01_04_Task/button_044.png", 1)
ReceiveButton:loadTexturePressed("01_04_Task/button_044.png", 1)
ReceiveButton:loadTextureDisabled("01_04_Task/button_044.png", 1)
ReceiveButton:setTitleFontSize(14)
ReceiveButton:setLayoutComponentEnabled(true)
ReceiveButton:setName("ReceiveButton")
ReceiveButton:setTag(71)
ReceiveButton:setCascadeColorEnabled(true)
ReceiveButton:setCascadeOpacityEnabled(true)
ReceiveButton:setPosition(323.5001, 70.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ReceiveButton)
layout:setSize({width = 208.0000, height = 98.0000})
layout:setLeftMargin(219.5001)
layout:setRightMargin(-427.5001)
layout:setTopMargin(-119.0000)
layout:setBottomMargin(21.0000)

luaScript.SetDownScele(ReceiveButton, "0.9800")
luaScript.SetClickEffect(ReceiveButton, "Sound004")
luaScript.SetDownColor(ReceiveButton, {r = 65, g = 65, b = 70})
Receive:addChild(ReceiveButton)

--Create ReceiveText_TT
local ReceiveText_TT = ccui.Text:create()
ReceiveText_TT:ignoreContentAdaptWithSize(true)
ReceiveText_TT:setTextAreaSize({width = 0, height = 0})
ReceiveText_TT:setFontName("font/Font001.ttf")
ReceiveText_TT:setFontSize(28)
ReceiveText_TT:setString([[一鍵領取]])
ReceiveText_TT:setTextHorizontalAlignment(1)
ReceiveText_TT:setTextVerticalAlignment(1)
ReceiveText_TT:enableShadow({r = 42, g = 42, b = 57, a = 255}, {width = 0, height = -1}, 0)
ReceiveText_TT:setLayoutComponentEnabled(true)
ReceiveText_TT:setName("ReceiveText_TT")
ReceiveText_TT:setTag(72)
ReceiveText_TT:setCascadeColorEnabled(true)
ReceiveText_TT:setCascadeOpacityEnabled(true)
ReceiveText_TT:setPosition(104.0000, 51.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ReceiveText_TT)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5204)
layout:setPercentWidth(0.5529)
layout:setPercentHeight(0.3776)
layout:setSize({width = 115.0000, height = 37.0000})
layout:setLeftMargin(46.5000)
layout:setRightMargin(46.5000)
layout:setTopMargin(28.5000)
layout:setBottomMargin(32.5000)
ReceiveButton:addChild(ReceiveText_TT)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

