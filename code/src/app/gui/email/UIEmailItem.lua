local UIPanel = require("app.gui.basegui.UIPanel")

local M = class("UIEmailItem", UIPanel)

M.ITEM_COLUMN = 1

M.CELL_WIDTH = 699
M.CELL_HEIGHT = 138

M.GUI_FILE_NAME = "csd.01_10_Mail.01_10_MailLayer.lua"

M.BINDGUIDATANODE = {
    ["MailPanel"] = { varname = "MailPanel", onEvent = "onEmailTouchEvent" },
    ["MailTitleText_TT"] = { varname = "emailTitle" },
    ["ExpirationTimeText_TT"] = { varname = "emailValidTime" },
    ["ReceiveTimeText_TT"] = { varname = "emailCreatedTime" },
    ["UnreadMail"] = { varname = "UnreadMail" },
    ["ReadMail"] = { varname = "ReadMail" },

    ["Resource"] = { varname = "Resource" },
    ["RescourceIcon_1"] = { varname = "ResourceIcon_1" },
    ["RescourceIcon_2"] = { varname = "ResourceIcon_2" },
    ["RescourceIcon_3"] = { varname = "ResourceIcon_3" },
    ["RescourceIcon_4"] = { varname = "ResourceIcon_4" },
    ["ResourceText"] = { varname = "ResourceText" },
}

function M:onCreate()
    M.super.onCreate(self)

    self:resetRootNodePosition(cc.p(0, 0))
    self:resetRootNodeAnchorPoint(cc.p(0, 0))

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.MiniItem))

    self.MailPanel:setSwallowTouches(false)
end

function M:setTouchCallBack(cb)
    self.mTouchCallBack = cb
end

