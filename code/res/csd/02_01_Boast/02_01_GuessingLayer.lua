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
"ui/02_01_Boast/02_01_Boast_1.plist",	
"ui/02_01_Boast/02_01_Boast_2.plist",	
"ui/00_02_Default/00_02_Default_1.plist",	
"ui/00_01_Common/00_01_Common_1.plist",	
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

--Create Middle
local Middle=cc.Node:create()
Middle:setName("Middle")
Middle:setTag(88)
Middle:setCascadeColorEnabled(true)
Middle:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Middle)
layout:setRightMargin(720.0000)
layout:setTopMargin(1280.0000)
Layer:addChild(Middle)

--Create GuessingBg_1
local GuessingBg_1 = ccui.ImageView:create()
GuessingBg_1:ignoreContentAdaptWithSize(false)
GuessingBg_1:loadTexture("02_01_Boast/frame_014.png", 1)
GuessingBg_1:setLayoutComponentEnabled(true)
GuessingBg_1:setName("GuessingBg_1")
GuessingBg_1:setTag(89)
GuessingBg_1:setCascadeColorEnabled(true)
GuessingBg_1:setCascadeOpacityEnabled(true)
GuessingBg_1:setPosition(354.9999, 862.9991)
layout = ccui.LayoutComponent:bindLayoutComponent(GuessingBg_1)
layout:setSize({width = 516.0000, height = 210.0000})
layout:setLeftMargin(96.9999)
layout:setRightMargin(-612.9999)
layout:setTopMargin(-967.9991)
layout:setBottomMargin(757.9991)
Middle:addChild(GuessingBg_1)

--Create GuessingImage_IVT
local GuessingImage_IVT = ccui.ImageView:create()
GuessingImage_IVT:ignoreContentAdaptWithSize(false)
GuessingImage_IVT:loadTexture("02_01_Boast/picture_003_zh_CN.png", 1)
GuessingImage_IVT:setLayoutComponentEnabled(true)
GuessingImage_IVT:setName("GuessingImage_IVT")
GuessingImage_IVT:setTag(90)
GuessingImage_IVT:setCascadeColorEnabled(true)
GuessingImage_IVT:setCascadeOpacityEnabled(true)
GuessingImage_IVT:setPosition(357.9998, 915.9996)
layout = ccui.LayoutComponent:bindLayoutComponent(GuessingImage_IVT)
layout:setSize({width = 326.0000, height = 116.0000})
layout:setLeftMargin(194.9998)
layout:setRightMargin(-520.9998)
layout:setTopMargin(-973.9996)
layout:setBottomMargin(857.9996)
Middle:addChild(GuessingImage_IVT)

--Create GuessingNum
local GuessingNum = ccui.Text:create()
GuessingNum:ignoreContentAdaptWithSize(true)
GuessingNum:setTextAreaSize({width = 0, height = 0})
GuessingNum:setFontName("font/Font003.ttf")
GuessingNum:setFontSize(50)
GuessingNum:setString([[234.5萬]])
GuessingNum:setLayoutComponentEnabled(true)
GuessingNum:setName("GuessingNum")
GuessingNum:setTag(93)
GuessingNum:setCascadeColorEnabled(true)
GuessingNum:setCascadeOpacityEnabled(true)
GuessingNum:setPosition(380.0000, 841.0000)
GuessingNum:setTextColor({r = 255, g = 238, b = 104})
layout = ccui.LayoutComponent:bindLayoutComponent(GuessingNum)
layout:setSize({width = 160.0000, height = 58.0000})
layout:setLeftMargin(300.0000)
layout:setRightMargin(-460.0000)
layout:setTopMargin(-870.0000)
layout:setBottomMargin(812.0000)
Middle:addChild(GuessingNum)

--Create GuessingIcon_1
local GuessingIcon_1 = ccui.ImageView:create()
GuessingIcon_1:ignoreContentAdaptWithSize(false)
GuessingIcon_1:loadTexture("00_02_Default/2.png", 1)
GuessingIcon_1:setLayoutComponentEnabled(true)
GuessingIcon_1:setName("GuessingIcon_1")
GuessingIcon_1:setTag(96)
GuessingIcon_1:setCascadeColorEnabled(true)
GuessingIcon_1:setCascadeOpacityEnabled(true)
GuessingIcon_1:setPosition(270.0000, 839.9983)
layout = ccui.LayoutComponent:bindLayoutComponent(GuessingIcon_1)
layout:setSize({width = 40.0000, height = 40.0000})
layout:setLeftMargin(250.0000)
layout:setRightMargin(-290.0000)
layout:setTopMargin(-859.9983)
layout:setBottomMargin(819.9983)
Middle:addChild(GuessingIcon_1)

