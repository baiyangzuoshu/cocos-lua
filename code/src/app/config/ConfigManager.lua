local M = {}

local configs = {
    "ProtobufConfig",
    "PlistConfig",
    "SystemConfig",
    "Config",
}

function M:init()
    for i, value in ipairs(configs) do
        cc.exports[value] = require("app.config." .. value)
    end
    ProtobufConfig:init()
end

function M:reloadAllConfig()
    for i, value in ipairs(configs) do
        cc.exports[value]=GlobleReloadLua("app.config." .. value)
    end
    ProtobufConfig:init()
end

function M:initConfigs()
    GSystem.loadConfig()
end

return M