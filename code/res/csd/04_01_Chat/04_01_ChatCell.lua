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
"ui/01_06_PersonalCenter/01_06_PersonalCenter_1.plist",	
"ui/00_02_Default/00_02_Default_1.plist",	
"ui/04_01_Chat/04_01_Chat_1.plist",	
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
layout:setSize({width = 681.0000, height = 185.0000})

--Create ChatNode
local ChatNode=cc.Node:create()
ChatNode:setName("ChatNode")
ChatNode:setTag(464)
ChatNode:setCascadeColorEnabled(true)
ChatNode:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(ChatNode)
layout:setRightMargin(681.0000)
layout:setTopMargin(185.0000)
Layer:addChild(ChatNode)

--Create HeadIcon
local HeadIcon=cc.Node:create()
HeadIcon:setName("HeadIcon")
HeadIcon:setTag(655)
HeadIcon:setCascadeColorEnabled(true)
HeadIcon:setCascadeOpacityEnabled(true)
HeadIcon:setPosition(75.0002, 85.0004)
layout = ccui.LayoutComponent:bindLayoutComponent(HeadIcon)
layout:setLeftMargin(75.0002)
layout:setRightMargin(-75.0002)
layout:setTopMargin(-85.0004)
layout:setBottomMargin(85.0004)
ChatNode:addChild(HeadIcon)

--Create HeadFrame
local HeadFrame = ccui.ImageView:create()
HeadFrame:ignoreContentAdaptWithSize(false)
HeadFrame:loadTexture("Default/ImageFile.png", 1)
HeadFrame:setLayoutComponentEnabled(true)
HeadFrame:setName("HeadFrame")
HeadFrame:setTag(353)
HeadFrame:setCascadeColorEnabled(true)
HeadFrame:setCascadeOpacityEnabled(true)
HeadFrame:setPosition(75.0000, 85.0002)
layout = ccui.LayoutComponent:bindLayoutComponent(HeadFrame)
layout:setSize({width = 120.0000, height = 120.0000})
layout:setLeftMargin(15.0000)
layout:setRightMargin(-135.0000)
layout:setTopMargin(-145.0002)
layout:setBottomMargin(25.0002)
ChatNode:addChild(HeadFrame)

--Create HeadPanel
local HeadPanel = ccui.Layout:create()
HeadPanel:ignoreContentAdaptWithSize(false)
HeadPanel:setClippingEnabled(false)
HeadPanel:setBackGroundColorOpacity(102)
HeadPanel:setTouchEnabled(true);
HeadPanel:setLayoutComponentEnabled(true)
HeadPanel:setName("HeadPanel")
HeadPanel:setTag(3115)
HeadPanel:setCascadeColorEnabled(true)
HeadPanel:setCascadeOpacityEnabled(true)
HeadPanel:setAnchorPoint(0.5000, 0.5000)
HeadPanel:setPosition(75.0000, 85.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(HeadPanel)
layout:setSize({width = 120.0000, height = 120.0000})
layout:setLeftMargin(15.0000)
layout:setRightMargin(-135.0000)
layout:setTopMargin(-145.0000)
layout:setBottomMargin(25.0000)
ChatNode:addChild(HeadPanel)

--Create NameText_O
local NameText_O = ccui.Text:create()
NameText_O:ignoreContentAdaptWithSize(true)
NameText_O:setTextAreaSize({width = 0, height = 0})
NameText_O:setFontName("font/Font001.ttf")
NameText_O:setFontSize(24)
NameText_O:setString([[拜拜甜甜圈圈]])
NameText_O:setTextVerticalAlignment(1)
NameText_O:setLayoutComponentEnabled(true)
NameText_O:setName("NameText_O")
NameText_O:setTag(467)
NameText_O:setCascadeColorEnabled(true)
NameText_O:setCascadeOpacityEnabled(true)
NameText_O:setAnchorPoint(0.0000, 0.5000)
NameText_O:setPosition(141.0002, 105.0004)
layout = ccui.LayoutComponent:bindLayoutComponent(NameText_O)
layout:setSize({width = 146.0000, height = 32.0000})
layout:setLeftMargin(141.0002)
layout:setRightMargin(-287.0002)
layout:setTopMargin(-121.0004)
layout:setBottomMargin(89.0004)
ChatNode:addChild(NameText_O)

--Create SexIcon
local SexIcon = ccui.ImageView:create()
SexIcon:ignoreContentAdaptWithSize(false)
SexIcon:loadTexture("01_06_PersonalCenter/icon_030.png", 1)
SexIcon:setLayoutComponentEnabled(true)
SexIcon:setName("SexIcon")
SexIcon:setTag(470)
SexIcon:setCascadeColorEnabled(true)
SexIcon:setCascadeOpacityEnabled(true)
SexIcon:setPosition(317.0004, 104.9998)
layout = ccui.LayoutComponent:bindLayoutComponent(SexIcon)
layout:setSize({width = 34.0000, height = 38.0000})
layout:setLeftMargin(300.0004)
layout:setRightMargin(-334.0004)
layout:setTopMargin(-123.9998)
layout:setBottomMargin(85.9998)
ChatNode:addChild(SexIcon)

--Create VipIcon
local VipIcon = ccui.ImageView:create()
VipIcon:ignoreContentAdaptWithSize(false)
VipIcon:loadTexture("00_02_Default/Vip1.png", 1)
VipIcon:setLayoutComponentEnabled(true)
VipIcon:setName("VipIcon")
VipIcon:setTag(469)
VipIcon:setCascadeColorEnabled(true)
VipIcon:setCascadeOpacityEnabled(true)
VipIcon:setPosition(352.0045, 104.9999)
layout = ccui.LayoutComponent:bindLayoutComponent(VipIcon)
layout:setSize({width = 34.0000, height = 28.0000})
layout:setLeftMargin(335.0045)
layout:setRightMargin(-369.0045)
layout:setTopMargin(-118.9999)
layout:setBottomMargin(90.9999)
ChatNode:addChild(VipIcon)

--Create Time
local Time=cc.Node:create()
Time:setName("Time")
Time:setTag(471)
Time:setCascadeColorEnabled(true)
Time:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Time)
ChatNode:addChild(Time)

