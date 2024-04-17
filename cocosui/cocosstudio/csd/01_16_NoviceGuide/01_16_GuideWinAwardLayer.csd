<GameFile>
  <PropertyGroup Name="01_16_GuideWinAwardLayer" Type="Layer" ID="a14ac4d6-e410-47eb-9637-276e66634a39" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Layer" Tag="407" ctype="GameLayerObjectData">
        <Size X="720.0000" Y="1280.0000" />
        <Children>
          <AbstractNodeData Name="Middle" ActionTag="653400920" Tag="559" IconVisible="True" LeftMargin="360.0000" RightMargin="360.0000" TopMargin="640.0000" BottomMargin="640.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="Bg_1" ActionTag="-2013564453" Tag="69" IconVisible="False" LeftMargin="-258.0000" RightMargin="-258.0000" TopMargin="-18.0000" BottomMargin="-178.0000" Scale9Enable="True" LeftEage="170" RightEage="170" TopEage="64" BottomEage="64" Scale9OriginX="170" Scale9OriginY="64" Scale9Width="176" Scale9Height="68" ctype="ImageViewObjectData">
                <Size X="516.0000" Y="196.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position Y="-80.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/03_08_NewWelfare/frame_100.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="WinAwardSprite_1" ActionTag="-281054342" Tag="585" IconVisible="False" LeftMargin="-360.0000" RightMargin="-360.0000" TopMargin="-416.0000" BottomMargin="-126.0000" ctype="SpriteObjectData">
                <Size X="720.0000" Y="542.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position Y="145.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/01_16_NoviceGuidance/picture_106.png" Plist="" />
                <BlendFunc Src="1" Dst="771" />
              </AbstractNodeData>
              <AbstractNodeData Name="WinAwardSprite_2_SVT" ActionTag="1344855099" Tag="586" IconVisible="False" LeftMargin="-293.0000" RightMargin="-293.0000" TopMargin="-99.0000" BottomMargin="-55.0000" ctype="SpriteObjectData">
                <Size X="586.0000" Y="154.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position Y="22.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/01_16_NoviceGuidance/picture_107_zh_CN.png" Plist="" />
                <BlendFunc Src="1" Dst="771" />
              </AbstractNodeData>
              <AbstractNodeData Name="AwardContentNode" ActionTag="-303709627" Tag="96" IconVisible="True" LeftMargin="-360.0000" RightMargin="360.0000" TopMargin="640.0000" BottomMargin="-640.0000" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="AwardContentPanel" ActionTag="-462433558" Tag="98" IconVisible="False" LeftMargin="126.5000" RightMargin="-593.5000" TopMargin="-582.0000" BottomMargin="462.0000" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size X="467.0000" Y="120.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="360.0000" Y="522.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <SingleColor A="255" R="150" G="200" B="255" />
                    <FirstColor A="255" R="150" G="200" B="255" />
                    <EndColor A="255" R="255" G="255" B="255" />
                    <ColorVector ScaleY="1.0000" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint />
                <Position X="-360.0000" Y="-640.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="GetButton" ActionTag="-1658888817" Tag="589" IconVisible="False" LeftMargin="-132.0000" RightMargin="-132.0000" TopMargin="210.0000" BottomMargin="-310.0000" TouchEnable="True" FontSize="14" LeftEage="87" RightEage="87" TopEage="33" BottomEage="33" Scale9OriginX="87" Scale9OriginY="33" Scale9Width="90" Scale9Height="34" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="" ctype="LuaPxButtonObjectData">
                <Size X="264.0000" Y="100.0000" />
                <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                <Children>
                  <AbstractNodeData Name="GetText_TT" ActionTag="1663437169" Tag="590" IconVisible="False" LeftMargin="96.0000" RightMargin="96.0000" TopMargin="18.5000" BottomMargin="34.5000" FontSize="34" LabelText="领取" OutlineEnabled="True" ShadowOffsetX="0.0000" ShadowOffsetY="-2.0000" ShadowEnabled="True" ctype="TextObjectData">
                    <Size X="72.0000" Y="47.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="132.0000" Y="58.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.5000" Y="0.5800" />
                    <PreSize X="0.2727" Y="0.4700" />
                    <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                    <OutlineColor A="255" R="116" G="203" B="69" />
                    <ShadowColor A="255" R="82" G="156" B="50" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position Y="-260.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <TextColor A="255" R="255" G="255" B="255" />
                <DisabledFileData Type="Normal" Path="ui/01_16_NoviceGuidance/button_102.png" Plist="" />
                <PressedFileData Type="Normal" Path="ui/01_16_NoviceGuidance/button_102.png" Plist="" />
                <NormalFileData Type="Normal" Path="ui/01_16_NoviceGuidance/button_102.png" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
                <MixedColor A="255" R="65" G="65" B="70" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint />
            <Position X="360.0000" Y="640.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5000" Y="0.5000" />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>