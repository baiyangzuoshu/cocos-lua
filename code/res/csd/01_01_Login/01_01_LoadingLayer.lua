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
"ui/00_03_Bg/00_03_Bg_1.plist",	
"ui/00_03_Bg/00_03_Bg_2.plist",	
"ui/00_03_Bg/00_03_Bg_3.plist",	
"ui/00_03_Bg/00_03_Bg_4.plist",	
"ui/00_03_Bg/00_03_Bg_5.plist",	
"ui/01_01_Login/01_01_Login_1.plist",	
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
layout:setSize({width = 720.0000, height = 1280.0000})

--Create Bg
local Bg=cc.Node:create()
Bg:setName("Bg")
Bg:setTag(7)
Bg:setCascadeColorEnabled(true)
Bg:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Bg)
layout:setRightMargin(720.0000)
layout:setTopMargin(1280.0000)
Layer:addChild(Bg)

--Create bg_1
local bg_1 = ccui.ImageView:create()
bg_1:ignoreContentAdaptWithSize(false)
bg_1:loadTexture("00_03_Bg/bg_014.png", 1)
bg_1:setLayoutComponentEnabled(true)
bg_1:setName("bg_1")
bg_1:setTag(22)
bg_1:setCascadeColorEnabled(true)
bg_1:setCascadeOpacityEnabled(true)
bg_1:setAnchorPoint(0.0000, 0.0000)
bg_1:setPosition(0.0000, -160.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(bg_1)
layout:setSize({width = 720.0000, height = 1600.0000})
layout:setRightMargin(-720.0000)
layout:setTopMargin(-1440.0000)
layout:setBottomMargin(-160.0000)
Bg:addChild(bg_1)

--Create BelowLeftFit
local BelowLeftFit=cc.Node:create()
BelowLeftFit:setName("BelowLeftFit")
BelowLeftFit:setTag(157)
BelowLeftFit:setCascadeColorEnabled(true)
BelowLeftFit:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(BelowLeftFit)
layout:setRightMargin(720.0000)
layout:setTopMargin(1280.0000)
Layer:addChild(BelowLeftFit)

--Create Loading
local Loading=cc.Node:create()
Loading:setName("Loading")
Loading:setTag(98)
Loading:setCascadeColorEnabled(true)
Loading:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Loading)
BelowLeftFit:addChild(Loading)

--Create LoadingText_TT
local LoadingText_TT = ccui.Text:create()
LoadingText_TT:ignoreContentAdaptWithSize(true)
LoadingText_TT:setTextAreaSize({width = 0, height = 0})
LoadingText_TT:setFontName("font/Default.ttf")
LoadingText_TT:setFontSize(28)
LoadingText_TT:setString([[游戏加载中]])
LoadingText_TT:setTextHorizontalAlignment(1)
LoadingText_TT:setTextVerticalAlignment(1)
LoadingText_TT:setLayoutComponentEnabled(true)
LoadingText_TT:setName("LoadingText_TT")
LoadingText_TT:setTag(99)
LoadingText_TT:setCascadeColorEnabled(true)
LoadingText_TT:setCascadeOpacityEnabled(true)
LoadingText_TT:setAnchorPoint(1.0000, 0.5000)
LoadingText_TT:setPosition(430.5000, 229.9999)
layout = ccui.LayoutComponent:bindLayoutComponent(LoadingText_TT)
layout:setSize({width = 141.0000, height = 37.0000})
layout:setLeftMargin(289.5000)
layout:setRightMargin(-430.5000)
layout:setTopMargin(-248.4999)
layout:setBottomMargin(211.4999)
Loading:addChild(LoadingText_TT)

--Create Text_1
local Text_1 = ccui.Text:create()
Text_1:ignoreContentAdaptWithSize(true)
Text_1:setTextAreaSize({width = 0, height = 0})
Text_1:setFontName("font/Default.ttf")
Text_1:setFontSize(28)
Text_1:setString([[20%]])
Text_1:setTextHorizontalAlignment(1)
Text_1:setTextVerticalAlignment(1)
Text_1:setLayoutComponentEnabled(true)
Text_1:setName("Text_1")
Text_1:setTag(36)
Text_1:setCascadeColorEnabled(true)
Text_1:setCascadeOpacityEnabled(true)
Text_1:setAnchorPoint(0.0000, 0.5000)
Text_1:setPosition(437.5000, 227.9998)
layout = ccui.LayoutComponent:bindLayoutComponent(Text_1)
layout:setSize({width = 59.0000, height = 37.0000})
layout:setLeftMargin(437.5000)
layout:setRightMargin(-496.5000)
layout:setTopMargin(-246.4998)
layout:setBottomMargin(209.4998)
Loading:addChild(Text_1)

--Create LoadingHintText_TT
local LoadingHintText_TT = ccui.Text:create()
LoadingHintText_TT:ignoreContentAdaptWithSize(true)
LoadingHintText_TT:setTextAreaSize({width = 0, height = 0})
LoadingHintText_TT:setFontName("font/Default.ttf")
LoadingHintText_TT:setFontSize(22)
LoadingHintText_TT:setString([[想要在摇骰子这一比赛中获胜，需要先弄清对方的方法和风格]])
LoadingHintText_TT:setTextHorizontalAlignment(1)
LoadingHintText_TT:setTextVerticalAlignment(1)
LoadingHintText_TT:setLayoutComponentEnabled(true)
LoadingHintText_TT:setName("LoadingHintText_TT")
LoadingHintText_TT:setTag(100)
LoadingHintText_TT:setCascadeColorEnabled(true)
LoadingHintText_TT:setCascadeOpacityEnabled(true)
LoadingHintText_TT:setPosition(360.0000, 120.0000)
LoadingHintText_TT:setTextColor({r = 160, g = 160, b = 160})
layout = ccui.LayoutComponent:bindLayoutComponent(LoadingHintText_TT)
layout:setSize({width = 597.0000, height = 29.0000})
layout:setLeftMargin(61.5000)
layout:setRightMargin(-658.5000)
layout:setTopMargin(-134.5000)
layout:setBottomMargin(105.5000)
Loading:addChild(LoadingHintText_TT)

