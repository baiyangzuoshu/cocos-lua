<GameFile>
  <PropertyGroup Name="01_10_DeleteConfirmLayer" Type="Layer" ID="8a84f9fd-449a-4b3a-b485-1e2212e92cb0" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Layer" Tag="211" ctype="GameLayerObjectData">
        <Size X="720.0000" Y="378.0000" />
        <Children>
          <AbstractNodeData Name="Bg" ActionTag="-1022136236" Tag="223" IconVisible="True" RightMargin="720.0000" TopMargin="378.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="Bg_1" ActionTag="-1751614548" Tag="585" IconVisible="False" LeftMargin="81.0000" RightMargin="-639.0000" TopMargin="-378.0000" Scale9Enable="True" LeftEage="16" RightEage="16" TopEage="124" BottomEage="124" Scale9OriginX="16" Scale9OriginY="124" Scale9Width="18" Scale9Height="130" ctype="ImageViewObjectData">
                <Size X="558.0000" Y="378.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="360.0000" Y="189.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/01_06_PersonalCenter/frame_038.png" Plist="" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint />
            <Position />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="Middle" ActionTag="144664405" Tag="656" IconVisible="True" RightMargin="720.0000" TopMargin="378.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="DeleteConfirmText_1_TT" ActionTag="734645499" Tag="657" IconVisible="False" LeftMargin="110.0000" RightMargin="-610.0000" TopMargin="-282.0000" BottomMargin="198.0000" IsCustomSize="True" FontSize="32" LabelText="确认删除所有已读邮件么？" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="500.0000" Y="84.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="360.0000" Y="240.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="DeleteConfirmText_2_TT" ActionTag="23226479" Tag="658" IconVisible="False" LeftMargin="274.4997" RightMargin="-445.4997" TopMargin="-186.0000" BottomMargin="154.0000" FontSize="24" LabelText="删除后无法恢复" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="171.0000" Y="32.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="359.9997" Y="170.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="Confirm" ActionTag="-2095060714" Tag="745" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="ConfirmButton" ActionTag="1567645970" Tag="685" IconVisible="False" LeftMargin="136.0006" RightMargin="-344.0006" TopMargin="-133.0041" BottomMargin="35.0041" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="178" Scale9Height="76" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="Sound004" ctype="LuaPxButtonObjectData">
                    <Size X="208.0000" Y="98.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="240.0006" Y="84.0041" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/01_10_Mail/button_034.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/01_10_Mail/button_034.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/01_10_Mail/button_034.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                    <MixedColor A="255" R="65" G="65" B="70" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="ConfirmText_TT" ActionTag="-415222935" Tag="684" IconVisible="False" LeftMargin="209.5000" RightMargin="-268.5000" TopMargin="-102.5000" BottomMargin="65.5000" FontSize="28" LabelText="确认" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="59.0000" Y="37.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="239.0000" Y="84.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint />
                <Position />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="Cancel" ActionTag="2093306445" Tag="744" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="CancelButton" ActionTag="1444914431" Tag="683" IconVisible="False" LeftMargin="386.0000" RightMargin="-594.0000" TopMargin="-133.0009" BottomMargin="35.0009" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="178" Scale9Height="76" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="Sound004" ctype="LuaPxButtonObjectData">
                    <Size X="208.0000" Y="98.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="490.0000" Y="84.0009" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/01_10_Mail/button_035.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/01_10_Mail/button_035.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/01_10_Mail/button_035.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                    <MixedColor A="255" R="65" G="65" B="70" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="CancelText_TT" ActionTag="-991354045" Tag="682" IconVisible="False" LeftMargin="460.5000" RightMargin="-519.5000" TopMargin="-102.5000" BottomMargin="65.5000" FontSize="28" LabelText="取消" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="59.0000" Y="37.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="490.0000" Y="84.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint />
                <Position />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint />
            <Position />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>