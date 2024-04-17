local AllData = {
    "CommonData",
    "LoginData",
    "UserData",
    "GameData",
    "StoreData",
    "RewardData",
    "GameSettingData",
    "EmailData",
    "TaskData",
    "FriendData",
    "ChatData",
    "PackageData",
    "ActivityData",
    "HotData",
    "UserHeadIconData",
    "AvatarRomoteData",
    "SieveData",
}

local AllDataModel = {}

local AllMessages = {}
local AllMessageListeners = {}
local AllTbx={}

for i,v in ipairs(g_TbxLanguage) do
    g_TbxLanguage[v]=true
end

local M = {}

function M:init()
    for _, v in ipairs(AllData) do
        cc.exports["g_" .. v] = require("app.data." .. v).new()
        table.insert(AllDataModel, cc.exports["g_" .. v])
    end
end

function M:reloadAllData()
    AllDataModel = {}
    for _, v in ipairs(AllData) do
        
        cc.exports["g_" .. v] = GlobleReloadLua("app.data." .. v).new()
        table.insert(AllDataModel, cc.exports["g_" .. v])
    end
end

function M:reloadTbxAllData()
    for k,v in pairs(AllTbx) do
        GlobleReloadLua("app.tbx."..v)
    end
end

function M:dispatchMessage(name, data)
    if AllMessageListeners[name] then
        local _data = {}
        _data.call = clone(AllMessageListeners[name])
        _data.data = data
        table.insert(AllMessages, _data)
    end
end

function M:isHaveThisEvent(eventList,obj,callback)
    for k,v in pairs(eventList) do
        if v._obj == obj and v._callBack == callback then
            return true
        end
    end
    return false
end
function M:registerMessageListener(name, obj, callBack)
    if not name then return end

    if not obj then return end

    if not callBack then return end

    if not AllMessageListeners[name] then
        AllMessageListeners[name] = {}
    end

    
    if not self:isHaveThisEvent(AllMessageListeners[name],obj,callBack) then
        local _back = {}
        _back._obj = obj
        _back._callBack = callBack
        table.insert(AllMessageListeners[name], _back)
    end
    

end

function M:unRegisterMessage(name, obj)
    if AllMessageListeners[name] then
        local len = table.getn(AllMessageListeners[name])
        for i = len, 1, -1 do
            local listener = AllMessageListeners[name][i]
            if listener._obj == obj then
                table.remove(AllMessageListeners[name], i)
            end
        end
    end
end

function M:_sendMessage(message)
    local data = message.data
    for _, v in ipairs(message.call) do
        if v._obj and v._callBack and v._obj[v._callBack] and type(v._obj[v._callBack]) == "function" then
            v._obj[v._callBack](v._obj, data)
        end
    end
end

function M:dispatchNetMessage(name, data)
    for _, v in ipairs(AllDataModel) do
        if v[name] and type(v[name]) == "function" then
            v[name](v, data)
        end
    end
end

function M:onUpdate(dt)
    if table.getn(AllMessages) > 0 then
        for _, v in ipairs(AllMessages) do
            self:_sendMessage(v)
        end
        AllMessages = {}
    end

    for _, v in ipairs(AllDataModel) do
        if v["onUpdate"]  then
            v["onUpdate"](v,dt)
        end
    end
end

-- function  M:haveLanguage(name)
--     for i,v in ipairs(g_TbxLanguage) do
--         if name == v then
--             return true
--         end

--     end
--     return false
-- end


function M:getTbxData(...)
    local arg={...}
    if table.getn(arg)<1 then return end

    local name = arg[1]
    local language=Enum.LanguageType.zh_tw
    if g_UserData then
        language=g_UserData:getSystemLanguage()
    end

    if g_TbxLanguage[name] then
        name = name.."_"..language
    end
    if not cc.exports["g_"..name] then
        require("app.tbx."..name)
        table.insert(AllTbx,name)
    end

    if table.getn(arg)==1 then
        return cc.exports["g_"..name]
    elseif table.getn(arg)==2 then
        return cc.exports["g_"..name][tostring(arg[2])]
    elseif table.getn(arg)==3 then
        local items ={}
        for k,v in pairs(cc.exports["g_"..name]) do
            if v[tostring(arg[2])] == arg[3] then
                table.insert(items,v)
            end
        end

        return items
    end
end

return M