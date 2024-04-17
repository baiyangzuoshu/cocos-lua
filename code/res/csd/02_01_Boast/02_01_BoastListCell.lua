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
layout:setSize({width = 420.0000, height = 420.0000})

--Create List
local List=cc.Node:create()
List:setName("List")
List:setTag(56)
List:setCascadeColorEnabled(true)
List:setCascadeOpacityEnabled(true)
List:setPosition(210.0000, 210.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(List)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setLeftMargin(210.0000)
layout:setRightMargin(210.0000)
layout:setTopMargin(210.0000)
layout:setBottomMargin(210.0000)
Layer:addChild(List)

--Create List_1
local List_1=cc.Node:create()
List_1:setName("List_1")
List_1:setTag(57)
List_1:setCascadeColorEnabled(true)
List_1:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(List_1)
List:addChild(List_1)

--Create ListBg_1
local ListBg_1 = cc.Sprite:createWithSpriteFrameName("02_01_Boast/frame_089.png")
ListBg_1:setName("ListBg_1")
ListBg_1:setTag(387)
ListBg_1:setCascadeColorEnabled(true)
ListBg_1:setCascadeOpacityEnabled(true)
ListBg_1:setPosition(0.0000, 110.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ListBg_1)
layout:setSize({width = 214.0000, height = 164.0000})
layout:setLeftMargin(-107.0000)
layout:setRightMargin(-107.0000)
layout:setTopMargin(-192.0000)
layout:setBottomMargin(28.0000)
ListBg_1:setBlendFunc({src = 1, dst = 771})
List_1:addChild(ListBg_1)

--Create FriendsPanel
local FriendsPanel = ccui.Layout:create()
FriendsPanel:ignoreContentAdaptWithSize(false)
FriendsPanel:setClippingEnabled(false)
FriendsPanel:setBackGroundColorOpacity(102)
FriendsPanel:setTouchEnabled(true);
FriendsPanel:setLayoutComponentEnabled(true)
FriendsPanel:setName("FriendsPanel")
FriendsPanel:setTag(59)
FriendsPanel:setCascadeColorEnabled(true)
FriendsPanel:setCascadeOpacityEnabled(true)
FriendsPanel:setAnchorPoint(0.5000, 0.5000)
FriendsPanel:setPosition(-4.0076, 109.9996)
layout = ccui.LayoutComponent:bindLayoutComponent(FriendsPanel)
layout:setSize({width = 84.0000, height = 84.0000})
layout:setLeftMargin(-46.0076)
layout:setRightMargin(-37.9924)
layout:setTopMargin(-151.9996)
layout:setBottomMargin(67.9996)
List_1:addChild(FriendsPanel)

--Create FriendsImage_IVT
local FriendsImage_IVT = ccui.ImageView:create()
FriendsImage_IVT:ignoreContentAdaptWithSize(false)
FriendsImage_IVT:loadTexture("02_01_Boast/button_067_zh_CN.png", 1)
FriendsImage_IVT:setScale9Enabled(true)
FriendsImage_IVT:setCapInsets({x = 27, y = 27, width = 30, height = 30})
FriendsImage_IVT:setLayoutComponentEnabled(true)
FriendsImage_IVT:setName("FriendsImage_IVT")
FriendsImage_IVT:setTag(60)
FriendsImage_IVT:setCascadeColorEnabled(true)
FriendsImage_IVT:setCascadeOpacityEnabled(true)
FriendsImage_IVT:setPosition(42.0000, 42.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(FriendsImage_IVT)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 84.0000, height = 84.0000})
FriendsPanel:addChild(FriendsImage_IVT)

--Create List_2
local List_2=cc.Node:create()
List_2:setName("List_2")
List_2:setTag(61)
List_2:setCascadeColorEnabled(true)
List_2:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(List_2)
List:addChild(List_2)

--Create ListBg_2
local ListBg_2 = cc.Sprite:createWithSpriteFrameName("02_01_Boast/frame_089.png")
ListBg_2:setName("ListBg_2")
ListBg_2:setTag(389)
ListBg_2:setCascadeColorEnabled(true)
ListBg_2:setCascadeOpacityEnabled(true)
ListBg_2:setPosition(97.0000, 56.0000)
ListBg_2:setRotationSkewX(60.0000)
ListBg_2:setRotationSkewY(60.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ListBg_2)
layout:setSize({width = 214.0000, height = 164.0000})
layout:setLeftMargin(-10.0000)
layout:setRightMargin(-204.0000)
layout:setTopMargin(-138.0000)
layout:setBottomMargin(-26.0000)
ListBg_2:setBlendFunc({src = 1, dst = 771})
List_2:addChild(ListBg_2)

