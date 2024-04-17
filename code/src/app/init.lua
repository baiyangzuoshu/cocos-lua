local sharedApplication = cc.Application:getInstance()
local target = sharedApplication:getTargetPlatform()

local Launcher = {}

Launcher.platform = sharedApplication:getTargetPlatform()

Launcher.PLATFORM_OS = {
    WINDOWS = 0,
    LINUX = 1,
    MAC = 2,
    ANDROID = 3,
    IPHONE = 4,
    IPAD = 5,
    BLACKBERRY = 6,
    NACL = 7,
    EMSCRIPTEN = 8,
    TIZEN = 9,
    WINRT = 10,
    WP8 = 11
}

Launcher.IS_ANDROID = Launcher.platform == Launcher.PLATFORM_OS.ANDROID
Launcher.IS_IOS = (Launcher.platform == Launcher.PLATFORM_OS.IPHONE or Launcher.platform == Launcher.PLATFORM_OS.IPAD)

if Launcher.IS_ANDROID then

    local callJavaStaticMethod = LuaJavaBridge.callStaticMethod

    local function checkArguments(args, sig)
        if type(args) ~= "table" then
            args = {}
        end
        if sig then
            return args, sig
        end

        sig = { "(" }
        for i, v in ipairs(args) do
            local t = type(v)
            if t == "number" then
                sig[#sig + 1] = "F"
            elseif t == "boolean" then
                sig[#sig + 1] = "Z"
            elseif t == "function" then
                sig[#sig + 1] = "I"
            else
                sig[#sig + 1] = "Ljava/lang/String;"
            end
        end
        sig[#sig + 1] = ")V"

        return args, table.concat(sig)
    end

    function Launcher.callStaticMethod(className, methodName, args, sig)
        local args, sig = checkArguments(args, sig)
        print(string.format("luaj.callStaticMethod(\"%s\",\n\t\"%s\",\n\targs,\n\t\"%s\"", className, methodName, sig))
        return callJavaStaticMethod(className or "bridge/AppController", methodName, args, sig)
    end

elseif Launcher.IS_IOS then

    local callStaticMethod = LuaObjcBridge.callStaticMethod

    function Launcher.callStaticMethod(className, methodName, args)
        local ok, ret = callStaticMethod(className, methodName, args)
        if not ok then
            local msg = string.format("luaoc.callStaticMethod(\"%s\", \"%s\", \"%s\") - error: [%s] ",
                    className, methodName, tostring(args), tostring(ret))
            if ret == -1 then
                print(msg .. "INVALID PARAMETERS")
            elseif ret == -2 then
                print(msg .. "CLASS NOT FOUND")
            elseif ret == -3 then
                print(msg .. "METHOD NOT FOUND")
            elseif ret == -4 then
                print(msg .. "EXCEPTION OCCURRED")
            elseif ret == -5 then
                print(msg .. "INVALID METHOD SIGNATURE")
            else
                print(msg .. "UNKNOWN")
            end
        end
        return ok, ret
    end
else
    function Launcher.callStaticMethod(className, methodName, args, sig)
        Log.log("don't support callStaticMethod!!!")
        return -1
    end
end

return Launcher