--Create ChatTimeBg
local ChatTimeBg = cc.Sprite:createWithSpriteFrameName("04_01_Chat/frame_081.png")
ChatTimeBg:setName("ChatTimeBg")
ChatTimeBg:setTag(163)
ChatTimeBg:setCascadeColorEnabled(true)
ChatTimeBg:setCascadeOpacityEnabled(true)
ChatTimeBg:setPosition(340.0000, 159.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ChatTimeBg)
layout:setSize({width = 122.0000, height = 36.0000})
layout:setLeftMargin(279.0000)
layout:setRightMargin(-401.0000)
layout:setTopMargin(-177.0000)
layout:setBottomMargin(141.0000)
ChatTimeBg:setBlendFunc({src = 1, dst = 771})
Time:addChild(ChatTimeBg)

--Create TimeNum
local TimeNum = ccui.Text:create()
TimeNum:ignoreContentAdaptWithSize(true)
TimeNum:setTextAreaSize({width = 0, height = 0})
TimeNum:setFontName("font/Default.ttf")
TimeNum:setFontSize(24)
TimeNum:setString([[刚刚]])
TimeNum:setTextHorizontalAlignment(1)
TimeNum:setTextVerticalAlignment(1)
TimeNum:setLayoutComponentEnabled(true)
TimeNum:setName("TimeNum")
TimeNum:setTag(473)
TimeNum:setCascadeColorEnabled(true)
TimeNum:setCascadeOpacityEnabled(true)
TimeNum:setPosition(340.0000, 161.0002)
TimeNum:setScaleY(1.0582)
layout = ccui.LayoutComponent:bindLayoutComponent(TimeNum)
layout:setSize({width = 50.0000, height = 32.0000})
layout:setLeftMargin(315.0000)
layout:setRightMargin(-365.0000)
layout:setTopMargin(-177.0002)
layout:setBottomMargin(145.0002)
Time:addChild(TimeNum)

--Create Content
local Content=cc.Node:create()
Content:setName("Content")
Content:setTag(477)
Content:setCascadeColorEnabled(true)
Content:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Content)
ChatNode:addChild(Content)

--Create ContentBg
local ContentBg = ccui.ImageView:create()
ContentBg:ignoreContentAdaptWithSize(false)
ContentBg:loadTexture("04_01_Chat/frame_086.png", 1)
ContentBg:setScale9Enabled(true)
ContentBg:setCapInsets({x = 19, y = 19, width = 52, height = 32})
ContentBg:setLayoutComponentEnabled(true)
ContentBg:setName("ContentBg")
ContentBg:setTag(504)
ContentBg:setCascadeColorEnabled(true)
ContentBg:setCascadeOpacityEnabled(true)
ContentBg:setAnchorPoint(0.0000, 1.0000)
ContentBg:setPosition(142.9999, 77.0002)
layout = ccui.LayoutComponent:bindLayoutComponent(ContentBg)
layout:setSize({width = 290.0000, height = 69.0000})
layout:setLeftMargin(142.9999)
layout:setRightMargin(-432.9999)
layout:setTopMargin(-77.0002)
layout:setBottomMargin(8.0002)
Content:addChild(ContentBg)

--Create ContentText_S
local ContentText_S = ccui.Text:create()
ContentText_S:ignoreContentAdaptWithSize(false)
ContentText_S:setFontName("font/Default.ttf")
ContentText_S:setFontSize(24)
ContentText_S:setString([[直播吹牛逼啊！老师你居然


]])
ContentText_S:setLayoutComponentEnabled(true)
ContentText_S:setName("ContentText_S")
ContentText_S:setTag(478)
ContentText_S:setCascadeColorEnabled(true)
ContentText_S:setCascadeOpacityEnabled(true)
ContentText_S:setAnchorPoint(0.0000, 1.0000)
ContentText_S:setPosition(18.4987, 52.0000)
ContentText_S:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(ContentText_S)
layout:setPositionPercentX(0.0638)
layout:setPositionPercentY(0.7536)
layout:setPercentWidth(0.8379)
layout:setPercentHeight(0.4638)
layout:setSize({width = 243.0000, height = 32.0000})
layout:setLeftMargin(18.4987)
layout:setRightMargin(28.5013)
layout:setTopMargin(17.0000)
layout:setBottomMargin(20.0000)
ContentBg:addChild(ContentText_S)

--Create ExpressionImage
local ExpressionImage = ccui.ImageView:create()
ExpressionImage:ignoreContentAdaptWithSize(false)
ExpressionImage:loadTexture("Default/ImageFile.png", 1)
ExpressionImage:setLayoutComponentEnabled(true)
ExpressionImage:setName("ExpressionImage")
ExpressionImage:setTag(475)
ExpressionImage:setCascadeColorEnabled(true)
ExpressionImage:setCascadeOpacityEnabled(true)
ExpressionImage:setAnchorPoint(0.0000, 1.0000)
ExpressionImage:setPosition(144.9998, 75.0004)
layout = ccui.LayoutComponent:bindLayoutComponent(ExpressionImage)
layout:setSize({width = 50.0000, height = 50.0000})
layout:setLeftMargin(144.9998)
layout:setRightMargin(-194.9998)
layout:setTopMargin(-75.0004)
layout:setBottomMargin(25.0004)
ChatNode:addChild(ExpressionImage)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

