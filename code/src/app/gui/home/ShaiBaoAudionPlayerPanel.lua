
local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("ShaiBaoAudionPlayerPanel", UIPanel)

M.GUI_FILE_NAME = "csd.02_04_DiceBaby.02_04_AudioHeadCell.lua"

M.BINDGUIDATANODE = {
    ["AudioHeadLoadingBar_2"]={varname="AudioHeadLoadingBar_2"},
    ["AudioHead"]={varname="AudioHead"},
    ["AudioHeadPanel_2"]={varname="AudioHeadPanel_2",onEvent="onTouchAudioHeadPanel"},
    ["AudioHeadButton_2"]={varname="AudioHeadButton_2"},
}


function M:onCreate()
    M.super.onCreate(self)
    self.mAvatar = UIManager:createPanelOnly("app.gui.widget.AvatarWidget")

    self.AudioHead:addChild(self.mAvatar)

    self.mVoice = 0
    self.mMaxVoice = 255
    self.MuteTimes = 0
    self.AudioHeadLoadingBar_2:setPercent(self.mVoice/self.mMaxVoice*100)

    self.mAvatar:setCascadeOpacityEnabled(true)
    self._rootNode:setCascadeOpacityEnabled(true)
    self.AudioHeadButton_2:setCascadeOpacityEnabled(true)
    self._rootNode:setOpacity(0)
    self.AudioHeadButton_2:setVisible(false)
end
function M:setHeadIcon(iconPath,uid)
    self.uid = uid
    self.hideTime = (1.5 + GSystem.DiceBabyHeadReservedTime /1000) * 60
    local avaterLink = string.lower(iconPath)
    local  isSystem = false
    if not string.find(avaterLink,"http") then
        isSystem = true
    end
    self.mAvatar:InitTexture(isSystem,iconPath,uid)
end

function M:getUid()
    return self.uid
end

function M:OnUpdate(dt)
    if self.hideTime <= 0 and self.uid ~= -1 then
        self.uid = -1
        -- self:setVisible(false)
        self._rootNode:runAction(cc.Sequence:create(cc.FadeOut:create(GSystem.DiceBabyHeadVanishTime / 1000),cc.CallFunc:create(function ()
            self.AudioHeadButton_2:setVisible(false)
        end)))
    elseif self.hideTime > 0 then
        self.hideTime = self.hideTime - 1
    end
end

function M:setVoice(voice,uid,needAct)
    self.uid = uid
    self.hideTime = (1.5 + GSystem.DiceBabyHeadReservedTime /1000) * 60
    self.mVoice=voice
    self.AudioHeadLoadingBar_2:setPercent(self.mVoice/self.mMaxVoice*100)
    if needAct then
        self._rootNode:runAction(cc.Sequence:create(cc.FadeIn:create(GSystem.DiceBabyHeadAppearTime / 1000),cc.CallFunc:create(function ()
            self.AudioHeadButton_2:setVisible(true)
        end)))
    end
end

function M:onTouchAudioHeadPanel(data)
    if data.event == "end" then
        -- if tonumber(self.uid) == -1 then
        --     return
        -- end
        -- if self:MuteAudio(self.uid,true) then--true 禁言
        --     g_SieveData:addMuteMember(self.uid)
        -- end
    end
end

function M:MuteAudio(uid,mute)
    if self.MuteTimes < 3 then
        if kz.IAgoraRoomManager:instance():muteRemoteAudioStream(tonumber(uid),mute) == 0 then
            self.MuteTimes = 0
            return true
        else
            self:MuteAudio(uid,mute)
        end
    else
        self.MuteTimes = 0
        return false
    end
end

return M