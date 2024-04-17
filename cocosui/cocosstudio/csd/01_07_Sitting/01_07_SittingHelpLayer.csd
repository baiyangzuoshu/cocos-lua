<GameFile>
  <PropertyGroup Name="01_07_SittingHelpLayer" Type="Layer" ID="fd1e3973-4c6c-434b-82f4-972c5770ff3d" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Layer" Tag="331" ctype="GameLayerObjectData">
        <Size X="720.0000" Y="1280.0000" />
        <Children>
          <AbstractNodeData Name="bg" ActionTag="1255356428" Tag="8" IconVisible="True" RightMargin="720.0000" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="Bg_1" ActionTag="829770953" Tag="113" IconVisible="False" RightMargin="-720.0000" TopMargin="-1440.0000" BottomMargin="-160.0000" TouchEnable="True" Scale9Enable="True" LeftEage="6" RightEage="6" TopEage="6" BottomEage="6" Scale9OriginX="6" Scale9OriginY="6" Scale9Width="8" Scale9Height="8" ctype="ImageViewObjectData">
                <Size X="720.0000" Y="1600.0000" />
                <AnchorPoint />
                <Position Y="-160.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/01_07_Sitting/bg_005.png" Plist="" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint />
            <Position />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="BelowLeftFit" ActionTag="976617374" Tag="370" IconVisible="True" RightMargin="720.0000" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="HelpPanel" ActionTag="1569702994" Tag="334" IconVisible="False" RightMargin="-720.0000" TopMargin="-1280.0000" BottomMargin="123.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size X="720.0000" Y="1157.0000" />
                <AnchorPoint />
                <Position Y="123.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <SingleColor A="255" R="150" G="200" B="255" />
                <FirstColor A="255" R="150" G="200" B="255" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="BelowLeftBg" ActionTag="1242353870" Tag="371" IconVisible="False" RightMargin="-720.0000" TopMargin="-128.0000" Scale9Enable="True" LeftEage="6" RightEage="6" TopEage="38" BottomEage="38" Scale9OriginX="6" Scale9OriginY="38" Scale9Width="708" Scale9Height="52" ctype="ImageViewObjectData">
                <Size X="720.0000" Y="128.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="1.0000" />
                <Position X="360.0000" Y="128.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/00_01_Common/frame_144.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="ReturnPanel" ActionTag="2005405304" Tag="372" IconVisible="False" LeftMargin="17.0000" RightMargin="-163.0000" TopMargin="-108.0000" BottomMargin="46.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size X="146.0000" Y="62.0000" />
                <Children>
                  <AbstractNodeData Name="ReturnButton" ActionTag="-1555326931" Tag="373" IconVisible="False" LeftMargin="19.0000" RightMargin="81.0000" TopMargin="8.0000" BottomMargin="8.0000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="16" Scale9Height="24" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="1.0000" ClickEffect="" ctype="LuaPxButtonObjectData">
                    <Size X="46.0000" Y="46.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <Children>
                      <AbstractNodeData Name="ReturnText_TT" ActionTag="838125641" Tag="374" IconVisible="False" LeftMargin="42.0000" RightMargin="-62.0000" TopMargin="-3.0000" BottomMargin="7.0000" FontSize="32" LabelText="返回" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-2.0000" ShadowEnabled="True" ctype="TextObjectData">
                        <Size X="66.0000" Y="42.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="42.0000" Y="28.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.9130" Y="0.6087" />
                        <PreSize X="1.4348" Y="0.9130" />
                        <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="47" G="45" B="87" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="42.0000" Y="31.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.2877" Y="0.5000" />
                    <PreSize X="0.3151" Y="0.7419" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/00_01_Common/button_006.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/00_01_Common/button_006.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/00_01_Common/button_006.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                    <MixedColor A="255" R="65" G="65" B="70" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="90.0000" Y="77.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0473" />
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