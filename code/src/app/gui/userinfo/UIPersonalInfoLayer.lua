local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIPersonalInfoLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_06_PersonalCenter.01_06_PersonalInformationLayer.lua"

M.BINDGUIDATANODE = {
    ["HeadFrame"] = { varname = "HeadFrame" },
    ["HeadIcon"] = { varname = "HeadIcon" },
    ["NameText_O"] = { varname = "NicknameText" },
    ["SexIcon"] = { varname = "SexIcon"},
    ["IDNum"] = { varname = "UserID"},
    ["VipImage"] = { varname = "VipImage" },
    ["FansNum"] = { varname = "FansNum" },
    ["ContentText_O"] = { varname = "DescText"},
    ["ContentText_0_TT"] = { varname = "emptyText"},

    ["ModifyButton"] = { varname = "ModifyButton", onClick = "onEditBtnClick" },
    ["Modify"] = { varname = "Modify" },
    ["ModifyBg"] = { varname = "ModifyBg" },

    ["InteractionPopups"] = { varname = "InteractionPopups"},

    ["ModifyNamePanel"] = { varname = "ModifyNamePanel", onEvent = "onModifyNamePanelTouchEvent" },
    ["ModifyPanel"] = { varname = "ModifyPanel", onEvent = "onModifyPanelTouchEvent" },
    ["ModifySignaturePanel"] = { varname = "ModifySignaturePanel", onEvent = "onModifySignaturePanelTouchEvent" },
    ["ModifyHeadPanel"] = { varname = "ModifyHeadPanel", onEvent = "onModifyHeadPanelTouchEvent" },

    ["ModifyHeadTipDotIcon"]={varname="ModifyHeadTipDotIcon"},
    ["ModifyNameTipDotIcon"]={varname="ModifyNameTipDotIcon"},
    ["ModifySexTipDotIcon"]={varname="ModifySexTipDotIcon"},
    ["ModifyTipDotIcon"]={varname="ModifyTipDotIcon"},}

function M:refreshHot()
    self.ModifyHeadTipDotIcon:setVisible(g_HotData:hasHot(Enum.redPointSubcategory.avatarEditButton))
    self.ModifyNameTipDotIcon:setVisible(g_HotData:hasHot(Enum.redPointSubcategory.nicknameEditButton))
    self.ModifySexTipDotIcon:setVisible(g_HotData:hasHot(Enum.redPointSubcategory.sexEditButton))
    self.ModifyTipDotIcon:setVisible(g_HotData:hasHot(Enum.redPointSubcategory.avatarEditButton) 
            or g_HotData:hasHot(Enum.redPointSubcategory.nicknameEditButton) 
            or g_HotData:hasHot(Enum.redPointSubcategory.sexEditButton)
            or g_HotData:hasHot(Enum.redPointSubcategory.avatarList)
        )
end

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.Head))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.HeadBox))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.VipIconTail))

    self:initOutClickableArea()
end

function M:initOutClickableArea()
    local function onOutOfQuickBoxClick()
        self:closePanel()
    end

    UIUtils.addClickableNode(self.InteractionPopups, nil, onOutOfQuickBoxClick)
end

function M:onInit()
    M.super.onInit(self)

    self.Modify:setVisible(false)
    self.ModifyBg:setVisible(false)
    self.mIsEditMode = false
    self.ModifyButton:setBright(true)
	self:refreshHot()
end

function M:onEnter()
    M.super.onEnter(self)

    self:refreshUI()
end

function M:refreshUI()
    
    local userName = g_UserData:getNickName() 

    self.NicknameText:setString(userName)
    Utils.setShortName(self.NicknameText, userName, GSystem.NameLimitNumber)

    self.UserID:setString(g_UserData:getUserId())
    
    local slogan = g_UserData:getSlogan()
    if Utils.isEmptyStr(slogan) then 
        self.DescText:setVisible(false)
        self.emptyText:setVisible(true)
    else
        self.DescText:setVisible(true)
        self.emptyText:setVisible(false)
        self.DescText:setString(slogan)
        self.DescText:setString(Utils.setShortDesc(slogan, 94))
    end
    
    self.FansNum:setString(g_UserData:getMyFansNum())

    local vipLevel = g_UserData:getVipLevel()
    if vipLevel <= 0 then 
        self.VipImage:setVisible(false)
    else
        self.VipImage:setVisible(true)
        local vipData = DataManager:getTbxData("Vip", vipLevel)
        if vipData then 
            self.VipImage:loadTexture(Utils.getIconStr(PlistConfig.Icon.VipIconTail, vipData.VipIcon), ccui.TextureResType.plistType)
        end
    end

    local sex = g_UserData:getSex()
    self.SexIcon:setVisible(true)
    if sex == Enum.SexShowType.Null then 
        self.SexIcon:setVisible(false)
    elseif sex == Enum.SexShowType.Male then 
        self.SexIcon:loadTexture("01_06_PersonalCenter/icon_030.png", ccui.TextureResType.plistType)
    elseif sex == Enum.SexShowType.FeMale then 
        self.SexIcon:loadTexture("01_06_PersonalCenter/icon_031.png", ccui.TextureResType.plistType)
    end

    self.HeadIcon:removeAllChildren()
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    avater:InitTexture(string.utf8len(g_UserData:getUserInfo():getHead())<7,g_UserData:getUserInfo():getHead(),g_UserData:getUserInfo():getUserId())
    self.HeadIcon:addChild(avater)

    self.HeadFrame:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(g_UserData:getHeadBox())), ccui.TextureResType.plistType)
