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
"ui/01_10_Mail/01_10_Mail_1.plist",	
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
layout:setSize({width = 718.0000, height = 420.0000})

--Create Middle
local Middle=cc.Node:create()
Middle:setName("Middle")
Middle:setTag(252)
Middle:setCascadeColorEnabled(true)
Middle:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Middle)
layout:setRightMargin(718.0000)
layout:setTopMargin(420.0000)
Layer:addChild(Middle)

--Create Bg
local Bg=cc.Node:create()
Bg:setName("Bg")
Bg:setTag(261)
Bg:setCascadeColorEnabled(true)
Bg:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Bg)
Middle:addChild(Bg)

--Create Bg_1
local Bg_1 = ccui.ImageView:create()
Bg_1:ignoreContentAdaptWithSize(false)
Bg_1:loadTexture("01_06_PersonalCenter/frame_034.png", 1)
Bg_1:setScale9Enabled(true)
Bg_1:setCapInsets({x = 17, y = 88, width = 20, height = 194})
Bg_1:setLayoutComponentEnabled(true)
Bg_1:setName("Bg_1")
Bg_1:setTag(263)
Bg_1:setCascadeColorEnabled(true)
Bg_1:setCascadeOpacityEnabled(true)
Bg_1:setAnchorPoint(0.0000, 0.0000)
Bg_1:setPosition(0.0000, -0.0001)
layout = ccui.LayoutComponent:bindLayoutComponent(Bg_1)
layout:setSize({width = 718.0000, height = 420.0000})
layout:setRightMargin(-718.0000)
layout:setTopMargin(-419.9999)
layout:setBottomMargin(-0.0001)
Bg:addChild(Bg_1)