--Create LoadingStripBg
local LoadingStripBg = ccui.ImageView:create()
LoadingStripBg:ignoreContentAdaptWithSize(false)
LoadingStripBg:loadTexture("01_01_Login/strip_003.png", 1)
LoadingStripBg:setScale9Enabled(true)
LoadingStripBg:setCapInsets({x = 16, y = 9, width = 604, height = 10})
LoadingStripBg:setLayoutComponentEnabled(true)
LoadingStripBg:setName("LoadingStripBg")
LoadingStripBg:setTag(105)
LoadingStripBg:setCascadeColorEnabled(true)
LoadingStripBg:setCascadeOpacityEnabled(true)
LoadingStripBg:setPosition(360.0000, 158.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(LoadingStripBg)
layout:setSize({width = 636.0000, height = 28.0000})
layout:setLeftMargin(42.0000)
layout:setRightMargin(-678.0000)
layout:setTopMargin(-172.0000)
layout:setBottomMargin(144.0000)
Loading:addChild(LoadingStripBg)

--Create LoadingStrip
local LoadingStrip = ccui.LoadingBar:create()
LoadingStrip:loadTexture("01_01_Login/strip_002.png", 1)
LoadingStrip:ignoreContentAdaptWithSize(false)
LoadingStrip:setLayoutComponentEnabled(true)
LoadingStrip:setName("LoadingStrip")
LoadingStrip:setTag(104)
LoadingStrip:setCascadeColorEnabled(true)
LoadingStrip:setCascadeOpacityEnabled(true)
LoadingStrip:setPosition(360.9998, 159.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(LoadingStrip)
layout:setSize({width = 636.0000, height = 28.0000})
layout:setLeftMargin(42.9998)
layout:setRightMargin(-678.9998)
layout:setTopMargin(-173.0000)
layout:setBottomMargin(145.0000)
Loading:addChild(LoadingStrip)

--Create VersionNum
local VersionNum = ccui.Text:create()
VersionNum:ignoreContentAdaptWithSize(true)
VersionNum:setTextAreaSize({width = 0, height = 0})
VersionNum:setFontName("font/Font003.ttf")
VersionNum:setFontSize(32)
VersionNum:setString([[0.0.0.0]])
VersionNum:setTextHorizontalAlignment(2)
VersionNum:setTextVerticalAlignment(1)
VersionNum:setLayoutComponentEnabled(true)
VersionNum:setName("VersionNum")
VersionNum:setTag(97)
VersionNum:setCascadeColorEnabled(true)
VersionNum:setCascadeOpacityEnabled(true)
VersionNum:setAnchorPoint(1.0000, 0.5000)
VersionNum:setPosition(700.0000, 38.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(VersionNum)
layout:setSize({width = 87.0000, height = 37.0000})
layout:setLeftMargin(613.0000)
layout:setRightMargin(-700.0000)
layout:setTopMargin(-57.0000)
layout:setBottomMargin(20.0000)
BelowLeftFit:addChild(VersionNum)

--Create LogoPicture_SVT
local LogoPicture_SVT = cc.Sprite:createWithSpriteFrameName("01_01_Login/picture_105_zh_TW.png")
LogoPicture_SVT:setName("LogoPicture_SVT")
LogoPicture_SVT:setTag(401)
LogoPicture_SVT:setCascadeColorEnabled(true)
LogoPicture_SVT:setCascadeOpacityEnabled(true)
LogoPicture_SVT:setPosition(352.0005, 999.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(LogoPicture_SVT)
layout:setSize({width = 659.0000, height = 384.0000})
layout:setLeftMargin(22.5005)
layout:setRightMargin(-681.5005)
layout:setTopMargin(-1191.0000)
layout:setBottomMargin(807.0000)
LogoPicture_SVT:setBlendFunc({src = 1, dst = 771})
BelowLeftFit:addChild(LogoPicture_SVT)

--Create Bg_101_1
local Bg_101_1 = cc.Sprite:createWithSpriteFrameName("Default/Sprite.png")
Bg_101_1:setName("Bg_101_1")
Bg_101_1:setTag(87)
Bg_101_1:setCascadeColorEnabled(true)
Bg_101_1:setCascadeOpacityEnabled(true)
Bg_101_1:setAnchorPoint(0.0000, 0.0000)
Bg_101_1:setPosition(0.0000, -160.0000)
Bg_101_1:setOpacity(171)
layout = ccui.LayoutComponent:bindLayoutComponent(Bg_101_1)
layout:setPositionPercentY(-0.1250)
layout:setPercentWidth(0.0639)
layout:setPercentHeight(0.0359)
layout:setSize({width = 46.0000, height = 46.0000})
layout:setRightMargin(674.0000)
layout:setTopMargin(1394.0000)
layout:setBottomMargin(-160.0000)
Bg_101_1:setBlendFunc({src = 1, dst = 771})
Layer:addChild(Bg_101_1)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

