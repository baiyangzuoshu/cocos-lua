local M = class("FriendInfo")

function M:ctor(friendData)
    self.mNetData = friendData

    self.mUid = friendData.uid
    self.mNickName = friendData.nickname or friendData.name or ""
    self.mSex = friendData.sex
    self.mAvatar = friendData.avatar
    self.mOnlineState = friendData.onlineState
    self.mIsSystemAvatar = friendData.isSystemAvatar
    self.mSlogan = friendData.slogan
    self.mVipLevel = friendData.vipLevel or 0
    self.mFansNum = friendData.fansNum or 0
    self.mAvatarFrame = friendData.avatarFrame
    self.mStatus = friendData.status
    self.mGetHeadCallBack = nil
end

function M:getHeadIcon(CallBack)
    self.mGetHeadCallBack=CallBack
    local headPath = ""
    local loadType = ccui.TextureResType.localType
    if self.mIsSystemAvatar then

        loadType = ccui.TextureResType.plistType
        if self.mGetHeadCallBack then
            headPath=Utils.getIconStr(PlistConfig.Icon.Head, tonumber(self.mAvatar))
            self.mGetHeadCallBack(headPath,loadType)
        end
        
    else
        --getHeadData
        loadType = ccui.TextureResType.localType
        headPath=g_UserHeadIconData:getHeadData(self.mAvatar,self.mUid)
        if headPath == "" then
            Utils.GetServerHeadIcon(self.mUid,self.mAvatar,handler(self,self.doewLoadPngSeccess))
        else
            if self.mGetHeadCallBack then
                self.mGetHeadCallBack(headPath,loadType)
            end
        end
    end
end

function M:doewLoadPngSeccess(task)
    local filepath = task.storagePath
    g_UserHeadIconData:addHeadData(self.mAvatar,filepath)
    local acts = {}
    acts[#acts + 1] = cc.DelayTime:create(0.1)
    acts[#acts + 1] = cc.CallFunc:create(function ()
        if self.mGetHeadCallBack then
            local loadType = ccui.TextureResType.localType
            self.mGetHeadCallBack(filepath,loadType)
        end
    end)

    display.getRunningScene():runAction(cc.Sequence:create(acts))
end

function M:getNetData()
    return self.mNetData
end

function M:getIsSystemAvatar()
    return self.mIsSystemAvatar
end

function M:getFriendUid()
    return self.mUid
end

function M:getNickName()
    return self.mNickName
end

function M:getSex()
    return self.mSex
end

function M:getAvatar()
    return self.mAvatar
end

function M:getOnlineState()
    return self.mOnlineState
end

function M:getSlogan()
    return self.mSlogan
end

function M:getVipLevel()
    return self.mVipLevel
end

function M:getFansNum()
    return self.mFansNum
end

function M:getAvatarFrame()
    return self.mAvatarFrame
end

function M:getStatus()
    return self.mStatus
end

return M