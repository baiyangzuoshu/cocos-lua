-- 与原生通信管理类

local M = {}

local mMessageQueue = {}

function M:onUpdate(dt)
    if next(mMessageQueue) == nil then
        return
    end

    for _, message in ipairs(mMessageQueue) do
        self:handleMessage(message.opcode, message.resultCode, message.data)
    end

    mMessageQueue = {}
end

function M:addOperatorMessage(opcode, resultCode, data)
    mMessageQueue[#mMessageQueue + 1] = { opcode = opcode, resultCode = resultCode, data = data }
end

function M:handleMessage(opcode, resultCode, data)
    Log.info("------NativeBridgeManager-----------handleMessage: ", opcode, resultCode,data)      
    if opcode==1001 then  --google登錄返回
        g_LoginData:googleLoginCallBack(resultCode,data)

    elseif opcode == 1 then   --google支付回調
        Log.info("支付數據回調")
      --------NativeBridgeManager-----------handleMessage: 	1	1	{"com.yippeekiyay.letsroll.tier_5":"¥33.28","com.yippeekiyay.letsroll.tier_20":"¥133.33","com.yippeekiyay.letsroll.tier_10":"¥66.63","com.yippeekiyay.letsroll.tier_50":"¥333.43","com.yippeekiyay.letsroll.tier_60":"¥666.92","com.yippeekiyay.letsroll.tier_2":"¥13.27"}
      if resultCode==1 then
        g_StoreData:getGooglePayDataBack(data)
      end
      
    elseif opcode == 2 then   --google支付回調
        if resultCode == 1 then
            --胜利
            local _data = cjson.decode(data)
            g_UserData:requestRecharge(_data)
        else
            --失败
        end
    elseif opcode == 5 then  --android facebook login    
        if resultCode ==1 then
            local _data = json.decode(data)
            g_LoginData:facebookLoginCallBack(1,_data.token)
        end
    elseif opcode == 1002 then --需要提示玩家打开麦克风
        DataManager:dispatchMessage(Constant.CustomEvent.TipPlayerOpenAudio)
    elseif opcode == 1003 then --打开了麦克风 如果玩家打开麦克风 则 再次打开
        DataManager:dispatchMessage(Constant.CustomEvent.SeccessOpenAudio)
    elseif opcode == 1004 then --line登录返回
        local _data = json.decode(data)
        g_LoginData:lineLoginCallBack(resultCode,_data.token)
    end

end



return M