
cc.FileUtils:getInstance():setPopupNotify(false)

require "config"
require "cocos.init"

table.print = function()
end

ccpDistance=cc.pGetDistance

cc.Director:getInstance():getOpenGLView():setDesignResolutionSize(720, 500, cc.ResolutionPolicy.FIXED_WIDTH)

function GlobleReloadLua(module_name)
    --local func = assert(load(ch))
    local old_module = _G[module_name]

    package.loaded[module_name] = nil
    return require (module_name)

    -- local new_module = _G[module_name]
    -- if new_module then
    --     for k, v in pairs(new_module) do
    --         old_module[k] = v
    --     end
    -- end

    -- package.loaded[module_name] = old_module


end

local function main()
    local storagePath = cc.FileUtils:getInstance():getWritablePath() .. "download/" 
    local resPath = storagePath.. 'res/'
    local srcPath = storagePath.. 'src/'
    if not (cc.FileUtils:getInstance():isDirectoryExist(storagePath)) then         
        cc.FileUtils:getInstance():createDirectory(storagePath)
        cc.FileUtils:getInstance():createDirectory(resPath)
        cc.FileUtils:getInstance():createDirectory(srcPath)
    end
    local searchPaths = cc.FileUtils:getInstance():getSearchPaths() 
    table.insert(searchPaths, 1, storagePath)  
    table.insert(searchPaths, 2, resPath)
    table.insert(searchPaths, 3, srcPath)
    cc.FileUtils:getInstance():setSearchPaths(searchPaths)
    require("app.MyApp"):createScene()
end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end