end

function M:onEditBtnClick(ref)
    self.mIsEditMode = not self.mIsEditMode
    self.Modify:setVisible(self.mIsEditMode)
    self.ModifyBg:setVisible(self.mIsEditMode)
    self.ModifyButton:setBright(not self.mIsEditMode)
end

function M:onModifyNamePanelTouchEvent(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        local panel = UIManager:getOrCreatePanel("UIModifyNameLayer")
        if panel then
            panel:showToScene()
            panel:setConfirmCb(
                function()
                    local userName = panel:getTextInput()
                    if Utils.isEmptyStr(userName) then 
                        UIUtils.popToadtByMessageId(Constant.Define.UserNameIsNotNull)
                        DataManager:dispatchMessage(Constant.CustomEvent.CheckUserNameExist)
                        return
                    end
                    if Utils.getStringLength(userName) > GSystem.NameTextLimitNumber then 
                        UIUtils.popToadtByMessageId(Constant.Define.UserNameIsTooLong)
                        DataManager:dispatchMessage(Constant.CustomEvent.CheckUserNameExist)
                        return
                    end
                    local userInfo = {}
                    userInfo.nickname = userName
                    g_UserData:requestModifyUserInfo(userInfo)
                end
            )
        end
		g_HotData:C2S_removeRedPoint(Enum.redPointSubcategory.nicknameEditButton)
    end
end

function M:onModifyPanelTouchEvent(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        local panel = UIManager:getOrCreatePanel("UIModifySexLayer")
        if panel then
            panel:showToScene()
            panel:setConfirmCb(
                function()
                    local sex = panel:getSelectIndex()
                    if sex == g_UserData:getSex() then 
                        UIUtils.popToadtByMessageId(Constant.Define.NoChange)
                        return
                    end 
                    local userInfo = {}
                    userInfo.sex = sex
                    g_UserData:requestModifyUserInfo(userInfo)
                end
            )
        end
		g_HotData:C2S_removeRedPoint(Enum.redPointSubcategory.sexEditButton)
    end
end

function M:onModifySignaturePanelTouchEvent(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        local panel = UIManager:getOrCreatePanel("UIModifyDescLayer")
        if panel then
            panel:showToScene()
            panel:setConfirmCb(
                function()
                    local userDesc = panel:getTextInput()
                    if Utils.isProhibitWord(userDesc) then 
                        UIUtils.popToadtByMessageId(Constant.Define.UserNameIsIllegal)
                        DataManager:dispatchMessage(Constant.CustomEvent.CheckDescError)
                        return
                    end
                    if g_UserData:getSlogan() == userDesc then 
                        DataManager:dispatchMessage(Constant.CustomEvent.ClosePersonalInfoPanel)
                        return
                    end
                    local userInfo = {}
                    userInfo.slogan = userDesc
                    g_UserData:requestModifyUserInfo(userInfo)
                end
            )
        end
    end
end

function M:onModifyHeadPanelTouchEvent(data)
    if data.event == "end" then
        SoundSystemManager:playSound004()
        g_UserData:requestGetAvatrFrameList()
		g_HotData:C2S_removeRedPoint(Enum.redPointSubcategory.avatarEditButton)
    end
end

function M:onAvatarFrameListArrive()
    local panel = UIManager:getOrCreatePanel("UIHeadFrameLayer") 
    if panel then 
        panel:showToScene()
    end
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.UpdateUserInfo, "refreshUI")
    self:doRegEvent(Constant.CustomEvent.onAvatarFrameListArrive, "onAvatarFrameListArrive")
	self:doRegEvent(Constant.CustomEvent.UIPersonalInfoLayer_refreshHot, "refreshHot")
end

return M