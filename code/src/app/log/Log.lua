cc.exports.Log = {}

local LogConfig = require("app.log.LogConfig")

local default_log_level = LogConfig.default_log_level
local http_log = LogConfig.http_log
local tcp_log = LogConfig.tcp_log

local base_print
if device.platform == "android" then
    base_print = release_print
else
    base_print = print
end

local logHelper = require("app.log.LogHelper").new(base_print, default_log_level, http_log, tcp_log)

function Log.set_default_log_level(level)
    default_log_level = level
    logHelper = require("app.log.LogHelper").new(base_print, level, http_log, tcp_log)
end

function Log.log(fmt, ...)
    logHelper:printDebug(fmt, ...)
end

function Log.info(fmt, ...)
    logHelper:printInfo(fmt, ...)
end

function Log.warn(fmt, ...)
    logHelper:printWarn(fmt, ...)
end

function Log.error(fmt, ...)
    logHelper:printError(fmt, ...)
end

function Log.custom(tag, level, fmt, ...)
    logHelper:printCustom(tag, level, fmt, ...)
end

function Log.print(...)
    logHelper:printArgs(...)
end

function Log.print_http_request(url, json)
    logHelper:printHttpRequest(url, json)
end

function Log.print_http_request(url, json)
    logHelper:printHttpRequest(url, json)
end

function Log.print_http_response(url, json, readyState, status, response)
    logHelper:printHttpResponse(url, json, readyState, status, response)
end

function Log.print_socket_send(id, len, name, data)
    logHelper:printTcpSend(id, len, name, data)
end

function Log.print_socket_recv(id, len, name, data)
    logHelper:printTcpRecv(id, len, name, data)
end

function Log.print_table(data, level)
    logHelper:printTable(data, level)
end