--Create PlayerCardPanel
local PlayerCardPanel = ccui.Layout:create()
PlayerCardPanel:ignoreContentAdaptWithSize(false)
PlayerCardPanel:setClippingEnabled(false)
PlayerCardPanel:setBackGroundColorOpacity(102)
PlayerCardPanel:setTouchEnabled(true);
PlayerCardPanel:setLayoutComponentEnabled(true)
PlayerCardPanel:setName("PlayerCardPanel")
PlayerCardPanel:setTag(71)
PlayerCardPanel:setCascadeColorEnabled(true)
PlayerCardPanel:setCascadeOpacityEnabled(true)
PlayerCardPanel:setAnchorPoint(0.5000, 0.5000)
PlayerCardPanel:setPosition(97.0000, 54.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(PlayerCardPanel)
layout:setSize({width = 84.0000, height = 84.0000})
layout:setLeftMargin(55.0000)
layout:setRightMargin(-139.0000)
layout:setTopMargin(-96.0000)
layout:setBottomMargin(12.0000)
List_2:addChild(PlayerCardPanel)

--Create PlayerCardImage_IVT
local PlayerCardImage_IVT = ccui.ImageView:create()
PlayerCardImage_IVT:ignoreContentAdaptWithSize(false)
PlayerCardImage_IVT:loadTexture("02_01_Boast/button_068_zh_CN.png", 1)
PlayerCardImage_IVT:setScale9Enabled(true)
PlayerCardImage_IVT:setCapInsets({x = 27, y = 27, width = 30, height = 30})
PlayerCardImage_IVT:setLayoutComponentEnabled(true)
PlayerCardImage_IVT:setName("PlayerCardImage_IVT")
PlayerCardImage_IVT:setTag(72)
PlayerCardImage_IVT:setCascadeColorEnabled(true)
PlayerCardImage_IVT:setCascadeOpacityEnabled(true)
PlayerCardImage_IVT:setPosition(42.0000, 42.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(PlayerCardImage_IVT)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 84.0000, height = 84.0000})
PlayerCardPanel:addChild(PlayerCardImage_IVT)

--Create List_3
local List_3=cc.Node:create()
List_3:setName("List_3")
List_3:setTag(65)
List_3:setCascadeColorEnabled(true)
List_3:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(List_3)
List:addChild(List_3)

--Create ListBg_3
local ListBg_3 = cc.Sprite:createWithSpriteFrameName("02_01_Boast/frame_089.png")
ListBg_3:setName("ListBg_3")
ListBg_3:setTag(390)
ListBg_3:setCascadeColorEnabled(true)
ListBg_3:setCascadeOpacityEnabled(true)
ListBg_3:setPosition(98.0000, -53.0000)
ListBg_3:setRotationSkewX(120.0000)
ListBg_3:setRotationSkewY(120.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ListBg_3)
layout:setSize({width = 214.0000, height = 164.0000})
layout:setLeftMargin(-9.0000)
layout:setRightMargin(-205.0000)
layout:setTopMargin(-29.0000)
layout:setBottomMargin(-135.0000)
ListBg_3:setBlendFunc({src = 1, dst = 771})
List_3:addChild(ListBg_3)

--Create ExpressionPanel
local ExpressionPanel = ccui.Layout:create()
ExpressionPanel:ignoreContentAdaptWithSize(false)
ExpressionPanel:setClippingEnabled(false)
ExpressionPanel:setBackGroundColorOpacity(102)
ExpressionPanel:setTouchEnabled(true);
ExpressionPanel:setLayoutComponentEnabled(true)
ExpressionPanel:setName("ExpressionPanel")
ExpressionPanel:setTag(67)
ExpressionPanel:setCascadeColorEnabled(true)
ExpressionPanel:setCascadeOpacityEnabled(true)
ExpressionPanel:setVisible(false)
ExpressionPanel:setAnchorPoint(0.5000, 0.5000)
ExpressionPanel:setPosition(98.9916, -53.0006)
layout = ccui.LayoutComponent:bindLayoutComponent(ExpressionPanel)
layout:setSize({width = 84.0000, height = 84.0000})
layout:setLeftMargin(56.9916)
layout:setRightMargin(-140.9916)
layout:setTopMargin(11.0006)
layout:setBottomMargin(-95.0006)
List_3:addChild(ExpressionPanel)

--Create ExpressionImage_IVT
local ExpressionImage_IVT = ccui.ImageView:create()
ExpressionImage_IVT:ignoreContentAdaptWithSize(false)
ExpressionImage_IVT:loadTexture("02_01_Boast/button_065_zh_CN.png", 1)
ExpressionImage_IVT:setScale9Enabled(true)
ExpressionImage_IVT:setCapInsets({x = 27, y = 27, width = 30, height = 30})
ExpressionImage_IVT:setLayoutComponentEnabled(true)
ExpressionImage_IVT:setName("ExpressionImage_IVT")
ExpressionImage_IVT:setTag(68)
ExpressionImage_IVT:setCascadeColorEnabled(true)
ExpressionImage_IVT:setCascadeOpacityEnabled(true)
ExpressionImage_IVT:setPosition(42.0000, 42.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ExpressionImage_IVT)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 84.0000, height = 84.0000})
ExpressionPanel:addChild(ExpressionImage_IVT)

--Create List_4
local List_4=cc.Node:create()
List_4:setName("List_4")
List_4:setTag(69)
List_4:setCascadeColorEnabled(true)
List_4:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(List_4)
List:addChild(List_4)

