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
"ui/01_07_Sitting/01_07_Sitting_1.plist",	
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
layout:setSize({width = 720.0000, height = 1000.0000})

--Create SignOutAgreement
local SignOutAgreement=cc.Node:create()
SignOutAgreement:setName("SignOutAgreement")
SignOutAgreement:setTag(866)
SignOutAgreement:setCascadeColorEnabled(true)
SignOutAgreement:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(SignOutAgreement)
layout:setRightMargin(720.0000)
layout:setTopMargin(1000.0000)
Layer:addChild(SignOutAgreement)

--Create Bg_1
local Bg_1 = ccui.ImageView:create()
Bg_1:ignoreContentAdaptWithSize(false)
Bg_1:loadTexture("01_06_PersonalCenter/frame_034.png", 1)
Bg_1:setScale9Enabled(true)
Bg_1:setCapInsets({x = 17, y = 138, width = 20, height = 144})
Bg_1:setLayoutComponentEnabled(true)
Bg_1:setName("Bg_1")
Bg_1:setTag(692)
Bg_1:setCascadeColorEnabled(true)
Bg_1:setCascadeOpacityEnabled(true)
Bg_1:setAnchorPoint(0.5000, 0.0000)
Bg_1:setPosition(360.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Bg_1)
layout:setSize({width = 718.0000, height = 1000.0000})
layout:setLeftMargin(1.0000)
layout:setRightMargin(-719.0000)
layout:setTopMargin(-1000.0000)
SignOutAgreement:addChild(Bg_1)

--Create TitleText_TT
local TitleText_TT = ccui.Text:create()
TitleText_TT:ignoreContentAdaptWithSize(true)
TitleText_TT:setTextAreaSize({width = 0, height = 0})
TitleText_TT:setFontName("font/Font001.ttf")
TitleText_TT:setFontSize(32)
TitleText_TT:setString([[游戏账号注销协议]])
TitleText_TT:setTextHorizontalAlignment(1)
TitleText_TT:setTextVerticalAlignment(1)
TitleText_TT:enableShadow({r = 0, g = 0, b = 0, a = 255}, {width = 2, height = -2}, 0)
TitleText_TT:setLayoutComponentEnabled(true)
TitleText_TT:setName("TitleText_TT")
TitleText_TT:setTag(749)
TitleText_TT:setCascadeColorEnabled(true)
TitleText_TT:setCascadeOpacityEnabled(true)
TitleText_TT:setPosition(360.0000, 964.9999)
layout = ccui.LayoutComponent:bindLayoutComponent(TitleText_TT)
layout:setSize({width = 259.0000, height = 42.0000})
layout:setLeftMargin(230.5000)
layout:setRightMargin(-489.5000)
layout:setTopMargin(-985.9999)
layout:setBottomMargin(943.9999)
SignOutAgreement:addChild(TitleText_TT)

