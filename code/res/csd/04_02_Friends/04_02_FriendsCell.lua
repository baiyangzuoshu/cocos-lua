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
"ui/04_02_Friends/04_02_Friends_1.plist",	
"ui/01_06_PersonalCenter/01_06_PersonalCenter_1.plist",	
"ui/00_01_Common/00_01_Common_1.plist",	
"ui/00_02_Default/00_02_Default_1.plist",	
"ui/01_04_Task/01_04_Task_1.plist",	
"ui/02_01_Boast/02_01_Boast_1.plist",	
"ui/02_01_Boast/02_01_Boast_2.plist",	
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
layout:setSize({width = 538.0000, height = 124.0000})

--Create Friends
local Friends=cc.Node:create()
Friends:setName("Friends")
Friends:setTag(635)
Friends:setCascadeColorEnabled(true)
Friends:setCascadeOpacityEnabled(true)
Friends:setPosition(269.0000, 62.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Friends)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setLeftMargin(269.0000)
layout:setRightMargin(269.0000)
layout:setTopMargin(62.0000)
layout:setBottomMargin(62.0000)
Layer:addChild(Friends)

--Create Bg
local Bg = cc.Sprite:createWithSpriteFrameName("04_02_Friends/frame_054.png")
Bg:setName("Bg")
Bg:setTag(1195)
Bg:setCascadeColorEnabled(true)
Bg:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Bg)
layout:setSize({width = 538.0000, height = 126.0000})
layout:setLeftMargin(-269.0000)
layout:setRightMargin(-269.0000)
layout:setTopMargin(-63.0000)
layout:setBottomMargin(-63.0000)
Bg:setBlendFunc({src = 1, dst = 771})
Friends:addChild(Bg)

--Create Common
local Common=cc.Node:create()
Common:setName("Common")
Common:setTag(638)
Common:setCascadeColorEnabled(true)
Common:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Common)
Friends:addChild(Common)

