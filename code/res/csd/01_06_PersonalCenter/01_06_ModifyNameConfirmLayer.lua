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
layout:setSize({width = 720.0000, height = 378.0000})

--Create Bg
local Bg=cc.Node:create()
Bg:setName("Bg")
Bg:setTag(107)
Bg:setCascadeColorEnabled(true)
Bg:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Bg)
layout:setRightMargin(720.0000)
layout:setTopMargin(378.0000)
Layer:addChild(Bg)

--Create Bg_1
local Bg_1 = ccui.ImageView:create()
Bg_1:ignoreContentAdaptWithSize(false)
Bg_1:loadTexture("01_06_PersonalCenter/frame_038.png", 1)
Bg_1:setScale9Enabled(true)
Bg_1:setCapInsets({x = 16, y = 124, width = 18, height = 130})
Bg_1:setLayoutComponentEnabled(true)
Bg_1:setName("Bg_1")
Bg_1:setTag(163)
Bg_1:setCascadeColorEnabled(true)
Bg_1:setCascadeOpacityEnabled(true)
Bg_1:setAnchorPoint(0.5000, 0.0000)
Bg_1:setPosition(360.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Bg_1)
layout:setSize({width = 558.0000, height = 378.0000})
layout:setLeftMargin(81.0000)
layout:setRightMargin(-639.0000)
layout:setTopMargin(-378.0000)
Bg:addChild(Bg_1)

--Create First
local First=cc.Node:create()
First:setName("First")
First:setTag(127)
First:setCascadeColorEnabled(true)
First:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(First)
layout:setRightMargin(720.0000)
layout:setTopMargin(378.0000)
Layer:addChild(First)

--Create Confirm
local Confirm=cc.Node:create()
Confirm:setName("Confirm")
Confirm:setTag(120)
Confirm:setCascadeColorEnabled(true)
Confirm:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Confirm)
First:addChild(Confirm)

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
ConfirmButton:setTag(121)
ConfirmButton:setCascadeColorEnabled(true)
ConfirmButton:setCascadeOpacityEnabled(true)
ConfirmButton:setPosition(240.0006, 84.0041)
layout = ccui.LayoutComponent:bindLayoutComponent(ConfirmButton)
layout:setSize({width = 208.0000, height = 98.0000})
layout:setLeftMargin(136.0006)
layout:setRightMargin(-344.0006)
layout:setTopMargin(-133.0041)
layout:setBottomMargin(35.0041)

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
ConfirmText_TT:setTag(122)
ConfirmText_TT:setCascadeColorEnabled(true)
ConfirmText_TT:setCascadeOpacityEnabled(true)
ConfirmText_TT:setPosition(240.0000, 84.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ConfirmText_TT)
layout:setSize({width = 59.0000, height = 37.0000})
layout:setLeftMargin(210.5000)
layout:setRightMargin(-269.5000)
layout:setTopMargin(-102.5000)
layout:setBottomMargin(65.5000)
Confirm:addChild(ConfirmText_TT)

--Create Cancel
local Cancel=cc.Node:create()
Cancel:setName("Cancel")
Cancel:setTag(123)
Cancel:setCascadeColorEnabled(true)
Cancel:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Cancel)
First:addChild(Cancel)

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
CancelButton:setTag(124)
CancelButton:setCascadeColorEnabled(true)
CancelButton:setCascadeOpacityEnabled(true)
CancelButton:setPosition(490.0000, 84.0009)
layout = ccui.LayoutComponent:bindLayoutComponent(CancelButton)
layout:setSize({width = 208.0000, height = 98.0000})
layout:setLeftMargin(386.0000)
layout:setRightMargin(-594.0000)
layout:setTopMargin(-133.0009)
layout:setBottomMargin(35.0009)

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
CancelText_TT:setLayoutComponentEnabled(true)
CancelText_TT:setName("CancelText_TT")
CancelText_TT:setTag(125)
CancelText_TT:setCascadeColorEnabled(true)
CancelText_TT:setCascadeOpacityEnabled(true)
CancelText_TT:setPosition(490.0000, 84.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(CancelText_TT)
layout:setSize({width = 59.0000, height = 37.0000})
layout:setLeftMargin(460.5000)
layout:setRightMargin(-519.5000)
layout:setTopMargin(-102.5000)
layout:setBottomMargin(65.5000)
Cancel:addChild(CancelText_TT)

--Create ModifyNameConfirmText
local ModifyNameConfirmText = ccui.Text:create()
ModifyNameConfirmText:ignoreContentAdaptWithSize(true)
ModifyNameConfirmText:setTextAreaSize({width = 0, height = 0})
ModifyNameConfirmText:setFontName("font/Default.ttf")
ModifyNameConfirmText:setFontSize(32)
ModifyNameConfirmText:setString([[首次修改免费，是否进行修改]])
ModifyNameConfirmText:setTextHorizontalAlignment(1)
ModifyNameConfirmText:setTextVerticalAlignment(1)
ModifyNameConfirmText:setLayoutComponentEnabled(true)
ModifyNameConfirmText:setName("ModifyNameConfirmText")
ModifyNameConfirmText:setTag(126)
ModifyNameConfirmText:setCascadeColorEnabled(true)
ModifyNameConfirmText:setCascadeOpacityEnabled(true)
ModifyNameConfirmText:setPosition(364.9989, 218.0003)
layout = ccui.LayoutComponent:bindLayoutComponent(ModifyNameConfirmText)
layout:setSize({width = 419.0000, height = 42.0000})
layout:setLeftMargin(155.4989)
layout:setRightMargin(-574.4989)
layout:setTopMargin(-239.0003)
layout:setBottomMargin(197.0003)
First:addChild(ModifyNameConfirmText)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

