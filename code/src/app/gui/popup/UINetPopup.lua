local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UINetPopup", UIPanel)
M.GUI_FILE_NAME = "csd.01_02_Main.01_02_CommonMiniTipPopUp_1.lua"

M.BINDGUIDATANODE = {
    ["ConfirmButton"] = { varname = "ConfirmButton",onClick = "onConfirmButtonClick"},
    ["ContentText"] = { varname = "ContentText"},
    ["ConfirmText_TT"]={varname="ConfirmText_TT"},
    ["TitleText"]={varname="TitleText"}
}

function M:onCreate()
    M.super.onCreate(self)
end

function M:onInit()
    M.super.onInit(self)
    local   data1=DataManager:getTbxData("Text",Enum.Text.netTile)
    local   data2=DataManager:getTbxData("Text",Enum.Text.netBtn)

    self.TitleText:setString(data1.Desc)
    self.ConfirmText_TT:setString(data2.Desc)
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:setText(txt)
    self.ContentText:setString(txt)
    local size=self.ContentText:getVirtualRendererSize()
    self.ContentText:setContentSize(cc.size(size.width+10,size.height+100))
end

function M:setConfirmCb(cb)
    self.m_confirmCb = cb
end

function M:onConfirmButtonClick(ref)
    if self.m_confirmCb then
        self.m_confirmCb()
    end
    self:closePanel()
end

return M