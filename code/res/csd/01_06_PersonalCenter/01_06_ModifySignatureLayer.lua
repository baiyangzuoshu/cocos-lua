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
layout:setSize({width = 720.0000, height = 538.0000})

--Create Bg
local Bg=cc.Node:create()
Bg:setName("Bg")
Bg:setTag(391)
Bg:setCascadeColorEnabled(true)
Bg:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Bg)
layout:setRightMargin(720.0000)
layout:setTopMargin(538.0000)
Layer:addChild(Bg)

--Create Bg_1
local Bg_1 = ccui.ImageView:create()
Bg_1:ignoreContentAdaptWithSize(false)
Bg_1:loadTexture("01_06_PersonalCenter/frame_038.png", 1)
Bg_1:setScale9Enabled(true)
Bg_1:setCapInsets({x = 16, y = 124, width = 18, height = 130})
Bg_1:setLayoutComponentEnabled(true)
Bg_1:setName("Bg_1")
Bg_1:setTag(394)
Bg_1:setCascadeColorEnabled(true)
Bg_1:setCascadeOpacityEnabled(true)
Bg_1:setPosition(365.0003, 268.9996)
layout = ccui.LayoutComponent:bindLayoutComponent(Bg_1)
layout:setSize({width = 558.0000, height = 538.0000})
layout:setLeftMargin(86.0003)
layout:setRightMargin(-644.0003)
layout:setTopMargin(-537.9996)
layout:setBottomMargin(-0.0004)
Bg:addChild(Bg_1)

--Create Middle
local Middle=cc.Node:create()
Middle:setName("Middle")
Middle:setTag(395)
Middle:setCascadeColorEnabled(true)
Middle:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Middle)
layout:setRightMargin(720.0000)
layout:setTopMargin(538.0000)
Layer:addChild(Middle)

--Create TitleText_TT
local TitleText_TT = ccui.Text:create()
TitleText_TT:ignoreContentAdaptWithSize(true)
TitleText_TT:setTextAreaSize({width = 0, height = 0})
TitleText_TT:setFontName("font/Font001.ttf")
TitleText_TT:setFontSize(32)
TitleText_TT:setString([[修改个性签名]])
TitleText_TT:setTextHorizontalAlignment(1)
TitleText_TT:setTextVerticalAlignment(1)
TitleText_TT:setLayoutComponentEnabled(true)
TitleText_TT:setName("TitleText_TT")
TitleText_TT:setTag(492)
TitleText_TT:setCascadeColorEnabled(true)
TitleText_TT:setCascadeOpacityEnabled(true)
TitleText_TT:setPosition(364.0000, 500.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(TitleText_TT)
layout:setSize({width = 192.0000, height = 42.0000})
layout:setLeftMargin(268.0000)
layout:setRightMargin(-460.0000)
layout:setTopMargin(-521.0000)
layout:setBottomMargin(479.0000)
Middle:addChild(TitleText_TT)

--Create Content
local Content=cc.Node:create()
Content:setName("Content")
Content:setTag(709)
Content:setCascadeColorEnabled(true)
Content:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Content)
Middle:addChild(Content)

--Create ContentBg
local ContentBg = cc.Sprite:createWithSpriteFrameName("01_06_PersonalCenter/frame_037.png")
ContentBg:setName("ContentBg")
ContentBg:setTag(611)
ContentBg:setCascadeColorEnabled(true)
ContentBg:setCascadeOpacityEnabled(true)
ContentBg:setPosition(365.0000, 292.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ContentBg)
layout:setSize({width = 450.0000, height = 256.0000})
layout:setLeftMargin(140.0000)
layout:setRightMargin(-590.0000)
layout:setTopMargin(-420.0000)
layout:setBottomMargin(164.0000)
ContentBg:setBlendFunc({src = 1, dst = 771})
Content:addChild(ContentBg)

--Create ContentErrorBg
local ContentErrorBg = cc.Sprite:createWithSpriteFrameName("01_06_PersonalCenter/frame_140.png")
ContentErrorBg:setName("ContentErrorBg")
ContentErrorBg:setTag(149)
ContentErrorBg:setCascadeColorEnabled(true)
ContentErrorBg:setCascadeOpacityEnabled(true)
ContentErrorBg:setAnchorPoint(0.0000, 0.0000)
ContentErrorBg:setPosition(140.0000, 164.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ContentErrorBg)
layout:setSize({width = 450.0000, height = 256.0000})
layout:setLeftMargin(140.0000)
layout:setRightMargin(-590.0000)
layout:setTopMargin(-420.0000)
layout:setBottomMargin(164.0000)
ContentErrorBg:setBlendFunc({src = 1, dst = 771})
Content:addChild(ContentErrorBg)