--Create HeadPanel
local HeadPanel = ccui.Layout:create()
HeadPanel:ignoreContentAdaptWithSize(false)
HeadPanel:setClippingEnabled(false)
HeadPanel:setBackGroundColorOpacity(102)
HeadPanel:setTouchEnabled(true);
HeadPanel:setLayoutComponentEnabled(true)
HeadPanel:setName("HeadPanel")
HeadPanel:setTag(640)
HeadPanel:setCascadeColorEnabled(true)
HeadPanel:setCascadeOpacityEnabled(true)
HeadPanel:setAnchorPoint(0.5000, 0.5000)
HeadPanel:setPosition(-207.5000, 0.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(HeadPanel)
layout:setSize({width = 120.0000, height = 120.0000})
layout:setLeftMargin(-267.5000)
layout:setRightMargin(147.5000)
layout:setTopMargin(-60.5000)
layout:setBottomMargin(-59.5000)
Common:addChild(HeadPanel)

--Create HeadIcon
local HeadIcon=cc.Node:create()
HeadIcon:setName("HeadIcon")
HeadIcon:setTag(765)
HeadIcon:setCascadeColorEnabled(true)
HeadIcon:setCascadeOpacityEnabled(true)
HeadIcon:setPosition(60.0000, 60.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(HeadIcon)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setLeftMargin(60.0000)
layout:setRightMargin(60.0000)
layout:setTopMargin(60.0000)
layout:setBottomMargin(60.0000)
HeadPanel:addChild(HeadIcon)

--Create HeadFrame
local HeadFrame = ccui.ImageView:create()
HeadFrame:ignoreContentAdaptWithSize(false)
HeadFrame:loadTexture("01_06_PersonalCenter/frame_043.png", 1)
HeadFrame:setScale9Enabled(true)
HeadFrame:setCapInsets({x = 40, y = 40, width = 42, height = 42})
HeadFrame:setLayoutComponentEnabled(true)
HeadFrame:setName("HeadFrame")
HeadFrame:setTag(134)
HeadFrame:setCascadeColorEnabled(true)
HeadFrame:setCascadeOpacityEnabled(true)
HeadFrame:setPosition(60.0000, 60.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(HeadFrame)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 120.0000, height = 120.0000})
HeadPanel:addChild(HeadFrame)

--Create ServiceImage
local ServiceImage = ccui.ImageView:create()
ServiceImage:ignoreContentAdaptWithSize(false)
ServiceImage:loadTexture("00_01_Common/icon_129.png", 1)
ServiceImage:setLayoutComponentEnabled(true)
ServiceImage:setName("ServiceImage")
ServiceImage:setTag(98)
ServiceImage:setCascadeColorEnabled(true)
ServiceImage:setCascadeOpacityEnabled(true)
ServiceImage:setVisible(false)
ServiceImage:setPosition(100.0000, 20.0000)
ServiceImage:setScaleX(0.5000)
ServiceImage:setScaleY(0.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(ServiceImage)
layout:setPositionPercentX(0.8333)
layout:setPositionPercentY(0.1667)
layout:setPercentWidth(0.5333)
layout:setPercentHeight(0.5333)
layout:setSize({width = 64.0000, height = 64.0000})
layout:setLeftMargin(68.0000)
layout:setRightMargin(-12.0000)
layout:setTopMargin(68.0000)
layout:setBottomMargin(-12.0000)
HeadPanel:addChild(ServiceImage)

--Create NameText_O
local NameText_O = ccui.Text:create()
NameText_O:ignoreContentAdaptWithSize(true)
NameText_O:setTextAreaSize({width = 0, height = 0})
NameText_O:setFontName("font/Font001.ttf")
NameText_O:setFontSize(24)
NameText_O:setString([[甜甜圈拜拜拜]])
NameText_O:setTextVerticalAlignment(1)
NameText_O:setLayoutComponentEnabled(true)
NameText_O:setName("NameText_O")
NameText_O:setTag(641)
NameText_O:setCascadeColorEnabled(true)
NameText_O:setCascadeOpacityEnabled(true)
NameText_O:setAnchorPoint(0.0000, 0.5000)
NameText_O:setPosition(-140.0001, 20.0001)
NameText_O:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(NameText_O)
layout:setSize({width = 147.0000, height = 32.0000})
layout:setLeftMargin(-140.0001)
layout:setRightMargin(-6.9999)
layout:setTopMargin(-36.0001)
layout:setBottomMargin(4.0001)
Common:addChild(NameText_O)

--Create VipImage
local VipImage = ccui.ImageView:create()
VipImage:ignoreContentAdaptWithSize(false)
VipImage:loadTexture("00_02_Default/Vip1.png", 1)
VipImage:setLayoutComponentEnabled(true)
VipImage:setName("VipImage")
VipImage:setTag(642)
VipImage:setCascadeColorEnabled(true)
VipImage:setCascadeOpacityEnabled(true)
VipImage:setPosition(26.0000, 20.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(VipImage)
layout:setSize({width = 34.0000, height = 28.0000})
layout:setLeftMargin(9.0000)
layout:setRightMargin(-43.0000)
layout:setTopMargin(-34.0000)
layout:setBottomMargin(6.0000)
Common:addChild(VipImage)

--Create SexIcon
local SexIcon = ccui.ImageView:create()
SexIcon:ignoreContentAdaptWithSize(false)
SexIcon:loadTexture("01_06_PersonalCenter/icon_030.png", 1)
SexIcon:setScale9Enabled(true)
SexIcon:setCapInsets({x = 11, y = 12, width = 12, height = 14})
SexIcon:setLayoutComponentEnabled(true)
SexIcon:setName("SexIcon")
SexIcon:setTag(643)
SexIcon:setCascadeColorEnabled(true)
SexIcon:setCascadeOpacityEnabled(true)
SexIcon:setPosition(-7.9989, -18.9999)
layout = ccui.LayoutComponent:bindLayoutComponent(SexIcon)
layout:setSize({width = 34.0000, height = 38.0000})
layout:setLeftMargin(-24.9989)
layout:setRightMargin(-9.0011)
layout:setTopMargin(-0.0001)
layout:setBottomMargin(-37.9999)
Common:addChild(SexIcon)

--Create ID
local ID=cc.Node:create()
ID:setName("ID")
ID:setTag(710)
ID:setCascadeColorEnabled(true)
ID:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(ID)
Common:addChild(ID)

--Create IDText
local IDText = ccui.Text:create()
IDText:ignoreContentAdaptWithSize(true)
IDText:setTextAreaSize({width = 0, height = 0})
IDText:setFontName("font/Font003.ttf")
IDText:setFontSize(26)
IDText:setString([[ID]])
IDText:setTextVerticalAlignment(1)
IDText:setLayoutComponentEnabled(true)
IDText:setName("IDText")
IDText:setTag(711)
IDText:setCascadeColorEnabled(true)
IDText:setCascadeOpacityEnabled(true)
IDText:setPosition(-127.0003, -19.9996)
IDText:setTextColor({r = 160, g = 160, b = 160})
layout = ccui.LayoutComponent:bindLayoutComponent(IDText)
layout:setSize({width = 26.0000, height = 30.0000})
layout:setLeftMargin(-140.0003)
layout:setRightMargin(114.0003)
layout:setTopMargin(4.9996)
layout:setBottomMargin(-34.9996)
ID:addChild(IDText)

--Create IDNum
local IDNum = ccui.Text:create()
IDNum:ignoreContentAdaptWithSize(true)
IDNum:setTextAreaSize({width = 0, height = 0})
IDNum:setFontName("font/Font003.ttf")
IDNum:setFontSize(28)
IDNum:setString([[321011]])
IDNum:setTextVerticalAlignment(1)
IDNum:setLayoutComponentEnabled(true)
IDNum:setName("IDNum")
IDNum:setTag(712)
IDNum:setCascadeColorEnabled(true)
IDNum:setCascadeOpacityEnabled(true)
IDNum:setAnchorPoint(0.0000, 0.5000)
IDNum:setPosition(-109.5020, -19.9993)
IDNum:setTextColor({r = 160, g = 160, b = 160})
layout = ccui.LayoutComponent:bindLayoutComponent(IDNum)
layout:setSize({width = 77.0000, height = 33.0000})
layout:setLeftMargin(-109.5020)
layout:setRightMargin(32.5020)
layout:setTopMargin(3.4993)
layout:setBottomMargin(-36.4993)
ID:addChild(IDNum)

--Create FriendesList
local FriendesList=cc.Node:create()
FriendesList:setName("FriendesList")
FriendesList:setTag(713)
FriendesList:setCascadeColorEnabled(true)
FriendesList:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(FriendesList)
Friends:addChild(FriendesList)

--Create ConcernButton

local luaScript = require("csd.LuaScript.newButton")
local ConcernButton = luaScript.CreateCustomNode()
ConcernButton:ignoreContentAdaptWithSize(false)
ConcernButton:loadTextureNormal("04_02_Friends/icon_138.png", 1)
ConcernButton:loadTexturePressed("04_02_Friends/icon_138.png", 1)
ConcernButton:loadTextureDisabled("04_02_Friends/icon_139.png", 1)
ConcernButton:setTitleFontSize(14)
ConcernButton:setTouchEnabled(false);
ConcernButton:setLayoutComponentEnabled(true)
ConcernButton:setName("ConcernButton")
ConcernButton:setTag(56)
ConcernButton:setCascadeColorEnabled(true)
ConcernButton:setCascadeOpacityEnabled(true)
ConcernButton:setVisible(false)
ConcernButton:setPosition(115.0000, -23.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ConcernButton)
layout:setSize({width = 44.0000, height = 36.0000})
layout:setLeftMargin(93.0000)
layout:setRightMargin(-137.0000)
layout:setTopMargin(5.0000)
layout:setBottomMargin(-41.0000)

luaScript.SetDownScele(ConcernButton, "1.0000")
luaScript.SetClickEffect(ConcernButton, "")
luaScript.SetDownColor(ConcernButton, {r = 65, g = 65, b = 70})
FriendesList:addChild(ConcernButton)

--Create ChatButton

local luaScript = require("csd.LuaScript.newButton")
local ChatButton = luaScript.CreateCustomNode()
ChatButton:ignoreContentAdaptWithSize(false)
ChatButton:loadTextureNormal("04_02_Friends/button_042.png", 1)
ChatButton:loadTexturePressed("04_02_Friends/button_042.png", 1)
ChatButton:loadTextureDisabled("04_02_Friends/button_042.png", 1)
ChatButton:setTitleFontSize(14)
ChatButton:setScale9Enabled(true)
ChatButton:setCapInsets({x = 15, y = 11, width = 14, height = 14})
ChatButton:setLayoutComponentEnabled(true)
ChatButton:setName("ChatButton")
ChatButton:setTag(715)
ChatButton:setCascadeColorEnabled(true)
ChatButton:setCascadeOpacityEnabled(true)
ChatButton:setPosition(235.0000, -23.0001)
layout = ccui.LayoutComponent:bindLayoutComponent(ChatButton)
layout:setSize({width = 44.0000, height = 36.0000})
layout:setLeftMargin(213.0000)
layout:setRightMargin(-257.0000)
layout:setTopMargin(5.0001)
layout:setBottomMargin(-41.0001)

luaScript.SetDownScele(ChatButton, "0.9800")
luaScript.SetClickEffect(ChatButton, "Sound004")
luaScript.SetDownColor(ChatButton, {r = 65, g = 65, b = 70})
FriendesList:addChild(ChatButton)

--Create ChatTipDotIcon
local ChatTipDotIcon = ccui.ImageView:create()
ChatTipDotIcon:ignoreContentAdaptWithSize(false)
ChatTipDotIcon:loadTexture("00_01_Common/icon_045.png", 1)
ChatTipDotIcon:setScale9Enabled(true)
ChatTipDotIcon:setCapInsets({x = 15, y = 15, width = 24, height = 24})
ChatTipDotIcon:setLayoutComponentEnabled(true)
ChatTipDotIcon:setName("ChatTipDotIcon")
ChatTipDotIcon:setTag(205)
ChatTipDotIcon:setCascadeColorEnabled(true)
ChatTipDotIcon:setCascadeOpacityEnabled(true)
ChatTipDotIcon:setPosition(41.9999, 35.9999)
layout = ccui.LayoutComponent:bindLayoutComponent(ChatTipDotIcon)
layout:setPositionPercentX(0.9545)
layout:setPositionPercentY(1.0000)
layout:setPercentWidth(1.2273)
layout:setPercentHeight(1.5000)
layout:setSize({width = 54.0000, height = 54.0000})
layout:setLeftMargin(14.9999)
layout:setRightMargin(-24.9999)
layout:setTopMargin(-26.9999)
layout:setBottomMargin(8.9999)
ChatButton:addChild(ChatTipDotIcon)

--Create ChatTipDotNum
local ChatTipDotNum = ccui.Text:create()
ChatTipDotNum:ignoreContentAdaptWithSize(true)
ChatTipDotNum:setTextAreaSize({width = 0, height = 0})
ChatTipDotNum:setFontName("font/Font003.ttf")
ChatTipDotNum:setFontSize(22)
ChatTipDotNum:setString([[99]])
ChatTipDotNum:setLayoutComponentEnabled(true)
ChatTipDotNum:setName("ChatTipDotNum")
ChatTipDotNum:setTag(204)
ChatTipDotNum:setCascadeColorEnabled(true)
ChatTipDotNum:setCascadeOpacityEnabled(true)
ChatTipDotNum:setPosition(40.9999, 35.9999)
layout = ccui.LayoutComponent:bindLayoutComponent(ChatTipDotNum)
layout:setPositionPercentX(0.9318)
layout:setPositionPercentY(1.0000)
layout:setPercentWidth(0.5455)
layout:setPercentHeight(0.7222)
layout:setSize({width = 24.0000, height = 26.0000})
layout:setLeftMargin(28.9999)
layout:setRightMargin(-8.9999)
layout:setTopMargin(-12.9999)
layout:setBottomMargin(22.9999)
ChatButton:addChild(ChatTipDotNum)

--Create WatchButton

local luaScript = require("csd.LuaScript.newButton")
local WatchButton = luaScript.CreateCustomNode()
WatchButton:ignoreContentAdaptWithSize(false)
WatchButton:loadTextureNormal("04_02_Friends/button_041.png", 1)
WatchButton:loadTexturePressed("04_02_Friends/button_041.png", 1)
WatchButton:loadTextureDisabled("04_02_Friends/button_041.png", 1)
WatchButton:setTitleFontSize(14)
WatchButton:setScale9Enabled(true)
WatchButton:setCapInsets({x = 15, y = 11, width = 14, height = 14})
WatchButton:setLayoutComponentEnabled(true)
WatchButton:setName("WatchButton")
WatchButton:setTag(714)
WatchButton:setCascadeColorEnabled(true)
WatchButton:setCascadeOpacityEnabled(true)
WatchButton:setPosition(175.0000, -23.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(WatchButton)
layout:setSize({width = 44.0000, height = 36.0000})
layout:setLeftMargin(153.0000)
layout:setRightMargin(-197.0000)
layout:setTopMargin(5.0000)
layout:setBottomMargin(-41.0000)

luaScript.SetDownScele(WatchButton, "0.9800")
luaScript.SetClickEffect(WatchButton, "Sound004")
luaScript.SetDownColor(WatchButton, {r = 65, g = 65, b = 70})
FriendesList:addChild(WatchButton)

--Create Online
local Online=cc.Node:create()
Online:setName("Online")
Online:setTag(717)
Online:setCascadeColorEnabled(true)
Online:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Online)
FriendesList:addChild(Online)

--Create OnlineText
local OnlineText = ccui.Text:create()
OnlineText:ignoreContentAdaptWithSize(true)
OnlineText:setTextAreaSize({width = 0, height = 0})
OnlineText:setFontName("font/Default.ttf")
OnlineText:setFontSize(22)
OnlineText:setString([[在线]])
OnlineText:setTextHorizontalAlignment(2)
OnlineText:setTextVerticalAlignment(1)
OnlineText:setLayoutComponentEnabled(true)
OnlineText:setName("OnlineText")
OnlineText:setTag(718)
OnlineText:setCascadeColorEnabled(true)
OnlineText:setCascadeOpacityEnabled(true)
OnlineText:setAnchorPoint(1.0000, 0.5000)
OnlineText:setPosition(254.5001, 37.9999)
OnlineText:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(OnlineText)
layout:setSize({width = 47.0000, height = 29.0000})
layout:setLeftMargin(207.5001)
layout:setRightMargin(-254.5001)
layout:setTopMargin(-52.4999)
layout:setBottomMargin(23.4999)
Online:addChild(OnlineText)

--Create OnlineIcon
local OnlineIcon = ccui.ImageView:create()
OnlineIcon:ignoreContentAdaptWithSize(false)
OnlineIcon:loadTexture("04_02_Friends/icon_052.png", 1)
OnlineIcon:setScale9Enabled(true)
OnlineIcon:setCapInsets({x = 7, y = 7, width = 8, height = 8})
OnlineIcon:setLayoutComponentEnabled(true)
OnlineIcon:setName("OnlineIcon")
OnlineIcon:setTag(720)
OnlineIcon:setCascadeColorEnabled(true)
OnlineIcon:setCascadeOpacityEnabled(true)
OnlineIcon:setPosition(-11.5000, 9.9998)
layout = ccui.LayoutComponent:bindLayoutComponent(OnlineIcon)
layout:setPositionPercentX(-0.2447)
layout:setPositionPercentY(0.3448)
layout:setPercentWidth(0.4681)
layout:setPercentHeight(0.7586)
layout:setSize({width = 22.0000, height = 22.0000})
layout:setLeftMargin(-22.5000)
layout:setRightMargin(47.5000)
layout:setTopMargin(8.0002)
layout:setBottomMargin(-1.0002)
OnlineText:addChild(OnlineIcon)

--Create AddFriends
local AddFriends=cc.Node:create()
AddFriends:setName("AddFriends")
AddFriends:setTag(725)
AddFriends:setCascadeColorEnabled(true)
AddFriends:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(AddFriends)
Friends:addChild(AddFriends)

--Create AddButton_1

local luaScript = require("csd.LuaScript.newButton")
local AddButton_1 = luaScript.CreateCustomNode()
AddButton_1:ignoreContentAdaptWithSize(false)
AddButton_1:loadTextureNormal("01_04_Task/button_085.png", 1)
AddButton_1:loadTexturePressed("01_04_Task/button_085.png", 1)
AddButton_1:loadTextureDisabled("01_04_Task/button_085.png", 1)
AddButton_1:setTitleFontSize(14)
AddButton_1:setLayoutComponentEnabled(true)
AddButton_1:setName("AddButton_1")
AddButton_1:setTag(726)
AddButton_1:setCascadeColorEnabled(true)
AddButton_1:setCascadeOpacityEnabled(true)
AddButton_1:setPosition(182.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(AddButton_1)
layout:setSize({width = 138.0000, height = 84.0000})
layout:setLeftMargin(113.0000)
layout:setRightMargin(-251.0000)
layout:setTopMargin(-42.0000)
layout:setBottomMargin(-42.0000)

luaScript.SetDownScele(AddButton_1, "0.9800")
luaScript.SetClickEffect(AddButton_1, "Sound004")
luaScript.SetDownColor(AddButton_1, {r = 65, g = 65, b = 70})
AddFriends:addChild(AddButton_1)

--Create AddText_1_TT
local AddText_1_TT = ccui.Text:create()
AddText_1_TT:ignoreContentAdaptWithSize(true)
AddText_1_TT:setTextAreaSize({width = 0, height = 0})
AddText_1_TT:setFontName("font/Font001.ttf")
AddText_1_TT:setFontSize(24)
AddText_1_TT:setString([[申请]])
AddText_1_TT:enableShadow({r = 42, g = 42, b = 57, a = 255}, {width = 0, height = -1}, 0)
AddText_1_TT:setLayoutComponentEnabled(true)
AddText_1_TT:setName("AddText_1_TT")
AddText_1_TT:setTag(727)
AddText_1_TT:setCascadeColorEnabled(true)
AddText_1_TT:setCascadeOpacityEnabled(true)
AddText_1_TT:setPosition(68.0009, 42.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(AddText_1_TT)
layout:setPositionPercentX(0.4928)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.3696)
layout:setPercentHeight(0.3810)
layout:setSize({width = 51.0000, height = 32.0000})
layout:setLeftMargin(42.5009)
layout:setRightMargin(44.4991)
layout:setTopMargin(26.0000)
layout:setBottomMargin(26.0000)
AddButton_1:addChild(AddText_1_TT)

--Create CancelButton_1

local luaScript = require("csd.LuaScript.newButton")
local CancelButton_1 = luaScript.CreateCustomNode()
CancelButton_1:ignoreContentAdaptWithSize(false)
CancelButton_1:loadTextureNormal("04_02_Friends/button_086.png", 1)
CancelButton_1:loadTexturePressed("04_02_Friends/button_086.png", 1)
CancelButton_1:loadTextureDisabled("04_02_Friends/button_086.png", 1)
CancelButton_1:setTitleFontSize(14)
CancelButton_1:setScale9Enabled(true)
CancelButton_1:setCapInsets({x = 14, y = 11, width = 109, height = 62})
CancelButton_1:setLayoutComponentEnabled(true)
CancelButton_1:setName("CancelButton_1")
CancelButton_1:setTag(149)
CancelButton_1:setCascadeColorEnabled(true)
CancelButton_1:setCascadeOpacityEnabled(true)
CancelButton_1:setPosition(180.0000, 0.0002)
layout = ccui.LayoutComponent:bindLayoutComponent(CancelButton_1)
layout:setSize({width = 138.0000, height = 84.0000})
layout:setLeftMargin(111.0000)
layout:setRightMargin(-249.0000)
layout:setTopMargin(-42.0002)
layout:setBottomMargin(-41.9998)

luaScript.SetDownScele(CancelButton_1, "0.9800")
luaScript.SetClickEffect(CancelButton_1, "Sound004")
luaScript.SetDownColor(CancelButton_1, {r = 65, g = 65, b = 70})
AddFriends:addChild(CancelButton_1)

--Create CancelText_1_TT
local CancelText_1_TT = ccui.Text:create()
CancelText_1_TT:ignoreContentAdaptWithSize(true)
CancelText_1_TT:setTextAreaSize({width = 0, height = 0})
CancelText_1_TT:setFontName("font/Font001.ttf")
CancelText_1_TT:setFontSize(24)
CancelText_1_TT:setString([[取消申请]])
CancelText_1_TT:setLayoutComponentEnabled(true)
CancelText_1_TT:setName("CancelText_1_TT")
CancelText_1_TT:setTag(150)
CancelText_1_TT:setCascadeColorEnabled(true)
CancelText_1_TT:setCascadeOpacityEnabled(true)
CancelText_1_TT:setPosition(70.0000, 42.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(CancelText_1_TT)
layout:setPositionPercentX(0.5072)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.7174)
layout:setPercentHeight(0.3810)
layout:setSize({width = 99.0000, height = 32.0000})
layout:setLeftMargin(20.5000)
layout:setRightMargin(18.5000)
layout:setTopMargin(26.0000)
layout:setBottomMargin(26.0000)
CancelButton_1:addChild(CancelText_1_TT)

--Create FriendsAlreadyText_TT
local FriendsAlreadyText_TT = ccui.Text:create()
FriendsAlreadyText_TT:ignoreContentAdaptWithSize(true)
FriendsAlreadyText_TT:setTextAreaSize({width = 0, height = 0})
FriendsAlreadyText_TT:setFontName("font/Default.ttf")
FriendsAlreadyText_TT:setFontSize(28)
FriendsAlreadyText_TT:setString([[已是好友]])
FriendsAlreadyText_TT:setTextHorizontalAlignment(2)
FriendsAlreadyText_TT:setTextVerticalAlignment(1)
FriendsAlreadyText_TT:setLayoutComponentEnabled(true)
FriendsAlreadyText_TT:setName("FriendsAlreadyText_TT")
FriendsAlreadyText_TT:setTag(426)
FriendsAlreadyText_TT:setCascadeColorEnabled(true)
FriendsAlreadyText_TT:setCascadeOpacityEnabled(true)
FriendsAlreadyText_TT:setAnchorPoint(1.0000, 0.5000)
FriendsAlreadyText_TT:setPosition(239.5000, 0.0000)
FriendsAlreadyText_TT:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(FriendsAlreadyText_TT)
layout:setSize({width = 115.0000, height = 37.0000})
layout:setLeftMargin(124.5000)
layout:setRightMargin(-239.5000)
layout:setTopMargin(-18.5000)
layout:setBottomMargin(-18.5000)
AddFriends:addChild(FriendsAlreadyText_TT)

--Create ApplyList
local ApplyList=cc.Node:create()
ApplyList:setName("ApplyList")
ApplyList:setTag(729)
ApplyList:setCascadeColorEnabled(true)
ApplyList:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(ApplyList)
Friends:addChild(ApplyList)

--Create Agree
local Agree=cc.Node:create()
Agree:setName("Agree")
Agree:setTag(731)
Agree:setCascadeColorEnabled(true)
Agree:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Agree)
ApplyList:addChild(Agree)

--Create AgreeButton_1

local luaScript = require("csd.LuaScript.newButton")
local AgreeButton_1 = luaScript.CreateCustomNode()
AgreeButton_1:ignoreContentAdaptWithSize(false)
AgreeButton_1:loadTextureNormal("02_01_Boast/button_017.png", 1)
AgreeButton_1:loadTexturePressed("02_01_Boast/button_017.png", 1)
AgreeButton_1:loadTextureDisabled("02_01_Boast/button_017.png", 1)
AgreeButton_1:setTitleFontSize(14)
AgreeButton_1:setLayoutComponentEnabled(true)
AgreeButton_1:setName("AgreeButton_1")
AgreeButton_1:setTag(734)
AgreeButton_1:setCascadeColorEnabled(true)
AgreeButton_1:setCascadeOpacityEnabled(true)
AgreeButton_1:setPosition(161.0004, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(AgreeButton_1)
layout:setSize({width = 48.0000, height = 48.0000})
layout:setLeftMargin(137.0004)
layout:setRightMargin(-185.0004)
layout:setTopMargin(-24.0000)
layout:setBottomMargin(-24.0000)

luaScript.SetDownScele(AgreeButton_1, "0.9800")
luaScript.SetClickEffect(AgreeButton_1, "Sound004")
luaScript.SetDownColor(AgreeButton_1, {r = 65, g = 65, b = 70})
Agree:addChild(AgreeButton_1)

--Create Refuse
local Refuse=cc.Node:create()
Refuse:setName("Refuse")
Refuse:setTag(732)
Refuse:setCascadeColorEnabled(true)
Refuse:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Refuse)
ApplyList:addChild(Refuse)

--Create RefuseButton_1

local luaScript = require("csd.LuaScript.newButton")
local RefuseButton_1 = luaScript.CreateCustomNode()
RefuseButton_1:ignoreContentAdaptWithSize(false)
RefuseButton_1:loadTextureNormal("02_01_Boast/button_012.png", 1)
RefuseButton_1:loadTexturePressed("02_01_Boast/button_012.png", 1)
RefuseButton_1:loadTextureDisabled("02_01_Boast/button_012.png", 1)
RefuseButton_1:setTitleFontSize(14)
RefuseButton_1:setLayoutComponentEnabled(true)
RefuseButton_1:setName("RefuseButton_1")
RefuseButton_1:setTag(736)
RefuseButton_1:setCascadeColorEnabled(true)
RefuseButton_1:setCascadeOpacityEnabled(true)
RefuseButton_1:setPosition(222.0004, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(RefuseButton_1)
layout:setSize({width = 48.0000, height = 48.0000})
layout:setLeftMargin(198.0004)
layout:setRightMargin(-246.0004)
layout:setTopMargin(-24.0000)
layout:setBottomMargin(-24.0000)

luaScript.SetDownScele(RefuseButton_1, "0.9800")
luaScript.SetClickEffect(RefuseButton_1, "Sound004")
luaScript.SetDownColor(RefuseButton_1, {r = 65, g = 65, b = 70})
Refuse:addChild(RefuseButton_1)

--Create BlackList
local BlackList=cc.Node:create()
BlackList:setName("BlackList")
BlackList:setTag(738)
BlackList:setCascadeColorEnabled(true)
BlackList:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(BlackList)
Friends:addChild(BlackList)

--Create RemoveButton

local luaScript = require("csd.LuaScript.newButton")
local RemoveButton = luaScript.CreateCustomNode()
RemoveButton:ignoreContentAdaptWithSize(false)
RemoveButton:loadTextureNormal("01_04_Task/button_085.png", 1)
RemoveButton:loadTexturePressed("01_04_Task/button_085.png", 1)
RemoveButton:loadTextureDisabled("01_04_Task/button_085.png", 1)
RemoveButton:setTitleFontSize(14)
RemoveButton:setScale9Enabled(true)
RemoveButton:setCapInsets({x = 15, y = 11, width = 108, height = 62})
RemoveButton:setLayoutComponentEnabled(true)
RemoveButton:setName("RemoveButton")
RemoveButton:setTag(739)
RemoveButton:setCascadeColorEnabled(true)
RemoveButton:setCascadeOpacityEnabled(true)
RemoveButton:setAnchorPoint(0.0000, 1.0000)
RemoveButton:setPosition(113.0000, 42.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(RemoveButton)
layout:setSize({width = 138.0000, height = 84.0000})
layout:setLeftMargin(113.0000)
layout:setRightMargin(-251.0000)
layout:setTopMargin(-42.0000)
layout:setBottomMargin(-42.0000)

luaScript.SetDownScele(RemoveButton, "0.9800")
luaScript.SetClickEffect(RemoveButton, "Sound004")
luaScript.SetDownColor(RemoveButton, {r = 65, g = 65, b = 70})
BlackList:addChild(RemoveButton)

--Create RemoveText_TT
local RemoveText_TT = ccui.Text:create()
RemoveText_TT:ignoreContentAdaptWithSize(true)
RemoveText_TT:setTextAreaSize({width = 0, height = 0})
RemoveText_TT:setFontName("font/Font001.ttf")
RemoveText_TT:setFontSize(24)
RemoveText_TT:setString([[移除]])
RemoveText_TT:setLayoutComponentEnabled(true)
RemoveText_TT:setName("RemoveText_TT")
RemoveText_TT:setTag(740)
RemoveText_TT:setCascadeColorEnabled(true)
RemoveText_TT:setCascadeOpacityEnabled(true)
RemoveText_TT:setPosition(68.0009, 42.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(RemoveText_TT)
layout:setPositionPercentX(0.4928)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.3696)
layout:setPercentHeight(0.3810)
layout:setSize({width = 51.0000, height = 32.0000})
layout:setLeftMargin(42.5009)
layout:setRightMargin(44.4991)
layout:setTopMargin(26.0000)
layout:setBottomMargin(26.0000)
RemoveButton:addChild(RemoveText_TT)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result
