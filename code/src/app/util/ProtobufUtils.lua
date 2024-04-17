local ProtobufUtils = {}

function ProtobufUtils.loadProtocolFile(path)
    local ret = false

    if cc.FileUtils:getInstance():isFileExist(path) then
        ret = ProtobufUtils.loadProtocolContent(cc.FileUtils:getInstance():getStringFromFile(path))
    else
        Log.warn("path: %s not exist.", path)
    end

    return ret
end

function ProtobufUtils.loadProtocolContent(content)
    return pb.load(content)
end
function ProtobufUtils.loadProtocolContentByProtoc(content)
    local protoc = require("app.util.protoc")
    return ProtobufUtils.loadProtocolContent(protoc:compile(content))
end

function ProtobufUtils.decode(name, data)
    return pb.decode(name, data)
end

function ProtobufUtils.encode(name, data)
    return pb.encode(name, data or {})
end

return ProtobufUtils