--Create ContentTextField
local ContentTextField = ccui.TextField:create()
ContentTextField:ignoreContentAdaptWithSize(false)
tolua.cast(ContentTextField:getVirtualRenderer(), "cc.Label"):setLineBreakWithoutSpace(true)
ContentTextField:setFontName("font/Default.ttf")
ContentTextField:setFontSize(24)
ContentTextField:setPlaceHolder("")
ContentTextField:setString([[一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十]])
ContentTextField:setMaxLength(10)
ContentTextField:setLayoutComponentEnabled(true)
ContentTextField:setName("ContentTextField")
ContentTextField:setTag(275)
ContentTextField:setCascadeColorEnabled(true)
ContentTextField:setCascadeOpacityEnabled(true)
ContentTextField:setAnchorPoint(0.0000, 1.0000)
ContentTextField:setPosition(159.0000, 399.0001)
layout = ccui.LayoutComponent:bindLayoutComponent(ContentTextField)
layout:setSize({width = 411.0000, height = 216.0000})
layout:setLeftMargin(159.0000)
layout:setRightMargin(-570.0000)
layout:setTopMargin(-399.0001)
layout:setBottomMargin(183.0001)
Content:addChild(ContentTextField)

--Create Confirm
local Confirm=cc.Node:create()
Confirm:setName("Confirm")
Confirm:setTag(712)
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
ConfirmButton:setTitleFontSize(30)
ConfirmButton:setScale9Enabled(true)
ConfirmButton:setCapInsets({x = 15, y = 11, width = 178, height = 76})
ConfirmButton:setLayoutComponentEnabled(true)
ConfirmButton:setName("ConfirmButton")
ConfirmButton:setTag(713)
ConfirmButton:setCascadeColorEnabled(true)
ConfirmButton:setCascadeOpacityEnabled(true)
ConfirmButton:setPosition(239.9991, 96.9978)
layout = ccui.LayoutComponent:bindLayoutComponent(ConfirmButton)
layout:setSize({width = 208.0000, height = 98.0000})
layout:setLeftMargin(135.9991)
layout:setRightMargin(-343.9991)
layout:setTopMargin(-145.9978)
layout:setBottomMargin(47.9978)

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
ConfirmText_TT:setString([[确认]])
ConfirmText_TT:setTextHorizontalAlignment(1)
ConfirmText_TT:setTextVerticalAlignment(1)
ConfirmText_TT:enableShadow({r = 0, g = 0, b = 0, a = 255}, {width = 0, height = -1}, 0)
ConfirmText_TT:setLayoutComponentEnabled(true)
ConfirmText_TT:setName("ConfirmText_TT")
ConfirmText_TT:setTag(714)
ConfirmText_TT:setCascadeColorEnabled(true)
ConfirmText_TT:setCascadeOpacityEnabled(true)
ConfirmText_TT:setPosition(239.9999, 97.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ConfirmText_TT)
layout:setSize({width = 59.0000, height = 37.0000})
layout:setLeftMargin(210.4999)
layout:setRightMargin(-269.4999)
layout:setTopMargin(-115.5000)
layout:setBottomMargin(78.5000)
Confirm:addChild(ConfirmText_TT)

--Create Cancel
local Cancel=cc.Node:create()
Cancel:setName("Cancel")
Cancel:setTag(752)
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
CancelButton:setLayoutComponentEnabled(true)
CancelButton:setName("CancelButton")
CancelButton:setTag(754)
CancelButton:setCascadeColorEnabled(true)
CancelButton:setCascadeOpacityEnabled(true)
CancelButton:setPosition(490.0000, 97.0001)
layout = ccui.LayoutComponent:bindLayoutComponent(CancelButton)
layout:setSize({width = 208.0000, height = 98.0000})
layout:setLeftMargin(386.0000)
layout:setRightMargin(-594.0000)
layout:setTopMargin(-146.0001)
layout:setBottomMargin(48.0001)

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
CancelText_TT:setString([[取消]])
CancelText_TT:setTextHorizontalAlignment(1)
CancelText_TT:setTextVerticalAlignment(1)
CancelText_TT:enableShadow({r = 0, g = 0, b = 0, a = 255}, {width = 0, height = -1}, 0)
CancelText_TT:setLayoutComponentEnabled(true)
CancelText_TT:setName("CancelText_TT")
CancelText_TT:setTag(755)
CancelText_TT:setCascadeColorEnabled(true)
CancelText_TT:setCascadeOpacityEnabled(true)
CancelText_TT:setPosition(490.0000, 97.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(CancelText_TT)
layout:setSize({width = 59.0000, height = 37.0000})
layout:setLeftMargin(460.5000)
layout:setRightMargin(-519.5000)
layout:setTopMargin(-115.5000)
layout:setBottomMargin(78.5000)
Cancel:addChild(CancelText_TT)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result
