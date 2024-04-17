<GameFile>
  <PropertyGroup Name="02_01_BoastMagicEmojiPopUp" Type="Layer" ID="d316fde1-fbff-48ba-9f0f-3522f0fde0bc" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Layer" Tag="595" ctype="GameLayerObjectData">
        <Size X="720.0000" Y="1280.0000" />
        <Children>
          <AbstractNodeData Name="BelowLeftFit_3" ActionTag="2068517739" Tag="600" IconVisible="True" RightMargin="720.0000" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="InteractionPopUp_3" ActionTag="1343627672" Tag="602" IconVisible="False" RightMargin="-720.0000" TopMargin="-382.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size X="720.0000" Y="382.0000" />
                <AnchorPoint />
                <Position />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <SingleColor A="255" R="150" G="200" B="255" />
                <FirstColor A="255" R="150" G="200" B="255" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="EmojiBg" ActionTag="161989993" Tag="601" IconVisible="False" LeftMargin="0.3783" RightMargin="-720.3783" TopMargin="-382.3783" BottomMargin="0.3783" Scale9Enable="True" LeftEage="237" RightEage="237" TopEage="126" BottomEage="126" Scale9OriginX="237" Scale9OriginY="126" Scale9Width="246" Scale9Height="130" ctype="ImageViewObjectData">
                <Size X="720.0000" Y="382.0000" />
                <AnchorPoint />
                <Position X="0.3783" Y="0.3783" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/02_01_Boast/frame_132.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="Information" ActionTag="1266678095" Tag="606" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="HeadIcon_3" ActionTag="598725639" Tag="451" IconVisible="True" LeftMargin="76.0000" RightMargin="-76.0000" TopMargin="-293.0000" BottomMargin="293.0000" ctype="SingleNodeObjectData">
                    <Size X="0.0000" Y="0.0000" />
                    <AnchorPoint />
                    <Position X="76.0000" Y="293.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="HeadFrame_3" ActionTag="1515828956" Tag="605" IconVisible="False" LeftMargin="16.0001" RightMargin="-136.0001" TopMargin="-352.9998" BottomMargin="232.9998" LeftEage="39" RightEage="39" TopEage="39" BottomEage="39" Scale9OriginX="39" Scale9OriginY="39" Scale9Width="42" Scale9Height="42" ctype="ImageViewObjectData">
                    <Size X="120.0000" Y="120.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="76.0001" Y="292.9998" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/00_02_Default/102001.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="MicButton_3" ActionTag="-1965757191" Tag="449" IconVisible="False" LeftMargin="83.0000" RightMargin="-141.0000" TopMargin="-285.0000" BottomMargin="227.0000" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="28" Scale9Height="36" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="1.0000" ClickEffect="" ctype="LuaPxButtonObjectData">
                    <Size X="58.0000" Y="58.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="112.0000" Y="256.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/02_01_Boast/icon_081.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/02_01_Boast/icon_081.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/02_01_Boast/icon_080.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                    <MixedColor A="255" R="65" G="65" B="70" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="MicLoadingBar_3" ActionTag="1741728438" Tag="448" RotationSkewX="-90.0000" RotationSkewY="-90.0000" IconVisible="False" LeftMargin="104.0000" RightMargin="-120.0000" TopMargin="-263.0000" BottomMargin="255.0000" ProgressInfo="100" ctype="LoadingBarObjectData">
                    <Size X="16.0000" Y="8.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="112.0000" Y="259.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <ImageFileData Type="Normal" Path="ui/02_01_Boast/icon_082.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="MicPanel_3" ActionTag="-1710090183" Tag="608" IconVisible="False" LeftMargin="16.0000" RightMargin="-136.0000" TopMargin="-353.0000" BottomMargin="233.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size X="120.0000" Y="120.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="76.0000" Y="293.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <SingleColor A="255" R="150" G="200" B="255" />
                    <FirstColor A="255" R="150" G="200" B="255" />
                    <EndColor A="255" R="255" G="255" B="255" />
                    <ColorVector ScaleY="1.0000" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="NameText_3_O" ActionTag="2093144098" Tag="607" IconVisible="False" LeftMargin="140.5003" RightMargin="-311.5003" TopMargin="-331.5004" BottomMargin="294.5004" FontSize="28" LabelText="我是至尊哥已" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="171.0000" Y="37.0000" />
                    <AnchorPoint ScaleY="0.5000" />
                    <Position X="140.5003" Y="313.0004" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="VipIcon" ActionTag="-1039267695" Tag="608" IconVisible="False" LeftMargin="313.0000" RightMargin="-347.0000" TopMargin="-327.0000" BottomMargin="299.0000" LeftEage="11" RightEage="11" TopEage="13" BottomEage="13" Scale9OriginX="11" Scale9OriginY="13" Scale9Width="12" Scale9Height="2" ctype="ImageViewObjectData">
                    <Size X="34.0000" Y="28.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="330.0000" Y="313.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/00_02_Default/Vip1.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="GoldFrame_1" ActionTag="922061957" Tag="394" IconVisible="False" LeftMargin="130.0005" RightMargin="-272.0005" TopMargin="-287.0009" BottomMargin="245.0009" ctype="SpriteObjectData">
                    <Size X="142.0000" Y="42.0000" />
                    <Children>
                      <AbstractNodeData Name="GoldIcon_1" ActionTag="2017110728" Tag="395" IconVisible="False" LeftMargin="0.9997" RightMargin="101.0003" TopMargin="1.9997" BottomMargin="0.0003" LeftEage="13" RightEage="13" TopEage="13" BottomEage="13" Scale9OriginX="13" Scale9OriginY="13" Scale9Width="14" Scale9Height="14" ctype="ImageViewObjectData">
                        <Size X="40.0000" Y="40.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="20.9997" Y="20.0003" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.1479" Y="0.4762" />
                        <PreSize X="0.2817" Y="0.9524" />
                        <FileData Type="Normal" Path="ui/00_02_Default/2.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="GoldNum_1" ActionTag="-1712692175" Tag="396" IconVisible="False" LeftMargin="39.0000" RightMargin="7.0000" TopMargin="2.5000" BottomMargin="4.5000" FontSize="30" LabelText="234.5萬" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="96.0000" Y="35.0000" />
                        <AnchorPoint ScaleX="0.1000" ScaleY="0.5000" />
                        <Position X="48.6000" Y="22.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="229" G="221" B="186" />
                        <PrePosition X="0.3423" Y="0.5238" />
                        <PreSize X="0.6761" Y="0.8333" />
                        <FontResource Type="Normal" Path="font/Font003.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="1.0000" ScaleY="0.5000" />
                    <Position X="272.0005" Y="266.0009" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/02_01_Boast/frame_135.png" Plist="" />
                    <BlendFunc Src="1" Dst="771" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint />
                <Position />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="KickPlayerButton" ActionTag="-1798992469" VisibleForFrame="False" Tag="331" IconVisible="False" LeftMargin="345.5000" RightMargin="-524.5000" TopMargin="-344.0000" BottomMargin="246.0000" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="178" Scale9Height="76" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="" ctype="LuaPxButtonObjectData">
                <Size X="179.0000" Y="98.0000" />
                <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                <Children>
                  <AbstractNodeData Name="KickPlayerText_TT" ActionTag="-595659101" Tag="332" IconVisible="False" LeftMargin="31.5000" RightMargin="33.5000" TopMargin="28.5001" BottomMargin="32.4999" FontSize="28" LabelText="踢出房间" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-1.0000" ShadowEnabled="True" ctype="TextObjectData">
                    <Size X="114.0000" Y="37.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="88.5000" Y="50.9999" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.4944" Y="0.5204" />
                    <PreSize X="0.6369" Y="0.3776" />
                    <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                    <OutlineColor A="255" R="42" G="42" B="57" />
                    <ShadowColor A="255" R="42" G="42" B="57" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="435.0000" Y="295.0000" />
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
              <AbstractNodeData Name="InteractiveButton_1" ActionTag="-404419153" Tag="524" IconVisible="False" LeftMargin="523.5000" RightMargin="-702.5000" TopMargin="-344.0000" BottomMargin="246.0000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="178" Scale9Height="76" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="Sound004" ctype="LuaPxButtonObjectData">
                <Size X="179.0000" Y="98.0000" />
                <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                <Children>
                  <AbstractNodeData Name="AddFriendText_TT" ActionTag="684045192" Tag="526" IconVisible="False" LeftMargin="45.0000" RightMargin="47.0000" TopMargin="28.5001" BottomMargin="32.4999" FontSize="28" LabelText="加好友" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-1.0000" ShadowEnabled="True" ctype="TextObjectData">
                    <Size X="87.0000" Y="37.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="88.5000" Y="50.9999" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.4944" Y="0.5204" />
                    <PreSize X="0.4860" Y="0.3776" />
                    <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                    <OutlineColor A="255" R="42" G="42" B="57" />
                    <ShadowColor A="255" R="42" G="42" B="57" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="613.0000" Y="295.0000" />
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
              <AbstractNodeData Name="InteractiveButton_2" Visible="False" ActionTag="-621568772" Tag="525" IconVisible="False" LeftMargin="523.5000" RightMargin="-702.5000" TopMargin="-344.0000" BottomMargin="246.0000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="178" Scale9Height="76" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="Sound004" ctype="LuaPxButtonObjectData">
                <Size X="179.0000" Y="98.0000" />
                <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                <Children>
                  <AbstractNodeData Name="CancelText_TT" ActionTag="380206091" Tag="527" IconVisible="False" LeftMargin="31.0000" RightMargin="33.0000" TopMargin="28.5000" BottomMargin="32.5000" FontSize="28" LabelText="取消申请" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="115.0000" Y="37.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="88.5000" Y="51.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.4944" Y="0.5204" />
                    <PreSize X="0.6425" Y="0.3776" />
                    <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="ChatText_1_TT" Visible="False" ActionTag="877281034" Tag="528" IconVisible="False" LeftMargin="59.0000" RightMargin="61.0000" TopMargin="28.5000" BottomMargin="32.5000" FontSize="28" LabelText="聊天" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="59.0000" Y="37.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="88.5000" Y="51.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.4944" Y="0.5204" />
                    <PreSize X="0.3296" Y="0.3776" />
                    <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="613.0000" Y="295.0000" />
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
              <AbstractNodeData Name="MagicEmojiText_TT" ActionTag="2052432135" Tag="523" IconVisible="False" LeftMargin="21.5000" RightMargin="-120.5000" TopMargin="-219.9997" BottomMargin="187.9997" FontSize="24" LabelText="魔法表情" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="99.0000" Y="32.0000" />
                <AnchorPoint ScaleY="0.5000" />
                <Position X="21.5000" Y="203.9997" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="234" G="234" B="234" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="MagicEmojiListPanel" ActionTag="2120540522" Tag="78" IconVisible="False" LeftMargin="21.0000" RightMargin="-720.0000" TopMargin="-204.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size X="699.0000" Y="204.0000" />
                <AnchorPoint />
                <Position X="21.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <SingleColor A="255" R="150" G="200" B="255" />
                <FirstColor A="255" R="150" G="200" B="255" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="ServiceUniqueNode" ActionTag="1537736205" Tag="2069" IconVisible="True" LeftMargin="360.0000" RightMargin="-360.0000" TopMargin="-600.0000" BottomMargin="600.0000" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <AnchorPoint />
                <Position X="360.0000" Y="600.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="MailSpineATNode" ActionTag="-641774364" Tag="584" IconVisible="True" LeftMargin="613.0000" RightMargin="-613.0000" TopMargin="-350.0000" BottomMargin="350.0000" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <AnchorPoint />
                <Position X="613.0000" Y="350.0000" />
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