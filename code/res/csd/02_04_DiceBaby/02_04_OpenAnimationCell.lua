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
"ui/00_01_Common/00_01_Common_1.plist",	
"ui/00_02_Default/00_02_Default_1.plist",	
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
layout:setSize({width = 300.0000, height = 450.0000})

--Create OpenAnimation
local OpenAnimation=cc.Node:create()
OpenAnimation:setName("OpenAnimation")
OpenAnimation:setTag(328)
OpenAnimation:setCascadeColorEnabled(true)
OpenAnimation:setCascadeOpacityEnabled(true)
OpenAnimation:setPosition(150.0000, 225.0000)
OpenAnimation:setScaleX(1.5000)
OpenAnimation:setScaleY(1.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(OpenAnimation)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setLeftMargin(150.0000)
layout:setRightMargin(150.0000)
layout:setTopMargin(225.0000)
layout:setBottomMargin(225.0000)
Layer:addChild(OpenAnimation)

--Create DiceBabyDice_1
local DiceBabyDice_1 = ccui.ImageView:create()
DiceBabyDice_1:ignoreContentAdaptWithSize(false)
DiceBabyDice_1:loadTexture("00_01_Common/3D_Dice_1.png", 1)
DiceBabyDice_1:setLayoutComponentEnabled(true)
DiceBabyDice_1:setName("DiceBabyDice_1")
DiceBabyDice_1:setTag(318)
DiceBabyDice_1:setCascadeColorEnabled(true)
DiceBabyDice_1:setCascadeOpacityEnabled(true)
DiceBabyDice_1:setPosition(-38.0000, -72.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(DiceBabyDice_1)
layout:setSize({width = 59.0000, height = 67.0000})
layout:setLeftMargin(-67.5000)
layout:setRightMargin(8.5000)
layout:setTopMargin(38.5000)
layout:setBottomMargin(-105.5000)
OpenAnimation:addChild(DiceBabyDice_1)

--Create DiceBabyDice_3
local DiceBabyDice_3 = ccui.ImageView:create()
DiceBabyDice_3:ignoreContentAdaptWithSize(false)
DiceBabyDice_3:loadTexture("00_01_Common/3D_Dice_1.png", 1)
DiceBabyDice_3:setLayoutComponentEnabled(true)
DiceBabyDice_3:setName("DiceBabyDice_3")
DiceBabyDice_3:setTag(320)
DiceBabyDice_3:setCascadeColorEnabled(true)
DiceBabyDice_3:setCascadeOpacityEnabled(true)
DiceBabyDice_3:setPosition(38.0000, -72.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(DiceBabyDice_3)
layout:setSize({width = 59.0000, height = 67.0000})
layout:setLeftMargin(8.5000)
layout:setRightMargin(-67.5000)
layout:setTopMargin(38.5000)
layout:setBottomMargin(-105.5000)
OpenAnimation:addChild(DiceBabyDice_3)

--Create DiceBabyDice_2
local DiceBabyDice_2 = ccui.ImageView:create()
DiceBabyDice_2:ignoreContentAdaptWithSize(false)
DiceBabyDice_2:loadTexture("00_01_Common/3D_Dice_1.png", 1)
DiceBabyDice_2:setLayoutComponentEnabled(true)
DiceBabyDice_2:setName("DiceBabyDice_2")
DiceBabyDice_2:setTag(319)
DiceBabyDice_2:setCascadeColorEnabled(true)
DiceBabyDice_2:setCascadeOpacityEnabled(true)
DiceBabyDice_2:setPosition(0.0000, -96.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(DiceBabyDice_2)
layout:setSize({width = 59.0000, height = 67.0000})
layout:setLeftMargin(-29.5000)
layout:setRightMargin(-29.5000)
layout:setTopMargin(62.5000)
layout:setBottomMargin(-129.5000)
OpenAnimation:addChild(DiceBabyDice_2)

--Create BankerDiceBox
local BankerDiceBox = ccui.ImageView:create()
BankerDiceBox:ignoreContentAdaptWithSize(false)
BankerDiceBox:loadTexture("00_02_Default/103001.png", 1)
BankerDiceBox:setLayoutComponentEnabled(true)
BankerDiceBox:setName("BankerDiceBox")
BankerDiceBox:setTag(324)
BankerDiceBox:setCascadeColorEnabled(true)
BankerDiceBox:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(BankerDiceBox)
layout:setSize({width = 200.0000, height = 300.0000})
layout:setLeftMargin(-100.0000)
layout:setRightMargin(-100.0000)
layout:setTopMargin(-150.0000)
layout:setBottomMargin(-150.0000)
OpenAnimation:addChild(BankerDiceBox)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

