local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIShopBuyConfirmLayer", UIPanel)

M.GUI_FILE_NAME = "csd.03_01_Shop.03_01_GoldConfirmLayer.lua"

M.BINDGUIDATANODE = {
    ["ConfirmButton"] = {varname = "ConfirmButton", onClick = "onClickConfirmBtn"},
    ["CancelButton"] = {varname = "CancelButton", onClick = "onClickCancelBtn"},

    ["FailText_TT"] = {varname = "FailText"},

    ["PurchaseTipsText"] = {varname = "PurchaseTipsText"},
}

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)
end

function M:onInit()
    M.super.onInit(self)

    self.FailText:setVisible(false)
    self.PurchaseTipsText:setVisible(true)
end

function M:setPurchaseTipsText(text)
    self.PurchaseTipsText:setString(text)
end

function M:setCancelCb(cb)
    self.m_cancelCb = cb
end

function M:setConfirmCb(cb)
    self.m_confirmCb = cb
end

function M:onClickCancelBtn(ref)
    if self.m_cancelCb then
        self.m_cancelCb()
    end
    self:closePanel()
end

function M:onClickConfirmBtn(ref)
    if self.m_confirmCb then
        self.m_confirmCb()
    end
    self:closePanel()
end


return M