--Create HeadShowNode
local HeadShowNode=cc.Node:create()
HeadShowNode:setName("HeadShowNode")
HeadShowNode:setTag(658)
HeadShowNode:setCascadeColorEnabled(true)
HeadShowNode:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(HeadShowNode)
Middle:addChild(HeadShowNode)

--Create LeftHeadIcon
local LeftHeadIcon=cc.Node:create()
LeftHeadIcon:setName("LeftHeadIcon")
LeftHeadIcon:setTag(534)
LeftHeadIcon:setCascadeColorEnabled(true)
LeftHeadIcon:setCascadeOpacityEnabled(true)
LeftHeadIcon:setPosition(271.0000, 700.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(LeftHeadIcon)
layout:setLeftMargin(271.0000)
layout:setRightMargin(-271.0000)
layout:setTopMargin(-700.0000)
layout:setBottomMargin(700.0000)
HeadShowNode:addChild(LeftHeadIcon)

--Create LeftHeadFrame
local LeftHeadFrame = ccui.ImageView:create()
LeftHeadFrame:ignoreContentAdaptWithSize(false)
LeftHeadFrame:loadTexture("Default/ImageFile.png", 1)
LeftHeadFrame:setLayoutComponentEnabled(true)
LeftHeadFrame:setName("LeftHeadFrame")
LeftHeadFrame:setTag(844)
LeftHeadFrame:setCascadeColorEnabled(true)
LeftHeadFrame:setCascadeOpacityEnabled(true)
LeftHeadFrame:setPosition(271.0000, 700.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(LeftHeadFrame)
layout:setSize({width = 120.0000, height = 120.0000})
layout:setLeftMargin(211.0000)
layout:setRightMargin(-331.0000)
layout:setTopMargin(-760.0000)
layout:setBottomMargin(640.0000)
HeadShowNode:addChild(LeftHeadFrame)

--Create LeftHeadPanel
local LeftHeadPanel = ccui.Layout:create()
LeftHeadPanel:ignoreContentAdaptWithSize(false)
LeftHeadPanel:setClippingEnabled(false)
LeftHeadPanel:setBackGroundColorOpacity(102)
LeftHeadPanel:setTouchEnabled(true);
LeftHeadPanel:setLayoutComponentEnabled(true)
LeftHeadPanel:setName("LeftHeadPanel")
LeftHeadPanel:setTag(2265)
LeftHeadPanel:setCascadeColorEnabled(true)
LeftHeadPanel:setCascadeOpacityEnabled(true)
LeftHeadPanel:setAnchorPoint(0.5000, 0.5000)
LeftHeadPanel:setPosition(271.0000, 700.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(LeftHeadPanel)
layout:setSize({width = 120.0000, height = 120.0000})
layout:setLeftMargin(211.0000)
layout:setRightMargin(-331.0000)
layout:setTopMargin(-760.0000)
layout:setBottomMargin(640.0000)
HeadShowNode:addChild(LeftHeadPanel)

--Create RightHeadIcon
local RightHeadIcon=cc.Node:create()
RightHeadIcon:setName("RightHeadIcon")
RightHeadIcon:setTag(535)
RightHeadIcon:setCascadeColorEnabled(true)
RightHeadIcon:setCascadeOpacityEnabled(true)
RightHeadIcon:setPosition(448.0000, 700.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(RightHeadIcon)
layout:setLeftMargin(448.0000)
layout:setRightMargin(-448.0000)
layout:setTopMargin(-700.0000)
layout:setBottomMargin(700.0000)
HeadShowNode:addChild(RightHeadIcon)

--Create RightHeadFrame
local RightHeadFrame = ccui.ImageView:create()
RightHeadFrame:ignoreContentAdaptWithSize(false)
RightHeadFrame:loadTexture("Default/ImageFile.png", 1)
RightHeadFrame:setLayoutComponentEnabled(true)
RightHeadFrame:setName("RightHeadFrame")
RightHeadFrame:setTag(846)
RightHeadFrame:setCascadeColorEnabled(true)
RightHeadFrame:setCascadeOpacityEnabled(true)
RightHeadFrame:setPosition(448.0000, 700.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(RightHeadFrame)
layout:setSize({width = 120.0000, height = 120.0000})
layout:setLeftMargin(388.0000)
layout:setRightMargin(-508.0000)
layout:setTopMargin(-760.0000)
layout:setBottomMargin(640.0000)
HeadShowNode:addChild(RightHeadFrame)

--Create RightHeadPanel
local RightHeadPanel = ccui.Layout:create()
RightHeadPanel:ignoreContentAdaptWithSize(false)
RightHeadPanel:setClippingEnabled(false)
RightHeadPanel:setBackGroundColorOpacity(102)
RightHeadPanel:setTouchEnabled(true);
RightHeadPanel:setLayoutComponentEnabled(true)
RightHeadPanel:setName("RightHeadPanel")
RightHeadPanel:setTag(2266)
RightHeadPanel:setCascadeColorEnabled(true)
RightHeadPanel:setCascadeOpacityEnabled(true)
RightHeadPanel:setAnchorPoint(0.5000, 0.5000)
RightHeadPanel:setPosition(448.0000, 700.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(RightHeadPanel)
layout:setSize({width = 120.0000, height = 120.0000})
layout:setLeftMargin(388.0000)
layout:setRightMargin(-508.0000)
layout:setTopMargin(-760.0000)
layout:setBottomMargin(640.0000)
HeadShowNode:addChild(RightHeadPanel)

--Create VSIcon
local VSIcon = ccui.ImageView:create()
VSIcon:ignoreContentAdaptWithSize(false)
VSIcon:loadTexture("02_01_Boast/icon_087.png", 1)
VSIcon:setLayoutComponentEnabled(true)
VSIcon:setName("VSIcon")
VSIcon:setTag(848)
VSIcon:setCascadeColorEnabled(true)
VSIcon:setCascadeOpacityEnabled(true)
VSIcon:setPosition(360.0000, 653.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(VSIcon)
layout:setSize({width = 108.0000, height = 70.0000})
layout:setLeftMargin(306.0000)
layout:setRightMargin(-414.0000)
layout:setTopMargin(-688.0000)
layout:setBottomMargin(618.0000)
HeadShowNode:addChild(VSIcon)

--Create GamePlayerLeftCallPoint
local GamePlayerLeftCallPoint = cc.Sprite:createWithSpriteFrameName("02_01_Boast/frame_027.png")
GamePlayerLeftCallPoint:setName("GamePlayerLeftCallPoint")
GamePlayerLeftCallPoint:setTag(368)
GamePlayerLeftCallPoint:setCascadeColorEnabled(true)
GamePlayerLeftCallPoint:setCascadeOpacityEnabled(true)
GamePlayerLeftCallPoint:setAnchorPoint(1.0000, 0.0000)
GamePlayerLeftCallPoint:setPosition(230.0000, 702.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(GamePlayerLeftCallPoint)
layout:setSize({width = 146.0000, height = 70.0000})
layout:setLeftMargin(84.0000)
layout:setRightMargin(-230.0000)
layout:setTopMargin(-772.0000)
layout:setBottomMargin(702.0000)
GamePlayerLeftCallPoint:setBlendFunc({src = 1, dst = 771})
HeadShowNode:addChild(GamePlayerLeftCallPoint)

--Create VerticesImage
local VerticesImage = ccui.ImageView:create()
VerticesImage:ignoreContentAdaptWithSize(false)
VerticesImage:loadTexture("00_01_Common/2D_Small_6.png", 1)
VerticesImage:setLayoutComponentEnabled(true)
VerticesImage:setName("VerticesImage")
VerticesImage:setTag(369)
VerticesImage:setCascadeColorEnabled(true)
VerticesImage:setCascadeOpacityEnabled(true)
VerticesImage:setPosition(107.0000, 40.0000)
VerticesImage:setScaleX(0.7000)
VerticesImage:setScaleY(0.7000)
layout = ccui.LayoutComponent:bindLayoutComponent(VerticesImage)
layout:setPositionPercentX(0.7329)
layout:setPositionPercentY(0.5714)
layout:setPercentWidth(0.5205)
layout:setPercentHeight(1.0857)
layout:setSize({width = 76.0000, height = 76.0000})
layout:setLeftMargin(69.0000)
layout:setRightMargin(1.0000)
layout:setTopMargin(-8.0000)
layout:setBottomMargin(2.0000)
GamePlayerLeftCallPoint:addChild(VerticesImage)

--Create VerticesText_TT
local VerticesText_TT = ccui.Text:create()
VerticesText_TT:ignoreContentAdaptWithSize(true)
VerticesText_TT:setTextAreaSize({width = 0, height = 0})
VerticesText_TT:setFontName("font/Font001.ttf")
VerticesText_TT:setFontSize(32)
VerticesText_TT:setString([[個]])
VerticesText_TT:setTextHorizontalAlignment(1)
VerticesText_TT:setTextVerticalAlignment(1)
VerticesText_TT:setLayoutComponentEnabled(true)
VerticesText_TT:setName("VerticesText_TT")
VerticesText_TT:setTag(370)
VerticesText_TT:setCascadeColorEnabled(true)
VerticesText_TT:setCascadeOpacityEnabled(true)
VerticesText_TT:setPosition(64.0000, 42.5000)
VerticesText_TT:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(VerticesText_TT)
layout:setPositionPercentX(0.4384)
layout:setPositionPercentY(0.6071)
layout:setPercentWidth(0.2329)
layout:setPercentHeight(0.6000)
layout:setSize({width = 34.0000, height = 42.0000})
layout:setLeftMargin(47.0000)
layout:setRightMargin(65.0000)
layout:setTopMargin(6.5000)
layout:setBottomMargin(21.5000)
GamePlayerLeftCallPoint:addChild(VerticesText_TT)

--Create VerticesNum
local VerticesNum = ccui.Text:create()
VerticesNum:ignoreContentAdaptWithSize(true)
VerticesNum:setTextAreaSize({width = 0, height = 0})
VerticesNum:setFontName("font/Font003.ttf")
VerticesNum:setFontSize(40)
VerticesNum:setString([[12]])
VerticesNum:setTextHorizontalAlignment(1)
VerticesNum:setTextVerticalAlignment(1)
VerticesNum:setLayoutComponentEnabled(true)
VerticesNum:setName("VerticesNum")
VerticesNum:setTag(371)
VerticesNum:setCascadeColorEnabled(true)
VerticesNum:setCascadeOpacityEnabled(true)
VerticesNum:setAnchorPoint(0.7500, 0.5000)
VerticesNum:setPosition(35.0000, 40.0000)
VerticesNum:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(VerticesNum)
layout:setPositionPercentX(0.2397)
layout:setPositionPercentY(0.5714)
layout:setPercentWidth(0.2740)
layout:setPercentHeight(0.6714)
layout:setSize({width = 40.0000, height = 47.0000})
layout:setLeftMargin(5.0000)
layout:setRightMargin(101.0000)
layout:setTopMargin(6.5000)
layout:setBottomMargin(16.5000)
GamePlayerLeftCallPoint:addChild(VerticesNum)

--Create GamePlayerRightOpenImage_IVT
local GamePlayerRightOpenImage_IVT = ccui.ImageView:create()
GamePlayerRightOpenImage_IVT:ignoreContentAdaptWithSize(false)
GamePlayerRightOpenImage_IVT:loadTexture("02_01_Boast/picture_012_zh_CN.png", 1)
GamePlayerRightOpenImage_IVT:setLayoutComponentEnabled(true)
GamePlayerRightOpenImage_IVT:setName("GamePlayerRightOpenImage_IVT")
GamePlayerRightOpenImage_IVT:setTag(861)
GamePlayerRightOpenImage_IVT:setCascadeColorEnabled(true)
GamePlayerRightOpenImage_IVT:setCascadeOpacityEnabled(true)
GamePlayerRightOpenImage_IVT:setAnchorPoint(0.0000, 0.0000)
GamePlayerRightOpenImage_IVT:setPosition(498.0000, 702.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(GamePlayerRightOpenImage_IVT)
layout:setSize({width = 76.0000, height = 70.0000})
layout:setLeftMargin(498.0000)
layout:setRightMargin(-574.0000)
layout:setTopMargin(-772.0000)
layout:setBottomMargin(702.0000)
HeadShowNode:addChild(GamePlayerRightOpenImage_IVT)

--Create Enough
local Enough=cc.Node:create()
Enough:setName("Enough")
Enough:setTag(284)
Enough:setCascadeColorEnabled(true)
Enough:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Enough)
Middle:addChild(Enough)

--Create EnoughChoosedImage_0
local EnoughChoosedImage_0 = ccui.ImageView:create()
EnoughChoosedImage_0:ignoreContentAdaptWithSize(false)
EnoughChoosedImage_0:loadTexture("02_01_Boast/button_013_2.png", 1)
EnoughChoosedImage_0:setLayoutComponentEnabled(true)
EnoughChoosedImage_0:setName("EnoughChoosedImage_0")
EnoughChoosedImage_0:setTag(147)
EnoughChoosedImage_0:setCascadeColorEnabled(true)
EnoughChoosedImage_0:setCascadeOpacityEnabled(true)
EnoughChoosedImage_0:setPosition(255.0000, 553.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(EnoughChoosedImage_0)
layout:setSize({width = 162.0000, height = 100.0000})
layout:setLeftMargin(174.0000)
layout:setRightMargin(-336.0000)
layout:setTopMargin(-603.0000)
layout:setBottomMargin(503.0000)
Enough:addChild(EnoughChoosedImage_0)

--Create EnoughButton

local luaScript = require("csd.LuaScript.newButton")
local EnoughButton = luaScript.CreateCustomNode()
EnoughButton:ignoreContentAdaptWithSize(false)
EnoughButton:loadTextureNormal("02_01_Boast/button_013.png", 1)
EnoughButton:loadTexturePressed("02_01_Boast/button_013.png", 1)
EnoughButton:loadTextureDisabled("02_01_Boast/button_013_1.png", 1)
EnoughButton:setTitleFontSize(14)
EnoughButton:setLayoutComponentEnabled(true)
EnoughButton:setName("EnoughButton")
EnoughButton:setTag(283)
EnoughButton:setCascadeColorEnabled(true)
EnoughButton:setCascadeOpacityEnabled(true)
EnoughButton:setPosition(255.0000, 553.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(EnoughButton)
layout:setSize({width = 162.0000, height = 100.0000})
layout:setLeftMargin(174.0000)
layout:setRightMargin(-336.0000)
layout:setTopMargin(-603.0000)
layout:setBottomMargin(503.0000)

luaScript.SetDownScele(EnoughButton, "0.9800")
luaScript.SetClickEffect(EnoughButton, "Sound004")
luaScript.SetDownColor(EnoughButton, {r = 65, g = 65, b = 70})
Enough:addChild(EnoughButton)

--Create EnoughText_TT
local EnoughText_TT = ccui.Text:create()
EnoughText_TT:ignoreContentAdaptWithSize(true)
EnoughText_TT:setTextAreaSize({width = 0, height = 0})
EnoughText_TT:setFontName("font/Font001.ttf")
EnoughText_TT:setFontSize(40)
EnoughText_TT:setString([[够]])
EnoughText_TT:setTextHorizontalAlignment(1)
EnoughText_TT:setTextVerticalAlignment(1)
EnoughText_TT:setLayoutComponentEnabled(true)
EnoughText_TT:setName("EnoughText_TT")
EnoughText_TT:setTag(285)
EnoughText_TT:setCascadeColorEnabled(true)
EnoughText_TT:setCascadeOpacityEnabled(true)
EnoughText_TT:setPosition(254.0015, 558.0016)
EnoughText_TT:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(EnoughText_TT)
layout:setSize({width = 43.0000, height = 53.0000})
layout:setLeftMargin(232.5015)
layout:setRightMargin(-275.5015)
layout:setTopMargin(-584.5016)
layout:setBottomMargin(531.5016)
Enough:addChild(EnoughText_TT)

--Create TipBg
local TipBg = ccui.ImageView:create()
TipBg:ignoreContentAdaptWithSize(false)
TipBg:loadTexture("02_01_Boast/picture_002.png", 1)
TipBg:setLayoutComponentEnabled(true)
TipBg:setName("TipBg")
TipBg:setTag(286)
TipBg:setCascadeColorEnabled(true)
TipBg:setCascadeOpacityEnabled(true)
TipBg:setPosition(305.0000, 598.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(TipBg)
layout:setSize({width = 138.0000, height = 60.0000})
layout:setLeftMargin(236.0000)
layout:setRightMargin(-374.0000)
layout:setTopMargin(-628.0000)
layout:setBottomMargin(568.0000)
Enough:addChild(TipBg)

--Create GuessingGoldIcon_1
local GuessingGoldIcon_1 = ccui.ImageView:create()
GuessingGoldIcon_1:ignoreContentAdaptWithSize(false)
GuessingGoldIcon_1:loadTexture("00_02_Default/2.png", 1)
GuessingGoldIcon_1:setLayoutComponentEnabled(true)
GuessingGoldIcon_1:setName("GuessingGoldIcon_1")
GuessingGoldIcon_1:setTag(372)
GuessingGoldIcon_1:setCascadeColorEnabled(true)
GuessingGoldIcon_1:setCascadeOpacityEnabled(true)
GuessingGoldIcon_1:setPosition(29.0000, 30.0000)
GuessingGoldIcon_1:setScaleX(0.8000)
GuessingGoldIcon_1:setScaleY(0.8000)
layout = ccui.LayoutComponent:bindLayoutComponent(GuessingGoldIcon_1)
layout:setPositionPercentX(0.2101)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.2899)
layout:setPercentHeight(0.6667)
layout:setSize({width = 40.0000, height = 40.0000})
layout:setLeftMargin(9.0000)
layout:setRightMargin(89.0000)
layout:setTopMargin(10.0000)
layout:setBottomMargin(10.0000)
TipBg:addChild(GuessingGoldIcon_1)

--Create TipNum
local TipNum = ccui.Text:create()
TipNum:ignoreContentAdaptWithSize(true)
TipNum:setTextAreaSize({width = 0, height = 0})
TipNum:setFontName("font/Font003.ttf")
TipNum:setFontSize(22)
TipNum:setString([[234.5萬]])
TipNum:setTextHorizontalAlignment(1)
TipNum:setTextVerticalAlignment(1)
TipNum:setLayoutComponentEnabled(true)
TipNum:setName("TipNum")
TipNum:setTag(288)
TipNum:setCascadeColorEnabled(true)
TipNum:setCascadeOpacityEnabled(true)
TipNum:setAnchorPoint(1.0000, 0.5000)
TipNum:setPosition(119.0000, 30.0000)
TipNum:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(TipNum)
layout:setPositionPercentX(0.8623)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.5362)
layout:setPercentHeight(0.4333)
layout:setSize({width = 74.0000, height = 26.0000})
layout:setLeftMargin(45.0000)
layout:setRightMargin(19.0000)
layout:setTopMargin(17.0000)
layout:setBottomMargin(17.0000)
TipBg:addChild(TipNum)

--Create NotEnough
local NotEnough=cc.Node:create()
NotEnough:setName("NotEnough")
NotEnough:setTag(289)
NotEnough:setCascadeColorEnabled(true)
NotEnough:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(NotEnough)
Middle:addChild(NotEnough)

--Create NotEnoughChoosedImage
local NotEnoughChoosedImage = ccui.ImageView:create()
NotEnoughChoosedImage:ignoreContentAdaptWithSize(false)
NotEnoughChoosedImage:loadTexture("02_01_Boast/button_013_2.png", 1)
NotEnoughChoosedImage:setLayoutComponentEnabled(true)
NotEnoughChoosedImage:setName("NotEnoughChoosedImage")
NotEnoughChoosedImage:setTag(146)
NotEnoughChoosedImage:setCascadeColorEnabled(true)
NotEnoughChoosedImage:setCascadeOpacityEnabled(true)
NotEnoughChoosedImage:setPosition(465.0000, 553.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(NotEnoughChoosedImage)
layout:setSize({width = 162.0000, height = 100.0000})
layout:setLeftMargin(384.0000)
layout:setRightMargin(-546.0000)
layout:setTopMargin(-603.0000)
layout:setBottomMargin(503.0000)
NotEnough:addChild(NotEnoughChoosedImage)

--Create NotEnoughButton

local luaScript = require("csd.LuaScript.newButton")
local NotEnoughButton = luaScript.CreateCustomNode()
NotEnoughButton:ignoreContentAdaptWithSize(false)
NotEnoughButton:loadTextureNormal("02_01_Boast/button_013.png", 1)
NotEnoughButton:loadTexturePressed("02_01_Boast/button_013.png", 1)
NotEnoughButton:loadTextureDisabled("02_01_Boast/button_013_1.png", 1)
NotEnoughButton:setTitleFontSize(14)
NotEnoughButton:setLayoutComponentEnabled(true)
NotEnoughButton:setName("NotEnoughButton")
NotEnoughButton:setTag(291)
NotEnoughButton:setCascadeColorEnabled(true)
NotEnoughButton:setCascadeOpacityEnabled(true)
NotEnoughButton:setPosition(465.0001, 553.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(NotEnoughButton)
layout:setSize({width = 162.0000, height = 100.0000})
layout:setLeftMargin(384.0001)
layout:setRightMargin(-546.0001)
layout:setTopMargin(-603.0000)
layout:setBottomMargin(503.0000)

luaScript.SetDownScele(NotEnoughButton, "0.9800")
luaScript.SetClickEffect(NotEnoughButton, "Sound004")
luaScript.SetDownColor(NotEnoughButton, {r = 65, g = 65, b = 70})
NotEnough:addChild(NotEnoughButton)

--Create NotEnoughText_TT
local NotEnoughText_TT = ccui.Text:create()
NotEnoughText_TT:ignoreContentAdaptWithSize(true)
NotEnoughText_TT:setTextAreaSize({width = 0, height = 0})
NotEnoughText_TT:setFontName("font/Font001.ttf")
NotEnoughText_TT:setFontSize(40)
NotEnoughText_TT:setString([[不够]])
NotEnoughText_TT:setTextHorizontalAlignment(1)
NotEnoughText_TT:setTextVerticalAlignment(1)
NotEnoughText_TT:setLayoutComponentEnabled(true)
NotEnoughText_TT:setName("NotEnoughText_TT")
NotEnoughText_TT:setTag(292)
NotEnoughText_TT:setCascadeColorEnabled(true)
NotEnoughText_TT:setCascadeOpacityEnabled(true)
NotEnoughText_TT:setPosition(463.9982, 557.9983)
NotEnoughText_TT:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(NotEnoughText_TT)
layout:setSize({width = 83.0000, height = 53.0000})
layout:setLeftMargin(422.4982)
layout:setRightMargin(-505.4982)
layout:setTopMargin(-584.4983)
layout:setBottomMargin(531.4983)
NotEnough:addChild(NotEnoughText_TT)

--Create TipBg_1
local TipBg_1 = ccui.ImageView:create()
TipBg_1:ignoreContentAdaptWithSize(false)
TipBg_1:loadTexture("02_01_Boast/picture_002.png", 1)
TipBg_1:setLayoutComponentEnabled(true)
TipBg_1:setName("TipBg_1")
TipBg_1:setTag(293)
TipBg_1:setCascadeColorEnabled(true)
TipBg_1:setCascadeOpacityEnabled(true)
TipBg_1:setPosition(515.0000, 598.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(TipBg_1)
layout:setSize({width = 138.0000, height = 60.0000})
layout:setLeftMargin(446.0000)
layout:setRightMargin(-584.0000)
layout:setTopMargin(-628.0000)
layout:setBottomMargin(568.0000)
NotEnough:addChild(TipBg_1)

--Create GuessingGoldIcon_1
local GuessingGoldIcon_1 = ccui.ImageView:create()
GuessingGoldIcon_1:ignoreContentAdaptWithSize(false)
GuessingGoldIcon_1:loadTexture("00_02_Default/2.png", 1)
GuessingGoldIcon_1:setLayoutComponentEnabled(true)
GuessingGoldIcon_1:setName("GuessingGoldIcon_1")
GuessingGoldIcon_1:setTag(373)
GuessingGoldIcon_1:setCascadeColorEnabled(true)
GuessingGoldIcon_1:setCascadeOpacityEnabled(true)
GuessingGoldIcon_1:setPosition(29.0000, 30.0000)
GuessingGoldIcon_1:setScaleX(0.8000)
GuessingGoldIcon_1:setScaleY(0.8000)
layout = ccui.LayoutComponent:bindLayoutComponent(GuessingGoldIcon_1)
layout:setPositionPercentX(0.2101)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.2899)
layout:setPercentHeight(0.6667)
layout:setSize({width = 40.0000, height = 40.0000})
layout:setLeftMargin(9.0000)
layout:setRightMargin(89.0000)
layout:setTopMargin(10.0000)
layout:setBottomMargin(10.0000)
TipBg_1:addChild(GuessingGoldIcon_1)

--Create TipNum_1
local TipNum_1 = ccui.Text:create()
TipNum_1:ignoreContentAdaptWithSize(true)
TipNum_1:setTextAreaSize({width = 0, height = 0})
TipNum_1:setFontName("font/Font003.ttf")
TipNum_1:setFontSize(22)
TipNum_1:setString([[234.5萬]])
TipNum_1:setTextHorizontalAlignment(1)
TipNum_1:setTextVerticalAlignment(1)
TipNum_1:setLayoutComponentEnabled(true)
TipNum_1:setName("TipNum_1")
TipNum_1:setTag(296)
TipNum_1:setCascadeColorEnabled(true)
TipNum_1:setCascadeOpacityEnabled(true)
TipNum_1:setAnchorPoint(1.0000, 0.5000)
TipNum_1:setPosition(118.9999, 30.0000)
TipNum_1:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(TipNum_1)
layout:setPositionPercentX(0.8623)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.5362)
layout:setPercentHeight(0.4333)
layout:setSize({width = 74.0000, height = 26.0000})
layout:setLeftMargin(44.9999)
layout:setRightMargin(19.0001)
layout:setTopMargin(17.0000)
layout:setBottomMargin(17.0000)
TipBg_1:addChild(TipNum_1)

--Create Stake
local Stake=cc.Node:create()
Stake:setName("Stake")
Stake:setTag(300)
Stake:setCascadeColorEnabled(true)
Stake:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Stake)
Middle:addChild(Stake)

--Create StakeText_1_TT
local StakeText_1_TT = ccui.Text:create()
StakeText_1_TT:ignoreContentAdaptWithSize(true)
StakeText_1_TT:setTextAreaSize({width = 0, height = 0})
StakeText_1_TT:setFontName("font/Default.ttf")
StakeText_1_TT:setFontSize(26)
StakeText_1_TT:setString([[选择一方，押注234.5萬金币]])
StakeText_1_TT:setTextVerticalAlignment(1)
StakeText_1_TT:setLayoutComponentEnabled(true)
StakeText_1_TT:setName("StakeText_1_TT")
StakeText_1_TT:setTag(297)
StakeText_1_TT:setCascadeColorEnabled(true)
StakeText_1_TT:setCascadeOpacityEnabled(true)
StakeText_1_TT:setPosition(360.0000, 482.0004)
layout = ccui.LayoutComponent:bindLayoutComponent(StakeText_1_TT)
layout:setSize({width = 328.0000, height = 34.0000})
layout:setLeftMargin(196.0000)
layout:setRightMargin(-524.0000)
layout:setTopMargin(-499.0004)
layout:setBottomMargin(465.0004)
Stake:addChild(StakeText_1_TT)

--Create Time
local Time=cc.Node:create()
Time:setName("Time")
Time:setTag(301)
Time:setCascadeColorEnabled(true)
Time:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Time)
Middle:addChild(Time)

--Create TimeText_TT
local TimeText_TT = ccui.Text:create()
TimeText_TT:ignoreContentAdaptWithSize(true)
TimeText_TT:setTextAreaSize({width = 0, height = 0})
TimeText_TT:setFontName("font/Default.ttf")
TimeText_TT:setFontSize(24)
TimeText_TT:setString([[5 秒后结束竞猜]])
TimeText_TT:setTextHorizontalAlignment(1)
TimeText_TT:setTextVerticalAlignment(1)
TimeText_TT:setLayoutComponentEnabled(true)
TimeText_TT:setName("TimeText_TT")
TimeText_TT:setTag(303)
TimeText_TT:setCascadeColorEnabled(true)
TimeText_TT:setCascadeOpacityEnabled(true)
TimeText_TT:setPosition(358.0032, 437.0031)
TimeText_TT:setTextColor({r = 160, g = 160, b = 160})
layout = ccui.LayoutComponent:bindLayoutComponent(TimeText_TT)
layout:setSize({width = 168.0000, height = 32.0000})
layout:setLeftMargin(274.0032)
layout:setRightMargin(-442.0032)
layout:setTopMargin(-453.0031)
layout:setBottomMargin(421.0031)
Time:addChild(TimeText_TT)

--Create GuessingHeadPanel
local GuessingHeadPanel = ccui.Layout:create()
GuessingHeadPanel:ignoreContentAdaptWithSize(false)
GuessingHeadPanel:setClippingEnabled(false)
GuessingHeadPanel:setBackGroundColorOpacity(102)
GuessingHeadPanel:setTouchEnabled(true);
GuessingHeadPanel:setLayoutComponentEnabled(true)
GuessingHeadPanel:setName("GuessingHeadPanel")
GuessingHeadPanel:setTag(656)
GuessingHeadPanel:setCascadeColorEnabled(true)
GuessingHeadPanel:setCascadeOpacityEnabled(true)
GuessingHeadPanel:setAnchorPoint(0.5000, 0.5000)
GuessingHeadPanel:setPosition(360.0001, 364.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(GuessingHeadPanel)
layout:setSize({width = 720.0000, height = 132.0000})
layout:setLeftMargin(0.0001)
layout:setRightMargin(-720.0001)
layout:setTopMargin(-430.0000)
layout:setBottomMargin(298.0000)
Middle:addChild(GuessingHeadPanel)

--Create ShrinkInterfaceNode
local ShrinkInterfaceNode=cc.Node:create()
ShrinkInterfaceNode:setName("ShrinkInterfaceNode")
ShrinkInterfaceNode:setTag(320)
ShrinkInterfaceNode:setCascadeColorEnabled(true)
ShrinkInterfaceNode:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(ShrinkInterfaceNode)
Middle:addChild(ShrinkInterfaceNode)

--Create ShrinkInterfaceSprite
local ShrinkInterfaceSprite = cc.Sprite:createWithSpriteFrameName("02_01_Boast/button_098.png")
ShrinkInterfaceSprite:setName("ShrinkInterfaceSprite")
ShrinkInterfaceSprite:setTag(319)
ShrinkInterfaceSprite:setCascadeColorEnabled(true)
ShrinkInterfaceSprite:setCascadeOpacityEnabled(true)
ShrinkInterfaceSprite:setPosition(360.0000, 250.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ShrinkInterfaceSprite)
layout:setSize({width = 40.0000, height = 40.0000})
layout:setLeftMargin(340.0000)
layout:setRightMargin(-380.0000)
layout:setTopMargin(-270.0000)
layout:setBottomMargin(230.0000)
ShrinkInterfaceSprite:setBlendFunc({src = 1, dst = 771})
ShrinkInterfaceNode:addChild(ShrinkInterfaceSprite)

--Create ShrinkInterfacePanel
local ShrinkInterfacePanel = ccui.Layout:create()
ShrinkInterfacePanel:ignoreContentAdaptWithSize(false)
ShrinkInterfacePanel:setClippingEnabled(false)
ShrinkInterfacePanel:setTouchEnabled(true);
ShrinkInterfacePanel:setLayoutComponentEnabled(true)
ShrinkInterfacePanel:setName("ShrinkInterfacePanel")
ShrinkInterfacePanel:setTag(314)
ShrinkInterfacePanel:setCascadeColorEnabled(true)
ShrinkInterfacePanel:setCascadeOpacityEnabled(true)
ShrinkInterfacePanel:setAnchorPoint(0.5000, 0.5000)
ShrinkInterfacePanel:setPosition(359.9997, 249.9981)
layout = ccui.LayoutComponent:bindLayoutComponent(ShrinkInterfacePanel)
layout:setSize({width = 50.0000, height = 50.0000})
layout:setLeftMargin(334.9997)
layout:setRightMargin(-384.9997)
layout:setTopMargin(-274.9981)
layout:setBottomMargin(224.9981)
ShrinkInterfaceNode:addChild(ShrinkInterfacePanel)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

