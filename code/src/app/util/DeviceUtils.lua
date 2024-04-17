cc.exports.DeviceUtils = {}

local android = nil
local ios = nil
local windows = nil

local mApplication = cc.Application:getInstance()

function DeviceUtils.generateGUID()
    local seed = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f" }

    local tb = {}
    for i = 1, 32 do
        table.insert(tb, seed[math.random(1, 16)])
    end

    local sid = table.concat(tb)
    local guid = string.format("%s-%s-%s-%s-%s",
    string.sub(sid, 1, 8),
    string.sub(sid, 9, 12),
    string.sub(sid, 13, 16),
    string.sub(sid, 17, 20),
    string.sub(sid, 21, 32))
    return guid
end

function DeviceUtils.getPlatform()
    return device.platform
end

function DeviceUtils.isAndroid()
    if android == nil then
        android = (DeviceUtils.getPlatform() == "android")
    end

    return android
end

function DeviceUtils.isIOS()
    if ios == nil then
        ios = (DeviceUtils.getPlatform() == "ios")
    end

    return ios
end

function DeviceUtils.isWindows()
    if windows == nil then
        windows = (DeviceUtils.getPlatform() == "windows")
    end

    return windows
end

function DeviceUtils.getPhoneModel()
    return device.model
end

function DeviceUtils.getVersion()
    local ret = "1.0.0"

    if DeviceUtils.isAndroid() then
        -- ret = 
    elseif DeviceUtils.isIOS() then
        -- ret = 
    end

    return ret
end

function DeviceUtils.getPackageName()
    local ret = "com.kuizhi.dahua"

    if DeviceUtils.isAndroid() then
        -- ret = 
    elseif DeviceUtils.isIOS() then
        -- ret = 
    end

    return ret
end

function DeviceUtils.getChannelId()
    local ret = 1001

    if DeviceUtils.isAndroid() then
        -- ret = 
    elseif DeviceUtils.isIOS() then
        -- ret = 
    end

    return ret
end

function DeviceUtils.getIDFA()
    local ret = DeviceUtils.generateGUID()

    if DeviceUtils.isAndroid() then
        -- ret = 
    elseif DeviceUtils.isIOS() then
        -- ret = 
    end

    return ret
end

function DeviceUtils.getAppPushToken()
    local ret = DeviceUtils.generateGUID()

    if DeviceUtils.isAndroid() then
        -- ret = 
    elseif DeviceUtils.isIOS() then
        -- ret = 
    end

    return ret
end

function DeviceUtils.getDeviceId()
    local ret = DeviceUtils.generateGUID()

    if DeviceUtils.isAndroid() then
        -- ret = 
    elseif DeviceUtils.isIOS() then
        -- ret = 
    end

    return ret
end

function DeviceUtils.getAvatarWritablePath(filename)
    local avatarPath = cc.FileUtils:getInstance():getWritablePath() .. "avatar/" 
    if not (cc.FileUtils:getInstance():isDirectoryExist(avatarPath)) then
        cc.FileUtils:getInstance():createDirectory(avatarPath)
    end
    local ret = cc.FileUtils:getInstance():getWritablePath().."avatar/"..filename..".png"

    if DeviceUtils.isWindows() then
        ret = cc.FileUtils:getInstance():getWritablePath().. "tmp/" .. tostring(g_UserData:getUserId()) .. "/avatar/" .. filename
    end

    return ret
end

function DeviceUtils.openURL(url)
    mApplication:openURL(url)
end