--Create TitleText_TT
local TitleText_TT = ccui.Text:create()
TitleText_TT:ignoreContentAdaptWithSize(true)
TitleText_TT:setTextAreaSize({width = 0, height = 0})
TitleText_TT:setFontName("font/Font001.ttf")
TitleText_TT:setFontSize(32)
TitleText_TT:setString([[提示]])
TitleText_TT:setTextHorizontalAlignment(1)
TitleText_TT:setTextVerticalAlignment(1)
TitleText_TT:enableShadow({r = 0, g = 0, b = 0, a = 255}, {width = 2, height = -2}, 0)
TitleText_TT:setLayoutComponentEnabled(true)
TitleText_TT:setName("TitleText_TT")
TitleText_TT:setTag(38)
TitleText_TT:setCascadeColorEnabled(true)
TitleText_TT:setCascadeOpacityEnabled(true)
TitleText_TT:setPosition(359.0000, 379.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(TitleText_TT)
layout:setSize({width = 67.0000, height = 42.0000})
layout:setLeftMargin(325.5000)
layout:setRightMargin(-392.5000)
layout:setTopMargin(-400.0000)
layout:setBottomMargin(358.0000)
Middle:addChild(TitleText_TT)

--Create FinishNode
local FinishNode=cc.Node:create()
FinishNode:setName("FinishNode")
FinishNode:setTag(35)
FinishNode:setCascadeColorEnabled(true)
FinishNode:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(FinishNode)
Middle:addChild(FinishNode)

--Create ContentText_1
local ContentText_1 = ccui.Text:create()
ContentText_1:ignoreContentAdaptWithSize(false)
ContentText_1:setFontName("font/Default.ttf")
ContentText_1:setFontSize(32)
ContentText_1:setString([[恭喜完成新手教学
获得金币：1000]])
ContentText_1:setTextHorizontalAlignment(1)
ContentText_1:setTextVerticalAlignment(2)
ContentText_1:setLayoutComponentEnabled(true)
ContentText_1:setName("ContentText_1")
ContentText_1:setTag(39)
ContentText_1:setCascadeColorEnabled(true)
ContentText_1:setCascadeOpacityEnabled(true)
ContentText_1:setPosition(359.0000, 295.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ContentText_1)
layout:setSize({width = 600.0000, height = 84.0000})
layout:setLeftMargin(59.0000)
layout:setRightMargin(-659.0000)
layout:setTopMargin(-337.0000)
layout:setBottomMargin(253.0000)
FinishNode:addChild(ContentText_1)

--Create ContentText_2
local ContentText_2 = ccui.Text:create()
ContentText_2:ignoreContentAdaptWithSize(false)
ContentText_2:setFontName("font/Default.ttf")
ContentText_2:setFontSize(32)
ContentText_2:setString([[是否开始进价教学]])
ContentText_2:setTextHorizontalAlignment(1)
ContentText_2:setLayoutComponentEnabled(true)
ContentText_2:setName("ContentText_2")
ContentText_2:setTag(40)
ContentText_2:setCascadeColorEnabled(true)
ContentText_2:setCascadeOpacityEnabled(true)
ContentText_2:setPosition(359.0000, 194.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ContentText_2)
layout:setSize({width = 600.0000, height = 84.0000})
layout:setLeftMargin(59.0000)
layout:setRightMargin(-659.0000)
layout:setTopMargin(-236.0000)
layout:setBottomMargin(152.0000)
FinishNode:addChild(ContentText_2)

--Create ExitNode
local ExitNode=cc.Node:create()
ExitNode:setName("ExitNode")
ExitNode:setTag(36)
ExitNode:setCascadeColorEnabled(true)
ExitNode:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(ExitNode)
Middle:addChild(ExitNode)

--Create ContentText_3_TT
local ContentText_3_TT = ccui.Text:create()
ContentText_3_TT:ignoreContentAdaptWithSize(false)
ContentText_3_TT:setFontName("font/Default.ttf")
ContentText_3_TT:setFontSize(32)
ContentText_3_TT:setString([[离大奖只差一点点]])
ContentText_3_TT:setTextHorizontalAlignment(1)
ContentText_3_TT:setTextVerticalAlignment(2)
ContentText_3_TT:setLayoutComponentEnabled(true)
ContentText_3_TT:setName("ContentText_3_TT")
ContentText_3_TT:setTag(37)
ContentText_3_TT:setCascadeColorEnabled(true)
ContentText_3_TT:setCascadeOpacityEnabled(true)
ContentText_3_TT:setPosition(359.0000, 295.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ContentText_3_TT)
layout:setSize({width = 600.0000, height = 84.0000})
layout:setLeftMargin(59.0000)
layout:setRightMargin(-659.0000)
layout:setTopMargin(-337.0000)
layout:setBottomMargin(253.0000)
ExitNode:addChild(ContentText_3_TT)

--Create ContentText_4_TT
local ContentText_4_TT = ccui.Text:create()
ContentText_4_TT:ignoreContentAdaptWithSize(false)
ContentText_4_TT:setFontName("font/Default.ttf")
ContentText_4_TT:setFontSize(32)
ContentText_4_TT:setString([[真的要退出吗？]])
ContentText_4_TT:setTextHorizontalAlignment(1)
ContentText_4_TT:setLayoutComponentEnabled(true)
ContentText_4_TT:setName("ContentText_4_TT")
ContentText_4_TT:setTag(38)
ContentText_4_TT:setCascadeColorEnabled(true)
ContentText_4_TT:setCascadeOpacityEnabled(true)
ContentText_4_TT:setPosition(359.0000, 194.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ContentText_4_TT)
layout:setSize({width = 600.0000, height = 84.0000})
layout:setLeftMargin(59.0000)
layout:setRightMargin(-659.0000)
layout:setTopMargin(-236.0000)
layout:setBottomMargin(152.0000)
ExitNode:addChild(ContentText_4_TT)

--Create Cancel
local Cancel=cc.Node:create()
Cancel:setName("Cancel")
Cancel:setTag(255)
Cancel:setCascadeColorEnabled(true)
Cancel:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Cancel)
Middle:addChild(Cancel)

--Create CancelButton

