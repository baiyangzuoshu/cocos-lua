local M = {}

M.m_runningScene = nil

function M:runScene(newScene)

    if not newScene then return end

    if self.m_runningScene then
        self.m_runningScene:close()
        self.m_runningScene = nil
    end

    self.m_runningScene = newScene

    self.m_runningScene:run()
end

function M:getRunScene()
    if self.m_runningScene then
        return self.m_runningScene
    end
end

return M