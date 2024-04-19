-- 新建一个 table，包含 CreateCustomNode 和 GetBaseType 方法。
local container = {}

container.begin = {}
container.down = {}
container.clickEffect = ""

-- 新建根节点 Node，目前这个方法的名字为固定的，必须为 CreateCustomNode。
-- 方法的最后一句必须是一个 return 语句，把新建的结点返回。
function container.CreateCustomNode()

    local btnScale = 1
    local btnColor = { r = 0, g = 0, b = 0 }
    local CustomButton = ccui.Button:create()
    CustomButton:ignoreContentAdaptWithSize(false)
    CustomButton:loadTextureNormal("Default/Button_Normal.png", 0)
    CustomButton:loadTexturePressed("Default/Button_Press.png", 0)
    CustomButton:loadTextureDisabled("Default/Button_Disable.png", 0)
    CustomButton:setTitleFontSize(14)
    CustomButton:setTitleText("")
    CustomButton:setTitleColor({ r = 65, g = 65, b = 70 })
    CustomButton:setScale9Enabled(true)
    CustomButton:setCapInsets({ x = 15, y = 11, width = 16, height = 14 })
    CustomButton:setLayoutComponentEnabled(true)
    CustomButton:setName("CustomButton")
    --container.begin.scale = CustomButton:getScale()
    --container.begin.textColor = CustomButton:getTitleColor()
    --table.print(container.begin.textColor)
    CustomButton.downscale = CustomButton:getScale()
    CustomButton.textColor = CustomButton:getTitleColor()

    CustomButton:setTag(2)
    CustomButton:setCascadeColorEnabled(true)
    CustomButton:setCascadeOpacityEnabled(true)
    CustomButton.begin = {}
    CustomButton.down = {}

    CustomButton:addTouchEventListener(function(ref, type)
        if type == 0 then
            --data.event = "begin"
            btnScale = ref:getScale()
            btnColor = ref:getTitleColor()
            --table.print(container.down.textColor)
            ref:setScale(ref.downscale)
            ref:setTitleColor(ref.downtextColor)

            if string.len(ref.clickEffect) > 0 then
                SoundSystemManager:playEffect("music/soundeffect/" .. ref.clickEffect .. ".mp3")
            end

        elseif type == 1 then
            --data.event = "move"
            --CustomButton:setScale(container.down.scale)
            --CustomButton:setTitleColor(container.down.textColor)
        elseif type == 2 then
            --data.event = "end"
            ref:setScale(btnScale)
            --local _color = 
            ref:setTitleColor(btnColor)
        else
            --data.event = "canscel"
            ref:setScale(btnScale)
            ref:setTitleColor(btnColor)
        end

    end)
    return CustomButton
end

function container.GetDownScele(root)
    if not root.beginscale then
        root.beginscale = root:getScale()
    end

    if not root.downscale then
        root.downscale = root:getScale()
    end

    return root.downscale
end

function container.SetDownScele(root, scale)
    root.downscale = scale
end

function container.GetDownColor(root)
    if not root.downtextColor then

        root.downtextColor = root:getTitleColor()

    end
    return root.downtextColor

end

function container.SetDownColor(root, color)
    root.downtextColor = color
end

function container.GetClickEffect(root)
    if not root.clickEffect then
        root.clickEffect = ""
    end
    return root.clickEffect
end

function container.SetClickEffect(root, effect)
    root.clickEffect = effect
end


-- 返回该插件所扩展的基础类型。
function container.GetBaseType()
    return 'Button'
end

-- 返回这个包含 CreateCustomNode 和 GetBaseType 方法的表。
return container