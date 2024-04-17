local M = class("viewBaseScene", cc.Scene)

function M:ctor()
    if self.onCreate then self:onCreate() end
end
function M:onCreate()
    Log.log("view Base Scene")
    if CC_SHOW_FPS then
        cc.Director:getInstance():setDisplayStats(true)
    end
end

function M:onEnter()
end

return M