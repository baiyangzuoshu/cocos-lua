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
layout:setSize({width = 720.0000, height = 378.0000})

--Create Bg
local Bg=cc.Node:create()
Bg:setName("Bg")
Bg:setTag(757)
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
Bg_1:setTag(758)
Bg_1:setCascadeColorEnabled(true)
Bg_1:setCascadeOpacityEnabled(true)
Bg_1:setAnchorPoint(0.0000, 0.0000)
Bg_1:setPosition(85.0017, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Bg_1)
layout:setSize({width = 558.0000, height = 378.0000})
layout:setLeftMargin(85.0017)
layout:setRightMargin(-643.0017)
layout:setTopMargin(-378.0000)
Bg:addChild(Bg_1)

--Create Middle
local Middle=cc.Node:create()
Middle:setName("Middle")
Middle:setTag(761)
Middle:setCascadeColorEnabled(true)
Middle:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Middle)
layout:setRightMargin(720.0000)
layout:setTopMargin(378.0000)
Layer:addChild(Middle)

--Create TitleText_TT
local TitleText_TT = ccui.Text:create()
TitleText_TT:ignoreContentAdaptWithSize(true)
TitleText_TT:setTextAreaSize({width = 0, height = 0})
TitleText_TT:setFontName("font/Font001.ttf")
TitleText_TT:setFontSize(32)
TitleText_TT:setString([[修改昵称]])
TitleText_TT:setTextHorizontalAlignment(1)
TitleText_TT:setTextVerticalAlignment(1)
TitleText_TT:setLayoutComponentEnabled(true)
TitleText_TT:setName("TitleText_TT")
TitleText_TT:setTag(762)
TitleText_TT:setCascadeColorEnabled(true)
TitleText_TT:setCascadeOpacityEnabled(true)
TitleText_TT:setPosition(364.0000, 340.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(TitleText_TT)
layout:setSize({width = 131.0000, height = 42.0000})
layout:setLeftMargin(298.5000)
layout:setRightMargin(-429.5000)
layout:setTopMargin(-361.0000)
layout:setBottomMargin(319.0000)
Middle:addChild(TitleText_TT)

--Create Name
local Name=cc.Node:create()
Name:setName("Name")
Name:setTag(869)
Name:setCascadeColorEnabled(true)
Name:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Name)
Middle:addChild(Name)

--Create NamePanel
local NamePanel = ccui.Layout:create()
NamePanel:ignoreContentAdaptWithSize(false)
NamePanel:setClippingEnabled(false)
NamePanel:setBackGroundColorOpacity(102)
NamePanel:setTouchEnabled(true);
NamePanel:setLayoutComponentEnabled(true)
NamePanel:setName("NamePanel")
NamePanel:setTag(230)
NamePanel:setCascadeColorEnabled(true)
NamePanel:setCascadeOpacityEnabled(true)
NamePanel:setAnchorPoint(0.5000, 0.5000)
NamePanel:setPosition(364.0000, 221.9998)
layout = ccui.LayoutComponent:bindLayoutComponent(NamePanel)
layout:setSize({width = 454.0000, height = 80.0000})
layout:setLeftMargin(137.0000)
layout:setRightMargin(-591.0000)
layout:setTopMargin(-261.9998)
layout:setBottomMargin(181.9998)
Name:addChild(NamePanel)

--Create NameBg
local NameBg = ccui.ImageView:create()
NameBg:ignoreContentAdaptWithSize(false)
NameBg:loadTexture("01_07_Sitting/frame_125.png", 1)
NameBg:setScale9Enabled(true)
NameBg:setCapInsets({x = 9, y = 9, width = 44, height = 44})
NameBg:setLayoutComponentEnabled(true)
NameBg:setName("NameBg")
NameBg:setTag(1284)
NameBg:setCascadeColorEnabled(true)
NameBg:setCascadeOpacityEnabled(true)
NameBg:setPosition(227.0000, 40.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(NameBg)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.9780)
layout:setPercentHeight(0.8500)
layout:setSize({width = 444.0000, height = 68.0000})
layout:setLeftMargin(5.0000)
layout:setRightMargin(5.0000)
layout:setTopMargin(6.0000)
layout:setBottomMargin(6.0000)
NamePanel:addChild(NameBg)

