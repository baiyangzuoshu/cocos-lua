local CINDEX = 0

local httpClient = require("app.net.HttpClient")

local ProtobufUtils = require("app.util.ProtobufUtils")


local _ioClient = nil

local _transport = nil

local _connectCallback = nil

local _HeartbeatConfig = {
    lastHeartbeat = 0,
    overTime = 0,

    interval = -1,
    count = 0,
}

local _isKickTag=false

local _waitSendMessages = {}

local M = {}

function M:initNet(host, port)
    self:close()

    Log.log("init server host:%s, port:%d", host, port)

    local io_service = yasio.io_service
    _ioClient = io_service.new({ host = host, port = port })

    _ioClient:set_option(yasio.YOPT_C_LFBFD_PARAMS, CINDEX, 65535, 2, 4, 6)
    --_ioClient:set_option(yasio.YOPT_S_TCP_KEEPALIVE,CINDEX,60,5,3)
    _ioClient:start(handler(self, self.receive))
end

function M:connect(callback)
    Log.log("连接服务器...")

    if self:isOpen() then
        if callback then
            callback(false)
        end
    else
        _connectCallback = callback
        _ioClient:open(CINDEX, yasio.YCK_TCP_CLIENT)
    end
end

function M:close()
    if not _ioClient then return end

    if self:isConnect() then
        _ioClient:close(CINDEX)
    end

    _ioClient:stop()

    self:clearConnectState()
end

function M:clearConnectState()
    _ioClient = nil

    _transport = nil

    _connectCallback = nil

    _waitSendMessages = {}

    _isKickTag=false

    _HeartbeatConfig = {
        lastHeartbeat = 0,
        overTime = 0,

        interval = -1,
        count = 0,
    }

end

function M:kickTagIng()
    _isKickTag=true
end

function M:onConnected()
    Log.log("网络连接成功")
    self:notifyConnectState(true)
end

function M:showUINetPop(txt,cb)
    local panel=UIManager:getOrCreatePanel("UINetPopup")
    if panel then
        panel:setText(txt)
        panel:setConfirmCb(cb)
        panel:showToScene()
    end
end

function M:onConnectFail()
    Log.log("网络连接失败")
    self:notifyConnectState(false)
    self:restartConnect()
    
end
-- 1.尝试重新连接
-- 2.重新连接失败n次，initNet
-- 3.initNet失败，重新登陆
function M:onDisconnect()
    Log.log("网络连接断开")
    self:restartConnect()
end

function M:restartConnect()
    if not _isKickTag then
        kz.IAgoraRoomManager:instance():leaveRoom()
        DataManager:dispatchNetMessage("S2C_Disconnect")
    end
end

function M:isOpen()
    if not _ioClient then return false end

    return _ioClient:is_open(CINDEX)
end

function M:isConnect()
    if not self:isOpen() then return false end

    if not _transport then return false end

    return _ioClient:is_open(_transport)
end

function M:resetHeartbeatTime()
    _HeartbeatConfig.lastHeartbeat = socket.gettime() * 1000
end

function M:receive(event)
    local t = event:kind()

    if t == yasio.YEK_PACKET then
        -- 解包并分发消息
        self:dispatchPack(event:packet())
    elseif t == yasio.YEK_CONNECT_RESPONSE then
        if event:status() == 0 then
            _transport = event:transport()
            self:onConnected()
        else
            self:onConnectFail()
        end
    elseif t == yasio.YEK_CONNECTION_LOST then
        self:onDisconnect()
    end
end

function M:notifyConnectState(isConnected)
    if _connectCallback ~= nil then
        _connectCallback(isConnected)
        _connectCallback = nil
    end
end

function M:sendHttpPostRequest(api, data, callback)
    httpClient:sendHttpPostRequest(Net.LoginSeverIp .. "/" .. api, cjson.encode(data), callback)
end
function M:sendHttpGetHodRequest(api, data, callback)

    httpClient:sendHttpAvatarRequest(Net.InitAllocation .. "/" .. api.."?".."version="..data.version.."&env="..data.env.."&system="..data.system, callback)
end

function M:onUpdate(dt)
    self:updateHeartbeat(dt)

    if _ioClient then
        -- 消息分发
        _ioClient:dispatch(128)
        local newMessage = {}
        -- 消息发送
        if table.getn(_waitSendMessages) > 0 and self:isConnect() then
            for _, obs in ipairs(_waitSendMessages) do
                
            end
            for i,obs in ipairs(_waitSendMessages) do
                if i<=5 then
                    _ioClient:write(_transport, obs)
                else
                    table.insert(newMessage,obs)
                end
                
            end
            _waitSendMessages = newMessage
        end
    end
end

function M:setHeartbeat(heartbeat)
    _HeartbeatConfig.count = heartbeat + 1

    _HeartbeatConfig.overTime = 3 * heartbeat

    _HeartbeatConfig.interval = heartbeat

    _HeartbeatConfig.lastHeartbeat = socket.gettime() * 1000
end

function M:sendHeartbeat()
    _HeartbeatConfig.count = 0
    self:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_Heartbeat, {})
end

function M:updateHeartbeat(dt)
    if not self:isConnect() then
        return
    end

    if _HeartbeatConfig.interval <= 0 then
        return
    end

    _HeartbeatConfig.count = _HeartbeatConfig.count + dt * 1000
    if _HeartbeatConfig.count >= _HeartbeatConfig.interval then
        self:sendHeartbeat()
    end

    if _HeartbeatConfig.overTime > socket.gettime() * 1000 - _HeartbeatConfig.lastHeartbeat then
        return
    end
    Log.log("心跳超时")
    self:resetHeartbeatTime()
    self:onDisconnect()
end

function M:dispatchPack(ibs)
    if not ibs then return end

    local id = ibs:read_u16()
    local len = ibs:read_u32()

    if not Net.Code2Protobuf[id] then
        Log.warn("NetDataManager:dispatchPack, id:%s unregistered.", tostring(id))
        return
    end

    local msg = nil

    local protocolName = Net.Code2Protobuf[id].protocolName
    if not Utils.isEmptyStr(protocolName) then
        msg = ProtobufUtils.decode(protocolName, ibs:read_bytes(len))
    end

    Log.print_socket_recv(id, len, protocolName, msg)

    local methodName = Net.Code2Protobuf[id].methodName
    if not Utils.isEmptyStr(methodName) then
        DataManager:dispatchNetMessage(methodName, msg)
    end

end

function M:sendMessageByOpCode(id, data)
    self:sendMessage(id, nil, data)
end

function M:sendMessage(id, protocolName, data)
    if not id then return end
    
    if protocolName == nil then
        if not Net.Code2Protobuf[id] then
            Log.warn("NetDataManager:sendMessage, id:%s unregistered.", tostring(id))
        else
            protocolName = Net.Code2Protobuf[id].protocolName
        end
    end

    local bytes = nil
    local len = 0

    if not Utils.isEmptyStr(protocolName) then
        bytes = ProtobufUtils.encode(protocolName, data or {})
    end

    local obs = yasio.obstream.new()

    obs:write_u16(id)

    if not Utils.isEmptyStr(bytes) then
        len = string.len(bytes)

        obs:write_u32(string.len(bytes))
        obs:write_bytes(bytes)
    else
        obs:write_u32(0)
    end

    Log.print_socket_send(id, len, protocolName, data)

    _waitSendMessages[#_waitSendMessages + 1] = obs

end

return M