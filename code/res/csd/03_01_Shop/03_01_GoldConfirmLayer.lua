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
layout:setSize({width = 720.0000, height = 372.0000})

--Create UpLeftFit
local UpLeftFit=cc.Node:create()
UpLeftFit:setName("UpLeftFit")
UpLeftFit:setTag(393)
UpLeftFit:setCascadeColorEnabled(true)
UpLeftFit:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(UpLeftFit)
layout:setRightMargin(720.0000)
layout:setTopMargin(372.0000)
Layer:addChild(UpLeftFit)

--Create Bg
local Bg = ccui.ImageView:create()
Bg:ignoreContentAdaptWithSize(false)
Bg:loadTexture("01_06_PersonalCenter/frame_038.png", 1)
Bg:setScale9Enabled(true)
Bg:setCapInsets({x = 16, y = 124, width = 18, height = 130})
Bg:setLayoutComponentEnabled(true)
Bg:setName("Bg")
Bg:setTag(394)
Bg:setCascadeColorEnabled(true)
Bg:setCascadeOpacityEnabled(true)
Bg:setPosition(365.0000, 186.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Bg)
layout:setSize({width = 600.0000, height = 372.0000})
layout:setLeftMargin(65.0000)
layout:setRightMargin(-665.0000)
layout:setTopMargin(-372.0000)
UpLeftFit:addChild(Bg)

--Create Confirm
local Confirm=cc.Node:create()
Confirm:setName("Confirm")
Confirm:setTag(443)
Confirm:setCascadeColorEnabled(true)
Confirm:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Confirm)
UpLeftFit:addChild(Confirm)

--Create ConfirmButton

local luaScript = require("csd.LuaScript.newButton")
local ConfirmButton = luaScript.CreateCustomNode()
ConfirmButton:ignoreContentAdaptWithSize(false)
ConfirmButton:loadTextureNormal("01_07_Sitting/button_022.png", 1)
ConfirmButton:loadTexturePressed("01_07_Sitting/button_022.png", 1)
ConfirmButton:loadTextureDisabled("01_07_Sitting/button_022.png", 1)
ConfirmButton:setTitleFontSize(14)
ConfirmButton:setScale9Enabled(true)
ConfirmButton:setCapInsets({x = 15, y = 11, width = 260, height = 70})
ConfirmButton:setLayoutComponentEnabled(true)
ConfirmButton:setName("ConfirmButton")
ConfirmButton:setTag(438)
ConfirmButton:setCascadeColorEnabled(true)
ConfirmButton:setCascadeOpacityEnabled(true)
ConfirmButton:setPosition(240.0006, 84.0041)
layout = ccui.LayoutComponent:bindLayoutComponent(ConfirmButton)
layout:setSize({width = 208.0000, height = 92.0000})
layout:setLeftMargin(136.0006)
layout:setRightMargin(-344.0006)
layout:setTopMargin(-130.0041)
layout:setBottomMargin(38.0041)

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
ConfirmText_TT:setLayoutComponentEnabled(true)
ConfirmText_TT:setName("ConfirmText_TT")
ConfirmText_TT:setTag(440)
ConfirmText_TT:setCascadeColorEnabled(true)
ConfirmText_TT:setCascadeOpacityEnabled(true)
ConfirmText_TT:setPosition(104.0000, 46.0000)
ConfirmText_TT:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(ConfirmText_TT)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.2837)
layout:setPercentHeight(0.4022)
layout:setSize({width = 59.0000, height = 37.0000})
layout:setLeftMargin(74.5000)
layout:setRightMargin(74.5000)
layout:setTopMargin(27.5000)
layout:setBottomMargin(27.5000)
ConfirmButton:addChild(ConfirmText_TT)

--Create Cancel
local Cancel=cc.Node:create()
Cancel:setName("Cancel")
Cancel:setTag(444)
Cancel:setCascadeColorEnabled(true)
Cancel:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Cancel)
UpLeftFit:addChild(Cancel)

--Create CancelButton

local luaScript = require("csd.LuaScript.newButton")
local CancelButton = luaScript.CreateCustomNode()
CancelButton:ignoreContentAdaptWithSize(false)
CancelButton:loadTextureNormal("01_06_PersonalCenter/button_026.png", 1)
CancelButton:loadTexturePressed("01_06_PersonalCenter/button_026.png", 1)
CancelButton:loadTextureDisabled("01_06_PersonalCenter/button_026.png", 1)
CancelButton:setTitleFontSize(14)
CancelButton:setLayoutComponentEnabled(true)
CancelButton:setName("CancelButton")
CancelButton:setTag(439)
CancelButton:setCascadeColorEnabled(true)
CancelButton:setCascadeOpacityEnabled(true)
CancelButton:setAnchorPoint(0.5000, 0.0000)
CancelButton:setPosition(490.9996, 38.0009)
layout = ccui.LayoutComponent:bindLayoutComponent(CancelButton)
layout:setSize({width = 208.0000, height = 98.0000})
layout:setLeftMargin(386.9996)
layout:setRightMargin(-594.9996)
layout:setTopMargin(-136.0009)
layout:setBottomMargin(38.0009)

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
CancelText_TT:setLayoutComponentEnabled(true)
CancelText_TT:setName("CancelText_TT")
CancelText_TT:setTag(441)
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

--Create PurchaseTipsText
local PurchaseTipsText = ccui.Text:create()
PurchaseTipsText:ignoreContentAdaptWithSize(true)
PurchaseTipsText:setTextAreaSize({width = 0, height = 0})
PurchaseTipsText:setFontName("font/Default.ttf")
PurchaseTipsText:setFontSize(32)
PurchaseTipsText:setString([[您将花费10000钻购买10000金币]])
PurchaseTipsText:setTextHorizontalAlignment(1)
PurchaseTipsText:setTextVerticalAlignment(1)
PurchaseTipsText:setLayoutComponentEnabled(true)
PurchaseTipsText:setName("PurchaseTipsText")
PurchaseTipsText:setTag(36)
PurchaseTipsText:setCascadeColorEnabled(true)
PurchaseTipsText:setCascadeOpacityEnabled(true)
PurchaseTipsText:setPosition(364.9999, 208.0005)
layout = ccui.LayoutComponent:bindLayoutComponent(PurchaseTipsText)
layout:setSize({width = 479.0000, height = 42.0000})
layout:setLeftMargin(125.4999)
layout:setRightMargin(-604.4999)
layout:setTopMargin(-229.0005)
layout:setBottomMargin(187.0005)
UpLeftFit:addChild(PurchaseTipsText)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