--Create ListBg_4
local ListBg_4 = cc.Sprite:createWithSpriteFrameName("02_01_Boast/frame_089.png")
ListBg_4:setName("ListBg_4")
ListBg_4:setTag(391)
ListBg_4:setCascadeColorEnabled(true)
ListBg_4:setCascadeOpacityEnabled(true)
ListBg_4:setPosition(0.0000, -111.0000)
ListBg_4:setRotationSkewX(180.0000)
ListBg_4:setRotationSkewY(180.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ListBg_4)
layout:setSize({width = 214.0000, height = 164.0000})
layout:setLeftMargin(-23.0000)
layout:setRightMargin(-23.0000)
layout:setTopMargin(88.0000)
layout:setBottomMargin(-134.0000)
ListBg_4:setBlendFunc({src = 1, dst = 771})
List_4:addChild(ListBg_4)

--Create GiftPanel
local GiftPanel = ccui.Layout:create()
GiftPanel:ignoreContentAdaptWithSize(false)
GiftPanel:setClippingEnabled(false)
GiftPanel:setBackGroundColorOpacity(102)
GiftPanel:setTouchEnabled(true);
GiftPanel:setLayoutComponentEnabled(true)
GiftPanel:setName("GiftPanel")
GiftPanel:setTag(63)
GiftPanel:setCascadeColorEnabled(true)
GiftPanel:setCascadeOpacityEnabled(true)
GiftPanel:setVisible(false)
GiftPanel:setAnchorPoint(0.5000, 0.5000)
GiftPanel:setPosition(2.0000, -111.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(GiftPanel)
layout:setSize({width = 84.0000, height = 84.0000})
layout:setLeftMargin(-40.0000)
layout:setRightMargin(-44.0000)
layout:setTopMargin(69.0000)
layout:setBottomMargin(-153.0000)
List_4:addChild(GiftPanel)

--Create GiftImage_IVT
local GiftImage_IVT = ccui.ImageView:create()
GiftImage_IVT:ignoreContentAdaptWithSize(false)
GiftImage_IVT:loadTexture("02_01_Boast/button_066_zh_CN.png", 1)
GiftImage_IVT:setScale9Enabled(true)
GiftImage_IVT:setCapInsets({x = 27, y = 27, width = 30, height = 30})
GiftImage_IVT:setLayoutComponentEnabled(true)
GiftImage_IVT:setName("GiftImage_IVT")
GiftImage_IVT:setTag(64)
GiftImage_IVT:setCascadeColorEnabled(true)
GiftImage_IVT:setCascadeOpacityEnabled(true)
GiftImage_IVT:setPosition(42.0001, 42.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(GiftImage_IVT)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 84.0000, height = 84.0000})
layout:setLeftMargin(0.0001)
layout:setRightMargin(-0.0001)
GiftPanel:addChild(GiftImage_IVT)

--Create List_5
local List_5=cc.Node:create()
List_5:setName("List_5")
List_5:setTag(73)
List_5:setCascadeColorEnabled(true)
List_5:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(List_5)
List:addChild(List_5)

--Create LIstBg_5
local LIstBg_5 = cc.Sprite:createWithSpriteFrameName("02_01_Boast/frame_089.png")
LIstBg_5:setName("LIstBg_5")
LIstBg_5:setTag(392)
LIstBg_5:setCascadeColorEnabled(true)
LIstBg_5:setCascadeOpacityEnabled(true)
LIstBg_5:setPosition(-96.0000, -55.0000)
LIstBg_5:setRotationSkewX(240.0000)
LIstBg_5:setRotationSkewY(240.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(LIstBg_5)
layout:setSize({width = 214.0000, height = 164.0000})
layout:setLeftMargin(-203.0000)
layout:setRightMargin(-11.0000)
layout:setTopMargin(-27.0000)
layout:setBottomMargin(-137.0000)
LIstBg_5:setBlendFunc({src = 1, dst = 771})
List_5:addChild(LIstBg_5)

--Create List_6
local List_6=cc.Node:create()
List_6:setName("List_6")
List_6:setTag(75)
List_6:setCascadeColorEnabled(true)
List_6:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(List_6)
List:addChild(List_6)

--Create ListBg_6
local ListBg_6 = cc.Sprite:createWithSpriteFrameName("02_01_Boast/frame_089.png")
ListBg_6:setName("ListBg_6")
ListBg_6:setTag(393)
ListBg_6:setCascadeColorEnabled(true)
ListBg_6:setCascadeOpacityEnabled(true)
ListBg_6:setPosition(-97.0000, 54.0000)
ListBg_6:setRotationSkewX(300.0000)
ListBg_6:setRotationSkewY(300.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ListBg_6)
layout:setSize({width = 214.0000, height = 164.0000})
layout:setLeftMargin(-204.0000)
layout:setRightMargin(-10.0000)
layout:setTopMargin(-136.0000)
layout:setBottomMargin(-28.0000)
ListBg_6:setBlendFunc({src = 1, dst = 771})
List_6:addChild(ListBg_6)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result
