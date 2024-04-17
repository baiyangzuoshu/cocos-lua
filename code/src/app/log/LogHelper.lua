local serpent = require("app.log.serpent")

local LogType = {
    DEBUG = 0,
    INFO = 1,
    WARN = 2,
    ERROR = 3,
}

local LogHelper = class("LogHelper")

function LogHelper:ctor(printFunc, level, http, tcp)

    self.mPrintFunc = printFunc
    self.mDefaultLogLevel = level

    self.mLogMethod = {}

    for _, v in pairs(LogType) do
        self:registerLog(v, v >= level)
    end

    self:registerHttpLog(http)
    self:registerSocketLog(tcp)

    setmetatable(self.mLogMethod, {
        __index = function(mytable, level)
            local ret
            if self.mDefaultLogLevel > level then
                ret = function() end
            else
                ret = function(tag, fmt, ...)
                    self.mPrintFunc(string.format("[%s]", string.upper(tag)), string.format(fmt, ...))
                end
            end
            return ret
        end
    })

end

function LogHelper:registerLog(methodKey, state)
    if state then
        self.mLogMethod[methodKey] = function(tag, fmt, ...)
            self:print(tag, fmt, ...)
        end
    else
        self.mLogMethod[methodKey] = function(tag, fmt, ...) end
    end
end

function LogHelper:registerHttpLog(state)
    if state then
        self.mLogMethod["HttpRequest"] = function(url, json)
            self:printNet("HTTP_REQUEST", { url = url, jsonData = json })
        end

        self.mLogMethod["HttpResponse"] = function(url, json, readyState, status, response)
            self:printNet("HttpResponse", { url = url, jsonData = json, readyState = readyState, status = status, response = response })
        end
    else
        self.mLogMethod["HttpRequest"] = function(url, json) end

        self.mLogMethod["HttpResponse"] = function(url, json, readyState, status, response) end
    end
end

function LogHelper:registerSocketLog(state)
    if state then
        self.mLogMethod["TcpRecv"] = function(id, size, name, message)
            self:printNet("TCP_RECV", { id = id, size = size, name = name, message = message })
        end

        self.mLogMethod["TcpSend"] = function(id, size, name, message)
            self:printNet("TCP_SEND", { id = id, size = size, name = name, message = message })
        end
    else
        self.mLogMethod["TcpRecv"] = function(id, size, name, message) end
        self.mLogMethod["TcpSend"] = function(id, size, name, message) end
    end
end

function LogHelper:print(tag, fmt, ...)
    self.mPrintFunc(string.format("[%s]", string.upper(tag)), string.format(fmt, ...))
end

function LogHelper:printNet(tag, data)
    if 4407==data.id then
        return
    end
    
    self.mPrintFunc()

    local date=os.date("%Y-%m-%d %H:%M:%S")
    self.mPrintFunc(string.upper(date.."  [NET:" .. tag .. "]"))
    self.mPrintFunc(serpent.block(data))

    self.mPrintFunc()
end

function LogHelper:printDebug(fmt, ...)
    self.mLogMethod[LogType.DEBUG]("DEBUG", fmt, ...)
end

function LogHelper:printInfo(fmt, ...)
    self.mLogMethod[LogType.INFO]("INFO", fmt, ...)
end

function LogHelper:printWarn(fmt, ...)
    self.mLogMethod[LogType.WARN]("WARN", fmt, ...)
    self.mLogMethod[LogType.WARN]("WARN", debug.traceback("", 2))
end

function LogHelper:printError(fmt, ...)
    self.mLogMethod[LogType.ERROR]("ERR", fmt, ...)
    self.mLogMethod[LogType.ERROR]("ERR", debug.traceback("", 2))
end

function LogHelper:printCustom(tag, level, fmt, ...)
    self.mLogMethod[level](tag, fmt, ...)
end

function LogHelper:printHttpRequest(url, json)
    self.mLogMethod["HttpRequest"](url, json)
end

function LogHelper:printHttpResponse(url, json, readyState, status, response)
    self.mLogMethod["HttpResponse"](url, json, readyState, status, response)
end

function LogHelper:printTcpSend(id, size, name, data)
    self.mLogMethod["TcpSend"](id, size, name, data)
end

function LogHelper:printTcpRecv(id, size, name, data)
    self.mLogMethod["TcpRecv"](id, size, name, data)
end

function LogHelper:printArgs(...)
    if self.mDefaultLogLevel > LogType.DEBUG then
        return
    end
    self.mPrintFunc()
    self.mPrintFunc(string.upper("[DEBUG]"), ...)
    self.mPrintFunc()
end

function LogHelper:printTable(data, level)
    level = level or LogType.DEBUG

    if self.mDefaultLogLevel > level then
        return
    end

    self.mLogMethod[level]("Table", serpent.block(data))
end

return LogHelper