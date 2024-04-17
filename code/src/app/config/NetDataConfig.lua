
-- Net.UserAgreement = "https://letsroll.yippeekiyay.com.tw/user_agreement/index.html?lang="

-- Net.PrivacyPolicy = "https://letsroll.yippeekiyay.com.tw/privacy_agreement/index.html?lang="

Net.HttpCmd = {
    Login = "user/login",
    LoginAuto = "user/getConnector",
    SmsCode = "login/smsCodeSend",
    Register = "user/register",
    ModifyPwd = "user/modifyPwd",
    ReCharge = "charge/ios",
    getAccountBindList = "user/getAccountBindList",
    bindAccount  = "user/bindAccount",
    unbindAccount  = "user/unbindAccount",
    removeAccount  = "user/removeAccount",
    ReChargeGoogle="charge/google",

    HodeRequest ="api/pkg/version",
}

local config = require("app.config.NetCodeConfig")

Net.NET_CMD = {}
for k, v in pairs(config) do
    Net.NET_CMD[k] = v.code
end

Net.Code2Protobuf = {}
for _, v in pairs(config) do
    Net.Code2Protobuf[v.code] = { protocolName = v.protocolName, methodName = v.methodName }
end