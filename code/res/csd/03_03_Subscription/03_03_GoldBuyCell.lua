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
"ui/03_03_Subscription/03_03_Subscription_1.plist",	
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
layout:setSize({width = 536.0000, height = 400.0000})

--Create GoldBuyNode
local GoldBuyNode=cc.Node:create()
GoldBuyNode:setName("GoldBuyNode")
GoldBuyNode:setTag(153)
GoldBuyNode:setCascadeColorEnabled(true)
GoldBuyNode:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(GoldBuyNode)
layout:setRightMargin(536.0000)
layout:setTopMargin(400.0000)
Layer:addChild(GoldBuyNode)

--Create GoldBuyBg
local GoldBuyBg = ccui.ImageView:create()
GoldBuyBg:ignoreContentAdaptWithSize(false)
GoldBuyBg:loadTexture("03_03_Subscription/frame_222.png", 1)
GoldBuyBg:setLayoutComponentEnabled(true)
GoldBuyBg:setName("GoldBuyBg")
GoldBuyBg:setTag(154)
GoldBuyBg:setCascadeColorEnabled(true)
GoldBuyBg:setCascadeOpacityEnabled(true)
GoldBuyBg:setPosition(268.0000, 150.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(GoldBuyBg)
layout:setSize({width = 536.0000, height = 300.0000})
layout:setRightMargin(-536.0000)
layout:setTopMargin(-300.0000)
GoldBuyNode:addChild(GoldBuyBg)

--Create GoldBuyImage
local GoldBuyImage = ccui.ImageView:create()
GoldBuyImage:ignoreContentAdaptWithSize(false)
GoldBuyImage:loadTexture("03_03_Subscription/icon_143.png", 1)
GoldBuyImage:setLayoutComponentEnabled(true)
GoldBuyImage:setName("GoldBuyImage")
GoldBuyImage:setTag(155)
GoldBuyImage:setCascadeColorEnabled(true)
GoldBuyImage:setCascadeOpacityEnabled(true)
GoldBuyImage:setPosition(268.0000, 300.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(GoldBuyImage)
layout:setSize({width = 250.0000, height = 204.0000})
layout:setLeftMargin(143.0000)
layout:setRightMargin(-393.0000)
layout:setTopMargin(-402.0000)
layout:setBottomMargin(198.0000)
GoldBuyNode:addChild(GoldBuyImage)

--Create GoldBuyText_TT
local GoldBuyText_TT = ccui.Text:create()
GoldBuyText_TT:ignoreContentAdaptWithSize(true)
GoldBuyText_TT:setTextAreaSize({width = 0, height = 0})
GoldBuyText_TT:setFontName("font/Font001.ttf")
GoldBuyText_TT:setFontSize(45)
GoldBuyText_TT:setString([[恭喜您成为黄金会员]])
GoldBuyText_TT:enableShadow({r = 89, g = 43, b = 112, a = 255}, {width = 0, height = -3}, 0)
GoldBuyText_TT:setLayoutComponentEnabled(true)
GoldBuyText_TT:setName("GoldBuyText_TT")
GoldBuyText_TT:setTag(156)
GoldBuyText_TT:setCascadeColorEnabled(true)
GoldBuyText_TT:setCascadeOpacityEnabled(true)
GoldBuyText_TT:setPosition(268.0000, 184.0000)
GoldBuyText_TT:setTextColor({r = 255, g = 241, b = 149})
layout = ccui.LayoutComponent:bindLayoutComponent(GoldBuyText_TT)
layout:setSize({width = 407.0000, height = 59.0000})
layout:setLeftMargin(64.5000)
layout:setRightMargin(-471.5000)
layout:setTopMargin(-213.5000)
layout:setBottomMargin(154.5000)
GoldBuyNode:addChild(GoldBuyText_TT)

--Create GoldBuyIndate
local GoldBuyIndate = ccui.Text:create()
GoldBuyIndate:ignoreContentAdaptWithSize(true)
GoldBuyIndate:setTextAreaSize({width = 0, height = 0})
GoldBuyIndate:setFontName("font/Default.ttf")
GoldBuyIndate:setFontSize(28)
GoldBuyIndate:setString([[会员有效期至 2099-12-30]])
GoldBuyIndate:enableShadow({r = 0, g = 0, b = 0, a = 255}, {width = 0, height = -1}, 0)
GoldBuyIndate:setLayoutComponentEnabled(true)
GoldBuyIndate:setName("GoldBuyIndate")
GoldBuyIndate:setTag(157)
GoldBuyIndate:setCascadeColorEnabled(true)
GoldBuyIndate:setCascadeOpacityEnabled(true)
GoldBuyIndate:setPosition(268.0000, 102.0000)
GoldBuyIndate:setTextColor({r = 254, g = 250, b = 255})
layout = ccui.LayoutComponent:bindLayoutComponent(GoldBuyIndate)
layout:setSize({width = 330.0000, height = 37.0000})
layout:setLeftMargin(103.0000)
layout:setRightMargin(-433.0000)
layout:setTopMargin(-120.5000)
layout:setBottomMargin(83.5000)
GoldBuyNode:addChild(GoldBuyIndate)

--Create GoldBuyButton

local luaScript = require("csd.LuaScript.newButton")
local GoldBuyButton = luaScript.CreateCustomNode()
GoldBuyButton:ignoreContentAdaptWithSize(false)
GoldBuyButton:loadTextureNormal("03_03_Subscription/button_107.png", 1)
GoldBuyButton:loadTexturePressed("03_03_Subscription/button_107.png", 1)
GoldBuyButton:loadTextureDisabled("03_03_Subscription/button_107.png", 1)
GoldBuyButton:setTitleFontSize(14)
GoldBuyButton:setLayoutComponentEnabled(true)
GoldBuyButton:setName("GoldBuyButton")
GoldBuyButton:setTag(158)
GoldBuyButton:setCascadeColorEnabled(true)
GoldBuyButton:setCascadeOpacityEnabled(true)
GoldBuyButton:setPosition(268.0000, 8.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(GoldBuyButton)
layout:setSize({width = 242.0000, height = 98.0000})
layout:setLeftMargin(147.0000)
layout:setRightMargin(-389.0000)
layout:setTopMargin(-57.0000)
layout:setBottomMargin(-41.0000)

luaScript.SetDownScele(GoldBuyButton, "0.9800")
luaScript.SetClickEffect(GoldBuyButton, "")
luaScript.SetDownColor(GoldBuyButton, {r = 65, g = 65, b = 70})
GoldBuyNode:addChild(GoldBuyButton)

--Create GoldBuyButtonText_TT
local GoldBuyButtonText_TT = ccui.Text:create()
GoldBuyButtonText_TT:ignoreContentAdaptWithSize(true)
GoldBuyButtonText_TT:setTextAreaSize({width = 0, height = 0})
GoldBuyButtonText_TT:setFontName("font/Font001.ttf")
GoldBuyButtonText_TT:setFontSize(33)
GoldBuyButtonText_TT:setString([[我知道了]])
GoldBuyButtonText_TT:enableShadow({r = 255, g = 255, b = 255, a = 255}, {width = 0, height = -1}, 0)
GoldBuyButtonText_TT:setLayoutComponentEnabled(true)
GoldBuyButtonText_TT:setName("GoldBuyButtonText_TT")
GoldBuyButtonText_TT:setTag(159)
GoldBuyButtonText_TT:setCascadeColorEnabled(true)
GoldBuyButtonText_TT:setCascadeOpacityEnabled(true)
GoldBuyButtonText_TT:setPosition(121.0000, 55.0000)
GoldBuyButtonText_TT:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(GoldBuyButtonText_TT)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5612)
layout:setPercentWidth(0.5537)
layout:setPercentHeight(0.4490)
layout:setSize({width = 134.0000, height = 44.0000})
layout:setLeftMargin(54.0000)
layout:setRightMargin(54.0000)
layout:setTopMargin(21.0000)
layout:setBottomMargin(33.0000)
GoldBuyButton:addChild(GoldBuyButtonText_TT)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result