local luaScript = require("csd.LuaScript.newButton")
local CancelButton = luaScript.CreateCustomNode()
CancelButton:ignoreContentAdaptWithSize(false)
CancelButton:loadTextureNormal("01_10_Mail/button_035.png", 1)
CancelButton:loadTexturePressed("01_10_Mail/button_035.png", 1)
CancelButton:loadTextureDisabled("01_10_Mail/button_035.png", 1)
CancelButton:setTitleFontSize(14)
CancelButton:setScale9Enabled(true)
CancelButton:setCapInsets({x = 15, y = 11, width = 178, height = 76})
CancelButton:setLayoutComponentEnabled(true)
CancelButton:setName("CancelButton")
CancelButton:setTag(1190)
CancelButton:setCascadeColorEnabled(true)
CancelButton:setCascadeOpacityEnabled(true)
CancelButton:setPosition(506.0000, 111.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(CancelButton)
layout:setSize({width = 208.0000, height = 98.0000})
layout:setLeftMargin(402.0000)
layout:setRightMargin(-610.0000)
layout:setTopMargin(-160.0000)
layout:setBottomMargin(62.0000)

luaScript.SetDownScele(CancelButton, "0.9800")
luaScript.SetClickEffect(CancelButton, "Sound004")
luaScript.SetDownColor(CancelButton, {r = 65, g = 65, b = 70})
Cancel:addChild(CancelButton)

--Create CancelText_TT
local CancelText_TT = ccui.Text:create()
CancelText_TT:ignoreContentAdaptWithSize(true)
CancelText_TT:setTextAreaSize({width = 0, height = 0})
CancelText_TT:setFontName("font/Font001.ttf")
CancelText_TT:setFontSize(28)
CancelText_TT:setString([[否]])
CancelText_TT:setTextHorizontalAlignment(1)
CancelText_TT:setTextVerticalAlignment(1)
CancelText_TT:enableShadow({r = 0, g = 0, b = 0, a = 255}, {width = 0, height = -1}, 0)
CancelText_TT:setLayoutComponentEnabled(true)
CancelText_TT:setName("CancelText_TT")
CancelText_TT:setTag(1191)
CancelText_TT:setCascadeColorEnabled(true)
CancelText_TT:setCascadeOpacityEnabled(true)
CancelText_TT:setPosition(104.0000, 49.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(CancelText_TT)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.1490)
layout:setPercentHeight(0.3776)
layout:setSize({width = 31.0000, height = 37.0000})
layout:setLeftMargin(88.5000)
layout:setRightMargin(88.5000)
layout:setTopMargin(30.5000)
layout:setBottomMargin(30.5000)
CancelButton:addChild(CancelText_TT)

--Create Confirm
local Confirm=cc.Node:create()
Confirm:setName("Confirm")
Confirm:setTag(1189)
Confirm:setCascadeColorEnabled(true)
Confirm:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Confirm)
Middle:addChild(Confirm)

--Create ConfirmButton

local luaScript = require("csd.LuaScript.newButton")
local ConfirmButton = luaScript.CreateCustomNode()
ConfirmButton:ignoreContentAdaptWithSize(false)
ConfirmButton:loadTextureNormal("01_10_Mail/button_034.png", 1)
ConfirmButton:loadTexturePressed("01_10_Mail/button_034.png", 1)
ConfirmButton:loadTextureDisabled("01_10_Mail/button_034.png", 1)
ConfirmButton:setTitleFontSize(14)
ConfirmButton:setScale9Enabled(true)
ConfirmButton:setCapInsets({x = 15, y = 11, width = 178, height = 76})
ConfirmButton:setLayoutComponentEnabled(true)
ConfirmButton:setName("ConfirmButton")
ConfirmButton:setTag(256)
ConfirmButton:setCascadeColorEnabled(true)
ConfirmButton:setCascadeOpacityEnabled(true)
ConfirmButton:setPosition(215.0000, 111.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ConfirmButton)
layout:setSize({width = 208.0000, height = 98.0000})
layout:setLeftMargin(111.0000)
layout:setRightMargin(-319.0000)
layout:setTopMargin(-160.0000)
layout:setBottomMargin(62.0000)

luaScript.SetDownScele(ConfirmButton, "0.9800")
luaScript.SetClickEffect(ConfirmButton, "Sound004")
luaScript.SetDownColor(ConfirmButton, {r = 65, g = 65, b = 70})
Confirm:addChild(ConfirmButton)

--Create ConfirmText_TT
local ConfirmText_TT = ccui.Text:create()
ConfirmText_TT:ignoreContentAdaptWithSize(true)
ConfirmText_TT:setTextAreaSize({width = 0, height = 0})
ConfirmText_TT:setFontName("font/Font001.ttf")
ConfirmText_TT:setFontSize(28)
ConfirmText_TT:setString([[是]])
ConfirmText_TT:setTextHorizontalAlignment(1)
ConfirmText_TT:setTextVerticalAlignment(1)
ConfirmText_TT:enableShadow({r = 0, g = 0, b = 0, a = 255}, {width = 0, height = -1}, 0)
ConfirmText_TT:setLayoutComponentEnabled(true)
ConfirmText_TT:setName("ConfirmText_TT")
ConfirmText_TT:setTag(257)
ConfirmText_TT:setCascadeColorEnabled(true)
ConfirmText_TT:setCascadeOpacityEnabled(true)
ConfirmText_TT:setPosition(104.0000, 49.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ConfirmText_TT)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.1490)
layout:setPercentHeight(0.3776)
layout:setSize({width = 31.0000, height = 37.0000})
layout:setLeftMargin(88.5000)
layout:setRightMargin(88.5000)
layout:setTopMargin(30.5000)
layout:setBottomMargin(30.5000)
ConfirmButton:addChild(ConfirmText_TT)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result
