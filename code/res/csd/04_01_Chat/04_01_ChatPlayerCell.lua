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

--Create ChatPlayerCell
local ChatPlayerCell=cc.Node:create()
ChatPlayerCell:setName("ChatPlayerCell")
ChatPlayerCell:setTag(52)
ChatPlayerCell:setCascadeColorEnabled(true)
ChatPlayerCell:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(ChatPlayerCell)
layout:setRightMargin(681.0000)
layout:setTopMargin(185.0000)
Layer:addChild(ChatPlayerCell)

--Create Time
local Time=cc.Node:create()
Time:setName("Time")
Time:setTag(75)
Time:setCascadeColorEnabled(true)
Time:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Time)
ChatPlayerCell:addChild(Time)

--Create PrivateChatTimeBg
local PrivateChatTimeBg = cc.Sprite:createWithSpriteFrameName("04_01_Chat/frame_081.png")
PrivateChatTimeBg:setName("PrivateChatTimeBg")
PrivateChatTimeBg:setTag(177)
PrivateChatTimeBg:setCascadeColorEnabled(true)
PrivateChatTimeBg:setCascadeOpacityEnabled(true)
PrivateChatTimeBg:setPosition(340.0000, 159.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(PrivateChatTimeBg)
layout:setSize({width = 122.0000, height = 36.0000})
layout:setLeftMargin(279.0000)
layout:setRightMargin(-401.0000)
layout:setTopMargin(-177.0000)
layout:setBottomMargin(141.0000)
PrivateChatTimeBg:setBlendFunc({src = 1, dst = 771})
Time:addChild(PrivateChatTimeBg)

--Create TimeNum
local TimeNum = ccui.Text:create()
TimeNum:ignoreContentAdaptWithSize(true)
TimeNum:setTextAreaSize({width = 0, height = 0})
TimeNum:setFontName("font/Default.ttf")
TimeNum:setFontSize(24)
TimeNum:setString([[51分钟前]])
TimeNum:setLayoutComponentEnabled(true)
TimeNum:setName("TimeNum")
TimeNum:setTag(77)
TimeNum:setCascadeColorEnabled(true)
TimeNum:setCascadeOpacityEnabled(true)
TimeNum:setPosition(339.9998, 160.9999)
layout = ccui.LayoutComponent:bindLayoutComponent(TimeNum)
layout:setSize({width = 103.0000, height = 32.0000})
layout:setLeftMargin(288.4998)
layout:setRightMargin(-391.4998)
layout:setTopMargin(-176.9999)
layout:setBottomMargin(144.9999)
Time:addChild(TimeNum)

--Create HeadIcon
local HeadIcon=cc.Node:create()
HeadIcon:setName("HeadIcon")
HeadIcon:setTag(727)
HeadIcon:setCascadeColorEnabled(true)
HeadIcon:setCascadeOpacityEnabled(true)
HeadIcon:setPosition(605.0001, 66.0001)
layout = ccui.LayoutComponent:bindLayoutComponent(HeadIcon)
layout:setLeftMargin(605.0001)
layout:setRightMargin(-605.0001)
layout:setTopMargin(-66.0001)
layout:setBottomMargin(66.0001)
ChatPlayerCell:addChild(HeadIcon)

--Create HeadFrame
local HeadFrame = ccui.ImageView:create()
HeadFrame:ignoreContentAdaptWithSize(false)
HeadFrame:loadTexture("Default/ImageFile.png", 1)
HeadFrame:setLayoutComponentEnabled(true)
HeadFrame:setName("HeadFrame")
HeadFrame:setTag(508)
HeadFrame:setCascadeColorEnabled(true)
HeadFrame:setCascadeOpacityEnabled(true)
HeadFrame:setPosition(604.9991, 66.0006)
layout = ccui.LayoutComponent:bindLayoutComponent(HeadFrame)
layout:setSize({width = 120.0000, height = 120.0000})
layout:setLeftMargin(544.9991)
layout:setRightMargin(-664.9991)
layout:setTopMargin(-126.0006)
layout:setBottomMargin(6.0006)
ChatPlayerCell:addChild(HeadFrame)

--Create HeadPanel
local HeadPanel = ccui.Layout:create()
HeadPanel:ignoreContentAdaptWithSize(false)
HeadPanel:setClippingEnabled(false)
HeadPanel:setBackGroundColorOpacity(102)
HeadPanel:setTouchEnabled(true);
HeadPanel:setLayoutComponentEnabled(true)
HeadPanel:setName("HeadPanel")
HeadPanel:setTag(3172)
HeadPanel:setCascadeColorEnabled(true)
HeadPanel:setCascadeOpacityEnabled(true)
HeadPanel:setAnchorPoint(0.5000, 0.5000)
HeadPanel:setPosition(605.0000, 66.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(HeadPanel)
layout:setSize({width = 120.0000, height = 120.0000})
layout:setLeftMargin(545.0000)
layout:setRightMargin(-665.0000)
layout:setTopMargin(-126.0000)
layout:setBottomMargin(6.0000)
ChatPlayerCell:addChild(HeadPanel)

--Create Content
local Content=cc.Node:create()
Content:setName("Content")
Content:setTag(69)
Content:setCascadeColorEnabled(true)
Content:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Content)
ChatPlayerCell:addChild(Content)

--Create ContentBg
local ContentBg = ccui.ImageView:create()
ContentBg:ignoreContentAdaptWithSize(false)
ContentBg:loadTexture("04_01_Chat/frame_127.png", 1)
ContentBg:setScale9Enabled(true)
ContentBg:setCapInsets({x = 15, y = 15, width = 60, height = 40})
ContentBg:setLayoutComponentEnabled(true)
ContentBg:setName("ContentBg")
ContentBg:setTag(70)
ContentBg:setCascadeColorEnabled(true)
ContentBg:setCascadeOpacityEnabled(true)
ContentBg:setAnchorPoint(1.0000, 1.0000)
ContentBg:setPosition(539.0001, 99.9983)
layout = ccui.LayoutComponent:bindLayoutComponent(ContentBg)
layout:setSize({width = 290.0000, height = 70.0000})
layout:setLeftMargin(249.0001)
layout:setRightMargin(-539.0001)
layout:setTopMargin(-99.9983)
layout:setBottomMargin(29.9983)
Content:addChild(ContentBg)

--Create ContentText_S
local ContentText_S = ccui.Text:create()
ContentText_S:ignoreContentAdaptWithSize(false)
ContentText_S:setFontName("font/Default.ttf")
ContentText_S:setFontSize(24)
ContentText_S:setString([[開他，開開開開啊開啊]])
ContentText_S:setTextHorizontalAlignment(2)
ContentText_S:setLayoutComponentEnabled(true)
ContentText_S:setName("ContentText_S")
ContentText_S:setTag(71)
ContentText_S:setCascadeColorEnabled(true)
ContentText_S:setCascadeOpacityEnabled(true)
ContentText_S:setAnchorPoint(1.0000, 1.0000)
ContentText_S:setPosition(263.5000, 51.9978)
ContentText_S:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(ContentText_S)
layout:setPositionPercentX(0.9086)
layout:setPositionPercentY(0.7428)
layout:setPercentWidth(0.8379)
layout:setPercentHeight(0.4571)
layout:setSize({width = 243.0000, height = 32.0000})
layout:setLeftMargin(20.5000)
layout:setRightMargin(26.5000)
layout:setTopMargin(18.0022)
layout:setBottomMargin(19.9978)
ContentBg:addChild(ContentText_S)

--Create ContentErrorButton

local luaScript = require("csd.LuaScript.newButton")
local ContentErrorButton = luaScript.CreateCustomNode()
ContentErrorButton:ignoreContentAdaptWithSize(false)
ContentErrorButton:loadTextureNormal("04_01_Chat/icon_044.png", 1)
ContentErrorButton:loadTexturePressed("04_01_Chat/icon_044.png", 1)
ContentErrorButton:loadTextureDisabled("04_01_Chat/icon_044.png", 1)
ContentErrorButton:setTitleFontSize(14)
ContentErrorButton:setLayoutComponentEnabled(true)
ContentErrorButton:setName("ContentErrorButton")
ContentErrorButton:setTag(48)
ContentErrorButton:setCascadeColorEnabled(true)
ContentErrorButton:setCascadeOpacityEnabled(true)
ContentErrorButton:setPosition(211.9951, 62.9982)
layout = ccui.LayoutComponent:bindLayoutComponent(ContentErrorButton)
layout:setSize({width = 46.0000, height = 46.0000})
layout:setLeftMargin(188.9951)
layout:setRightMargin(-234.9951)
layout:setTopMargin(-85.9982)
layout:setBottomMargin(39.9982)

luaScript.SetDownScele(ContentErrorButton, "1.0000")
luaScript.SetClickEffect(ContentErrorButton, "")
luaScript.SetDownColor(ContentErrorButton, {r = 65, g = 65, b = 70})
Content:addChild(ContentErrorButton)

--Create ExpressionImage
local ExpressionImage = ccui.ImageView:create()
ExpressionImage:ignoreContentAdaptWithSize(false)
ExpressionImage:loadTexture("Default/ImageFile.png", 1)
ExpressionImage:setLayoutComponentEnabled(true)
ExpressionImage:setName("ExpressionImage")
ExpressionImage:setTag(78)
ExpressionImage:setCascadeColorEnabled(true)
ExpressionImage:setCascadeOpacityEnabled(true)
ExpressionImage:setPosition(512.0003, 73.0008)
layout = ccui.LayoutComponent:bindLayoutComponent(ExpressionImage)
layout:setSize({width = 50.0000, height = 50.0000})
layout:setLeftMargin(487.0003)
layout:setRightMargin(-537.0003)
layout:setTopMargin(-98.0008)
layout:setBottomMargin(48.0008)
ChatPlayerCell:addChild(ExpressionImage)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