--Create NameTextField
local NameTextField = ccui.TextField:create()
NameTextField:ignoreContentAdaptWithSize(false)
tolua.cast(NameTextField:getVirtualRenderer(), "cc.Label"):setLineBreakWithoutSpace(true)
NameTextField:setFontName("font/Default.ttf")
NameTextField:setFontSize(28)
NameTextField:setPlaceHolder("昵称最多六个字")
NameTextField:setString([[我是大塊頭]])
NameTextField:setMaxLength(10)
NameTextField:setLayoutComponentEnabled(true)
NameTextField:setName("NameTextField")
NameTextField:setTag(274)
NameTextField:setCascadeColorEnabled(true)
NameTextField:setCascadeOpacityEnabled(true)
NameTextField:setAnchorPoint(0.0000, 0.5000)
NameTextField:setPosition(29.0000, 40.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(NameTextField)
layout:setPositionPercentX(0.0639)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.8722)
layout:setPercentHeight(0.5000)
layout:setSize({width = 396.0000, height = 40.0000})
layout:setLeftMargin(29.0000)
layout:setRightMargin(29.0000)
layout:setTopMargin(20.0000)
layout:setBottomMargin(20.0000)
NamePanel:addChild(NameTextField)

--Create Error
local Error=cc.Node:create()
Error:setName("Error")
Error:setTag(61)
Error:setCascadeColorEnabled(true)
Error:setCascadeOpacityEnabled(true)
Error:setPosition(227.0000, 40.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Error)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setLeftMargin(227.0000)
layout:setRightMargin(227.0000)
layout:setTopMargin(40.0000)
layout:setBottomMargin(40.0000)
NamePanel:addChild(Error)

--Create NameErrorBg
local NameErrorBg = cc.Sprite:createWithSpriteFrameName("01_06_PersonalCenter/frame_143.png")
NameErrorBg:setName("NameErrorBg")
NameErrorBg:setTag(580)
NameErrorBg:setCascadeColorEnabled(true)
NameErrorBg:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(NameErrorBg)
layout:setSize({width = 458.0000, height = 82.0000})
layout:setLeftMargin(-229.0000)
layout:setRightMargin(-229.0000)
layout:setTopMargin(-41.0000)
layout:setBottomMargin(-41.0000)
NameErrorBg:setBlendFunc({src = 1, dst = 771})
Error:addChild(NameErrorBg)

--Create Diamond
local Diamond=cc.Node:create()
Diamond:setName("Diamond")
Diamond:setTag(873)
Diamond:setCascadeColorEnabled(true)
Diamond:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Diamond)
Middle:addChild(Diamond)

--Create DiamondIcon
local DiamondIcon = ccui.ImageView:create()
DiamondIcon:ignoreContentAdaptWithSize(false)
DiamondIcon:loadTexture("01_06_PersonalCenter/icon_032.png", 1)
DiamondIcon:setScale9Enabled(true)
DiamondIcon:setCapInsets({x = 15, y = 13, width = 18, height = 16})
DiamondIcon:setLayoutComponentEnabled(true)
DiamondIcon:setName("DiamondIcon")
DiamondIcon:setTag(876)
DiamondIcon:setCascadeColorEnabled(true)
DiamondIcon:setCascadeOpacityEnabled(true)
DiamondIcon:setPosition(162.0023, 159.0018)
layout = ccui.LayoutComponent:bindLayoutComponent(DiamondIcon)
layout:setSize({width = 48.0000, height = 42.0000})
layout:setLeftMargin(138.0023)
layout:setRightMargin(-186.0023)
layout:setTopMargin(-180.0018)
layout:setBottomMargin(138.0018)
Diamond:addChild(DiamondIcon)

--Create DiamondNum
local DiamondNum = ccui.Text:create()
DiamondNum:ignoreContentAdaptWithSize(true)
DiamondNum:setTextAreaSize({width = 0, height = 0})
DiamondNum:setFontName("font/Font003.ttf")
DiamondNum:setFontSize(24)
DiamondNum:setString([[500]])
DiamondNum:setTextHorizontalAlignment(1)
DiamondNum:setTextVerticalAlignment(1)
DiamondNum:setLayoutComponentEnabled(true)
DiamondNum:setName("DiamondNum")
DiamondNum:setTag(877)
DiamondNum:setCascadeColorEnabled(true)
DiamondNum:setCascadeOpacityEnabled(true)
DiamondNum:setPosition(202.9998, 162.9977)
DiamondNum:setTextColor({r = 193, g = 189, b = 237})
layout = ccui.LayoutComponent:bindLayoutComponent(DiamondNum)
layout:setSize({width = 38.0000, height = 28.0000})
layout:setLeftMargin(183.9998)
layout:setRightMargin(-221.9998)
layout:setTopMargin(-176.9977)
layout:setBottomMargin(148.9977)
Diamond:addChild(DiamondNum)

