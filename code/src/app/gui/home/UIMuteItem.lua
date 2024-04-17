local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIMuteItem", UIPanel)

M.ITEM_COLUMN = 1

M.CELL_WIDTH = 538
M.CELL_HEIGHT = 124

M.GUI_FILE_NAME = "csd.02_04_DiceBaby.02_04_ReleaseShutupCell.lua"

M.BINDGUIDATANODE = {

    ["SexIcon"] = { varname = "SexIcon" },
    ["IDNum"] = { varname = "IDNum" },
    ["NameText_O"] = { varname = "NameText" },
    ["HeadIcon"] = { varname = "HeadIcon" },
    ["HeadPanel"] = { varname = "HeadPanel", onEvent = "onHeadPanelTouchEvent" },
    ["VipImage"] = { varname = "VipImage" },
    ["ReleaseShutupButton"] = { varname = "ReleaseShutupButton", onEvent = "onReleaseShutupButtonClick" },

}

function M:onCreate()
    M.super.onCreate(self)
    self:resetCenterPosition()

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.Head))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.HeadBox))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.VipIconTail))
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:refreshData(data,idx)
    self.idx = idx
    self.playerData = data
    self.uid = data.uid
    
    self.SexIcon:setVisible(false)

    self.IDNum:setString(data.uid)
    self.NameText:setString(data.name)

    self.HeadIcon:removeAllChildren()
    local avater = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")
    avater:InitTexture(string.utf8len(data.avatar)<7,data.avatar,data.uid)
    self.HeadIcon:addChild(avater)

    local vipLevel = data.vipLevel
    if vipLevel <= 0 then
        self.VipImage:setVisible(false)
    else
        self.VipImage:setVisible(true)
        local vipData = DataManager:getTbxData("Vip", vipLevel)
        if vipData then 
            self.VipImage:loadTexture(Utils.getIconStr(PlistConfig.Icon.VipIconTail, vipData.VipIcon), ccui.TextureResType.plistType)
        end
    end

    Utils.showFormatVip(self.NameText, self.VipImage)
end

function M:onHeadPanelTouchEvent(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        local panel = UIManager:getOrCreatePanel("UIOtherPersonInfoLayer")
        if panel then
            self.playerData.nickname = self.playerData.name
            self.mFriendInfo = require("app.bean.FriendInfo").new(self.playerData)

            panel:setFriendInfo(self.mFriendInfo)
            panel:showToScene()
        end
    end
end

function M:onReleaseShutupButtonClick(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        if not g_SieveData:getAudioIsSound() then
            g_SieveData:removeMuteMember(self.uid)
            if #g_SieveData:getmMuteList() > 0 then
                Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sAvatarInfo, {uids=g_SieveData:getmMuteList()})
            else
                DataManager:dispatchMessage(Constant.CustomEvent.DiceBabyShutupPopUp_refreshData)
            end
            return
        end
        if kz.IAgoraRoomManager:instance():muteRemoteAudioStream(tonumber(self.uid),false) == 0 then
            g_SieveData:removeMuteMember(self.uid)
            if #g_SieveData:getmMuteList() > 0 then
                Client:sendMessageByOpCode(Net.NET_CMD.MSG_c2sAvatarInfo, {uids=g_SieveData:getmMuteList()})
            else
                DataManager:dispatchMessage(Constant.CustomEvent.DiceBabyShutupPopUp_refreshData)
            end
        end
    end
end


function M:regAllEventMsg()
    M.super.regAllEventMsg(self)
end

return M