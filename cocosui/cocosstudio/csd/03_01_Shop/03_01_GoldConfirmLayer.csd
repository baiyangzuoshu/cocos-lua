<GameFile>
  <PropertyGroup Name="03_01_GoldConfirmLayer" Type="Layer" ID="9c494c35-aa7b-42c5-9d86-99c9f994f427" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Layer" Tag="43" ctype="GameLayerObjectData">
        <Size X="720.0000" Y="372.0000" />
        <Children>
          <AbstractNodeData Name="UpLeftFit" ActionTag="1953922166" Tag="393" IconVisible="True" RightMargin="720.0000" TopMargin="372.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="Bg" ActionTag="746822008" Tag="394" IconVisible="False" LeftMargin="65.0000" RightMargin="-665.0000" TopMargin="-372.0000" Scale9Enable="True" LeftEage="16" RightEage="16" TopEage="124" BottomEage="124" Scale9OriginX="16" Scale9OriginY="124" Scale9Width="18" Scale9Height="130" ctype="ImageViewObjectData">
                <Size X="600.0000" Y="372.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="365.0000" Y="186.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/01_06_PersonalCenter/frame_038.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="Confirm" ActionTag="-1349404884" Tag="443" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="ConfirmButton" ActionTag="369858104" Tag="438" IconVisible="False" LeftMargin="136.0006" RightMargin="-344.0006" TopMargin="-130.0041" BottomMargin="38.0041" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="260" Scale9Height="70" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="Sound004" ctype="LuaPxButtonObjectData">
                    <Size X="208.0000" Y="92.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <Children>
                      <AbstractNodeData Name="ConfirmText_TT" ActionTag="-1842439366" Tag="440" IconVisible="False" LeftMargin="74.5000" RightMargin="74.5000" TopMargin="27.5000" BottomMargin="27.5000" FontSize="28" LabelText="确认" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="59.0000" Y="37.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="104.0000" Y="46.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="0" G="0" B="0" />
                        <PrePosition X="0.5000" Y="0.5000" />
                        <PreSize X="0.2837" Y="0.4022" />
                        <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="240.0006" Y="84.0041" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/01_07_Sitting/button_022.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/01_07_Sitting/button_022.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/01_07_Sitting/button_022.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                    <MixedColor A="255" R="65" G="65" B="70" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint />
                <Position />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="Cancel" ActionTag="-1133708935" Tag="444" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="CancelButton" ActionTag="1373416149" Tag="439" IconVisible="False" LeftMargin="386.9996" RightMargin="-594.9996" TopMargin="-136.0009" BottomMargin="38.0009" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="148" Scale9Height="76" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="Sound004" ctype="LuaPxButtonObjectData">
                    <Size X="208.0000" Y="98.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <Children>
                      <AbstractNodeData Name="CancelText_TT" ActionTag="1573315095" Tag="441" IconVisible="False" LeftMargin="74.5000" RightMargin="74.5000" TopMargin="30.5000" BottomMargin="30.5000" FontSize="28" LabelText="取消" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="59.0000" Y="37.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="104.0000" Y="49.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.5000" Y="0.5000" />
                        <PreSize X="0.2837" Y="0.3776" />
                        <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" />
                    <Position X="490.9996" Y="38.0009" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/01_06_PersonalCenter/button_026.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/01_06_PersonalCenter/button_026.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/01_06_PersonalCenter/button_026.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                    <MixedColor A="255" R="65" G="65" B="70" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint />
                <Position />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="PurchaseTipsText" ActionTag="-345265172" Tag="36" IconVisible="False" LeftMargin="125.4999" RightMargin="-604.4999" TopMargin="-229.0005" BottomMargin="187.0005" FontSize="32" LabelText="您将花费10000钻购买10000金币" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="479.0000" Y="42.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="364.9999" Y="208.0005" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
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
      </ObjectData>
    </Content>
  </Content>
</GameFile>