--Create DiamondText_TT
local DiamondText_TT = ccui.Text:create()
DiamondText_TT:ignoreContentAdaptWithSize(true)
DiamondText_TT:setTextAreaSize({width = 0, height = 0})
DiamondText_TT:setFontName("font/Default.ttf")
DiamondText_TT:setFontSize(24)
DiamondText_TT:setString([[/次]])
DiamondText_TT:setTextVerticalAlignment(1)
DiamondText_TT:setLayoutComponentEnabled(true)
DiamondText_TT:setName("DiamondText_TT")
DiamondText_TT:setTag(878)
DiamondText_TT:setCascadeColorEnabled(true)
DiamondText_TT:setCascadeOpacityEnabled(true)
DiamondText_TT:setAnchorPoint(0.0000, 0.5000)
DiamondText_TT:setPosition(222.5000, 164.0000)
DiamondText_TT:setTextColor({r = 193, g = 189, b = 237})
layout = ccui.LayoutComponent:bindLayoutComponent(DiamondText_TT)
layout:setSize({width = 37.0000, height = 32.0000})
layout:setLeftMargin(222.5000)
layout:setRightMargin(-259.5000)
layout:setTopMargin(-180.0000)
layout:setBottomMargin(148.0000)
Diamond:addChild(DiamondText_TT)

--Create FirstText_TT
local FirstText_TT = ccui.Text:create()
FirstText_TT:ignoreContentAdaptWithSize(true)
FirstText_TT:setTextAreaSize({width = 0, height = 0})
FirstText_TT:setFontName("font/Default.ttf")
FirstText_TT:setFontSize(24)
FirstText_TT:setString([[首次修改免费]])
FirstText_TT:setTextHorizontalAlignment(1)
FirstText_TT:setTextVerticalAlignment(1)
FirstText_TT:setLayoutComponentEnabled(true)
FirstText_TT:setName("FirstText_TT")
FirstText_TT:setTag(82)
FirstText_TT:setCascadeColorEnabled(true)
FirstText_TT:setCascadeOpacityEnabled(true)
FirstText_TT:setAnchorPoint(0.0000, 0.5000)
FirstText_TT:setPosition(140.0000, 162.0000)
FirstText_TT:setTextColor({r = 193, g = 189, b = 237})
layout = ccui.LayoutComponent:bindLayoutComponent(FirstText_TT)
layout:setSize({width = 146.0000, height = 32.0000})
layout:setLeftMargin(140.0000)
layout:setRightMargin(-286.0000)
layout:setTopMargin(-178.0000)
layout:setBottomMargin(146.0000)
Middle:addChild(FirstText_TT)

--Create Confirm
local Confirm=cc.Node:create()
Confirm:setName("Confirm")
Confirm:setTag(874)
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
ConfirmButton:setLayoutComponentEnabled(true)
ConfirmButton:setName("ConfirmButton")
ConfirmButton:setTag(879)
ConfirmButton:setCascadeColorEnabled(true)
ConfirmButton:setCascadeOpacityEnabled(true)
ConfirmButton:setPosition(239.0010, 84.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ConfirmButton)
layout:setSize({width = 208.0000, height = 98.0000})
layout:setLeftMargin(135.0010)
layout:setRightMargin(-343.0010)
layout:setTopMargin(-133.0000)
layout:setBottomMargin(35.0000)

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
ConfirmText_TT:setLayoutComponentEnabled(true)
ConfirmText_TT:setName("ConfirmText_TT")
ConfirmText_TT:setTag(880)
ConfirmText_TT:setCascadeColorEnabled(true)
ConfirmText_TT:setCascadeOpacityEnabled(true)
ConfirmText_TT:setPosition(239.0000, 84.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ConfirmText_TT)
layout:setSize({width = 59.0000, height = 37.0000})
layout:setLeftMargin(209.5000)
layout:setRightMargin(-268.5000)
layout:setTopMargin(-102.5000)
layout:setBottomMargin(65.5000)
Confirm:addChild(ConfirmText_TT)

--Create Cancel
local Cancel=cc.Node:create()
Cancel:setName("Cancel")
Cancel:setTag(875)
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
CancelButton:setTag(881)
CancelButton:setCascadeColorEnabled(true)
CancelButton:setCascadeOpacityEnabled(true)
CancelButton:setPosition(490.0000, 84.0020)
layout = ccui.LayoutComponent:bindLayoutComponent(CancelButton)
layout:setSize({width = 208.0000, height = 98.0000})
layout:setLeftMargin(386.0000)
layout:setRightMargin(-594.0000)
layout:setTopMargin(-133.0020)
layout:setBottomMargin(35.0020)

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
CancelText_TT:setTag(882)
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

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result
