local M = {}

-- 缓存
local mCacheValues = {}

local function getValue(key, readValueFunc)
    local value = mCacheValues[key]
    if value == nil then
        value = readValueFunc()
        mCacheValues[key] = value
    end
    return value
end

function M:getInt(key, defaultValue)
    local value = getValue(key, function()
           return cc.UserDefault:getInstance():getIntegerForKey(key, defaultValue or 0) 
        end)
    return value
end

function M:setInt(key, value)
    cc.UserDefault:getInstance():setIntegerForKey(key, value)
    mCacheValues[key] = value
end

function M:getBool(key, defaultValue)
    local value = getValue(key, function()
           return cc.UserDefault:getInstance():getBoolForKey(key, defaultValue or false) 
        end)
    return value
end

function M:setBool(key, value)
    cc.UserDefault:getInstance():setBoolForKey(key, value)
    mCacheValues[key] = value
end

function M:getString(key, defaultValue)
    local value = getValue(key, function()
           return cc.UserDefault:getInstance():getStringForKey(key, defaultValue or "") 
        end)
    return value
end

function M:setString(key, value)
    cc.UserDefault:getInstance():setStringForKey(key, value)
    mCacheValues[key] = value
end

function M:getFloat(key, defaultValue)
    local value = getValue(key, function()
           return cc.UserDefault:getInstance():getFloatForKey(key, defaultValue or 0.0) 
        end)
    return value
end

function M:setFloat(key, value)
    cc.UserDefault:getInstance():setFloatForKey(key, value)
    mCacheValues[key] = value
end

function M:getDouble(key, defaultValue)
    local value = getValue(key, function()
           return cc.UserDefault:getInstance():getDoubleForKey(key, defaultValue or 0.0) 
        end)
    return value
end

function M:setDouble(key, value)
    cc.UserDefault:getInstance():setDoubleForKey(key, value)
    mCacheValues[key] = value
end

function M:removeFromCache(key)
    mCacheValues[key] = nil
end

return M