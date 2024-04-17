local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIHeadFrameCell", UIPanel)

M.GUI_FILE_NAME = "csd.01_06_PersonalCenter.01_06_HeadSittingCell.lua"

M.BINDGUIDATANODE = {
    ["HeadPanel"] = { varname = "HeadPanel", onEvent = "onHeadFrameTouchEvent" },

    ["Head"] = { varname = "Head" },
    ["CameraButton"] = { varname = "CameraButton", onClick = "OnCameraBtnClick" },
    ["HeadIcon"] = { varname = "HeadIcon" },

    ["HeadFrame"] = { varname = "HeadFrame" },
    ["HeadFrameIcon"] = { varname = "HeadFrameIcon" },
    ["HeadFrameTimeIcon"] = { varname = "HeadFrameTimeIcon" },

    ["SelectedImage"] = { varname = "Selected" },
    ["SelecedIcon"] = { varname = "SelecedIcon" },
}

function M:onCreate()
    M.super.onCreate(self)

    self:setShadeShowModel(false)

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.Head))
    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.HeadBox))

    self:resetRootNodePosition(cc.p(0, 0))
    self:resetRootNodeAnchorPoint(cc.p(0, 0))

    self.HeadPanel:setSwallowTouches(false)

    self.mAllNodes = {
        self.Head,
        self.HeadFrame
    }

    self.SelecedIcon:setVisible(false)
end

function M:onlyShowNode(showNode)
    for _ , v in pairs(self.mAllNodes) do 
        if showNode == v then 
            v:setVisible(true)
        else
            v:setVisible(false)
        end
    end
end

function M:getItemInfo()
    return self.mItemInfo
end

function M:setItemInfo(itemInfo)
    self.mItemInfo = itemInfo
    self:refreshItemInfo()
end

function M:setTouchCallBack(cb)
    self.mTouchCallBack = cb
end

function M:setItemSelect(isVisible)
    self.Selected:setVisible(isVisible)
end

function M:onHeadFrameTouchEvent(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        if self.mTouchCallBack then 
            self:mTouchCallBack()
        end
    end
end

function M:OnCameraBtnClick(ref)
    --UIUtils.popToast("暂未开放")
    Log.log("暂未开放")
end

function M:refreshItemInfo()
    local showType = Enum.HeadFrameTab.UnKnow
    if self.mItemInfo then
        showType = self.mItemInfo:getHeadFrameType()
    end

    if Enum.HeadFrameTab.UnKnow == showType then
        
    elseif Enum.HeadFrameTab.Head == showType then
        self:showHead()
    elseif Enum.HeadFrameTab.HeadFrame == showType then
        self:showHeadFrame()
    end
end

function M:showHead()
    self:onlyShowNode(self.Head)
    if not self.mItemInfo then return end

    local netData = self.mItemInfo:getNetData()

    if netData.isCamera then 
        self.HeadIcon:setVisible(false)
        self.CameraButton:setVisible(true)
    else
        self.HeadIcon:setVisible(true)
        self.CameraButton:setVisible(false)

        self.HeadIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.Head, tonumber(netData.id)), ccui.TextureResType.plistType)
    end

    if netData.id == tonumber(g_UserData:getHead()) then 
        self.SelecedIcon:setVisible(true)
    else
        self.SelecedIcon:setVisible(false)
    end
end

function M:showHeadFrame()
    self:onlyShowNode(self.HeadFrame)
    if not self.mItemInfo then return end

    local netData = self.mItemInfo:getNetData()

    self.HeadFrameIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.HeadBox, tonumber(netData.id)), ccui.TextureResType.plistType)

    if netData.id == tonumber(g_UserData:getHeadBox()) then 
        self.SelecedIcon:setVisible(true)
    else
        self.SelecedIcon:setVisible(false)
    end

    if netData.expireTime ~= -1 then 
        self.HeadFrameTimeIcon:setVisible(true)
    else
        self.HeadFrameTimeIcon:setVisible(false)
    end
end

return M