--Create AgreementBg
local AgreementBg = ccui.ImageView:create()
AgreementBg:ignoreContentAdaptWithSize(false)
AgreementBg:loadTexture("01_07_Sitting/frame_027.png", 1)
AgreementBg:setScale9Enabled(true)
AgreementBg:setCapInsets({x = 20, y = 20, width = 22, height = 22})
AgreementBg:setLayoutComponentEnabled(true)
AgreementBg:setName("AgreementBg")
AgreementBg:setTag(853)
AgreementBg:setCascadeColorEnabled(true)
AgreementBg:setCascadeOpacityEnabled(true)
AgreementBg:setPosition(360.0000, 547.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(AgreementBg)
layout:setSize({width = 658.0000, height = 715.0000})
layout:setLeftMargin(31.0000)
layout:setRightMargin(-689.0000)
layout:setTopMargin(-905.0000)
layout:setBottomMargin(190.0000)
SignOutAgreement:addChild(AgreementBg)

--Create AgreementListView
local AgreementListView = ccui.ListView:create()
AgreementListView:setDirection(1)
AgreementListView:setGravity(0)
AgreementListView:ignoreContentAdaptWithSize(false)
AgreementListView:setClippingEnabled(true)
AgreementListView:setBackGroundColorOpacity(102)
AgreementListView:setLayoutComponentEnabled(true)
AgreementListView:setName("AgreementListView")
AgreementListView:setTag(739)
AgreementListView:setCascadeColorEnabled(true)
AgreementListView:setCascadeOpacityEnabled(true)
AgreementListView:setAnchorPoint(0.5000, 0.5000)
AgreementListView:setPosition(360.0000, 547.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(AgreementListView)
layout:setSize({width = 610.0000, height = 695.0000})
layout:setLeftMargin(55.0000)
layout:setRightMargin(-665.0000)
layout:setTopMargin(-895.0000)
layout:setBottomMargin(200.0000)
SignOutAgreement:addChild(AgreementListView)

--Create AgreeTipText_TT
local AgreeTipText_TT = ccui.Text:create()
AgreeTipText_TT:ignoreContentAdaptWithSize(true)
AgreeTipText_TT:setTextAreaSize({width = 0, height = 0})
AgreeTipText_TT:setFontName("font/Default.ttf")
AgreeTipText_TT:setFontSize(24)
AgreeTipText_TT:setString([[阅读完全部协议后，可点击同意按钮]])
AgreeTipText_TT:setTextVerticalAlignment(1)
AgreeTipText_TT:setLayoutComponentEnabled(true)
AgreeTipText_TT:setName("AgreeTipText_TT")
AgreeTipText_TT:setTag(602)
AgreeTipText_TT:setCascadeColorEnabled(true)
AgreeTipText_TT:setCascadeOpacityEnabled(true)
AgreeTipText_TT:setAnchorPoint(0.0000, 0.5000)
AgreeTipText_TT:setPosition(29.9995, 157.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(AgreeTipText_TT)
layout:setSize({width = 387.0000, height = 32.0000})
layout:setLeftMargin(29.9995)
layout:setRightMargin(-416.9995)
layout:setTopMargin(-173.0000)
layout:setBottomMargin(141.0000)
SignOutAgreement:addChild(AgreeTipText_TT)

--Create ConfirmButton

local luaScript = require("csd.LuaScript.newButton")
local ConfirmButton = luaScript.CreateCustomNode()
ConfirmButton:ignoreContentAdaptWithSize(false)
ConfirmButton:loadTextureNormal("01_10_Mail/button_034.png", 1)
ConfirmButton:loadTexturePressed("01_10_Mail/button_034.png", 1)
ConfirmButton:loadTextureDisabled("01_10_Mail/button_034_1.png", 1)
ConfirmButton:setTitleFontSize(14)
ConfirmButton:setScale9Enabled(true)
ConfirmButton:setCapInsets({x = 15, y = 11, width = 178, height = 76})
ConfirmButton:setLayoutComponentEnabled(true)
ConfirmButton:setName("ConfirmButton")
ConfirmButton:setTag(688)
ConfirmButton:setCascadeColorEnabled(true)
ConfirmButton:setCascadeOpacityEnabled(true)
ConfirmButton:setPosition(215.0009, 80.0001)
layout = ccui.LayoutComponent:bindLayoutComponent(ConfirmButton)
layout:setSize({width = 208.0000, height = 98.0000})
layout:setLeftMargin(111.0009)
layout:setRightMargin(-319.0009)
layout:setTopMargin(-129.0001)
layout:setBottomMargin(31.0001)

luaScript.SetDownScele(ConfirmButton, "0.9800")
luaScript.SetClickEffect(ConfirmButton, "Sound004")
luaScript.SetDownColor(ConfirmButton, {r = 65, g = 65, b = 70})
SignOutAgreement:addChild(ConfirmButton)

--Create ConfirmText_TT
local ConfirmText_TT = ccui.Text:create()
ConfirmText_TT:ignoreContentAdaptWithSize(true)
ConfirmText_TT:setTextAreaSize({width = 0, height = 0})
ConfirmText_TT:setFontName("font/Font001.ttf")
ConfirmText_TT:setFontSize(28)
ConfirmText_TT:setString([[同意]])
ConfirmText_TT:setTextHorizontalAlignment(1)
ConfirmText_TT:setTextVerticalAlignment(1)
ConfirmText_TT:enableShadow({r = 0, g = 0, b = 0, a = 255}, {width = 0, height = -1}, 0)
ConfirmText_TT:setLayoutComponentEnabled(true)
ConfirmText_TT:setName("ConfirmText_TT")
ConfirmText_TT:setTag(689)
ConfirmText_TT:setCascadeColorEnabled(true)
ConfirmText_TT:setCascadeOpacityEnabled(true)
ConfirmText_TT:setPosition(104.0000, 49.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ConfirmText_TT)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.2837)
layout:setPercentHeight(0.3776)
layout:setSize({width = 59.0000, height = 37.0000})
layout:setLeftMargin(74.5000)
layout:setRightMargin(74.5000)
layout:setTopMargin(30.5000)
layout:setBottomMargin(30.5000)
ConfirmButton:addChild(ConfirmText_TT)

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
CancelButton:setTag(686)
CancelButton:setCascadeColorEnabled(true)
CancelButton:setCascadeOpacityEnabled(true)
CancelButton:setPosition(506.0000, 80.0001)
layout = ccui.LayoutComponent:bindLayoutComponent(CancelButton)
layout:setSize({width = 208.0000, height = 98.0000})
layout:setLeftMargin(402.0000)
layout:setRightMargin(-610.0000)
layout:setTopMargin(-129.0001)
layout:setBottomMargin(31.0001)

luaScript.SetDownScele(CancelButton, "0.9800")
luaScript.SetClickEffect(CancelButton, "Sound004")
luaScript.SetDownColor(CancelButton, {r = 65, g = 65, b = 70})
SignOutAgreement:addChild(CancelButton)

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
CancelText_TT:setTag(687)
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
