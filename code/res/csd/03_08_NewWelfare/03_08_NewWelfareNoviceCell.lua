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
layout:setSize({width = 108.0000, height = 108.0000})

--Create NoviceRes
local NoviceRes=cc.Node:create()
NoviceRes:setName("NoviceRes")
NoviceRes:setTag(361)
NoviceRes:setCascadeColorEnabled(true)
NoviceRes:setCascadeOpacityEnabled(true)
NoviceRes:setPosition(54.0000, 54.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(NoviceRes)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setLeftMargin(54.0000)
layout:setRightMargin(54.0000)
layout:setTopMargin(54.0000)
layout:setBottomMargin(54.0000)
Layer:addChild(NoviceRes)

--Create ResPanel
local ResPanel = ccui.Layout:create()
ResPanel:ignoreContentAdaptWithSize(false)
ResPanel:setClippingEnabled(false)
ResPanel:setBackGroundColorOpacity(102)
ResPanel:setTouchEnabled(true);
ResPanel:setLayoutComponentEnabled(true)
ResPanel:setName("ResPanel")
ResPanel:setTag(362)
ResPanel:setCascadeColorEnabled(true)
ResPanel:setCascadeOpacityEnabled(true)
ResPanel:setAnchorPoint(0.5000, 0.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(ResPanel)
layout:setSize({width = 108.0000, height = 108.0000})
layout:setLeftMargin(-54.0000)
layout:setRightMargin(-54.0000)
layout:setTopMargin(-54.0000)
layout:setBottomMargin(-54.0000)
NoviceRes:addChild(ResPanel)

--Create ResIcon
local ResIcon = ccui.ImageView:create()
ResIcon:ignoreContentAdaptWithSize(false)
ResIcon:loadTexture("Default/ImageFile.png", 1)
ResIcon:setLayoutComponentEnabled(true)
ResIcon:setName("ResIcon")
ResIcon:setTag(365)
ResIcon:setCascadeColorEnabled(true)
ResIcon:setCascadeOpacityEnabled(true)
ResIcon:setPosition(54.0000, 54.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ResIcon)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.9259)
layout:setPercentHeight(0.9259)
layout:setSize({width = 100.0000, height = 100.0000})
layout:setLeftMargin(4.0000)
layout:setRightMargin(4.0000)
layout:setTopMargin(4.0000)
layout:setBottomMargin(4.0000)
ResPanel:addChild(ResIcon)

--Create Bg
local Bg = cc.Sprite:createWithSpriteFrameName("03_08_NewWelfare/frame_099.png")
Bg:setName("Bg")
Bg:setTag(430)
Bg:setCascadeColorEnabled(true)
Bg:setCascadeOpacityEnabled(true)
Bg:setPosition(54.0000, 54.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Bg)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 108.0000, height = 108.0000})
Bg:setBlendFunc({src = 1, dst = 771})
ResPanel:addChild(Bg)

--Create ResNum
local ResNum = ccui.Text:create()
ResNum:ignoreContentAdaptWithSize(true)
ResNum:setTextAreaSize({width = 0, height = 0})
ResNum:setFontName("font/Font003.ttf")
ResNum:setFontSize(24)
ResNum:setString([[5000]])
ResNum:setTextHorizontalAlignment(2)
ResNum:setLayoutComponentEnabled(true)
ResNum:setName("ResNum")
ResNum:setTag(366)
ResNum:setCascadeColorEnabled(true)
ResNum:setCascadeOpacityEnabled(true)
ResNum:setAnchorPoint(1.0000, 0.5000)
ResNum:setPosition(90.4998, 26.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ResNum)
layout:setPositionPercentX(0.8380)
layout:setPositionPercentY(0.2407)
layout:setPercentWidth(0.4630)
layout:setPercentHeight(0.2593)
layout:setSize({width = 50.0000, height = 28.0000})
layout:setLeftMargin(40.4998)
layout:setRightMargin(17.5002)
layout:setTopMargin(68.0000)
layout:setBottomMargin(12.0000)
ResPanel:addChild(ResNum)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result
