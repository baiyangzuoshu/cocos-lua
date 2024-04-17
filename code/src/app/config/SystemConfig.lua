

cc.exports.GSystem={}

function GSystem.loadConfig()
    local configData = DataManager:getTbxData("System")
    for k,v in pairs(configData) do
        GSystem[k] = v.Value   
    end

end

GSystem["SystemLanguage"] = Enum.LanguageType.zh_cn

GSystem.loadConfig()