local M = class("BaseScene")

function M:ctor()
    self.mName = "BaseScene"

    self.mAllPanel = {}
end

function M:getSceneName()
    if self.mName then
        return self.mName
    end
end

function M:close()
    for name, panel in pairs(self.mAllPanel) do
        if panel then
            UIManager:closePanel(panel)
        end
    end
end

function M:run()
end

function M:removePanel(name, panel)
    self.mAllPanel[name] = nil
end

function M:addPanel(name, panel)
    self.mAllPanel[name] = panel
end

return M