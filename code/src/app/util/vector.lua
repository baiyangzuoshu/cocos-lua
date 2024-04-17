local M=class("vector")

function M:ctor()
    self.mdata={}
end

function M:push(v)
    table.insert(self.mdata,v)
end

function M:pop()
    local t={}
    local temp=self.mdata[#self.mdata]
    for i=1,#self.mdata-1,1 do
        table.insert(t,self.mdata[i])
    end
    self.mdata=t

    return temp
end

function M:length()
    return #self.mdata
end

function M:removeByIndex(index)
    local t={}
    local temp
    for i=1,#self.mdata,1 do
        if index==i then
            temp=self.mdata[i]
        else
            table.insert(t,self.mdata[i])
        end
    end
    self.mdata=t

    return temp
end

function M:findByIndex(index)
    return self.mdata[index]
end

return M