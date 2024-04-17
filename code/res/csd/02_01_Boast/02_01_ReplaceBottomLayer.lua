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
"ui/02_01_Boast/02_01_Boast_1.plist",	
"ui/02_01_Boast/02_01_Boast_2.plist",	
"ui/00_02_Default/00_02_Default_1.plist",	
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
layout:setSize({width = 720.0000, height = 284.0000})

--Create BelowLeftFit_3
local BelowLeftFit_3=cc.Node:create()
BelowLeftFit_3:setName("BelowLeftFit_3")
BelowLeftFit_3:setTag(61)
BelowLeftFit_3:setCascadeColorEnabled(true)
BelowLeftFit_3:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(BelowLeftFit_3)
layout:setRightMargin(720.0000)
layout:setTopMargin(284.0000)
Layer:addChild(BelowLeftFit_3)

--Create StakeGoldFrame
local StakeGoldFrame = ccui.ImageView:create()
StakeGoldFrame:ignoreContentAdaptWithSize(false)
StakeGoldFrame:loadTexture("02_01_Boast/frame_008.png", 1)
StakeGoldFrame:setScale9Enabled(true)
StakeGoldFrame:setCapInsets({x = 3, y = 93, width = 4, height = 98})
StakeGoldFrame:setLayoutComponentEnabled(true)
StakeGoldFrame:setName("StakeGoldFrame")
StakeGoldFrame:setTag(62)
StakeGoldFrame:setCascadeColorEnabled(true)
StakeGoldFrame:setCascadeOpacityEnabled(true)
StakeGoldFrame:setPosition(360.0000, 142.0000)
StakeGoldFrame:setOpacity(238)
layout = ccui.LayoutComponent:bindLayoutComponent(StakeGoldFrame)
layout:setSize({width = 720.0000, height = 284.0000})
layout:setRightMargin(-720.0000)
layout:setTopMargin(-284.0000)
BelowLeftFit_3:addChild(StakeGoldFrame)

