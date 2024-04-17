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
"ui/03_08_NewWelfare/03_08_NewWelfare_1.plist",	
"ui/01_16_NoviceGuidance/01_16_NoviceGuidance_1.plist",	
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
Middle:setTag(559)
Middle:setCascadeColorEnabled(true)
Middle:setCascadeOpacityEnabled(true)
Middle:setPosition(360.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Middle)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setLeftMargin(360.0000)
layout:setRightMargin(360.0000)
layout:setTopMargin(640.0000)
layout:setBottomMargin(640.0000)
Layer:addChild(Middle)

--Create Bg_1
local Bg_1 = ccui.ImageView:create()
Bg_1:ignoreContentAdaptWithSize(false)
Bg_1:loadTexture("03_08_NewWelfare/frame_100.png", 1)
Bg_1:setScale9Enabled(true)
Bg_1:setCapInsets({x = 170, y = 64, width = 176, height = 68})
Bg_1:setLayoutComponentEnabled(true)
Bg_1:setName("Bg_1")
Bg_1:setTag(69)
Bg_1:setCascadeColorEnabled(true)
Bg_1:setCascadeOpacityEnabled(true)
Bg_1:setPosition(0.0000, -80.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Bg_1)
layout:setSize({width = 516.0000, height = 196.0000})
layout:setLeftMargin(-258.0000)
layout:setRightMargin(-258.0000)
layout:setTopMargin(-18.0000)
layout:setBottomMargin(-178.0000)
Middle:addChild(Bg_1)

--Create WinAwardSprite_1
local WinAwardSprite_1 = cc.Sprite:createWithSpriteFrameName("01_16_NoviceGuidance/picture_106.png")
WinAwardSprite_1:setName("WinAwardSprite_1")
WinAwardSprite_1:setTag(585)
WinAwardSprite_1:setCascadeColorEnabled(true)
WinAwardSprite_1:setCascadeOpacityEnabled(true)
WinAwardSprite_1:setPosition(0.0000, 145.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(WinAwardSprite_1)
layout:setSize({width = 720.0000, height = 542.0000})
layout:setLeftMargin(-360.0000)
layout:setRightMargin(-360.0000)
layout:setTopMargin(-416.0000)
layout:setBottomMargin(-126.0000)
WinAwardSprite_1:setBlendFunc({src = 1, dst = 771})
Middle:addChild(WinAwardSprite_1)

--Create WinAwardSprite_2_SVT
local WinAwardSprite_2_SVT = cc.Sprite:createWithSpriteFrameName("01_16_NoviceGuidance/picture_107_zh_CN.png")
WinAwardSprite_2_SVT:setName("WinAwardSprite_2_SVT")
WinAwardSprite_2_SVT:setTag(586)
WinAwardSprite_2_SVT:setCascadeColorEnabled(true)
WinAwardSprite_2_SVT:setCascadeOpacityEnabled(true)
WinAwardSprite_2_SVT:setPosition(0.0000, 22.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(WinAwardSprite_2_SVT)
layout:setSize({width = 586.0000, height = 154.0000})
layout:setLeftMargin(-293.0000)
layout:setRightMargin(-293.0000)
layout:setTopMargin(-99.0000)
layout:setBottomMargin(-55.0000)
WinAwardSprite_2_SVT:setBlendFunc({src = 1, dst = 771})
Middle:addChild(WinAwardSprite_2_SVT)

--Create AwardContentNode
local AwardContentNode=cc.Node:create()
AwardContentNode:setName("AwardContentNode")
AwardContentNode:setTag(96)
AwardContentNode:setCascadeColorEnabled(true)
AwardContentNode:setCascadeOpacityEnabled(true)
AwardContentNode:setPosition(-360.0000, -640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(AwardContentNode)
layout:setLeftMargin(-360.0000)
layout:setRightMargin(360.0000)
layout:setTopMargin(640.0000)
layout:setBottomMargin(-640.0000)
Middle:addChild(AwardContentNode)

--Create AwardContentPanel
local AwardContentPanel = ccui.Layout:create()
AwardContentPanel:ignoreContentAdaptWithSize(false)
AwardContentPanel:setClippingEnabled(false)
AwardContentPanel:setBackGroundColorOpacity(102)
AwardContentPanel:setLayoutComponentEnabled(true)
AwardContentPanel:setName("AwardContentPanel")
AwardContentPanel:setTag(98)
AwardContentPanel:setCascadeColorEnabled(true)
AwardContentPanel:setCascadeOpacityEnabled(true)
AwardContentPanel:setAnchorPoint(0.5000, 0.5000)
AwardContentPanel:setPosition(360.0000, 522.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(AwardContentPanel)
layout:setSize({width = 467.0000, height = 120.0000})
layout:setLeftMargin(126.5000)
layout:setRightMargin(-593.5000)
layout:setTopMargin(-582.0000)
layout:setBottomMargin(462.0000)
AwardContentNode:addChild(AwardContentPanel)

--Create GetButton

local luaScript = require("csd.LuaScript.newButton")
local GetButton = luaScript.CreateCustomNode()
GetButton:ignoreContentAdaptWithSize(false)
GetButton:loadTextureNormal("01_16_NoviceGuidance/button_102.png", 1)
GetButton:loadTexturePressed("01_16_NoviceGuidance/button_102.png", 1)
GetButton:loadTextureDisabled("01_16_NoviceGuidance/button_102.png", 1)
GetButton:setTitleFontSize(14)
GetButton:setLayoutComponentEnabled(true)
GetButton:setName("GetButton")
GetButton:setTag(589)
GetButton:setCascadeColorEnabled(true)
GetButton:setCascadeOpacityEnabled(true)
GetButton:setPosition(0.0000, -260.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(GetButton)
layout:setSize({width = 264.0000, height = 100.0000})
layout:setLeftMargin(-132.0000)
layout:setRightMargin(-132.0000)
layout:setTopMargin(210.0000)
layout:setBottomMargin(-310.0000)

luaScript.SetDownScele(GetButton, "0.9800")
luaScript.SetClickEffect(GetButton, "")
luaScript.SetDownColor(GetButton, {r = 65, g = 65, b = 70})
Middle:addChild(GetButton)

--Create GetText_TT
local GetText_TT = ccui.Text:create()
GetText_TT:ignoreContentAdaptWithSize(true)
GetText_TT:setTextAreaSize({width = 0, height = 0})
GetText_TT:setFontName("font/Font001.ttf")
GetText_TT:setFontSize(34)
GetText_TT:setString([[领取]])
GetText_TT:enableShadow({r = 82, g = 156, b = 50, a = 255}, {width = 0, height = -2}, 0)
GetText_TT:enableOutline({r = 116, g = 203, b = 69, a = 255}, 1)
GetText_TT:setLayoutComponentEnabled(true)
GetText_TT:setName("GetText_TT")
GetText_TT:setTag(590)
GetText_TT:setCascadeColorEnabled(true)
GetText_TT:setCascadeOpacityEnabled(true)
GetText_TT:setPosition(132.0000, 58.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(GetText_TT)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5800)
layout:setPercentWidth(0.2727)
layout:setPercentHeight(0.4700)
layout:setSize({width = 72.0000, height = 47.0000})
layout:setLeftMargin(96.0000)
layout:setRightMargin(96.0000)
layout:setTopMargin(18.5000)
layout:setBottomMargin(34.5000)
GetButton:addChild(GetText_TT)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result
