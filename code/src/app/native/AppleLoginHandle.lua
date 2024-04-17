function appLoginCallBackHandle(type,opcode,data,size)
    

    if opcode == 0 or opcode == nil then

    else
        if data == nil then return end 
        local _data = json.decode(data)
        g_LoginData:appleLoginCallBack(1,_data.token,_data.authorizationCode)
    end
end

function handleShareContent(type,opcode,data,size)

end

function faceBookLoginCallBackHandle(type,code,data,length)
    

    if code == 1 then
        local _data = json.decode(data)
        g_LoginData:facebookLoginCallBack(1,_data.token)
    end


end

function lineLoginCallBackHandle(type,code,data,length)
    

    if code == 1 then
        local _data = json.decode(data)
        g_LoginData:lineLoginCallBack(1,_data.token)
    end


end