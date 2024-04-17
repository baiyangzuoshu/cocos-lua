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
Middle:setTag(557)
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

--Create bg_1
local bg_1 = cc.Sprite:createWithSpriteFrameName("01_16_NoviceGuidance/picture_108.png")
bg_1:setName("bg_1")
bg_1:setTag(585)
bg_1:setCascadeColorEnabled(true)
bg_1:setCascadeOpacityEnabled(true)
bg_1:setPosition(0.0000, 50.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(bg_1)
layout:setSize({width = 720.0000, height = 542.0000})
layout:setLeftMargin(-360.0000)
layout:setRightMargin(-360.0000)
layout:setTopMargin(-321.0000)
layout:setBottomMargin(-221.0000)
bg_1:setBlendFunc({src = 1, dst = 771})
Middle:addChild(bg_1)

--Create BigPrizeSprite_1_SVT
local BigPrizeSprite_1_SVT = cc.Sprite:createWithSpriteFrameName("01_16_NoviceGuidance/picture_112_zh_CN.png")
BigPrizeSprite_1_SVT:setName("BigPrizeSprite_1_SVT")
BigPrizeSprite_1_SVT:setTag(586)
BigPrizeSprite_1_SVT:setCascadeColorEnabled(true)
BigPrizeSprite_1_SVT:setCascadeOpacityEnabled(true)
BigPrizeSprite_1_SVT:setPosition(0.0000, 200.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(BigPrizeSprite_1_SVT)
layout:setSize({width = 476.0000, height = 140.0000})
layout:setLeftMargin(-238.0000)
layout:setRightMargin(-238.0000)
layout:setTopMargin(-270.0000)
layout:setBottomMargin(130.0000)
BigPrizeSprite_1_SVT:setBlendFunc({src = 1, dst = 771})
Middle:addChild(BigPrizeSprite_1_SVT)

--Create BigPrizeSprite_2_SVT
local BigPrizeSprite_2_SVT = cc.Sprite:createWithSpriteFrameName("01_16_NoviceGuidance/picture_109_zh_CN.png")
BigPrizeSprite_2_SVT:setName("BigPrizeSprite_2_SVT")
BigPrizeSprite_2_SVT:setTag(587)
BigPrizeSprite_2_SVT:setCascadeColorEnabled(true)
BigPrizeSprite_2_SVT:setCascadeOpacityEnabled(true)
BigPrizeSprite_2_SVT:setPosition(0.0000, -115.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(BigPrizeSprite_2_SVT)
layout:setSize({width = 632.0000, height = 94.0000})
layout:setLeftMargin(-316.0000)
layout:setRightMargin(-316.0000)
layout:setTopMargin(68.0000)
layout:setBottomMargin(-162.0000)
BigPrizeSprite_2_SVT:setBlendFunc({src = 1, dst = 771})
Middle:addChild(BigPrizeSprite_2_SVT)

--Create BigPrizeButton

local luaScript = require("csd.LuaScript.newButton")
local BigPrizeButton = luaScript.CreateCustomNode()
BigPrizeButton:ignoreContentAdaptWithSize(false)
BigPrizeButton:loadTextureNormal("01_16_NoviceGuidance/button_102.png", 1)
BigPrizeButton:loadTexturePressed("01_16_NoviceGuidance/button_102.png", 1)
BigPrizeButton:loadTextureDisabled("01_16_NoviceGuidance/button_102.png", 1)
BigPrizeButton:setTitleFontSize(14)
BigPrizeButton:setLayoutComponentEnabled(true)
BigPrizeButton:setName("BigPrizeButton")
BigPrizeButton:setTag(589)
BigPrizeButton:setCascadeColorEnabled(true)
BigPrizeButton:setCascadeOpacityEnabled(true)
BigPrizeButton:setPosition(0.0000, -240.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(BigPrizeButton)
layout:setSize({width = 264.0000, height = 100.0000})
layout:setLeftMargin(-132.0000)
layout:setRightMargin(-132.0000)
layout:setTopMargin(190.0000)
layout:setBottomMargin(-290.0000)

luaScript.SetDownScele(BigPrizeButton, "0.9800")
luaScript.SetClickEffect(BigPrizeButton, "")
luaScript.SetDownColor(BigPrizeButton, {r = 65, g = 65, b = 70})
Middle:addChild(BigPrizeButton)

--Create BigPrizeButtonText
local BigPrizeButtonText = ccui.Text:create()
BigPrizeButtonText:ignoreContentAdaptWithSize(true)
BigPrizeButtonText:setTextAreaSize({width = 0, height = 0})
BigPrizeButtonText:setFontName("font/Font001.ttf")
BigPrizeButtonText:setFontSize(34)
BigPrizeButtonText:setString([[GO]])
BigPrizeButtonText:enableShadow({r = 82, g = 156, b = 50, a = 255}, {width = 0, height = -2}, 0)
BigPrizeButtonText:enableOutline({r = 116, g = 203, b = 69, a = 255}, 1)
BigPrizeButtonText:setLayoutComponentEnabled(true)
BigPrizeButtonText:setName("BigPrizeButtonText")
BigPrizeButtonText:setTag(590)
BigPrizeButtonText:setCascadeColorEnabled(true)
BigPrizeButtonText:setCascadeOpacityEnabled(true)
BigPrizeButtonText:setPosition(132.0000, 58.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(BigPrizeButtonText)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5800)
layout:setPercentWidth(0.2159)
layout:setPercentHeight(0.4700)
layout:setSize({width = 57.0000, height = 47.0000})
layout:setLeftMargin(103.5000)
layout:setRightMargin(103.5000)
layout:setTopMargin(18.5000)
layout:setBottomMargin(34.5000)
BigPrizeButton:addChild(BigPrizeButtonText)

--Create BigPrizeHintText_TT
local BigPrizeHintText_TT = ccui.Text:create()
BigPrizeHintText_TT:ignoreContentAdaptWithSize(true)
BigPrizeHintText_TT:setTextAreaSize({width = 0, height = 0})
BigPrizeHintText_TT:setFontName("font/Font001.ttf")
BigPrizeHintText_TT:setFontSize(24)
BigPrizeHintText_TT:setString([[完成后获得神秘大奖]])
BigPrizeHintText_TT:setLayoutComponentEnabled(true)
BigPrizeHintText_TT:setName("BigPrizeHintText_TT")
BigPrizeHintText_TT:setTag(591)
BigPrizeHintText_TT:setCascadeColorEnabled(true)
BigPrizeHintText_TT:setCascadeOpacityEnabled(true)
BigPrizeHintText_TT:setPosition(0.0000, -308.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(BigPrizeHintText_TT)
layout:setSize({width = 219.0000, height = 32.0000})
layout:setLeftMargin(-109.5000)
layout:setRightMargin(-109.5000)
layout:setTopMargin(292.0000)
layout:setBottomMargin(-324.0000)
Middle:addChild(BigPrizeHintText_TT)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

