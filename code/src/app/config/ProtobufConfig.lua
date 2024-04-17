local ProtobufUtils = require("app.util.ProtobufUtils")

local protocols = {
    "client",
    "server",
}

local M = {}

function M:init()
    pb.option("enum_as_value")

    for _, name in ipairs(protocols) do

        local path = string.format("pb/%s.pb", name)

        if ProtobufUtils.loadProtocolFile(path) then
            Log.log("protocol [%s] loaded success. ", name)
            else
            Log.warn("protocol [%s] loaded fail.", name)
        end
    end

end

-- function M:reloadProto()
--     pb.option("enum_as_value")

--     for _, name in ipairs(protocols) do

--         local path = string.format("pb/%s.pb", name)

--         if ProtobufUtils.loadProtocolFile(path) then
--             Log.log("protocol [%s] loaded success. ", name)
--             else
--             Log.warn("protocol [%s] loaded fail.", name)
--         end
--     end
-- end

return M