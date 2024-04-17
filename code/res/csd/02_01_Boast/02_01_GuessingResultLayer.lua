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
Middle:setTag(632)
Middle:setCascadeColorEnabled(true)
Middle:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Middle)
layout:setRightMargin(720.0000)
layout:setTopMargin(1280.0000)
Layer:addChild(Middle)

--Create GuessWrongImage_IVT
local GuessWrongImage_IVT = ccui.ImageView:create()
GuessWrongImage_IVT:ignoreContentAdaptWithSize(false)
GuessWrongImage_IVT:loadTexture("02_01_Boast/picture_071_zh_TW.png", 1)
GuessWrongImage_IVT:setLayoutComponentEnabled(true)
GuessWrongImage_IVT:setName("GuessWrongImage_IVT")
GuessWrongImage_IVT:setTag(633)
GuessWrongImage_IVT:setCascadeColorEnabled(true)
GuessWrongImage_IVT:setCascadeOpacityEnabled(true)
GuessWrongImage_IVT:setPosition(360.0001, 990.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(GuessWrongImage_IVT)
layout:setSize({width = 674.0000, height = 220.0000})
layout:setLeftMargin(23.0001)
layout:setRightMargin(-697.0001)
layout:setTopMargin(-1100.0000)
layout:setBottomMargin(880.0000)
Middle:addChild(GuessWrongImage_IVT)

--Create BingoImage_IVT
local BingoImage_IVT = ccui.ImageView:create()
BingoImage_IVT:ignoreContentAdaptWithSize(false)
BingoImage_IVT:loadTexture("02_01_Boast/picture_070_zh_TW.png", 1)
BingoImage_IVT:setLayoutComponentEnabled(true)
BingoImage_IVT:setName("BingoImage_IVT")
BingoImage_IVT:setTag(470)
BingoImage_IVT:setCascadeColorEnabled(true)
BingoImage_IVT:setCascadeOpacityEnabled(true)
BingoImage_IVT:setPosition(360.0000, 990.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(BingoImage_IVT)
layout:setSize({width = 674.0000, height = 220.0000})
layout:setLeftMargin(23.0000)
layout:setRightMargin(-697.0000)
layout:setTopMargin(-1100.0000)
layout:setBottomMargin(880.0000)
Middle:addChild(BingoImage_IVT)

--Create CancelImage_IVT
local CancelImage_IVT = ccui.ImageView:create()
CancelImage_IVT:ignoreContentAdaptWithSize(false)
CancelImage_IVT:loadTexture("02_01_Boast/picture_072_zh_TW.png", 1)
CancelImage_IVT:setLayoutComponentEnabled(true)
CancelImage_IVT:setName("CancelImage_IVT")
CancelImage_IVT:setTag(359)
CancelImage_IVT:setCascadeColorEnabled(true)
CancelImage_IVT:setCascadeOpacityEnabled(true)
CancelImage_IVT:setVisible(false)
CancelImage_IVT:setPosition(360.0000, 990.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(CancelImage_IVT)
layout:setSize({width = 622.0000, height = 220.0000})
layout:setLeftMargin(49.0000)
layout:setRightMargin(-671.0000)
layout:setTopMargin(-1100.0000)
layout:setBottomMargin(880.0000)
Middle:addChild(CancelImage_IVT)

--Create ResultImage_IVT
local ResultImage_IVT = ccui.ImageView:create()
ResultImage_IVT:ignoreContentAdaptWithSize(false)
ResultImage_IVT:loadTexture("02_01_Boast/picture_081_zh_CN.png", 1)
ResultImage_IVT:setLayoutComponentEnabled(true)
ResultImage_IVT:setName("ResultImage_IVT")
ResultImage_IVT:setTag(303)
ResultImage_IVT:setCascadeColorEnabled(true)
ResultImage_IVT:setCascadeOpacityEnabled(true)
ResultImage_IVT:setVisible(false)
ResultImage_IVT:setPosition(370.0000, 919.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ResultImage_IVT)
layout:setSize({width = 622.0000, height = 220.0000})
layout:setLeftMargin(59.0000)
layout:setRightMargin(-681.0000)
layout:setTopMargin(-1029.0000)
layout:setBottomMargin(809.0000)
Middle:addChild(ResultImage_IVT)

--Create ReturnBg_1
local ReturnBg_1 = cc.Sprite:createWithSpriteFrameName("02_01_Boast/frame_146.png")
ReturnBg_1:setName("ReturnBg_1")
ReturnBg_1:setTag(360)
ReturnBg_1:setCascadeColorEnabled(true)
ReturnBg_1:setCascadeOpacityEnabled(true)
ReturnBg_1:setPosition(360.0000, 872.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ReturnBg_1)
layout:setSize({width = 254.0000, height = 84.0000})
layout:setLeftMargin(233.0000)
layout:setRightMargin(-487.0000)
layout:setTopMargin(-914.0000)
layout:setBottomMargin(830.0000)
ReturnBg_1:setBlendFunc({src = 1, dst = 771})
Middle:addChild(ReturnBg_1)

--Create ReturnGoldIcon
local ReturnGoldIcon = cc.Sprite:createWithSpriteFrameName("00_02_Default/2.png")
ReturnGoldIcon:setName("ReturnGoldIcon")
ReturnGoldIcon:setTag(362)
ReturnGoldIcon:setCascadeColorEnabled(true)
ReturnGoldIcon:setCascadeOpacityEnabled(true)
ReturnGoldIcon:setPosition(45.0001, 41.9997)
ReturnGoldIcon:setScaleX(1.5000)
ReturnGoldIcon:setScaleY(1.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(ReturnGoldIcon)
layout:setPositionPercentX(0.1772)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.1575)
layout:setPercentHeight(0.4762)
layout:setSize({width = 40.0000, height = 40.0000})
layout:setLeftMargin(25.0001)
layout:setRightMargin(188.9999)
layout:setTopMargin(22.0003)
layout:setBottomMargin(21.9997)
ReturnGoldIcon:setBlendFunc({src = 1, dst = 771})
ReturnBg_1:addChild(ReturnGoldIcon)

--Create ReturnGoldNum
local ReturnGoldNum = ccui.Text:create()
ReturnGoldNum:ignoreContentAdaptWithSize(true)
ReturnGoldNum:setTextAreaSize({width = 0, height = 0})
ReturnGoldNum:setFontName("font/Font003.ttf")
ReturnGoldNum:setFontSize(42)
ReturnGoldNum:setString([[+1000]])
ReturnGoldNum:setLayoutComponentEnabled(true)
ReturnGoldNum:setName("ReturnGoldNum")
ReturnGoldNum:setTag(363)
ReturnGoldNum:setCascadeColorEnabled(true)
ReturnGoldNum:setCascadeOpacityEnabled(true)
ReturnGoldNum:setAnchorPoint(0.0000, 0.5000)
ReturnGoldNum:setPosition(83.0000, 42.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ReturnGoldNum)
layout:setPositionPercentX(0.3268)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.4213)
layout:setPercentHeight(0.5833)
layout:setSize({width = 107.0000, height = 49.0000})
layout:setLeftMargin(83.0000)
layout:setRightMargin(64.0000)
layout:setTopMargin(17.5000)
layout:setBottomMargin(17.5000)
ReturnBg_1:addChild(ReturnGoldNum)

--Create GuessingNode_1
local GuessingNode_1=cc.Node:create()
GuessingNode_1:setName("GuessingNode_1")
GuessingNode_1:setTag(464)
GuessingNode_1:setCascadeColorEnabled(true)
GuessingNode_1:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(GuessingNode_1)
Middle:addChild(GuessingNode_1)

--Create bg_1
local bg_1 = cc.Sprite:createWithSpriteFrameName("02_01_Boast/frame_145.png")
bg_1:setName("bg_1")
bg_1:setTag(315)
bg_1:setCascadeColorEnabled(true)
bg_1:setCascadeOpacityEnabled(true)
bg_1:setPosition(362.0000, 755.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(bg_1)
layout:setSize({width = 630.0000, height = 154.0000})
layout:setLeftMargin(47.0000)
layout:setRightMargin(-677.0000)
layout:setTopMargin(-832.0000)
layout:setBottomMargin(678.0000)
bg_1:setBlendFunc({src = 1, dst = 771})
GuessingNode_1:addChild(bg_1)

--Create VSImage
local VSImage = ccui.ImageView:create()
VSImage:ignoreContentAdaptWithSize(false)
VSImage:loadTexture("02_01_Boast/picture_065.png", 1)
VSImage:setLayoutComponentEnabled(true)
VSImage:setName("VSImage")
VSImage:setTag(314)
VSImage:setCascadeColorEnabled(true)
VSImage:setCascadeOpacityEnabled(true)
VSImage:setPosition(364.0000, 748.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(VSImage)
layout:setSize({width = 62.0000, height = 44.0000})
layout:setLeftMargin(333.0000)
layout:setRightMargin(-395.0000)
layout:setTopMargin(-770.0000)
layout:setBottomMargin(726.0000)
GuessingNode_1:addChild(VSImage)

--Create EnoughWinImage_IVT
local EnoughWinImage_IVT = ccui.ImageView:create()
EnoughWinImage_IVT:ignoreContentAdaptWithSize(false)
EnoughWinImage_IVT:loadTexture("02_01_Boast/picture_068_zh_TW.png", 1)
EnoughWinImage_IVT:setLayoutComponentEnabled(true)
EnoughWinImage_IVT:setName("EnoughWinImage_IVT")
EnoughWinImage_IVT:setTag(313)
EnoughWinImage_IVT:setCascadeColorEnabled(true)
EnoughWinImage_IVT:setCascadeOpacityEnabled(true)
EnoughWinImage_IVT:setPosition(240.0000, 764.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(EnoughWinImage_IVT)
layout:setSize({width = 210.0000, height = 150.0000})
layout:setLeftMargin(135.0000)
layout:setRightMargin(-345.0000)
layout:setTopMargin(-839.0000)
layout:setBottomMargin(689.0000)
GuessingNode_1:addChild(EnoughWinImage_IVT)

--Create InsufficientLoseImage_IVT
local InsufficientLoseImage_IVT = ccui.ImageView:create()
InsufficientLoseImage_IVT:ignoreContentAdaptWithSize(false)
InsufficientLoseImage_IVT:loadTexture("02_01_Boast/picture_067_zh_TW.png", 1)
InsufficientLoseImage_IVT:setLayoutComponentEnabled(true)
InsufficientLoseImage_IVT:setName("InsufficientLoseImage_IVT")
InsufficientLoseImage_IVT:setTag(312)
InsufficientLoseImage_IVT:setCascadeColorEnabled(true)
InsufficientLoseImage_IVT:setCascadeOpacityEnabled(true)
InsufficientLoseImage_IVT:setPosition(490.0000, 764.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(InsufficientLoseImage_IVT)
layout:setSize({width = 210.0000, height = 150.0000})
layout:setLeftMargin(385.0000)
layout:setRightMargin(-595.0000)
layout:setTopMargin(-839.0000)
layout:setBottomMargin(689.0000)
GuessingNode_1:addChild(InsufficientLoseImage_IVT)

--Create GuessingNode_2
local GuessingNode_2=cc.Node:create()
GuessingNode_2:setName("GuessingNode_2")
GuessingNode_2:setTag(465)
GuessingNode_2:setCascadeColorEnabled(true)
GuessingNode_2:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(GuessingNode_2)
Middle:addChild(GuessingNode_2)

--Create bg_2
local bg_2 = cc.Sprite:createWithSpriteFrameName("02_01_Boast/frame_148.png")
bg_2:setName("bg_2")
bg_2:setTag(466)
bg_2:setCascadeColorEnabled(true)
bg_2:setCascadeOpacityEnabled(true)
bg_2:setPosition(362.0000, 755.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(bg_2)
layout:setSize({width = 630.0000, height = 154.0000})
layout:setLeftMargin(47.0000)
layout:setRightMargin(-677.0000)
layout:setTopMargin(-832.0000)
layout:setBottomMargin(678.0000)
bg_2:setBlendFunc({src = 1, dst = 771})
GuessingNode_2:addChild(bg_2)

--Create VSImage
local VSImage = ccui.ImageView:create()
VSImage:ignoreContentAdaptWithSize(false)
VSImage:loadTexture("02_01_Boast/picture_065.png", 1)
VSImage:setLayoutComponentEnabled(true)
VSImage:setName("VSImage")
VSImage:setTag(467)
VSImage:setCascadeColorEnabled(true)
VSImage:setCascadeOpacityEnabled(true)
VSImage:setPosition(364.0000, 748.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(VSImage)
layout:setSize({width = 62.0000, height = 44.0000})
layout:setLeftMargin(333.0000)
layout:setRightMargin(-395.0000)
layout:setTopMargin(-770.0000)
layout:setBottomMargin(726.0000)
GuessingNode_2:addChild(VSImage)

--Create EnoughLoseImage_IVT
local EnoughLoseImage_IVT = ccui.ImageView:create()
EnoughLoseImage_IVT:ignoreContentAdaptWithSize(false)
EnoughLoseImage_IVT:loadTexture("02_01_Boast/picture_069_zh_TW.png", 1)
EnoughLoseImage_IVT:setLayoutComponentEnabled(true)
EnoughLoseImage_IVT:setName("EnoughLoseImage_IVT")
EnoughLoseImage_IVT:setTag(468)
EnoughLoseImage_IVT:setCascadeColorEnabled(true)
EnoughLoseImage_IVT:setCascadeOpacityEnabled(true)
EnoughLoseImage_IVT:setPosition(255.0000, 764.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(EnoughLoseImage_IVT)
layout:setSize({width = 210.0000, height = 150.0000})
layout:setLeftMargin(150.0000)
layout:setRightMargin(-360.0000)
layout:setTopMargin(-839.0000)
layout:setBottomMargin(689.0000)
GuessingNode_2:addChild(EnoughLoseImage_IVT)

--Create InsufficientWinImage_IVT
local InsufficientWinImage_IVT = ccui.ImageView:create()
InsufficientWinImage_IVT:ignoreContentAdaptWithSize(false)
InsufficientWinImage_IVT:loadTexture("02_01_Boast/picture_066_zh_TW.png", 1)
InsufficientWinImage_IVT:setLayoutComponentEnabled(true)
InsufficientWinImage_IVT:setName("InsufficientWinImage_IVT")
InsufficientWinImage_IVT:setTag(469)
InsufficientWinImage_IVT:setCascadeColorEnabled(true)
InsufficientWinImage_IVT:setCascadeOpacityEnabled(true)
InsufficientWinImage_IVT:setPosition(492.0000, 764.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(InsufficientWinImage_IVT)
layout:setSize({width = 210.0000, height = 150.0000})
layout:setLeftMargin(387.0000)
layout:setRightMargin(-597.0000)
layout:setTopMargin(-839.0000)
layout:setBottomMargin(689.0000)
GuessingNode_2:addChild(InsufficientWinImage_IVT)

--Create HeadNode
local HeadNode=cc.Node:create()
HeadNode:setName("HeadNode")
HeadNode:setTag(309)
HeadNode:setCascadeColorEnabled(true)
HeadNode:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(HeadNode)
Middle:addChild(HeadNode)

--Create LeftHeadPanel
local LeftHeadPanel = ccui.Layout:create()
LeftHeadPanel:ignoreContentAdaptWithSize(false)
LeftHeadPanel:setClippingEnabled(false)
LeftHeadPanel:setBackGroundColorOpacity(102)
LeftHeadPanel:setTouchEnabled(true);
LeftHeadPanel:setLayoutComponentEnabled(true)
LeftHeadPanel:setName("LeftHeadPanel")
LeftHeadPanel:setTag(310)
LeftHeadPanel:setCascadeColorEnabled(true)
LeftHeadPanel:setCascadeOpacityEnabled(true)
LeftHeadPanel:setPosition(-0.0010, 274.9998)
layout = ccui.LayoutComponent:bindLayoutComponent(LeftHeadPanel)
layout:setSize({width = 300.0000, height = 400.0000})
layout:setLeftMargin(-0.0010)
layout:setRightMargin(-299.9990)
layout:setTopMargin(-674.9998)
layout:setBottomMargin(274.9998)
HeadNode:addChild(LeftHeadPanel)

--Create RightHeadPanel
local RightHeadPanel = ccui.Layout:create()
RightHeadPanel:ignoreContentAdaptWithSize(false)
RightHeadPanel:setClippingEnabled(false)
RightHeadPanel:setBackGroundColorOpacity(102)
RightHeadPanel:setTouchEnabled(true);
RightHeadPanel:setLayoutComponentEnabled(true)
RightHeadPanel:setName("RightHeadPanel")
RightHeadPanel:setTag(311)
RightHeadPanel:setCascadeColorEnabled(true)
RightHeadPanel:setCascadeOpacityEnabled(true)
RightHeadPanel:setAnchorPoint(1.0000, 0.0000)
RightHeadPanel:setPosition(720.0000, 275.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(RightHeadPanel)
layout:setSize({width = 300.0000, height = 400.0000})
layout:setLeftMargin(420.0000)
layout:setRightMargin(-720.0000)
layout:setTopMargin(-675.0000)
layout:setBottomMargin(275.0000)
HeadNode:addChild(RightHeadPanel)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result
