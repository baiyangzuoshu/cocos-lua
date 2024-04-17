local M = class("TaskData")

function M:ctor()
    self.mAllServerHeadList = {}

    self.mDefultHeadIconId = "101001"
end
function M:getDefultHead()
    return self.mDefultHeadIconId
end
function M:addHeadData(url,path)
    self.mAllServerHeadList[url] = path
end

function M:getHeadData(url,userId)
    if self.mAllServerHeadList[url] then
        return  self.mAllServerHeadList[url]
    else
        -- local file = DeviceUtils.getAvatarWritablePath(userId)
        -- if cc.FileUtils:getInstance():isFileExist(file) then

        -- end
        -- -- if condition then
            
        -- -- end
        return ""
    end
end



return M