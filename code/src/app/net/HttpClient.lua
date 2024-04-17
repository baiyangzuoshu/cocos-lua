require("cocos.network.NetworkConstants")

local M = {}

function M:sendHttpPostRequest(url, json, callback)
    Log.print_http_request(url, json)

    local xhr = cc.XMLHttpRequest:new()
    xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_JSON
    xhr:setRequestHeader("Content-Type", "application/json")
    xhr:open("POST", url)

    if not callback then
        callback = handler(self, self.postGlobleCallBack)
    end

    xhr:registerScriptHandler(function()
        Log.print_http_response(url, json, xhr.readyState, xhr.status, xhr.response)
        xhr:unregisterScriptHandler()
        Log.print("xhr.readyState:"..xhr.readyState.." xhr.status:"..xhr.status)
        Log.info("xhr.readyState:"..xhr.readyState.." xhr.status:"..xhr.status)

        if tonumber(xhr.readyState)  == 4 and (tonumber(xhr.status)  >= 200 and tonumber(xhr.status) < 207) then
            Log.print("准备回调")
            local response = xhr.response
            callback(response)
        elseif tonumber(xhr.readyState)  == 1 and tonumber(xhr.status)  == 0 then 
            local panel = UIManager:getOrCreatePanel("UIClientErrorTipsLayer_1")
            if panel then 
                local TipTitleText = Utils.getTextByTextId(Enum.Text.TitleText)
                local ConfirmText = Utils.getTextByTextId(Enum.Text.ButtonText)
                local ContentText = Utils.getTextByTextId(Enum.Text.NetErrorContent)
                panel:setText(TipTitleText, ContentText, ConfirmText)
                panel:showToScene()
            end
        end
    end)
    xhr:send(json)
end


function M:sendHttpAvatarRequest(url, callback)
    Log.print_http_request(url, "")

    local xhr = cc.XMLHttpRequest:new()
    xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_JSON

    xhr:open("GET", url)

    if not callback then
        callback = handler(self, self.getGlobleCallBack)
    end

    xhr:registerScriptHandler(function()
        Log.print_http_response(url, "", xhr.readyState, xhr.status, xhr.response)

        if xhr.readyState == 4 and (xhr.status >= 200 and xhr.status < 207) then
            local response = cjson.decode(xhr.response)
            callback(response)
        else
            callback(nil)
        end

        xhr:unregisterScriptHandler()
    end)
    xhr:send()
end

function M:postGlobleCallBack(response)
end

function M:getGlobleCallBack(response)
end

return M