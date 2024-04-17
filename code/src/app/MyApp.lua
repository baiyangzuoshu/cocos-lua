
require("app.log.Log")

cc.exports.Launcher = require("app.init")
require("app.tbx.TbxLanguage")
require("app.Enum")
require("app.config.NetBaseConfig")
require("app.config.NetDataConfig")
require("app.util.Utils")

require("app.util.DeviceUtils")
cc.exports.cjson = require("cjson")


cc.exports.SceneManager = require("app.manager.SceneManager")
cc.exports.UIManager = require("app.manager.UIManager")
cc.exports.SoundSystemManager = require("app.manager.SoundSystemManager")
cc.exports.Preference = require("app.manager.Preference")
cc.exports.HodUpdateManager=require("app.manager.HodUpdateManager")

cc.exports.DataManager = require("app.data.DataManager")
cc.exports.ConfigManager = require("app.config.ConfigManager")

cc.exports.NativeBridgeManager = require("app.manager.NativeBridgeManager")

cc.exports.Openinstall = require("app.util.openinstall")

cc.exports.Client = require("app.net.NetDataManager")

require("app.data.GlobleCallBack")



require("app.native.ApplePayHandle")
require("app.native.AppleLoginHandle")

Openinstall:init();

cc.exports.m_GameScene = {}

local MyApp = {}

MyApp.gameConfig = {
    defaultScene = "app.scenes.UpdateScene",
}

function MyApp:init()
    math.newrandomseed()
    ConfigManager:init()
    DataManager:init()
end

function MyApp:createScene()
    MyApp:init()
    

    m_GameScene = require("app.scenes.viewBaseScene"):create()
    

    if m_GameScene then
        display.runScene(m_GameScene)

        MyApp:addDebugLayer(m_GameScene)

        local dataScene = require(MyApp.gameConfig.defaultScene).create()
        SceneManager:runScene(dataScene)  

        g_UserData:registOpeninstall()
    end
    
end

function  MyApp:reStartScene()
    UIManager:closeAllPanel()
    local dataScene = require(MyApp.gameConfig.defaultScene).create()
    SceneManager:runScene(dataScene)  
end

function MyApp:addDebugLayer(scene)
    if not DeviceUtils.isWindows() then
        return
    end

    local node = cc.Node:create()
    node:setGlobalZOrder(1000)
    scene:addChild(node)

    local function onToucheBegan(touch, event)
        local pos = touch:getLocation()

        if pos.x > 50 then
            return false
        end

        if pos.y < display.height - 50 then
            return false
        end

        return true
    end

    local function onTouchEnded(touch, event)
        local pos = touch:getLocation()

        if pos.x > 50 then
            return
        end

        if pos.y < display.height - 50 then
            return
        end

        local panel = UIManager:getOrCreatePanel("app.gui.netdebug.LoadProtocolFileLayer")
        if panel then
            panel:showToScene()
        end
    end

    local listener = cc.EventListenerTouchOneByOne:create()
    listener:registerScriptHandler(onToucheBegan, cc.Handler.EVENT_TOUCH_BEGAN)
    listener:registerScriptHandler(onTouchEnded, cc.Handler.EVENT_TOUCH_ENDED)
    local eventDispatcher = node:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, node)
end

function    applicationDidEnterBackground()
    enterTime=socket.gettime()
    
    Client:sendHeartbeat()
    kz.IAgoraRoomManager:instance():muteAllRemoteAudioStreams(false)
    kz.IAgoraRoomManager:instance():enableLocalAudio(false)
    DataManager:dispatchMessage(Constant.CustomEvent.ApplicationDidEnterBackground, {})
end

function    applicationWillEnterForeground()
    if not enterTime then
        enterTime=socket.gettime()
    end
    local   diff=socket.gettime()-enterTime+0.5*2
    
    local panel=UIManager:getPanel("UIGuessingLayer")
    if panel then
        panel:updateTime(diff)
    end
    Client:sendHeartbeat()

    if (g_GameData:getmUserstatus() == Enum.Userstatus.ShaibaoRoom or g_GameData:getmUserstatus() == Enum.Userstatus.ShaibaoGaing) then
        if g_SieveData:getAudioIsSound() then
            kz.IAgoraRoomManager:instance():muteAllRemoteAudioStreams(true)
        end
        if g_GameData:getAudioIsEnable() then
            kz.IAgoraRoomManager:instance():enableLocalAudio(true)
        end
    end
    if g_GameData:getmUserstatus() == Enum.Userstatus.ChuiniuGaing then
        if g_GameData:getAudioIsSound() then
            kz.IAgoraRoomManager:instance():muteAllRemoteAudioStreams(true)
        end
        if g_SieveData:getIsMicOpened() then
            kz.IAgoraRoomManager:instance():enableLocalAudio(true)
        end
    end
    
    DataManager:dispatchMessage(Constant.CustomEvent.ApplicationWillEnterForeground, {})

    if diff>2 then--切换后台超过2秒，在房间内，重新登录
        kz.IAgoraRoomManager:instance():leaveRoom()
        DataManager:dispatchNetMessage("S2C_Disconnect")
    end
end

return MyApp