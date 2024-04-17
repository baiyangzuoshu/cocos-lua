<GameFile>
  <PropertyGroup Name="03_12_ServiceLayer" Type="Layer" ID="b96a9ea6-d4c9-4662-a9f6-f8034802b905" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Layer" Tag="316" ctype="GameLayerObjectData">
        <Size X="720.0000" Y="1280.0000" />
        <Children>
          <AbstractNodeData Name="bg" ActionTag="1029686810" Tag="322" IconVisible="True" RightMargin="720.0000" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="bg_0" ActionTag="299628848" Tag="323" IconVisible="False" RightMargin="-720.0000" TopMargin="-1440.0000" BottomMargin="-160.0000" LeftEage="6" RightEage="6" TopEage="6" BottomEage="6" Scale9OriginX="6" Scale9OriginY="6" Scale9Width="8" Scale9Height="8" ctype="ImageViewObjectData">
                <Size X="720.0000" Y="1600.0000" />
                <AnchorPoint />
                <Position Y="-160.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/01_07_Sitting/bg_004.png" Plist="" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint />
            <Position />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="UpLeftFit" ActionTag="-1913383823" Tag="161" IconVisible="True" RightMargin="720.0000" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="LogoutNum" ActionTag="783645529" Tag="115" IconVisible="False" LeftMargin="642.0000" RightMargin="-685.0000" TopMargin="-1256.0000" BottomMargin="1224.0000" FontSize="24" LabelText="251" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="43.0000" Y="32.0000" />
                <Children>
                  <AbstractNodeData Name="LogoutText_TT" ActionTag="-979361680" Tag="490" IconVisible="False" LeftMargin="-191.0000" RightMargin="49.0000" FontSize="24" LabelText="当前在线总人数：" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="185.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="1.0000" ScaleY="0.5000" />
                    <Position X="-6.0000" Y="16.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="-0.1395" Y="0.5000" />
                    <PreSize X="4.3023" Y="1.0000" />
                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="1.0000" ScaleY="0.5000" />
                <Position X="685.0000" Y="1240.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="CollectNode" ActionTag="-939294911" Tag="486" IconVisible="True" LeftMargin="100.0000" RightMargin="-100.0000" TopMargin="-1173.0000" BottomMargin="1173.0000" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="CollectButton" ActionTag="-1669923115" Tag="487" IconVisible="False" LeftMargin="-90.0001" RightMargin="-89.9999" TopMargin="-45.0000" BottomMargin="-45.0000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="18" RightEage="18" TopEage="15" BottomEage="11" Scale9OriginX="18" Scale9OriginY="15" Scale9Width="112" Scale9Height="50" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9500" ClickEffect="" ctype="LuaPxButtonObjectData">
                    <Size X="180.0000" Y="90.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="-0.0001" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                    <MixedColor A="255" R="65" G="65" B="70" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="CollectText_TT" ActionTag="1718091579" Tag="488" IconVisible="False" LeftMargin="-27.5001" RightMargin="-27.4999" TopMargin="-17.0000" BottomMargin="-17.0000" FontSize="26" LabelText="收藏" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="55.0000" Y="34.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="-0.0001" />
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
                <Position X="100.0000" Y="1173.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="GenderNode" ActionTag="1267309026" Tag="491" IconVisible="True" LeftMargin="273.0000" RightMargin="-273.0000" TopMargin="-1173.0000" BottomMargin="1173.0000" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="GenderButton" ActionTag="-870637945" Tag="492" IconVisible="False" LeftMargin="-90.0000" RightMargin="-90.0000" TopMargin="-45.0000" BottomMargin="-45.0000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="18" RightEage="18" TopEage="15" BottomEage="11" Scale9OriginX="18" Scale9OriginY="15" Scale9Width="112" Scale9Height="50" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9500" ClickEffect="" ctype="LuaPxButtonObjectData">
                    <Size X="180.0000" Y="90.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                    <MixedColor A="255" R="65" G="65" B="70" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="GenderText_TT" Visible="False" ActionTag="-1544938286" Tag="493" IconVisible="False" LeftMargin="-53.5000" RightMargin="-33.5000" TopMargin="-17.0000" BottomMargin="-17.0000" FontSize="26" LabelText="性别:全" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="87.0000" Y="34.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="-10.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="GenderText_1_TT" ActionTag="397031246" Tag="226" IconVisible="False" LeftMargin="-53.0000" RightMargin="-33.0000" TopMargin="-17.0000" BottomMargin="-17.0000" FontSize="26" LabelText="性别:男" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="86.0000" Y="34.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="-10.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="GenderText_2_TT" Visible="False" ActionTag="1319791798" Tag="227" IconVisible="False" LeftMargin="-53.5000" RightMargin="-33.5000" TopMargin="-17.0000" BottomMargin="-17.0000" FontSize="26" LabelText="性别:女" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="87.0000" Y="34.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="-10.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="GenderText_3_TT" Visible="False" ActionTag="600186845" Tag="228" IconVisible="False" LeftMargin="-53.5000" RightMargin="-33.5000" TopMargin="-17.0000" BottomMargin="-17.0000" FontSize="26" LabelText="性别:无" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="87.0000" Y="34.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="-10.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="GenderDrop" ActionTag="-298394769" Tag="420" IconVisible="False" LeftMargin="44.0000" RightMargin="-76.0000" TopMargin="-12.0000" BottomMargin="-20.0000" LeftEage="10" RightEage="10" TopEage="10" BottomEage="10" Scale9OriginX="10" Scale9OriginY="10" Scale9Width="12" Scale9Height="12" ctype="ImageViewObjectData">
                    <Size X="32.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="60.0000" Y="-4.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/00_01_Common/icon_132.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="GenderDrop_2" Visible="False" ActionTag="-416473159" Tag="85" IconVisible="False" LeftMargin="44.0000" RightMargin="-76.0000" TopMargin="-12.0000" BottomMargin="-20.0000" LeftEage="10" RightEage="10" TopEage="10" BottomEage="10" Scale9OriginX="10" Scale9OriginY="10" Scale9Width="12" Scale9Height="12" ctype="ImageViewObjectData">
                    <Size X="32.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="60.0000" Y="-4.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/00_01_Common/icon_134.png" Plist="" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint />
                <Position X="273.0000" Y="1173.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="RegisterNode" ActionTag="-1457001141" Tag="494" IconVisible="True" LeftMargin="446.0000" RightMargin="-446.0000" TopMargin="-1172.9998" BottomMargin="1172.9998" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="RegisterButton" ActionTag="775278107" Tag="495" IconVisible="False" LeftMargin="-90.0000" RightMargin="-90.0000" TopMargin="-45.0000" BottomMargin="-45.0000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="18" RightEage="18" TopEage="15" BottomEage="11" Scale9OriginX="18" Scale9OriginY="15" Scale9Width="112" Scale9Height="50" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9500" ClickEffect="" ctype="LuaPxButtonObjectData">
                    <Size X="180.0000" Y="90.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                    <MixedColor A="255" R="65" G="65" B="70" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="RegisterText_TT" ActionTag="-1390824895" Tag="496" IconVisible="False" LeftMargin="-63.5000" RightMargin="-43.5000" TopMargin="-17.0000" BottomMargin="-17.0000" FontSize="26" LabelText="注册天数" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="107.0000" Y="34.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="-10.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="RegisterDown_1" ActionTag="2124723293" Tag="99" IconVisible="False" LeftMargin="44.0000" RightMargin="-76.0000" TopMargin="-6.0003" BottomMargin="-25.9997" LeftEage="10" RightEage="10" TopEage="10" BottomEage="10" Scale9OriginX="10" Scale9OriginY="10" Scale9Width="12" Scale9Height="12" ctype="ImageViewObjectData">
                    <Size X="32.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="60.0000" Y="-9.9997" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/00_01_Common/icon_132.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="RegisterDown_2" Visible="False" ActionTag="-982095013" Tag="100" IconVisible="False" LeftMargin="44.0000" RightMargin="-76.0000" TopMargin="-6.0003" BottomMargin="-25.9997" LeftEage="10" RightEage="10" TopEage="10" BottomEage="10" Scale9OriginX="10" Scale9OriginY="10" Scale9Width="12" Scale9Height="12" ctype="ImageViewObjectData">
                    <Size X="32.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="60.0000" Y="-9.9997" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/00_01_Common/icon_134.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="RegisterUp_1" ActionTag="-2146307524" Tag="101" IconVisible="False" LeftMargin="44.0000" RightMargin="-76.0000" TopMargin="-26.0001" BottomMargin="-5.9999" LeftEage="10" RightEage="10" TopEage="10" BottomEage="10" Scale9OriginX="10" Scale9OriginY="10" Scale9Width="12" Scale9Height="12" ctype="ImageViewObjectData">
                    <Size X="32.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="60.0000" Y="10.0001" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/00_01_Common/icon_133.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="RegisterUp_2" Visible="False" ActionTag="-1733082159" Tag="102" IconVisible="False" LeftMargin="44.0000" RightMargin="-76.0000" TopMargin="-26.0001" BottomMargin="-5.9999" LeftEage="10" RightEage="10" TopEage="10" BottomEage="10" Scale9OriginX="10" Scale9OriginY="10" Scale9Width="12" Scale9Height="12" ctype="ImageViewObjectData">
                    <Size X="32.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="60.0000" Y="10.0001" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/00_01_Common/icon_135.png" Plist="" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint />
                <Position X="446.0000" Y="1172.9998" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="RechargeNode" ActionTag="-139811825" Tag="497" IconVisible="True" LeftMargin="620.0000" RightMargin="-620.0000" TopMargin="-1172.9998" BottomMargin="1172.9998" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="RechargeButton" ActionTag="-1704373577" Tag="498" IconVisible="False" LeftMargin="-90.0000" RightMargin="-90.0000" TopMargin="-45.0000" BottomMargin="-45.0000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="18" RightEage="18" TopEage="15" BottomEage="11" Scale9OriginX="18" Scale9OriginY="15" Scale9Width="112" Scale9Height="50" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9500" ClickEffect="" ctype="LuaPxButtonObjectData">
                    <Size X="180.0000" Y="90.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                    <MixedColor A="255" R="65" G="65" B="70" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="RechargeText_TT" ActionTag="142826866" Tag="499" IconVisible="False" LeftMargin="-63.5000" RightMargin="-43.5000" TopMargin="-17.0000" BottomMargin="-17.0000" FontSize="26" LabelText="充值金额" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="107.0000" Y="34.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="-10.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="RechargeDown_1" ActionTag="1955983459" Tag="95" IconVisible="False" LeftMargin="44.0000" RightMargin="-76.0000" TopMargin="-6.0002" BottomMargin="-25.9998" LeftEage="10" RightEage="10" TopEage="10" BottomEage="10" Scale9OriginX="10" Scale9OriginY="10" Scale9Width="12" Scale9Height="12" ctype="ImageViewObjectData">
                    <Size X="32.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="60.0000" Y="-9.9998" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/00_01_Common/icon_132.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="RechargeDown_2" ActionTag="-1383145791" Tag="97" IconVisible="False" LeftMargin="44.0000" RightMargin="-76.0000" TopMargin="-26.0000" BottomMargin="-6.0000" LeftEage="10" RightEage="10" TopEage="10" BottomEage="10" Scale9OriginX="10" Scale9OriginY="10" Scale9Width="12" Scale9Height="12" ctype="ImageViewObjectData">
                    <Size X="32.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="60.0000" Y="10.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/00_01_Common/icon_133.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="RechargeUp_1" Visible="False" ActionTag="-90322480" Tag="96" IconVisible="False" LeftMargin="44.0000" RightMargin="-76.0000" TopMargin="-6.0002" BottomMargin="-25.9998" LeftEage="10" RightEage="10" TopEage="10" BottomEage="10" Scale9OriginX="10" Scale9OriginY="10" Scale9Width="12" Scale9Height="12" ctype="ImageViewObjectData">
                    <Size X="32.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="60.0000" Y="-9.9998" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/00_01_Common/icon_134.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="RechargeUp_2" Visible="False" ActionTag="-1656453089" Tag="98" IconVisible="False" LeftMargin="44.0000" RightMargin="-76.0000" TopMargin="-26.0000" BottomMargin="-6.0000" LeftEage="10" RightEage="10" TopEage="10" BottomEage="10" Scale9OriginX="10" Scale9OriginY="10" Scale9Width="12" Scale9Height="12" ctype="ImageViewObjectData">
                    <Size X="32.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="60.0000" Y="10.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/00_01_Common/icon_135.png" Plist="" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint />
                <Position X="620.0000" Y="1172.9998" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="LanguageNode" ActionTag="1365126893" Tag="512" IconVisible="True" LeftMargin="100.0000" RightMargin="-100.0000" TopMargin="-1089.0000" BottomMargin="1089.0000" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="LanguageButton" ActionTag="511970555" Tag="513" IconVisible="False" LeftMargin="-90.0001" RightMargin="-89.9999" TopMargin="-44.9997" BottomMargin="-45.0003" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="18" RightEage="18" TopEage="15" BottomEage="11" Scale9OriginX="18" Scale9OriginY="15" Scale9Width="112" Scale9Height="50" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9500" ClickEffect="" ctype="LuaPxButtonObjectData">
                    <Size X="180.0000" Y="90.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="-0.0001" Y="-0.0003" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                    <MixedColor A="255" R="65" G="65" B="70" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="LanguageText_TT" ActionTag="686407012" Tag="514" IconVisible="False" LeftMargin="-63.5000" RightMargin="-43.5000" TopMargin="-17.0000" BottomMargin="-17.0000" FontSize="26" LabelText="语言：全" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="107.0000" Y="34.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="-10.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="LanguageText_1_TT" ActionTag="2015191961" Tag="229" IconVisible="False" LeftMargin="-63.5000" RightMargin="-43.5000" TopMargin="-17.0000" BottomMargin="-17.0000" FontSize="26" LabelText="语言：简" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="107.0000" Y="34.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="-10.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="LanguageText_2_TT" ActionTag="-2092674420" Tag="230" IconVisible="False" LeftMargin="-63.5000" RightMargin="-43.5000" TopMargin="-17.0000" BottomMargin="-17.0000" FontSize="26" LabelText="语言：繁" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="107.0000" Y="34.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="-10.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="LanguageText_3_TT" ActionTag="493919434" Tag="5218" IconVisible="False" LeftMargin="-63.5000" RightMargin="-43.5000" TopMargin="-17.0000" BottomMargin="-17.0000" FontSize="26" LabelText="语言：英" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="107.0000" Y="34.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="-10.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="LanguageDrop" ActionTag="1549463866" Tag="419" IconVisible="False" LeftMargin="44.0000" RightMargin="-76.0000" TopMargin="-12.0000" BottomMargin="-20.0000" LeftEage="10" RightEage="10" TopEage="10" BottomEage="10" Scale9OriginX="10" Scale9OriginY="10" Scale9Width="12" Scale9Height="12" ctype="ImageViewObjectData">
                    <Size X="32.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="60.0000" Y="-4.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/00_01_Common/icon_132.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="LanguageDrop_2" Visible="False" ActionTag="1244506714" Tag="86" IconVisible="False" LeftMargin="44.0000" RightMargin="-76.0000" TopMargin="-12.0000" BottomMargin="-20.0000" LeftEage="10" RightEage="10" TopEage="10" BottomEage="10" Scale9OriginX="10" Scale9OriginY="10" Scale9Width="12" Scale9Height="12" ctype="ImageViewObjectData">
                    <Size X="32.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="60.0000" Y="-4.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/00_01_Common/icon_134.png" Plist="" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint />
                <Position X="100.0000" Y="1089.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="RoomServiceNode" ActionTag="-1855199142" Tag="515" IconVisible="True" LeftMargin="273.3333" RightMargin="-273.3333" TopMargin="-1089.0000" BottomMargin="1089.0000" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="RoomServiceButton" ActionTag="-231514436" Tag="516" IconVisible="False" LeftMargin="-90.0000" RightMargin="-90.0000" TopMargin="-45.0000" BottomMargin="-45.0000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="18" RightEage="18" TopEage="15" BottomEage="11" Scale9OriginX="18" Scale9OriginY="15" Scale9Width="112" Scale9Height="50" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9500" ClickEffect="" ctype="LuaPxButtonObjectData">
                    <Size X="180.0000" Y="90.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                    <MixedColor A="255" R="65" G="65" B="70" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="RoomServiceText_TT" ActionTag="797010791" Tag="517" IconVisible="False" LeftMargin="-63.5000" RightMargin="-43.5000" TopMargin="-17.0000" BottomMargin="-17.0000" FontSize="26" LabelText="房间客服" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="107.0000" Y="34.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="-10.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="RoomServiceDown_1" ActionTag="-356271919" Tag="91" IconVisible="False" LeftMargin="44.0000" RightMargin="-76.0000" TopMargin="-6.0000" BottomMargin="-26.0000" LeftEage="10" RightEage="10" TopEage="10" BottomEage="10" Scale9OriginX="10" Scale9OriginY="10" Scale9Width="12" Scale9Height="12" ctype="ImageViewObjectData">
                    <Size X="32.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="60.0000" Y="-10.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/00_01_Common/icon_132.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="RoomServiceDown_2" Visible="False" ActionTag="-1518185942" Tag="87" IconVisible="False" LeftMargin="44.0000" RightMargin="-76.0000" TopMargin="-6.0000" BottomMargin="-26.0000" LeftEage="10" RightEage="10" TopEage="10" BottomEage="10" Scale9OriginX="10" Scale9OriginY="10" Scale9Width="12" Scale9Height="12" ctype="ImageViewObjectData">
                    <Size X="32.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="60.0000" Y="-10.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/00_01_Common/icon_134.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="RoomServiceUp_1" ActionTag="946218179" Tag="92" IconVisible="False" LeftMargin="44.0000" RightMargin="-76.0000" TopMargin="-26.0000" BottomMargin="-6.0000" LeftEage="10" RightEage="10" TopEage="10" BottomEage="10" Scale9OriginX="10" Scale9OriginY="10" Scale9Width="12" Scale9Height="12" ctype="ImageViewObjectData">
                    <Size X="32.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="60.0000" Y="10.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/00_01_Common/icon_133.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="RoomServiceUp_2" Visible="False" ActionTag="-1072982809" Tag="88" IconVisible="False" LeftMargin="44.0000" RightMargin="-76.0000" TopMargin="-26.0000" BottomMargin="-6.0000" LeftEage="10" RightEage="10" TopEage="10" BottomEage="10" Scale9OriginX="10" Scale9OriginY="10" Scale9Width="12" Scale9Height="12" ctype="ImageViewObjectData">
                    <Size X="32.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="60.0000" Y="10.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/00_01_Common/icon_135.png" Plist="" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint />
                <Position X="273.3333" Y="1089.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="RoomPlayerNode" ActionTag="1139734157" Tag="518" IconVisible="True" LeftMargin="446.6667" RightMargin="-446.6667" TopMargin="-1089.0000" BottomMargin="1089.0000" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="RoomPlayerButton" ActionTag="-744845353" Tag="519" IconVisible="False" LeftMargin="-90.0000" RightMargin="-90.0000" TopMargin="-45.0000" BottomMargin="-45.0000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="18" RightEage="18" TopEage="15" BottomEage="11" Scale9OriginX="18" Scale9OriginY="15" Scale9Width="112" Scale9Height="50" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9500" ClickEffect="" ctype="LuaPxButtonObjectData">
                    <Size X="180.0000" Y="90.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                    <MixedColor A="255" R="65" G="65" B="70" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="RoomPlayerText_TT" ActionTag="-53731944" Tag="520" IconVisible="False" LeftMargin="-63.5000" RightMargin="-43.5000" TopMargin="-17.0000" BottomMargin="-17.0000" FontSize="26" LabelText="房间玩家" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="107.0000" Y="34.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="-10.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="RoomPlayerDown_1" ActionTag="112377787" Tag="93" IconVisible="False" LeftMargin="44.0000" RightMargin="-76.0000" TopMargin="-6.0000" BottomMargin="-26.0000" LeftEage="10" RightEage="10" TopEage="10" BottomEage="10" Scale9OriginX="10" Scale9OriginY="10" Scale9Width="12" Scale9Height="12" ctype="ImageViewObjectData">
                    <Size X="32.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="60.0000" Y="-10.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/00_01_Common/icon_132.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="RoomPlayerDown_2" Visible="False" ActionTag="1164247582" Tag="89" IconVisible="False" LeftMargin="44.0000" RightMargin="-76.0000" TopMargin="-6.0000" BottomMargin="-26.0000" LeftEage="10" RightEage="10" TopEage="10" BottomEage="10" Scale9OriginX="10" Scale9OriginY="10" Scale9Width="12" Scale9Height="12" ctype="ImageViewObjectData">
                    <Size X="32.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="60.0000" Y="-10.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/00_01_Common/icon_134.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="RoomPlayerUp_1" ActionTag="-771810099" Tag="94" IconVisible="False" LeftMargin="44.0000" RightMargin="-76.0000" TopMargin="-26.0000" BottomMargin="-6.0000" LeftEage="10" RightEage="10" TopEage="10" BottomEage="10" Scale9OriginX="10" Scale9OriginY="10" Scale9Width="12" Scale9Height="12" ctype="ImageViewObjectData">
                    <Size X="32.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="60.0000" Y="10.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/00_01_Common/icon_133.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="RoomPlayerUp_2" Visible="False" ActionTag="-1384189587" Tag="90" IconVisible="False" LeftMargin="44.0000" RightMargin="-76.0000" TopMargin="-26.0000" BottomMargin="-6.0000" LeftEage="10" RightEage="10" TopEage="10" BottomEage="10" Scale9OriginX="10" Scale9OriginY="10" Scale9Width="12" Scale9Height="12" ctype="ImageViewObjectData">
                    <Size X="32.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="60.0000" Y="10.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/00_01_Common/icon_135.png" Plist="" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint />
                <Position X="446.6667" Y="1089.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="StateNode" ActionTag="1155241551" Tag="521" IconVisible="True" LeftMargin="620.0001" RightMargin="-620.0001" TopMargin="-1089.0000" BottomMargin="1089.0000" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="StateButton" ActionTag="382405930" Tag="522" IconVisible="False" LeftMargin="-90.0000" RightMargin="-90.0000" TopMargin="-45.0000" BottomMargin="-45.0000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="18" RightEage="18" TopEage="15" BottomEage="11" Scale9OriginX="18" Scale9OriginY="15" Scale9Width="112" Scale9Height="50" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9500" ClickEffect="" ctype="LuaPxButtonObjectData">
                    <Size X="180.0000" Y="90.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                    <MixedColor A="255" R="65" G="65" B="70" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="StateText_TT" ActionTag="1346182964" Tag="523" IconVisible="False" LeftMargin="-53.5000" RightMargin="-53.5000" TopMargin="-17.0000" BottomMargin="-17.0000" FontSize="26" LabelText="当前状态" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="107.0000" Y="34.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position />
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
                <Position X="620.0001" Y="1089.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="HeadlineNode" ActionTag="-1140625230" Tag="372" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="HeadlineBg_1" ActionTag="676845817" Tag="373" IconVisible="False" LeftMargin="168.0001" RightMargin="-238.0001" TopMargin="-1052.0000" BottomMargin="992.0000" Scale9Enable="True" LeftEage="69" RightEage="69" TopEage="29" BottomEage="29" Scale9OriginX="69" Scale9OriginY="29" Scale9Width="72" Scale9Height="30" ctype="ImageViewObjectData">
                    <Size X="70.0000" Y="60.0000" />
                    <Children>
                      <AbstractNodeData Name="HeadlineText_1" ActionTag="1094681713" Tag="374" IconVisible="False" LeftMargin="14.0000" RightMargin="14.0000" TopMargin="17.0000" BottomMargin="17.0000" FontSize="20" LabelText="性别" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="42.0000" Y="26.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="35.0000" Y="30.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.5000" Y="0.5000" />
                        <PreSize X="0.6000" Y="0.4333" />
                        <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="203.0001" Y="1022.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/03_01_Shop/frame_213.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="HeadlineBg_2" ActionTag="-14733941" Tag="375" IconVisible="False" LeftMargin="243.3334" RightMargin="-313.3334" TopMargin="-1052.0000" BottomMargin="992.0000" Scale9Enable="True" LeftEage="69" RightEage="69" TopEage="29" BottomEage="29" Scale9OriginX="69" Scale9OriginY="29" Scale9Width="72" Scale9Height="30" ctype="ImageViewObjectData">
                    <Size X="70.0000" Y="60.0000" />
                    <Children>
                      <AbstractNodeData Name="HeadlineText_2" ActionTag="1948102260" Tag="376" IconVisible="False" LeftMargin="13.5000" RightMargin="13.5000" TopMargin="17.0000" BottomMargin="17.0000" FontSize="20" LabelText="注册" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="43.0000" Y="26.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="35.0000" Y="30.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.5000" Y="0.5000" />
                        <PreSize X="0.6143" Y="0.4333" />
                        <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="278.3334" Y="1022.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/03_01_Shop/frame_213.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="HeadlineBg_3" ActionTag="627001605" Tag="377" IconVisible="False" LeftMargin="318.6667" RightMargin="-388.6667" TopMargin="-1052.0000" BottomMargin="992.0000" Scale9Enable="True" LeftEage="69" RightEage="69" TopEage="29" BottomEage="29" Scale9OriginX="69" Scale9OriginY="29" Scale9Width="72" Scale9Height="30" ctype="ImageViewObjectData">
                    <Size X="70.0000" Y="60.0000" />
                    <Children>
                      <AbstractNodeData Name="HeadlineText_3" ActionTag="-1626245356" Tag="378" IconVisible="False" LeftMargin="13.5000" RightMargin="13.5000" TopMargin="17.0000" BottomMargin="17.0000" FontSize="20" LabelText="语言" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="43.0000" Y="26.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="35.0000" Y="30.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.5000" Y="0.5000" />
                        <PreSize X="0.6143" Y="0.4333" />
                        <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="353.6667" Y="1022.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/03_01_Shop/frame_213.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="HeadlineBg_4" ActionTag="-1609226128" Tag="379" IconVisible="False" LeftMargin="394.0001" RightMargin="-464.0001" TopMargin="-1052.0000" BottomMargin="992.0000" Scale9Enable="True" LeftEage="69" RightEage="69" TopEage="29" BottomEage="29" Scale9OriginX="69" Scale9OriginY="29" Scale9Width="72" Scale9Height="30" ctype="ImageViewObjectData">
                    <Size X="70.0000" Y="60.0000" />
                    <Children>
                      <AbstractNodeData Name="HeadlineText_4" ActionTag="387083710" Tag="380" IconVisible="False" LeftMargin="13.5000" RightMargin="13.5000" TopMargin="17.0000" BottomMargin="17.0000" FontSize="20" LabelText="充值" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="43.0000" Y="26.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="35.0000" Y="30.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.5000" Y="0.5000" />
                        <PreSize X="0.6143" Y="0.4333" />
                        <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="429.0001" Y="1022.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/03_01_Shop/frame_213.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="HeadlineBg_5" ActionTag="-542838981" Tag="381" IconVisible="False" LeftMargin="469.3334" RightMargin="-539.3334" TopMargin="-1052.0000" BottomMargin="992.0000" Scale9Enable="True" LeftEage="69" RightEage="69" TopEage="29" BottomEage="29" Scale9OriginX="69" Scale9OriginY="29" Scale9Width="72" Scale9Height="30" ctype="ImageViewObjectData">
                    <Size X="70.0000" Y="60.0000" />
                    <Children>
                      <AbstractNodeData Name="HeadlineText_5" ActionTag="564732396" Tag="382" IconVisible="False" LeftMargin="13.5000" RightMargin="13.5000" TopMargin="17.0000" BottomMargin="17.0000" FontSize="20" LabelText="客服" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="43.0000" Y="26.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="35.0000" Y="30.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.5000" Y="0.5000" />
                        <PreSize X="0.6143" Y="0.4333" />
                        <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="504.3334" Y="1022.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/03_01_Shop/frame_213.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="HeadlineBg_6" ActionTag="-84859160" Tag="383" IconVisible="False" LeftMargin="544.6667" RightMargin="-614.6667" TopMargin="-1052.0000" BottomMargin="992.0000" Scale9Enable="True" LeftEage="69" RightEage="69" TopEage="29" BottomEage="29" Scale9OriginX="69" Scale9OriginY="29" Scale9Width="72" Scale9Height="30" ctype="ImageViewObjectData">
                    <Size X="70.0000" Y="60.0000" />
                    <Children>
                      <AbstractNodeData Name="HeadlineText_6" ActionTag="-444728001" Tag="384" IconVisible="False" LeftMargin="14.0000" RightMargin="14.0000" TopMargin="17.0000" BottomMargin="17.0000" FontSize="20" LabelText="用户" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="42.0000" Y="26.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="35.0000" Y="30.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.5000" Y="0.5000" />
                        <PreSize X="0.6000" Y="0.4333" />
                        <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="579.6667" Y="1022.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/03_01_Shop/frame_213.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="HeadlineBg_7" ActionTag="-405587767" Tag="385" IconVisible="False" LeftMargin="620.0000" RightMargin="-690.0000" TopMargin="-1052.0000" BottomMargin="992.0000" Scale9Enable="True" LeftEage="69" RightEage="69" TopEage="29" BottomEage="29" Scale9OriginX="69" Scale9OriginY="29" Scale9Width="72" Scale9Height="30" ctype="ImageViewObjectData">
                    <Size X="70.0000" Y="60.0000" />
                    <Children>
                      <AbstractNodeData Name="HeadlineText_7" ActionTag="2002465891" Tag="386" IconVisible="False" LeftMargin="13.5000" RightMargin="13.5000" TopMargin="17.0000" BottomMargin="17.0000" FontSize="20" LabelText="前往" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="43.0000" Y="26.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="35.0000" Y="30.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.5000" Y="0.5000" />
                        <PreSize X="0.6143" Y="0.4333" />
                        <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="655.0000" Y="1022.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/03_01_Shop/frame_213.png" Plist="" />
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
          <AbstractNodeData Name="Middle" ActionTag="1767369199" Tag="485" IconVisible="True" RightMargin="720.0000" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="ServiceListPageView" ActionTag="1904536971" Tag="563" IconVisible="False" LeftMargin="31.0000" RightMargin="-689.0000" TopMargin="-995.0000" BottomMargin="145.0000" TouchEnable="True" ClipAble="True" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ScrollDirectionType="0" ctype="PageViewObjectData">
                <Size X="658.0000" Y="850.0000" />
                <AnchorPoint ScaleX="0.5000" />
                <Position X="360.0000" Y="145.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <SingleColor A="255" R="150" G="150" B="100" />
                <FirstColor A="255" R="150" G="150" B="100" />
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
          <AbstractNodeData Name="BelowLeftFit" ActionTag="1549347870" Tag="524" IconVisible="True" RightMargin="720.0000" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="BelowLeftBg" ActionTag="-1272365773" Tag="525" IconVisible="False" RightMargin="-720.0000" TopMargin="-128.0000" Scale9Enable="True" LeftEage="6" RightEage="6" TopEage="38" BottomEage="38" Scale9OriginX="6" Scale9OriginY="38" Scale9Width="708" Scale9Height="52" ctype="ImageViewObjectData">
                <Size X="720.0000" Y="128.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="1.0000" />
                <Position X="360.0000" Y="128.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/00_01_Common/frame_144.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="HomePageNode" ActionTag="741727970" Tag="646" IconVisible="True" LeftMargin="185.0000" RightMargin="-185.0000" TopMargin="-80.0000" BottomMargin="80.0000" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="HomePageButton" ActionTag="-748283195" Tag="647" IconVisible="False" LeftMargin="-50.0001" RightMargin="-49.9999" TopMargin="-27.5000" BottomMargin="-27.5000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="18" RightEage="18" TopEage="15" BottomEage="11" Scale9OriginX="18" Scale9OriginY="15" Scale9Width="112" Scale9Height="50" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9500" ClickEffect="" ctype="LuaPxButtonObjectData">
                    <Size X="100.0000" Y="55.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="-0.0001" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                    <MixedColor A="255" R="65" G="65" B="70" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="HomePageText_TT" ActionTag="-1453417730" Tag="648" IconVisible="False" LeftMargin="-21.5000" RightMargin="-21.5000" TopMargin="-13.0000" BottomMargin="-13.0000" FontSize="20" LabelText="首页" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="43.0000" Y="26.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position />
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
                <Position X="185.0000" Y="80.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="PageUpNode" ActionTag="879214724" Tag="649" IconVisible="True" LeftMargin="285.0000" RightMargin="-285.0000" TopMargin="-80.0000" BottomMargin="80.0000" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="PageUpButton" ActionTag="275108663" Tag="650" IconVisible="False" LeftMargin="-50.0000" RightMargin="-50.0000" TopMargin="-27.5000" BottomMargin="-27.5000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="18" RightEage="18" TopEage="15" BottomEage="11" Scale9OriginX="18" Scale9OriginY="15" Scale9Width="112" Scale9Height="50" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9500" ClickEffect="" ctype="LuaPxButtonObjectData">
                    <Size X="100.0000" Y="55.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                    <MixedColor A="255" R="65" G="65" B="70" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="PageUpText_TT" ActionTag="1831992617" Tag="651" IconVisible="False" LeftMargin="-31.5001" RightMargin="-31.4999" TopMargin="-13.0000" BottomMargin="-13.0000" FontSize="20" LabelText="上一页" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="63.0000" Y="26.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="-0.0001" />
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
                <Position X="285.0000" Y="80.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="PageText" ActionTag="-878109955" Tag="661" IconVisible="False" LeftMargin="330.9970" RightMargin="-388.9970" TopMargin="-92.9999" BottomMargin="66.9999" FontSize="20" LabelText="11/11" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="58.0000" Y="26.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="359.9970" Y="79.9999" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="NextPageNode" ActionTag="182816739" Tag="652" IconVisible="True" LeftMargin="435.0000" RightMargin="-435.0000" TopMargin="-80.0000" BottomMargin="80.0000" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="NextPageButton" ActionTag="-1462388140" Tag="653" IconVisible="False" LeftMargin="-50.0000" RightMargin="-50.0000" TopMargin="-27.5000" BottomMargin="-27.5000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="18" RightEage="18" TopEage="15" BottomEage="11" Scale9OriginX="18" Scale9OriginY="15" Scale9Width="112" Scale9Height="50" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9500" ClickEffect="" ctype="LuaPxButtonObjectData">
                    <Size X="100.0000" Y="55.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                    <MixedColor A="255" R="65" G="65" B="70" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="NextPageText_TT" ActionTag="-1635478114" Tag="654" IconVisible="False" LeftMargin="-31.4999" RightMargin="-31.5001" TopMargin="-13.0000" BottomMargin="-13.0000" FontSize="20" LabelText="下一页" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="63.0000" Y="26.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="0.0001" />
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
                <Position X="435.0000" Y="80.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="TrailerPageNode" ActionTag="1776139846" Tag="655" IconVisible="True" LeftMargin="535.0000" RightMargin="-535.0000" TopMargin="-80.0000" BottomMargin="80.0000" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="TrailerPageButton" ActionTag="-1493313949" Tag="656" IconVisible="False" LeftMargin="-50.0001" RightMargin="-49.9999" TopMargin="-27.5000" BottomMargin="-27.5000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="18" RightEage="18" TopEage="15" BottomEage="11" Scale9OriginX="18" Scale9OriginY="15" Scale9Width="112" Scale9Height="50" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9500" ClickEffect="" ctype="LuaPxButtonObjectData">
                    <Size X="100.0000" Y="55.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="-0.0001" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/01_07_Sitting/button_080.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                    <MixedColor A="255" R="65" G="65" B="70" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="TrailerPageText_TT" ActionTag="-1339049431" Tag="657" IconVisible="False" LeftMargin="-21.5000" RightMargin="-21.5000" TopMargin="-13.0000" BottomMargin="-13.0000" FontSize="20" LabelText="尾页" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="43.0000" Y="26.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position />
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
                <Position X="535.0000" Y="80.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="RefreshNode" ActionTag="-1840270195" Tag="165" IconVisible="True" LeftMargin="650.0000" RightMargin="-650.0000" TopMargin="-80.0000" BottomMargin="80.0000" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="RefreshButton" ActionTag="-907503558" Tag="166" IconVisible="False" LeftMargin="-32.0001" RightMargin="-31.9999" TopMargin="-32.0000" BottomMargin="-32.0000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="18" RightEage="18" TopEage="15" BottomEage="11" Scale9OriginX="18" Scale9OriginY="15" Scale9Width="28" Scale9Height="38" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="" ctype="LuaPxButtonObjectData">
                    <Size X="64.0000" Y="64.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="-0.0001" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/00_01_Common/icon_136.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/00_01_Common/icon_136.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/00_01_Common/icon_136.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                    <MixedColor A="255" R="65" G="65" B="70" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint />
                <Position X="650.0000" Y="80.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="Return" ActionTag="-782202812" Tag="349" IconVisible="False" LeftMargin="-1.0000" RightMargin="-145.0000" TopMargin="-108.0000" BottomMargin="46.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size X="146.0000" Y="62.0000" />
                <Children>
                  <AbstractNodeData Name="ReturnButton" ActionTag="-872867381" Tag="350" IconVisible="False" LeftMargin="19.0000" RightMargin="81.0000" TopMargin="8.0000" BottomMargin="8.0000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="16" Scale9Height="24" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="1.0000" ClickEffect="" ctype="LuaPxButtonObjectData">
                    <Size X="46.0000" Y="46.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <Children>
                      <AbstractNodeData Name="ReturnText_TT" ActionTag="-512301689" Tag="351" IconVisible="False" LeftMargin="42.0000" RightMargin="-62.0000" TopMargin="-3.0000" BottomMargin="7.0000" FontSize="32" LabelText="返回" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-2.0000" ShadowEnabled="True" ctype="TextObjectData">
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
                <Position X="72.0000" Y="77.0000" />
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