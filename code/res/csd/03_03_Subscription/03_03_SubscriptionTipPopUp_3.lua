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
Bg_1:loadTexture("01_06_PersonalCenter/frame_038.png", 1)
Bg_1:setScale9Enabled(true)
Bg_1:setCapInsets({x = 17, y = 88, width = 16, height = 152})
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
TitleText_TT:setString([[确认升级会员]])
TitleText_TT:setTextHorizontalAlignment(1)
TitleText_TT:setTextVerticalAlignment(1)
TitleText_TT:enableShadow({r = 34, g = 31, b = 86, a = 255}, {width = 0, height = -2}, 0)
TitleText_TT:setLayoutComponentEnabled(true)
TitleText_TT:setName("TitleText_TT")
TitleText_TT:setTag(104)
TitleText_TT:setCascadeColorEnabled(true)
TitleText_TT:setCascadeOpacityEnabled(true)
TitleText_TT:setPosition(359.0000, 379.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(TitleText_TT)
layout:setSize({width = 195.0000, height = 42.0000})
layout:setLeftMargin(261.5000)
layout:setRightMargin(-456.5000)
layout:setTopMargin(-400.0000)
layout:setBottomMargin(358.0000)
Middle:addChild(TitleText_TT)

--Create ContentText_1_TT
local ContentText_1_TT = ccui.Text:create()
ContentText_1_TT:ignoreContentAdaptWithSize(false)
ContentText_1_TT:setFontName("font/Default.ttf")
ContentText_1_TT:setFontSize(32)
ContentText_1_TT:setString([[升级后即可享受更多权益，每月会自动续费会员，之前订阅的会员将按剩余比例退还给您钻石]])
ContentText_1_TT:setTextHorizontalAlignment(1)
ContentText_1_TT:setTextVerticalAlignment(1)
ContentText_1_TT:setLayoutComponentEnabled(true)
ContentText_1_TT:setName("ContentText_1_TT")
ContentText_1_TT:setTag(254)
ContentText_1_TT:setCascadeColorEnabled(true)
ContentText_1_TT:setCascadeOpacityEnabled(true)
ContentText_1_TT:setPosition(359.0000, 250.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ContentText_1_TT)
layout:setSize({width = 600.0000, height = 150.0000})
layout:setLeftMargin(59.0000)
layout:setRightMargin(-659.0000)
layout:setTopMargin(-325.0000)
layout:setBottomMargin(175.0000)
Middle:addChild(ContentText_1_TT)

--Create Confirm
local Confirm=cc.Node:create()
Confirm:setName("Confirm")
Confirm:setTag(255)
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
ConfirmText_TT:setString([[确认升级]])
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
layout:setPercentWidth(0.5529)
layout:setPercentHeight(0.3776)
layout:setSize({width = 115.0000, height = 37.0000})
layout:setLeftMargin(46.5000)
layout:setRightMargin(46.5000)
layout:setTopMargin(30.5000)
layout:setBottomMargin(30.5000)
ConfirmButton:addChild(ConfirmText_TT)

--Create Cancel
local Cancel=cc.Node:create()
Cancel:setName("Cancel")
Cancel:setTag(1189)
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
CancelText_TT:setString([[取消]])
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
layout:setPercentWidth(0.2837)
layout:setPercentHeight(0.3776)
layout:setSize({width = 59.0000, height = 37.0000})
layout:setLeftMargin(74.5000)
layout:setRightMargin(74.5000)
layout:setTopMargin(30.5000)
layout:setBottomMargin(30.5000)
CancelButton:addChild(CancelText_TT)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