function M:onEmailTouchEvent(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        if self.mTouchCallBack then 
            self:mTouchCallBack()
        end
    end
end

function M:refreshData(data, idx)
    self:initData(data[idx + 1])

    local titleText = self:getEmailTitle()
    self.emailTitle:setString(Utils.getFormatTitle(titleText))
    self.emailCreatedTime:setString(self:getCreateTimeText())
    self.emailValidTime:setString(self:getValidTimeText())

    --Log.info(tostring(self:getEmailDbId()).."邮件初始状态为"..tostring(self:getEmailState()))
    local state = self:getEmailState()
    if state == Enum.EmailState.unread or state == Enum.EmailState.unreceived then 
        self.ReadMail:setVisible(false)
        self.UnreadMail:setVisible(true)
        self.emailTitle:setOpacity(255)
        self.emailCreatedTime:setOpacity(255)
        self.emailValidTime:setOpacity(255)
    elseif state == Enum.EmailState.received then
        self.ReadMail:setVisible(true)
        self.UnreadMail:setVisible(false)
        self.emailTitle:setOpacity(125)
        self.emailCreatedTime:setOpacity(125)
        self.emailValidTime:setOpacity(125)
    end
    
    local item = self:getEmailItem()
    self.Resource:setVisible(true)
    if Utils.isEmptyTable(item) then 
        self.Resource:setVisible(false)
    else
        self:showItemIcon(item)
    end

end

function M:showItemIcon(item)
    --展示附件
    local len = table.getn(item)
    --重置所有小图片为显示
    for i = 1, 4 do 
        local str = string.format("ResourceIcon_%d", i)
        self[str]:setVisible(true)
        self[str]:removeAllChildren()
    end
    self.ResourceText:setVisible(true)
    --加载附件小图片
    for i = 1, len do 
        if i <= 4 then 
            local str = string.format("ResourceIcon_%d", i)
            local itemData = DataManager:getTbxData("Item", tonumber(item[i].itemId))
            if itemData then 
                local spriteBg = cc.Sprite:createWithSpriteFrameName("01_10_Mail/frame_047.png")
                local sprite = cc.Sprite:createWithSpriteFrameName(Utils.getIconStr(PlistConfig.Icon.MiniItem, itemData.MiniItemIcon))
                local size = spriteBg:getContentSize()
                sprite:setPosition(cc.p(size.width / 2, size.height / 2))
                sprite:setAnchorPoint(cc.p(0.5, 0.5))
                spriteBg:addChild(sprite)
                self[str]:addChild(spriteBg)
                local state = self:getEmailState()
                if state == Enum.EmailState.received then
                    self[str]:setOpacity(125)
                    sprite:setOpacity(125)
                    spriteBg:setOpacity(125)
                else
                    spriteBg:setOpacity(255)
                    sprite:setOpacity(255)
                    self[str]:setOpacity(255)
                end
            end
        end
    end
    --不显示未使用的小图片 
    for i = len + 1, 4 do 
        if i <= 4 then 
            local str = string.format("ResourceIcon_%d", i)
            self[str]:setVisible(false)
        end
    end

    if len <= 4 then 
        self.ResourceText:setVisible(false)
    end
end

function M:getCreateTimeText()
    local timeStr = ""
    local nowTime = Utils.getFormatNowUnixTimeToDate()
    local createTime = Utils.getFormatUnixTimeToDate(self:getEmailCreatedTime())
    if tonumber(nowTime.year) == tonumber(createTime.year) then 
        local dayDiff = tonumber(nowTime.dayAtYear) - tonumber(createTime.dayAtYear)
        if dayDiff >= 1 then
            --显示天
            timeStr = Utils.showFormatText(Enum.Text.DayBefore, dayDiff)
        else
            --显示小时
            local hourDiff = tonumber(nowTime.hour) - tonumber(createTime.hour)
            if hourDiff < 1 then 
                hourDiff = 1
            end
            timeStr = Utils.showFormatText(Enum.Text.HourBefore, hourDiff)
        end
    end

    return timeStr
end

function M:getValidTimeText()
    local timeStr = ""
    if self:getEmailExpiredTime() ~= -1 then 
        local nowTime = Utils.getFormatNowUnixTimeToDate()
        local validTime = Utils.getFormatUnixTimeToDate(self:getEmailExpiredTime())
        if tonumber(nowTime.year) == tonumber(validTime.year) then
            local dayDiff = tonumber(validTime.dayAtYear) - tonumber(nowTime.dayAtYear)
            if dayDiff >= 1 then
                --显示天
                timeStr = Utils.showFormatText(Enum.Text.DayAfter, dayDiff)
            else
                --显示小时
                local hourDiff = tonumber(validTime.hour) - tonumber(nowTime.hour)
                if hourDiff < 1 then 
                    hourDiff = 1
                end
                timeStr = Utils.showFormatText(Enum.Text.HourAfter, hourDiff)
            end
        else
            --只处理一年内得
            local yearDiff = tonumber(validTime.year) - tonumber(nowTime.year) 
            if yearDiff == 1 then 
                local validYearDay = tonumber(validTime.dayAtYear)
                local nowYearDay = tonumber(nowTime.dayAtYear)
                local yearDays = 365
                if tonumber(nowTime.year) % 400 == 0 then 
                    yearDays = 366
                else
                    if tonumber(nowTime.year) % 4 == 0 and not (tonumber(nowTime.year) % 100 == 0) then
                        yearDays = 366
                    else
                        yearDays = 365
                    end
                end
                timeStr = Utils.showFormatText(Enum.Text.DayAfter, yearDays - nowYearDay + validYearDay)
            end
        end
    end
    return timeStr
end

function M:initData(data)
    self.mdata = data
    self.mEmailDbId = data.emailDbId
    self.mEmailId = data.emailId
    self.mEmailInfo = data.emailInfo
    self.mEmailContent = self.mEmailInfo.emailContent
    self.mEmailItem = data.emailItem
    self.mEmailSign = self.mEmailInfo.emailSign
    self.mEmailTitle = self.mEmailInfo.emailTitle
    self.mEmailCreatedTime = self.mEmailInfo.emailCreatedTime
    self.mEmailExpiredTime = self.mEmailInfo.emailExpiredTime
    self.mEmailState = data.emailState
    self.mEmailParam = self.mEmailInfo.emailParam
end

function M:getEmailData()
    return self.mdata
end

function M:getEmailDbId()
    return self.mEmailDbId
end

function M:getEmailId()
    return self.mEmailId
end

function M:getEmailInfo()
    return self.mEmailInfo
end

function M:getEmailTitle()
    return self.mEmailTitle
end

function M:getEmailContent()
    return self.mEmailContent
end

function M:getEmailCreatedTime()
    return self.mEmailCreatedTime
end

function M:getEmailExpiredTime()
    return self.mEmailExpiredTime
end

function M:getEmailSign()
    return self.mEmailSign
end

function M:getEmailItem()
    return self.mEmailItem
end

function M:getEmailState()
    return self.mEmailState
end

function M:getEmailParam()
    return self.mEmailParam
end

function M:onCleanup()
    M.super.onCleanup(self)
end

return M