--Create StakeGoldText_TT
local StakeGoldText_TT = ccui.Text:create()
StakeGoldText_TT:ignoreContentAdaptWithSize(true)
StakeGoldText_TT:setTextAreaSize({width = 0, height = 0})
StakeGoldText_TT:setFontName("font/Default.ttf")
StakeGoldText_TT:setFontSize(32)
StakeGoldText_TT:setString([[Raise the bet to]])
StakeGoldText_TT:setTextVerticalAlignment(1)
StakeGoldText_TT:setLayoutComponentEnabled(true)
StakeGoldText_TT:setName("StakeGoldText_TT")
StakeGoldText_TT:setTag(63)
StakeGoldText_TT:setCascadeColorEnabled(true)
StakeGoldText_TT:setCascadeOpacityEnabled(true)
StakeGoldText_TT:setAnchorPoint(1.0000, 0.5000)
StakeGoldText_TT:setPosition(418.0000, 196.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(StakeGoldText_TT)
layout:setSize({width = 241.0000, height = 42.0000})
layout:setLeftMargin(177.0000)
layout:setRightMargin(-418.0000)
layout:setTopMargin(-217.0000)
layout:setBottomMargin(175.0000)
BelowLeftFit_3:addChild(StakeGoldText_TT)

--Create StakeGoldIcon
local StakeGoldIcon = ccui.ImageView:create()
StakeGoldIcon:ignoreContentAdaptWithSize(false)
StakeGoldIcon:loadTexture("00_02_Default/2.png", 1)
StakeGoldIcon:setLayoutComponentEnabled(true)
StakeGoldIcon:setName("StakeGoldIcon")
StakeGoldIcon:setTag(64)
StakeGoldIcon:setCascadeColorEnabled(true)
StakeGoldIcon:setCascadeOpacityEnabled(true)
StakeGoldIcon:setPosition(443.9999, 195.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(StakeGoldIcon)
layout:setSize({width = 40.0000, height = 40.0000})
layout:setLeftMargin(423.9999)
layout:setRightMargin(-463.9999)
layout:setTopMargin(-215.0000)
layout:setBottomMargin(175.0000)
BelowLeftFit_3:addChild(StakeGoldIcon)

--Create StakeGoldText
local StakeGoldText = ccui.Text:create()
StakeGoldText:ignoreContentAdaptWithSize(true)
StakeGoldText:setTextAreaSize({width = 0, height = 0})
StakeGoldText:setFontName("font/Font003.ttf")
StakeGoldText:setFontSize(38)
StakeGoldText:setString([[1000]])
StakeGoldText:setTextVerticalAlignment(1)
StakeGoldText:setLayoutComponentEnabled(true)
StakeGoldText:setName("StakeGoldText")
StakeGoldText:setTag(65)
StakeGoldText:setCascadeColorEnabled(true)
StakeGoldText:setCascadeOpacityEnabled(true)
StakeGoldText:setAnchorPoint(0.0000, 0.5000)
StakeGoldText:setPosition(460.0000, 196.0000)
StakeGoldText:setTextColor({r = 255, g = 238, b = 104})
layout = ccui.LayoutComponent:bindLayoutComponent(StakeGoldText)
layout:setSize({width = 74.0000, height = 44.0000})
layout:setLeftMargin(460.0000)
layout:setRightMargin(-534.0000)
layout:setTopMargin(-218.0000)
layout:setBottomMargin(174.0000)
BelowLeftFit_3:addChild(StakeGoldText)

--Create StakeGoldButton

local luaScript = require("csd.LuaScript.newButton")
local StakeGoldButton = luaScript.CreateCustomNode()
StakeGoldButton:ignoreContentAdaptWithSize(false)
StakeGoldButton:loadTextureNormal("02_01_Boast/button_008.png", 1)
StakeGoldButton:loadTexturePressed("02_01_Boast/button_008.png", 1)
StakeGoldButton:loadTextureDisabled("02_01_Boast/button_008.png", 1)
StakeGoldButton:setTitleFontSize(14)
StakeGoldButton:setLayoutComponentEnabled(true)
StakeGoldButton:setName("StakeGoldButton")
StakeGoldButton:setTag(67)
StakeGoldButton:setCascadeColorEnabled(true)
StakeGoldButton:setCascadeOpacityEnabled(true)
StakeGoldButton:setPosition(238.0000, 94.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(StakeGoldButton)
layout:setSize({width = 208.0000, height = 92.0000})
layout:setLeftMargin(134.0000)
layout:setRightMargin(-342.0000)
layout:setTopMargin(-140.0000)
layout:setBottomMargin(48.0000)

luaScript.SetDownScele(StakeGoldButton, "0.9800")
luaScript.SetClickEffect(StakeGoldButton, "Sound004")
luaScript.SetDownColor(StakeGoldButton, {r = 65, g = 65, b = 70})
BelowLeftFit_3:addChild(StakeGoldButton)

--Create StakeGoldButtonText_TT
local StakeGoldButtonText_TT = ccui.Text:create()
StakeGoldButtonText_TT:ignoreContentAdaptWithSize(true)
StakeGoldButtonText_TT:setTextAreaSize({width = 0, height = 0})
StakeGoldButtonText_TT:setFontName("font/Font001.ttf")
StakeGoldButtonText_TT:setFontSize(28)
StakeGoldButtonText_TT:setString([[再想一想]])
StakeGoldButtonText_TT:setTextHorizontalAlignment(1)
StakeGoldButtonText_TT:setTextVerticalAlignment(1)
StakeGoldButtonText_TT:enableShadow({r = 42, g = 42, b = 57, a = 255}, {width = 0, height = -1}, 0)
StakeGoldButtonText_TT:setLayoutComponentEnabled(true)
StakeGoldButtonText_TT:setName("StakeGoldButtonText_TT")
StakeGoldButtonText_TT:setTag(68)
StakeGoldButtonText_TT:setCascadeColorEnabled(true)
StakeGoldButtonText_TT:setCascadeOpacityEnabled(true)
StakeGoldButtonText_TT:setPosition(238.0000, 99.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(StakeGoldButtonText_TT)
layout:setSize({width = 115.0000, height = 37.0000})
layout:setLeftMargin(180.5000)
layout:setRightMargin(-295.5000)
layout:setTopMargin(-117.5000)
layout:setBottomMargin(80.5000)
BelowLeftFit_3:addChild(StakeGoldButtonText_TT)

--Create StakeGoldButton_1

local luaScript = require("csd.LuaScript.newButton")
local StakeGoldButton_1 = luaScript.CreateCustomNode()
StakeGoldButton_1:ignoreContentAdaptWithSize(false)
StakeGoldButton_1:loadTextureNormal("02_01_Boast/button_009.png", 1)
StakeGoldButton_1:loadTexturePressed("02_01_Boast/button_009.png", 1)
StakeGoldButton_1:loadTextureDisabled("02_01_Boast/button_009.png", 1)
StakeGoldButton_1:setTitleFontSize(14)
StakeGoldButton_1:setLayoutComponentEnabled(true)
StakeGoldButton_1:setName("StakeGoldButton_1")
StakeGoldButton_1:setTag(69)
StakeGoldButton_1:setCascadeColorEnabled(true)
StakeGoldButton_1:setCascadeOpacityEnabled(true)
StakeGoldButton_1:setPosition(473.0000, 94.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(StakeGoldButton_1)
layout:setSize({width = 206.0000, height = 92.0000})
layout:setLeftMargin(370.0000)
layout:setRightMargin(-576.0000)
layout:setTopMargin(-140.0000)
layout:setBottomMargin(48.0000)

luaScript.SetDownScele(StakeGoldButton_1, "0.9800")
luaScript.SetClickEffect(StakeGoldButton_1, "Sound004")
luaScript.SetDownColor(StakeGoldButton_1, {r = 65, g = 65, b = 70})
BelowLeftFit_3:addChild(StakeGoldButton_1)

--Create StakeGoldButtonText_1_TT
local StakeGoldButtonText_1_TT = ccui.Text:create()
StakeGoldButtonText_1_TT:ignoreContentAdaptWithSize(true)
StakeGoldButtonText_1_TT:setTextAreaSize({width = 0, height = 0})
StakeGoldButtonText_1_TT:setFontName("font/Font001.ttf")
StakeGoldButtonText_1_TT:setFontSize(28)
StakeGoldButtonText_1_TT:setString([[确认提升]])
StakeGoldButtonText_1_TT:setTextHorizontalAlignment(1)
StakeGoldButtonText_1_TT:setTextVerticalAlignment(1)
StakeGoldButtonText_1_TT:enableShadow({r = 42, g = 42, b = 57, a = 255}, {width = 0, height = -1}, 0)
StakeGoldButtonText_1_TT:setLayoutComponentEnabled(true)
StakeGoldButtonText_1_TT:setName("StakeGoldButtonText_1_TT")
StakeGoldButtonText_1_TT:setTag(70)
StakeGoldButtonText_1_TT:setCascadeColorEnabled(true)
StakeGoldButtonText_1_TT:setCascadeOpacityEnabled(true)
StakeGoldButtonText_1_TT:setPosition(473.0000, 99.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(StakeGoldButtonText_1_TT)
layout:setSize({width = 115.0000, height = 37.0000})
layout:setLeftMargin(415.5000)
layout:setRightMargin(-530.5000)
layout:setTopMargin(-117.5000)
layout:setBottomMargin(80.5000)
BelowLeftFit_3:addChild(StakeGoldButtonText_1_TT)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

