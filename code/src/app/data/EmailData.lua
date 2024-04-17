local M = class("EmailData")

function M:ctor()
    self.mEmailData = {}
end

local EmailType = {
    Custom_Email = 0,       --自定义邮件
    --Nomal_Email = 1,        --系统邮件(读表)
}

function M:getEmailList()
    return self.mEmailData
end

--引用传递
function M:getEmailByDBId(emailDBId)
    local email = {}
    for _,v in ipairs(self.mEmailData) do 
        if v.emailDbId == emailDBId then 
            email = v
        end
    end
    return email
end

function M:isNomalEmail(emailType)
    if emailType == EmailType.Custom_Email then 
        return false 
    else
        return true 
    end
end

function M:createEmail(v)
    local email = {}
    email.emailDbId = v.mailId
    email.emailState = v.state
    email.emailId = v.templateId
    if self:isNomalEmail(v.templateId) then 
        email.emailInfo = self:createNomalEmail(v)
    else
        email.emailInfo = self:createCustomEmail(v)
    end
    email.emailItem = v.attachment
    table.insert(self.mEmailData, email)
end

function M:createNomalEmail(data)
    local email = {}
    local emailData = DataManager:getTbxData("MailContent", data.templateId)
    if emailData then 
        email.emailTitle = emailData.MailTitle
        email.emailContent = emailData.MailContent
        email.emailSign = emailData.MailSign
        email.emailCreatedTime = data.createdAt
        email.emailExpiredTime = data.expiredAt
        email.emailParam = data.param
    else
        Log.log("未找到id为%s的邮件", tostring(data.templateId))
    end
    return email
end

function M:createCustomEmail(data)
    local email = {}
    email.emailTitle = data.title
    email.emailContent = data.content
    email.emailSign = data.sign
    email.emailCreatedTime = data.createdAt
    email.emailExpiredTime = data.expiredAt
    email.emailParam = data.param or {}
    return email
end

function M:isShowMainEmailHot()
    local   num=0
    local   data=self:getEmailList()
    for _,v in pairs(data) do
        local aState = v.emailState
        if aState == Enum.EmailState.unread or aState == Enum.EmailState.unreceived then 
            num=num+1
        end
    end
    DataManager:dispatchMessage(Constant.CustomEvent.UpdateHotShow,{type=Enum.mainHotType.email,num=num})
end
----------------------------------------网络消息---------------------------------------------
--请求邮箱数据
function M:requestEmailList()
    UIUtils.showLoadingLayer(5,10)

    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_GetEmailList)
end

--回复全部邮件
function M:S2C_EmailList(data)
    UIUtils.closeLoadingLayer()
    
    if not data then return end 

    local emailList = data.list
    self.mEmailData = {}
    if not Utils.isEmptyTable(emailList) then 
        for _,v in ipairs(emailList) do 
            self:createEmail(v)
        end
    end
    
    self:isShowMainEmailHot()
end

--读邮件
function M:requestReadEmail(emailId)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_ReadEmail, {mailId = emailId})
end

--邮件状态变更
function M:S2C_UpdateEmailState(data)
    if not data then return end 

    local email = self:getEmailByDBId(data.mailId)
    if not Utils.isEmptyTable(email) then 
        email.emailState = data.state
        DataManager:dispatchMessage(Constant.CustomEvent.RefreshEmailUI, {state = data.state, items = email.emailItem})
        DataManager:dispatchMessage(Constant.CustomEvent.RefreshEmailData)
    end

    self:isShowMainEmailHot()
end

--领取邮件
function M:requestReciveEmail(emailId)
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_ReciveEmail, { mailId = emailId})
end

function M:S2C_ReciveEmail(data)
    if not data then return end
    
    local email = self:getEmailByDBId(data.mailId)
    if not Utils.isEmptyTable(email) then 
        email.emailState = data.state
        DataManager:dispatchMessage(Constant.CustomEvent.RefreshEmailUI, {state = data.state, items = email.emailItem})
        DataManager:dispatchMessage(Constant.CustomEvent.RefreshEmailData)
    end
    self:isShowMainEmailHot()
end

--一键领取
function M:requestReciveEmailAll()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_ReciveEmailAll)
end

--一键领取回复
function M:S2C_ReciveEmailAll(data)
    if not data then return end
    local list = data.list
    
    if not Utils.isEmptyTable(list) then 
        for _,v in ipairs(list) do 
            local email = self:getEmailByDBId(v.mailId)
            if not Utils.isEmptyTable(email) then 
                email.emailState = v.state
            end
        end
        DataManager:dispatchMessage(Constant.CustomEvent.RefreshEmailData)
    end

    self:isShowMainEmailHot()
end

--一键删除
function M:requestDeleteEmailAll()
    Client:sendMessageByOpCode(Net.NET_CMD.MSG_C2S_DeleteEmailAll)
end

--删除回复
function M:S2C_DeleteEmailAll(data)
    if not data then return end

    local list = data.mailIds
    if not Utils.isEmptyTable(list) then 
        for _,value in ipairs(list) do
            local email = self:getEmailByDBId(value) 
            if not Utils.isEmptyTable(email) then 
                table.removebyvalue(self.mEmailData, email, false)
            end
        end
        DataManager:dispatchMessage(Constant.CustomEvent.RefreshEmailData)
    end
end

--服务器推送新邮件
function M:S2C_NewEmailArrive(data)
    if not data then return end

    local list = data.mail
    
    self:createEmail(list)
    self:isShowMainEmailHot()
    local panel = UIManager:getPanel("UIEmailLayer") 
    if panel then 
        DataManager:dispatchMessage(Constant.CustomEvent.RefreshEmailData)
        return
    end
    DataManager:dispatchMessage(Constant.CustomEvent.NewEmailArrive)
    
end


return M