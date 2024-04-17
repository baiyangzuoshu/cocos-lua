function  GAMEGLOABLEUPDATE(dt)
    UIManager:onUpdate(dt)
    Client:onUpdate(dt)
    DataManager:onUpdate(dt)
    SoundSystemManager:onUpdate(dt)
    NativeBridgeManager:onUpdate(dt)
end

function ADD_OPERATOR_MESSAGE(opcode, resultCode, data)
    NativeBridgeManager:addOperatorMessage(opcode, resultCode, data)
end
function   AODIO_CHANGE_MESSAGE_CALLBACK(data)
    if not data or data =="" then
        return
    end
    Log.info("========:"..data)
    local datajson = cjson.decode(data)
    DataManager:dispatchMessage(Constant.CustomEvent.PlayerSayAgoraMessageChange, datajson.players)
    Log.print_table(datajson.players,2)

end

function AODIO_PLAYER_JOIN_ROOM(uid)
    Log.log("uid:%d 玩家进入游戏语音房间；",uid)
    DataManager:dispatchMessage(Constant.CustomEvent.PlayerJoinRoomSeccess, uid)
end

function AODIO_PLAYER_JOIN_ROOM_FAIL(uid)
    Log.log("玩家进入游戏语音房间失败")
    DataManager:dispatchMessage(Constant.CustomEvent.PlayerJoinRoomFail, uid)
end

function AODIO_PLAYER_LEVEL_ROOM(data)
    Log.log("玩家成功离开语音房间！")
    DataManager:dispatchMessage(Constant.CustomEvent.PlayerLevelRoom)
end

function AODIO_PLAYER_LEVEL_ROOM_FAIL(data)
    Log.log("玩家离开语音房间失败！")
    DataManager:dispatchMessage(Constant.CustomEvent.PlayerLevelRoomFail)
end

function AODIO_PLAYER_CHANNEL_SETTING(uid,isNotOpen)
    --玩家语音状态该表  uid 玩家id  isNotOpen true 是玩家关闭 麦克风  false是打开麦克风
    Log.log("玩家的语音改变 状态：id"..uid.." , isNotOpen:"..tostring(isNotOpen))
    local data = {}
    data.uid = uid
    data.isNotOpen = isNotOpen

    DataManager:dispatchMessage(Constant.CustomEvent.PlayerChangeAudioSetting,data)
end