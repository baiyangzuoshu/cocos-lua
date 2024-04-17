<GameFile>
  <PropertyGroup Name="01_07_SittingLayer" Type="Layer" ID="83c74bee-a7f3-4354-bb24-929524b2cc2e" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Layer" Tag="25" ctype="GameLayerObjectData">
        <Size X="720.0000" Y="1280.0000" />
        <Children>
          <AbstractNodeData Name="Bg" ActionTag="860328572" Tag="96" IconVisible="True" RightMargin="720.0000" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="Bg_0" ActionTag="460516090" Tag="1169" IconVisible="False" RightMargin="-720.0000" TopMargin="-1440.0000" BottomMargin="-160.0000" Scale9Enable="True" LeftEage="6" RightEage="6" TopEage="6" BottomEage="6" Scale9OriginX="6" Scale9OriginY="6" Scale9Width="8" Scale9Height="8" ctype="ImageViewObjectData">
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
          <AbstractNodeData Name="UpLeftFit" ActionTag="1732085602" Tag="158" IconVisible="True" RightMargin="720.0000" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="UpLeftBg" ActionTag="2108020856" Tag="155" IconVisible="False" LeftMargin="-0.0002" RightMargin="-719.9998" TopMargin="-1439.9999" BottomMargin="1151.9999" Scale9Enable="True" LeftEage="6" RightEage="6" TopEage="41" BottomEage="41" Scale9OriginX="6" Scale9OriginY="41" Scale9Width="8" Scale9Height="44" ctype="ImageViewObjectData">
                <Size X="720.0000" Y="288.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="359.9998" Y="1295.9999" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/01_07_Sitting/bg_007.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="SittingText_TT" ActionTag="429935579" Tag="11" IconVisible="False" LeftMargin="36.5000" RightMargin="-123.5000" TopMargin="-1243.5000" BottomMargin="1188.5000" FontSize="42" LabelText="设置" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="87.0000" Y="55.0000" />
                <AnchorPoint ScaleY="0.5000" />
                <Position X="36.5000" Y="1216.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="Logout" ActionTag="1389687274" Tag="13" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="LogoutButton" ActionTag="296554228" Tag="14" IconVisible="False" LeftMargin="544.5000" RightMargin="-692.5000" TopMargin="-1255.0000" BottomMargin="1179.0000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="18" RightEage="18" TopEage="15" BottomEage="11" Scale9OriginX="18" Scale9OriginY="15" Scale9Width="112" Scale9Height="50" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="" ctype="LuaPxButtonObjectData">
                    <Size X="148.0000" Y="76.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="618.5000" Y="1217.0000" />
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
                  <AbstractNodeData Name="LogoutText_TT" ActionTag="86263977" Tag="110" IconVisible="False" LeftMargin="570.0000" RightMargin="-667.0000" TopMargin="-1233.0000" BottomMargin="1201.0000" FontSize="24" LabelText="账户登出" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="97.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="618.5000" Y="1217.0000" />
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
            <AnchorPoint />
            <Position />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="Middel" ActionTag="600011771" Tag="97" IconVisible="True" RightMargin="720.0000" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="SittingScrollViewNode" ActionTag="-1451825857" Tag="3502" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="SittingScrollView" ActionTag="894007535" Tag="66" IconVisible="False" RightMargin="-720.0000" TopMargin="-1153.9999" BottomMargin="122.9999" TouchEnable="True" ClipAble="True" ComboBoxIndex="1" ColorAngle="90.0000" LeftEage="6" RightEage="6" TopEage="6" BottomEage="6" Scale9OriginX="-6" Scale9OriginY="-6" Scale9Width="12" Scale9Height="12" ScrollDirectionType="Vertical" ctype="ScrollViewObjectData">
                    <Size X="720.0000" Y="1031.0000" />
                    <Children>
                      <AbstractNodeData Name="Content" ActionTag="1876824713" Tag="244" IconVisible="True" RightMargin="720.0000" TopMargin="1049.0000" BottomMargin="311.0000" ctype="SingleNodeObjectData">
                        <Size X="0.0000" Y="0.0000" />
                        <Children>
                          <AbstractNodeData Name="UserSitting" ActionTag="679941973" Tag="115" IconVisible="True" ctype="SingleNodeObjectData">
                            <Size X="0.0000" Y="0.0000" />
                            <Children>
                              <AbstractNodeData Name="UserSittingText_TT" ActionTag="-1547260309" Tag="117" IconVisible="False" LeftMargin="34.4995" RightMargin="-165.4995" TopMargin="-1004.9988" BottomMargin="962.9988" FontSize="32" LabelText="用户设置" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                                <Size X="131.0000" Y="42.0000" />
                                <AnchorPoint ScaleY="0.5000" />
                                <Position X="34.4995" Y="983.9988" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition />
                                <PreSize X="0.0000" Y="0.0000" />
                                <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                                <OutlineColor A="255" R="255" G="0" B="0" />
                                <ShadowColor A="255" R="110" G="110" B="110" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="UserSittingBg" ActionTag="-553854950" Tag="119" IconVisible="False" LeftMargin="30.0013" RightMargin="-688.0013" TopMargin="-937.9996" BottomMargin="774.9996" Scale9Enable="True" LeftEage="19" RightEage="19" TopEage="19" BottomEage="19" Scale9OriginX="19" Scale9OriginY="19" Scale9Width="24" Scale9Height="24" ctype="ImageViewObjectData">
                                <Size X="658.0000" Y="163.0000" />
                                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                <Position X="359.0013" Y="856.4996" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition />
                                <PreSize X="0.0000" Y="0.0000" />
                                <FileData Type="Normal" Path="ui/01_07_Sitting/frame_027.png" Plist="" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="PasswordButton" ActionTag="-1255610831" Tag="121" IconVisible="False" LeftMargin="56.9997" RightMargin="-346.9997" TopMargin="-901.9990" BottomMargin="809.9990" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="260" Scale9Height="76" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="Sound004" ctype="LuaPxButtonObjectData">
                                <Size X="290.0000" Y="92.0000" />
                                <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                                <Children>
                                  <AbstractNodeData Name="PasswordText_TT" ActionTag="1802655519" Tag="122" IconVisible="False" LeftMargin="87.5000" RightMargin="87.5000" TopMargin="26.5000" BottomMargin="28.5000" FontSize="28" LabelText="账号设置" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-1.0000" ShadowEnabled="True" ctype="TextObjectData">
                                    <Size X="115.0000" Y="37.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="145.0000" Y="47.0000" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition X="0.5000" Y="0.5109" />
                                    <PreSize X="0.3966" Y="0.4022" />
                                    <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                                    <OutlineColor A="255" R="255" G="0" B="0" />
                                    <ShadowColor A="255" R="42" G="42" B="57" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="PasswordTipDotIcon" ActionTag="-95130573" Tag="1147" IconVisible="False" LeftMargin="262.0001" RightMargin="-8.0001" TopMargin="-5.0000" BottomMargin="61.0000" LeftEage="11" RightEage="11" TopEage="11" BottomEage="11" Scale9OriginX="11" Scale9OriginY="11" Scale9Width="14" Scale9Height="14" ctype="ImageViewObjectData">
                                    <Size X="36.0000" Y="36.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="280.0001" Y="79.0000" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition X="0.9655" Y="0.8587" />
                                    <PreSize X="0.1241" Y="0.3913" />
                                    <FileData Type="Normal" Path="ui/00_01_Common/icon_009.png" Plist="" />
                                  </AbstractNodeData>
                                </Children>
                                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                <Position X="201.9997" Y="855.9990" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition />
                                <PreSize X="0.0000" Y="0.0000" />
                                <TextColor A="255" R="255" G="255" B="255" />
                                <DisabledFileData Type="Normal" Path="ui/01_07_Sitting/button_021.png" Plist="" />
                                <PressedFileData Type="Normal" Path="ui/01_07_Sitting/button_021.png" Plist="" />
                                <NormalFileData Type="Normal" Path="ui/01_07_Sitting/button_021.png" Plist="" />
                                <OutlineColor A="255" R="255" G="0" B="0" />
                                <ShadowColor A="255" R="110" G="110" B="110" />
                                <MixedColor A="255" R="65" G="65" B="70" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="LanguageButton" ActionTag="-840769043" Tag="670" IconVisible="False" LeftMargin="365.0000" RightMargin="-655.0000" TopMargin="-901.9988" BottomMargin="809.9988" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="260" Scale9Height="76" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="Sound004" ctype="LuaPxButtonObjectData">
                                <Size X="290.0000" Y="92.0000" />
                                <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                                <Children>
                                  <AbstractNodeData Name="LanguageText_TT" ActionTag="-319473575" Tag="671" IconVisible="False" LeftMargin="87.5000" RightMargin="87.5000" TopMargin="26.5000" BottomMargin="28.5000" FontSize="28" LabelText="语言设置" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-1.0000" ShadowEnabled="True" ctype="TextObjectData">
                                    <Size X="115.0000" Y="37.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="145.0000" Y="47.0000" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition X="0.5000" Y="0.5109" />
                                    <PreSize X="0.3966" Y="0.4022" />
                                    <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                                    <OutlineColor A="255" R="255" G="0" B="0" />
                                    <ShadowColor A="255" R="42" G="42" B="57" />
                                  </AbstractNodeData>
                                </Children>
                                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                <Position X="510.0000" Y="855.9988" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition />
                                <PreSize X="0.0000" Y="0.0000" />
                                <TextColor A="255" R="255" G="255" B="255" />
                                <DisabledFileData Type="Normal" Path="ui/01_07_Sitting/button_021.png" Plist="" />
                                <PressedFileData Type="Normal" Path="ui/01_07_Sitting/button_021.png" Plist="" />
                                <NormalFileData Type="Normal" Path="ui/01_07_Sitting/button_021.png" Plist="" />
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
                          <AbstractNodeData Name="SoundSitting" ActionTag="651482703" Tag="123" IconVisible="True" ctype="SingleNodeObjectData">
                            <Size X="0.0000" Y="0.0000" />
                            <Children>
                              <AbstractNodeData Name="SoundSittingText_TT" ActionTag="-1875414641" Tag="124" IconVisible="False" LeftMargin="35.5012" RightMargin="-166.5012" TopMargin="-747.9951" BottomMargin="705.9951" FontSize="32" LabelText="声音设置" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                                <Size X="131.0000" Y="42.0000" />
                                <AnchorPoint ScaleY="0.5000" />
                                <Position X="35.5012" Y="726.9951" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition />
                                <PreSize X="0.0000" Y="0.0000" />
                                <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                                <OutlineColor A="255" R="255" G="0" B="0" />
                                <ShadowColor A="255" R="110" G="110" B="110" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="SoundSittingBg" ActionTag="758825268" Tag="125" IconVisible="False" LeftMargin="29.0000" RightMargin="-687.0000" TopMargin="-681.0051" BottomMargin="289.0051" Scale9Enable="True" LeftEage="19" RightEage="19" TopEage="19" BottomEage="19" Scale9OriginX="19" Scale9OriginY="19" Scale9Width="24" Scale9Height="24" ctype="ImageViewObjectData">
                                <Size X="658.0000" Y="392.0000" />
                                <AnchorPoint ScaleX="0.5000" ScaleY="1.0000" />
                                <Position X="358.0000" Y="681.0051" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition />
                                <PreSize X="0.0000" Y="0.0000" />
                                <FileData Type="Normal" Path="ui/01_07_Sitting/frame_027.png" Plist="" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="SoundEffect_1" ActionTag="801171899" Tag="126" IconVisible="True" ctype="SingleNodeObjectData">
                                <Size X="0.0000" Y="0.0000" />
                                <Children>
                                  <AbstractNodeData Name="SoundEffectText_1_TT" ActionTag="-1621190942" Tag="127" IconVisible="False" LeftMargin="58.5000" RightMargin="-113.5000" TopMargin="-637.7119" BottomMargin="603.7119" FontSize="26" LabelText="音乐" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                                    <Size X="55.0000" Y="34.0000" />
                                    <AnchorPoint ScaleY="0.5000" />
                                    <Position X="58.5000" Y="620.7119" />
                                    <Scale ScaleX="1.0000" ScaleY="0.8852" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                                    <OutlineColor A="255" R="255" G="0" B="0" />
                                    <ShadowColor A="255" R="110" G="110" B="110" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="EffectCheckBox_1" ActionTag="239530273" Tag="60" IconVisible="False" LeftMargin="139.0022" RightMargin="-191.0022" TopMargin="-644.0020" BottomMargin="596.0020" TouchEnable="True" ctype="CheckBoxObjectData">
                                    <Size X="52.0000" Y="48.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="165.0022" Y="620.0020" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <NormalBackFileData Type="Normal" Path="ui/01_07_Sitting/icon_026.png" Plist="" />
                                    <PressedBackFileData Type="Normal" Path="ui/01_07_Sitting/icon_026.png" Plist="" />
                                    <DisableBackFileData Type="Normal" Path="ui/01_07_Sitting/icon_026.png" Plist="" />
                                    <NodeNormalFileData Type="Normal" Path="ui/01_07_Sitting/icon_025.png" Plist="" />
                                    <NodeDisableFileData Type="Normal" Path="ui/01_07_Sitting/icon_025.png" Plist="" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="EffectSlider_1" ActionTag="1273647595" Tag="63" IconVisible="False" LeftMargin="213.0043" RightMargin="-649.0043" TopMargin="-633.0061" BottomMargin="605.0061" TouchEnable="True" PercentInfo="59" DisplayState="False" ctype="SliderObjectData">
                                    <Size X="436.0000" Y="28.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="431.0043" Y="619.0061" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <BackGroundData Type="Normal" Path="ui/01_07_Sitting/strip_006.png" Plist="" />
                                    <ProgressBarData Type="Normal" Path="ui/01_07_Sitting/strip_007.png" Plist="" />
                                    <BallNormalData Type="Normal" Path="ui/01_07_Sitting/button_018.png" Plist="" />
                                    <BallPressedData Type="Normal" Path="ui/01_07_Sitting/button_018.png" Plist="" />
                                    <BallDisabledData Type="Normal" Path="ui/01_07_Sitting/button_019.png" Plist="" />
                                  </AbstractNodeData>
                                </Children>
                                <AnchorPoint />
                                <Position />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition />
                                <PreSize X="0.0000" Y="0.0000" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="SoundEffect_2" ActionTag="1902961527" Tag="138" IconVisible="True" ctype="SingleNodeObjectData">
                                <Size X="0.0000" Y="0.0000" />
                                <Children>
                                  <AbstractNodeData Name="SoundEffectText_2_TT" ActionTag="1233570016" Tag="32" IconVisible="False" LeftMargin="57.5010" RightMargin="-112.5010" TopMargin="-548.9961" BottomMargin="514.9961" FontSize="26" LabelText="音效" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                                    <Size X="55.0000" Y="34.0000" />
                                    <AnchorPoint ScaleY="0.5000" />
                                    <Position X="57.5010" Y="531.9961" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                                    <OutlineColor A="255" R="255" G="0" B="0" />
                                    <ShadowColor A="255" R="110" G="110" B="110" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="EffectCheckBox_2" ActionTag="-1331088235" Tag="61" IconVisible="False" LeftMargin="139.0022" RightMargin="-191.0022" TopMargin="-556.0004" BottomMargin="508.0004" TouchEnable="True" CheckedState="True" ctype="CheckBoxObjectData">
                                    <Size X="52.0000" Y="48.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="165.0022" Y="532.0004" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <NormalBackFileData Type="Normal" Path="ui/01_07_Sitting/icon_026.png" Plist="" />
                                    <PressedBackFileData Type="Normal" Path="ui/01_07_Sitting/icon_026.png" Plist="" />
                                    <DisableBackFileData Type="Normal" Path="ui/01_07_Sitting/icon_026.png" Plist="" />
                                    <NodeNormalFileData Type="Normal" Path="ui/01_07_Sitting/icon_025.png" Plist="" />
                                    <NodeDisableFileData Type="Normal" Path="ui/01_07_Sitting/icon_025.png" Plist="" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="EffectSlider_2" ActionTag="100973423" Tag="64" IconVisible="False" LeftMargin="213.0043" RightMargin="-649.0043" TopMargin="-545.0029" BottomMargin="517.0029" TouchEnable="True" PercentInfo="24" ctype="SliderObjectData">
                                    <Size X="436.0000" Y="28.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="431.0043" Y="531.0029" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <BackGroundData Type="Normal" Path="ui/01_07_Sitting/strip_006.png" Plist="" />
                                    <ProgressBarData Type="Normal" Path="ui/01_07_Sitting/strip_005.png" Plist="" />
                                    <BallNormalData Type="Normal" Path="ui/01_07_Sitting/button_018.png" Plist="" />
                                    <BallPressedData Type="Normal" Path="ui/01_07_Sitting/button_018.png" Plist="" />
                                    <BallDisabledData Type="Normal" Path="ui/01_07_Sitting/button_019.png" Plist="" />
                                  </AbstractNodeData>
                                </Children>
                                <AnchorPoint />
                                <Position />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition />
                                <PreSize X="0.0000" Y="0.0000" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="SoundEffect_3" ActionTag="900181548" Tag="139" IconVisible="True" ctype="SingleNodeObjectData">
                                <Size X="0.0000" Y="0.0000" />
                                <Children>
                                  <AbstractNodeData Name="SoundEffectText_3_TT" ActionTag="1237259920" Tag="33" IconVisible="False" LeftMargin="58.5000" RightMargin="-113.5000" TopMargin="-460.9978" BottomMargin="426.9978" FontSize="26" LabelText="语音" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                                    <Size X="55.0000" Y="34.0000" />
                                    <AnchorPoint ScaleY="0.5000" />
                                    <Position X="58.5000" Y="443.9978" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                                    <OutlineColor A="255" R="255" G="0" B="0" />
                                    <ShadowColor A="255" R="110" G="110" B="110" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="EffectCheckBox_3" ActionTag="1543520254" Tag="62" IconVisible="False" LeftMargin="140.0038" RightMargin="-192.0038" TopMargin="-466.9959" BottomMargin="418.9959" TouchEnable="True" CheckedState="True" ctype="CheckBoxObjectData">
                                    <Size X="52.0000" Y="48.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="166.0038" Y="442.9959" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <NormalBackFileData Type="Normal" Path="ui/01_07_Sitting/icon_026.png" Plist="" />
                                    <PressedBackFileData Type="Normal" Path="ui/01_07_Sitting/icon_026.png" Plist="" />
                                    <DisableBackFileData Type="Normal" Path="ui/01_07_Sitting/icon_026.png" Plist="" />
                                    <NodeNormalFileData Type="Normal" Path="ui/01_07_Sitting/icon_025.png" Plist="" />
                                    <NodeDisableFileData Type="Normal" Path="ui/01_07_Sitting/icon_025.png" Plist="" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="EffectSlider_3" ActionTag="-1424073607" Tag="65" IconVisible="False" LeftMargin="212.9990" RightMargin="-648.9990" TopMargin="-455.9955" BottomMargin="427.9955" TouchEnable="True" PercentInfo="24" ctype="SliderObjectData">
                                    <Size X="436.0000" Y="28.0000" />
                                    <AnchorPoint ScaleY="0.5000" />
                                    <Position X="212.9990" Y="441.9955" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <BackGroundData Type="Normal" Path="ui/01_07_Sitting/strip_006.png" Plist="" />
                                    <ProgressBarData Type="Normal" Path="ui/01_07_Sitting/strip_005.png" Plist="" />
                                    <BallNormalData Type="Normal" Path="ui/01_07_Sitting/button_018.png" Plist="" />
                                    <BallPressedData Type="Normal" Path="ui/01_07_Sitting/button_018.png" Plist="" />
                                    <BallDisabledData Type="Normal" Path="ui/01_07_Sitting/button_019.png" Plist="" />
                                  </AbstractNodeData>
                                </Children>
                                <AnchorPoint />
                                <Position />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition />
                                <PreSize X="0.0000" Y="0.0000" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="Shock" ActionTag="1195300086" Tag="140" IconVisible="True" LeftMargin="-0.0006" RightMargin="0.0006" ctype="SingleNodeObjectData">
                                <Size X="0.0000" Y="0.0000" />
                                <Children>
                                  <AbstractNodeData Name="ShockText_TT" ActionTag="110480966" Tag="34" IconVisible="False" LeftMargin="58.0001" RightMargin="-112.0001" TopMargin="-374.0001" BottomMargin="340.0001" FontSize="26" LabelText="震动" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                                    <Size X="54.0000" Y="34.0000" />
                                    <AnchorPoint ScaleY="0.5000" />
                                    <Position X="58.0001" Y="357.0001" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                                    <OutlineColor A="255" R="255" G="0" B="0" />
                                    <ShadowColor A="255" R="110" G="110" B="110" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="ShockBg" ActionTag="-43591495" Alpha="244" Tag="35" IconVisible="False" LeftMargin="212.9994" RightMargin="-406.9994" TopMargin="-385.0004" BottomMargin="323.0004" Scale9Enable="True" LeftEage="9" RightEage="9" TopEage="20" BottomEage="20" Scale9OriginX="9" Scale9OriginY="20" Scale9Width="12" Scale9Height="22" ctype="ImageViewObjectData">
                                    <Size X="194.0000" Y="62.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="309.9994" Y="354.0004" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <FileData Type="Normal" Path="ui/01_07_Sitting/frame_028.png" Plist="" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="TurnOn" Visible="False" ActionTag="374681349" Tag="38" IconVisible="True" ctype="SingleNodeObjectData">
                                    <Size X="0.0000" Y="0.0000" />
                                    <Children>
                                      <AbstractNodeData Name="TurnOffText_1_TT" ActionTag="-2134728738" Alpha="153" Tag="142" IconVisible="False" LeftMargin="342.4968" RightMargin="-369.4968" TopMargin="-372.0000" BottomMargin="340.0000" FontSize="24" LabelText="关" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-1.0000" ctype="TextObjectData">
                                        <Size X="27.0000" Y="32.0000" />
                                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                        <Position X="355.9968" Y="356.0000" />
                                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                        <CColor A="255" R="255" G="255" B="255" />
                                        <PrePosition />
                                        <PreSize X="0.0000" Y="0.0000" />
                                        <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                                        <OutlineColor A="255" R="255" G="0" B="0" />
                                        <ShadowColor A="255" R="250" G="250" B="250" />
                                      </AbstractNodeData>
                                      <AbstractNodeData Name="TurnOnButton" ActionTag="-1915727261" Tag="71" IconVisible="False" LeftMargin="215.4995" RightMargin="-311.4995" TopMargin="-383.5006" BottomMargin="326.5006" Scale9Enable="True" LeftEage="31" RightEage="31" TopEage="18" BottomEage="18" Scale9OriginX="31" Scale9OriginY="18" Scale9Width="34" Scale9Height="20" ctype="ImageViewObjectData">
                                        <Size X="96.0000" Y="57.0000" />
                                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                        <Position X="263.4995" Y="355.0006" />
                                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                        <CColor A="255" R="255" G="255" B="255" />
                                        <PrePosition />
                                        <PreSize X="0.0000" Y="0.0000" />
                                        <FileData Type="Normal" Path="ui/01_07_Sitting/button_020.png" Plist="" />
                                      </AbstractNodeData>
                                      <AbstractNodeData Name="TurnOnText_TT" ActionTag="1204346219" Tag="39" IconVisible="False" LeftMargin="249.5016" RightMargin="-276.5016" TopMargin="-371.0014" BottomMargin="339.0014" FontSize="24" LabelText="开" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-1.0000" ShadowEnabled="True" ctype="TextObjectData">
                                        <Size X="27.0000" Y="32.0000" />
                                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                        <Position X="263.0016" Y="355.0014" />
                                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                        <CColor A="255" R="35" G="33" B="73" />
                                        <PrePosition />
                                        <PreSize X="0.0000" Y="0.0000" />
                                        <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                                        <OutlineColor A="255" R="255" G="0" B="0" />
                                        <ShadowColor A="255" R="250" G="250" B="250" />
                                      </AbstractNodeData>
                                    </Children>
                                    <AnchorPoint />
                                    <Position />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="TurnOff" ActionTag="-1873061002" Tag="41" IconVisible="True" ctype="SingleNodeObjectData">
                                    <Size X="0.0000" Y="0.0000" />
                                    <Children>
                                      <AbstractNodeData Name="TurnOnText_1_TT" ActionTag="1136109364" Alpha="153" Tag="140" IconVisible="False" LeftMargin="248.4921" RightMargin="-275.4921" TopMargin="-371.3600" BottomMargin="339.3600" FontSize="24" LabelText="开" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-1.0000" ctype="TextObjectData">
                                        <Size X="27.0000" Y="32.0000" />
                                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                        <Position X="261.9921" Y="355.3600" />
                                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                        <CColor A="255" R="255" G="255" B="255" />
                                        <PrePosition />
                                        <PreSize X="0.0000" Y="0.0000" />
                                        <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                                        <OutlineColor A="255" R="255" G="0" B="0" />
                                        <ShadowColor A="255" R="250" G="250" B="250" />
                                      </AbstractNodeData>
                                      <AbstractNodeData Name="TurnOffButton" ActionTag="1998385652" Tag="72" IconVisible="False" LeftMargin="308.4991" RightMargin="-404.4991" TopMargin="-383.5005" BottomMargin="326.5005" Scale9Enable="True" LeftEage="31" RightEage="31" TopEage="18" BottomEage="18" Scale9OriginX="31" Scale9OriginY="18" Scale9Width="34" Scale9Height="20" ctype="ImageViewObjectData">
                                        <Size X="96.0000" Y="57.0000" />
                                        <AnchorPoint ScaleY="0.5000" />
                                        <Position X="308.4991" Y="355.0005" />
                                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                        <CColor A="255" R="255" G="255" B="255" />
                                        <PrePosition />
                                        <PreSize X="0.0000" Y="0.0000" />
                                        <FileData Type="Normal" Path="ui/01_07_Sitting/button_020.png" Plist="" />
                                      </AbstractNodeData>
                                      <AbstractNodeData Name="TurnOffText_TT" ActionTag="2133507714" Tag="42" IconVisible="False" LeftMargin="341.5000" RightMargin="-368.5000" TopMargin="-371.9984" BottomMargin="339.9984" FontSize="24" LabelText="关" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-1.0000" ShadowEnabled="True" ctype="TextObjectData">
                                        <Size X="27.0000" Y="32.0000" />
                                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                        <Position X="355.0000" Y="355.9984" />
                                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                        <CColor A="255" R="35" G="33" B="73" />
                                        <PrePosition />
                                        <PreSize X="0.0000" Y="0.0000" />
                                        <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                                        <OutlineColor A="255" R="255" G="0" B="0" />
                                        <ShadowColor A="255" R="250" G="250" B="250" />
                                      </AbstractNodeData>
                                    </Children>
                                    <AnchorPoint />
                                    <Position />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="ShockPanel" ActionTag="1672739290" Tag="130" IconVisible="False" LeftMargin="213.9992" RightMargin="-405.9992" TopMargin="-384.0006" BottomMargin="324.0006" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                                    <Size X="192.0000" Y="60.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="309.9992" Y="354.0006" />
                                    <Scale ScaleX="1.0000" ScaleY="0.9928" />
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
                                <Position X="-0.0006" />
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
                          <AbstractNodeData Name="UserCener" ActionTag="-950896989" Tag="46" IconVisible="True" ctype="SingleNodeObjectData">
                            <Size X="0.0000" Y="0.0000" />
                            <Children>
                              <AbstractNodeData Name="UserCenterText_TT" ActionTag="1465644686" Tag="47" IconVisible="False" LeftMargin="34.5003" RightMargin="-165.5003" TopMargin="-259.0031" BottomMargin="217.0031" FontSize="32" LabelText="用户中心" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                                <Size X="131.0000" Y="42.0000" />
                                <AnchorPoint ScaleY="0.5000" />
                                <Position X="34.5003" Y="238.0031" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition />
                                <PreSize X="0.0000" Y="0.0000" />
                                <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                                <OutlineColor A="255" R="255" G="0" B="0" />
                                <ShadowColor A="255" R="110" G="110" B="110" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="UserCenterBg" ActionTag="160911900" Tag="48" IconVisible="False" LeftMargin="27.9998" RightMargin="-685.9998" TopMargin="-194.0011" BottomMargin="32.0011" Scale9Enable="True" LeftEage="19" RightEage="19" TopEage="19" BottomEage="19" Scale9OriginX="19" Scale9OriginY="19" Scale9Width="24" Scale9Height="24" ctype="ImageViewObjectData">
                                <Size X="658.0000" Y="162.0000" />
                                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                <Position X="356.9998" Y="113.0011" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition />
                                <PreSize X="0.0000" Y="0.0000" />
                                <FileData Type="Normal" Path="ui/01_07_Sitting/frame_027.png" Plist="" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="Help" ActionTag="1963545166" Tag="50" IconVisible="True" ctype="SingleNodeObjectData">
                                <Size X="0.0000" Y="0.0000" />
                                <Children>
                                  <AbstractNodeData Name="HelpButton" ActionTag="-788604111" Tag="52" IconVisible="False" LeftMargin="57.0000" RightMargin="-347.0000" TopMargin="-156.9997" BottomMargin="64.9997" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="260" Scale9Height="70" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="1.0000" ClickEffect="" ctype="LuaPxButtonObjectData">
                                    <Size X="290.0000" Y="92.0000" />
                                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                                    <Children>
                                      <AbstractNodeData Name="HelpText_TT" ActionTag="1131005103" Tag="53" IconVisible="False" LeftMargin="116.0000" RightMargin="116.0000" TopMargin="23.5000" BottomMargin="31.5000" FontSize="28" LabelText="帮助" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-1.0000" ShadowEnabled="True" ctype="TextObjectData">
                                        <Size X="58.0000" Y="37.0000" />
                                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                        <Position X="145.0000" Y="50.0000" />
                                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                        <CColor A="255" R="0" G="0" B="0" />
                                        <PrePosition X="0.5000" Y="0.5435" />
                                        <PreSize X="0.2000" Y="0.4022" />
                                        <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                                        <OutlineColor A="255" R="255" G="0" B="0" />
                                        <ShadowColor A="255" R="250" G="250" B="250" />
                                      </AbstractNodeData>
                                    </Children>
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="202.0000" Y="110.9997" />
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
                              <AbstractNodeData Name="CustomService" ActionTag="1812748720" Tag="51" IconVisible="True" ctype="SingleNodeObjectData">
                                <Size X="0.0000" Y="0.0000" />
                                <Children>
                                  <AbstractNodeData Name="CustomServiceButton" ActionTag="1177389518" Tag="54" IconVisible="False" LeftMargin="364.9984" RightMargin="-654.9984" TopMargin="-157.0016" BottomMargin="65.0016" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="260" Scale9Height="70" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="1.0000" ClickEffect="" ctype="LuaPxButtonObjectData">
                                    <Size X="290.0000" Y="92.0000" />
                                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                                    <Children>
                                      <AbstractNodeData Name="CustomServiceText_TT" ActionTag="-577188910" Tag="55" IconVisible="False" LeftMargin="115.5000" RightMargin="115.5000" TopMargin="23.5000" BottomMargin="31.5000" FontSize="28" LabelText="客服" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-1.0000" ShadowEnabled="True" ctype="TextObjectData">
                                        <Size X="59.0000" Y="37.0000" />
                                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                        <Position X="145.0000" Y="50.0000" />
                                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                        <CColor A="255" R="0" G="0" B="0" />
                                        <PrePosition X="0.5000" Y="0.5435" />
                                        <PreSize X="0.2034" Y="0.4022" />
                                        <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                                        <OutlineColor A="255" R="255" G="0" B="0" />
                                        <ShadowColor A="255" R="250" G="250" B="250" />
                                      </AbstractNodeData>
                                    </Children>
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="509.9984" Y="111.0016" />
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
                            </Children>
                            <AnchorPoint />
                            <Position />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition />
                            <PreSize X="0.0000" Y="0.0000" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="FollowUs" ActionTag="1577881857" Tag="58" IconVisible="True" ctype="SingleNodeObjectData">
                            <Size X="0.0000" Y="0.0000" />
                            <Children>
                              <AbstractNodeData Name="FollowUsText_TT" ActionTag="-864570645" Tag="57" IconVisible="False" LeftMargin="34.0001" RightMargin="-172.0001" TopMargin="-5.5013" BottomMargin="-39.4987" FontSize="34" LabelText="關注我們" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                                <Size X="138.0000" Y="45.0000" />
                                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                <Position X="103.0001" Y="-16.9987" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition />
                                <PreSize X="0.0000" Y="0.0000" />
                                <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                                <OutlineColor A="255" R="255" G="0" B="0" />
                                <ShadowColor A="255" R="110" G="110" B="110" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="FollowUsBg" ActionTag="1339832219" Tag="59" IconVisible="False" LeftMargin="29.0010" RightMargin="-687.0010" TopMargin="60.4985" BottomMargin="-223.4985" Scale9Enable="True" LeftEage="19" RightEage="19" TopEage="19" BottomEage="19" Scale9OriginX="19" Scale9OriginY="19" Scale9Width="24" Scale9Height="24" ctype="ImageViewObjectData">
                                <Size X="658.0000" Y="163.0000" />
                                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                <Position X="358.0010" Y="-141.9985" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition />
                                <PreSize X="0.0000" Y="0.0000" />
                                <FileData Type="Normal" Path="ui/01_07_Sitting/frame_027.png" Plist="" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="FacebookButton" ActionTag="-226103773" Tag="60" IconVisible="False" LeftMargin="68.0005" RightMargin="-148.0005" TopMargin="100.9991" BottomMargin="-180.9991" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="50" Scale9Height="58" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="1.0000" ClickEffect="" ctype="LuaPxButtonObjectData">
                                <Size X="80.0000" Y="80.0000" />
                                <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                <Position X="108.0005" Y="-140.9991" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition />
                                <PreSize X="0.0000" Y="0.0000" />
                                <TextColor A="255" R="255" G="255" B="255" />
                                <DisabledFileData Type="Normal" Path="ui/01_07_Sitting/icon_024.png" Plist="" />
                                <PressedFileData Type="Normal" Path="ui/01_07_Sitting/icon_024.png" Plist="" />
                                <NormalFileData Type="Normal" Path="ui/01_07_Sitting/icon_024.png" Plist="" />
                                <OutlineColor A="255" R="255" G="0" B="0" />
                                <ShadowColor A="255" R="110" G="110" B="110" />
                                <MixedColor A="255" R="65" G="65" B="70" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="WeChatButton" ActionTag="-444672027" VisibleForFrame="False" Tag="61" IconVisible="False" LeftMargin="181.0018" RightMargin="-261.0018" TopMargin="100.9991" BottomMargin="-180.9991" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="50" Scale9Height="58" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="1.0000" ClickEffect="" ctype="LuaPxButtonObjectData">
                                <Size X="80.0000" Y="80.0000" />
                                <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                <Position X="221.0018" Y="-140.9991" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition />
                                <PreSize X="0.0000" Y="0.0000" />
                                <TextColor A="255" R="255" G="255" B="255" />
                                <DisabledFileData Type="Normal" Path="ui/01_07_Sitting/icon_023.png" Plist="" />
                                <PressedFileData Type="Normal" Path="ui/01_07_Sitting/icon_023.png" Plist="" />
                                <NormalFileData Type="Normal" Path="ui/01_07_Sitting/icon_023.png" Plist="" />
                                <OutlineColor A="255" R="255" G="0" B="0" />
                                <ShadowColor A="255" R="110" G="110" B="110" />
                                <MixedColor A="255" R="65" G="65" B="70" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="InsButton" ActionTag="992096232" VisibleForFrame="False" Tag="62" IconVisible="False" LeftMargin="291.0008" RightMargin="-371.0008" TopMargin="100.9993" BottomMargin="-180.9993" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="50" Scale9Height="58" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="1.0000" ClickEffect="" ctype="LuaPxButtonObjectData">
                                <Size X="80.0000" Y="80.0000" />
                                <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                <Position X="331.0008" Y="-140.9993" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition />
                                <PreSize X="0.0000" Y="0.0000" />
                                <TextColor A="255" R="255" G="255" B="255" />
                                <DisabledFileData Type="Normal" Path="ui/01_07_Sitting/icon_022.png" Plist="" />
                                <PressedFileData Type="Normal" Path="ui/01_07_Sitting/icon_022.png" Plist="" />
                                <NormalFileData Type="Normal" Path="ui/01_07_Sitting/icon_022.png" Plist="" />
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
                          <AbstractNodeData Name="Clause" ActionTag="-1155070200" Tag="63" IconVisible="True" ctype="SingleNodeObjectData">
                            <Size X="0.0000" Y="0.0000" />
                            <Children>
                              <AbstractNodeData Name="Clause_CN" Visible="False" ActionTag="1772139111" Tag="90" IconVisible="True" ctype="SingleNodeObjectData">
                                <Size X="0.0000" Y="0.0000" />
                                <Children>
                                  <AbstractNodeData Name="AgreementText_CN" ActionTag="-1989076307" Alpha="153" Tag="64" IconVisible="False" LeftMargin="29.5000" RightMargin="-176.5000" TopMargin="251.9982" BottomMargin="-283.9982" FontSize="24" LabelText="游戏用户协议" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                                    <Size X="147.0000" Y="32.0000" />
                                    <AnchorPoint ScaleY="0.5000" />
                                    <Position X="29.5000" Y="-267.9982" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                                    <OutlineColor A="255" R="255" G="0" B="0" />
                                    <ShadowColor A="255" R="110" G="110" B="110" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="AgreementPanel_CN" ActionTag="-1588425524" Tag="138" IconVisible="False" LeftMargin="25.0001" RightMargin="-181.0001" TopMargin="255.4977" BottomMargin="-293.4977" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                                    <Size X="156.0000" Y="38.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="103.0001" Y="-274.4977" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <SingleColor A="255" R="150" G="200" B="255" />
                                    <FirstColor A="255" R="150" G="200" B="255" />
                                    <EndColor A="255" R="255" G="255" B="255" />
                                    <ColorVector ScaleY="1.0000" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="AgreementStrip_CN" ActionTag="-1792673307" Tag="99" IconVisible="False" LeftMargin="32.0001" RightMargin="-174.0001" TopMargin="288.4979" BottomMargin="-289.4979" Scale9Enable="True" LeftEage="29" RightEage="29" Scale9OriginX="29" Scale9Width="32" Scale9Height="2" ctype="ImageViewObjectData">
                                    <Size X="142.0000" Y="1.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="103.0001" Y="-288.9979" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="174" G="173" B="201" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <FileData Type="Normal" Path="ui/01_01_Login/strip_001.png" Plist="" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="PrivacyText_CN" ActionTag="-1950803538" Alpha="153" Tag="65" IconVisible="False" LeftMargin="211.5001" RightMargin="-310.5001" TopMargin="251.9981" BottomMargin="-283.9981" FontSize="24" LabelText="隐私政策" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                                    <Size X="99.0000" Y="32.0000" />
                                    <AnchorPoint ScaleY="0.5000" />
                                    <Position X="211.5001" Y="-267.9981" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                                    <OutlineColor A="255" R="255" G="0" B="0" />
                                    <ShadowColor A="255" R="110" G="110" B="110" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="PrivacyPanel_CN" ActionTag="-298050449" Tag="139" IconVisible="False" LeftMargin="208.0000" RightMargin="-314.0000" TopMargin="255.4978" BottomMargin="-293.4978" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                                    <Size X="106.0000" Y="38.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="261.0000" Y="-274.4978" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <SingleColor A="255" R="150" G="200" B="255" />
                                    <FirstColor A="255" R="150" G="200" B="255" />
                                    <EndColor A="255" R="255" G="255" B="255" />
                                    <ColorVector ScaleY="1.0000" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="PrivacyStrip_CN" ActionTag="162286835" Tag="101" IconVisible="False" LeftMargin="214.4985" RightMargin="-309.4985" TopMargin="288.4989" BottomMargin="-289.4989" Scale9Enable="True" LeftEage="29" RightEage="29" Scale9OriginX="29" Scale9Width="32" Scale9Height="2" ctype="ImageViewObjectData">
                                    <Size X="95.0000" Y="1.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="261.9985" Y="-288.9989" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="174" G="173" B="201" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <FileData Type="Normal" Path="ui/01_01_Login/strip_001.png" Plist="" />
                                  </AbstractNodeData>
                                </Children>
                                <AnchorPoint />
                                <Position />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition />
                                <PreSize X="0.0000" Y="0.0000" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="Clause_TW" Visible="False" ActionTag="1783892999" Tag="91" IconVisible="True" ctype="SingleNodeObjectData">
                                <Size X="0.0000" Y="0.0000" />
                                <Children>
                                  <AbstractNodeData Name="AgreementText_TW" ActionTag="-585550502" Alpha="153" Tag="92" IconVisible="False" LeftMargin="29.5000" RightMargin="-176.5000" TopMargin="251.9982" BottomMargin="-283.9982" FontSize="24" LabelText="遊戲用戶協議" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                                    <Size X="147.0000" Y="32.0000" />
                                    <AnchorPoint ScaleY="0.5000" />
                                    <Position X="29.5000" Y="-267.9982" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                                    <OutlineColor A="255" R="255" G="0" B="0" />
                                    <ShadowColor A="255" R="110" G="110" B="110" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="AgreementPanel_TW" ActionTag="1341604704" Tag="93" IconVisible="False" LeftMargin="25.0001" RightMargin="-181.0001" TopMargin="255.4977" BottomMargin="-293.4977" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                                    <Size X="156.0000" Y="38.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="103.0001" Y="-274.4977" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <SingleColor A="255" R="150" G="200" B="255" />
                                    <FirstColor A="255" R="150" G="200" B="255" />
                                    <EndColor A="255" R="255" G="255" B="255" />
                                    <ColorVector ScaleY="1.0000" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="AgreementStrip_TW" ActionTag="-1075985066" Tag="94" IconVisible="False" LeftMargin="32.0001" RightMargin="-174.0001" TopMargin="288.4979" BottomMargin="-289.4979" Scale9Enable="True" LeftEage="29" RightEage="29" Scale9OriginX="29" Scale9Width="32" Scale9Height="2" ctype="ImageViewObjectData">
                                    <Size X="142.0000" Y="1.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="103.0001" Y="-288.9979" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="174" G="173" B="201" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <FileData Type="Normal" Path="ui/01_01_Login/strip_001.png" Plist="" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="PrivacyText_TW" ActionTag="200781718" Alpha="153" Tag="95" IconVisible="False" LeftMargin="211.5001" RightMargin="-310.5001" TopMargin="251.9981" BottomMargin="-283.9981" FontSize="24" LabelText="隱私政策" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                                    <Size X="99.0000" Y="32.0000" />
                                    <AnchorPoint ScaleY="0.5000" />
                                    <Position X="211.5001" Y="-267.9981" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                                    <OutlineColor A="255" R="255" G="0" B="0" />
                                    <ShadowColor A="255" R="110" G="110" B="110" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="PrivacyPanel_TW" ActionTag="1764356325" Tag="96" IconVisible="False" LeftMargin="208.0000" RightMargin="-314.0000" TopMargin="255.4978" BottomMargin="-293.4978" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                                    <Size X="106.0000" Y="38.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="261.0000" Y="-274.4978" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <SingleColor A="255" R="150" G="200" B="255" />
                                    <FirstColor A="255" R="150" G="200" B="255" />
                                    <EndColor A="255" R="255" G="255" B="255" />
                                    <ColorVector ScaleY="1.0000" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="PrivacyStrip_TW" ActionTag="268389484" Tag="97" IconVisible="False" LeftMargin="214.4985" RightMargin="-309.4985" TopMargin="288.4989" BottomMargin="-289.4989" Scale9Enable="True" LeftEage="29" RightEage="29" Scale9OriginX="29" Scale9Width="32" Scale9Height="2" ctype="ImageViewObjectData">
                                    <Size X="95.0000" Y="1.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="261.9985" Y="-288.9989" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="174" G="173" B="201" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <FileData Type="Normal" Path="ui/01_01_Login/strip_001.png" Plist="" />
                                  </AbstractNodeData>
                                </Children>
                                <AnchorPoint />
                                <Position />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition />
                                <PreSize X="0.0000" Y="0.0000" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="Clause_EN" ActionTag="-642883173" Tag="98" IconVisible="True" ctype="SingleNodeObjectData">
                                <Size X="0.0000" Y="0.0000" />
                                <Children>
                                  <AbstractNodeData Name="AgreementText_EN" ActionTag="657602" Alpha="153" Tag="99" IconVisible="False" LeftMargin="29.5000" RightMargin="-218.5000" TopMargin="251.9982" BottomMargin="-283.9982" FontSize="24" LabelText="Terms of Service" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                                    <Size X="189.0000" Y="32.0000" />
                                    <AnchorPoint ScaleY="0.5000" />
                                    <Position X="29.5000" Y="-267.9982" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                                    <OutlineColor A="255" R="255" G="0" B="0" />
                                    <ShadowColor A="255" R="110" G="110" B="110" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="AgreementPanel_EN" ActionTag="1734456602" Tag="100" IconVisible="False" LeftMargin="25.0001" RightMargin="-225.0001" TopMargin="255.4977" BottomMargin="-293.4977" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                                    <Size X="200.0000" Y="38.0000" />
                                    <AnchorPoint ScaleY="0.5000" />
                                    <Position X="25.0001" Y="-274.4977" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <SingleColor A="255" R="150" G="200" B="255" />
                                    <FirstColor A="255" R="150" G="200" B="255" />
                                    <EndColor A="255" R="255" G="255" B="255" />
                                    <ColorVector ScaleY="1.0000" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="AgreementStrip_EN" ActionTag="-628441944" Tag="101" IconVisible="False" LeftMargin="32.0001" RightMargin="-221.0001" TopMargin="288.4979" BottomMargin="-289.4979" Scale9Enable="True" LeftEage="29" RightEage="29" Scale9OriginX="29" Scale9Width="32" Scale9Height="2" ctype="ImageViewObjectData">
                                    <Size X="189.0000" Y="1.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="126.5001" Y="-288.9979" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="174" G="173" B="201" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <FileData Type="Normal" Path="ui/01_01_Login/strip_001.png" Plist="" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="PrivacyText_EN" ActionTag="-91779599" Alpha="153" Tag="102" IconVisible="False" LeftMargin="276.5000" RightMargin="-360.5000" TopMargin="251.9981" BottomMargin="-283.9981" FontSize="24" LabelText="Privacy" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                                    <Size X="84.0000" Y="32.0000" />
                                    <AnchorPoint ScaleY="0.5000" />
                                    <Position X="276.5000" Y="-267.9981" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                                    <OutlineColor A="255" R="255" G="0" B="0" />
                                    <ShadowColor A="255" R="110" G="110" B="110" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="PrivacyPanel_EN" ActionTag="1398076359" Tag="103" IconVisible="False" LeftMargin="268.0001" RightMargin="-374.0001" TopMargin="255.4978" BottomMargin="-293.4978" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                                    <Size X="106.0000" Y="38.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="321.0001" Y="-274.4978" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <SingleColor A="255" R="150" G="200" B="255" />
                                    <FirstColor A="255" R="150" G="200" B="255" />
                                    <EndColor A="255" R="255" G="255" B="255" />
                                    <ColorVector ScaleY="1.0000" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="PrivacyStrip_EN" ActionTag="-653762385" Tag="104" IconVisible="False" LeftMargin="274.4986" RightMargin="-369.4986" TopMargin="288.4987" BottomMargin="-289.4987" Scale9Enable="True" LeftEage="29" RightEage="29" Scale9OriginX="29" Scale9Width="32" Scale9Height="2" ctype="ImageViewObjectData">
                                    <Size X="95.0000" Y="1.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="321.9986" Y="-288.9987" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="174" G="173" B="201" />
                                    <PrePosition />
                                    <PreSize X="0.0000" Y="0.0000" />
                                    <FileData Type="Normal" Path="ui/01_01_Login/strip_001.png" Plist="" />
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
                        <AnchorPoint />
                        <Position Y="311.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition Y="0.2287" />
                        <PreSize X="0.0000" Y="0.0000" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint />
                    <Position Y="122.9999" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <SingleColor A="255" R="87" G="83" B="156" />
                    <FirstColor A="255" R="255" G="150" B="100" />
                    <EndColor A="255" R="255" G="255" B="255" />
                    <ColorVector ScaleY="1.0000" />
                    <InnerNodeSize Width="720" Height="1360" />
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
          <AbstractNodeData Name="BelowLeftFit" ActionTag="105813212" Tag="159" IconVisible="True" RightMargin="720.0000" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="BelowLeftBg" ActionTag="1197643886" Tag="157" IconVisible="False" RightMargin="-720.0000" TopMargin="-128.0000" Scale9Enable="True" LeftEage="6" RightEage="6" TopEage="38" BottomEage="38" Scale9OriginX="6" Scale9OriginY="38" Scale9Width="708" Scale9Height="52" ctype="ImageViewObjectData">
                <Size X="720.0000" Y="128.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="1.0000" />
                <Position X="360.0000" Y="128.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/00_01_Common/frame_144.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="Return" ActionTag="-1412446603" Tag="169" IconVisible="False" LeftMargin="17.0000" RightMargin="-163.0000" TopMargin="-108.0000" BottomMargin="46.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size X="146.0000" Y="62.0000" />
                <Children>
                  <AbstractNodeData Name="ReturnButton" ActionTag="2005925306" Tag="112" IconVisible="False" LeftMargin="19.0000" RightMargin="81.0000" TopMargin="8.0000" BottomMargin="8.0000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="16" Scale9Height="24" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="" ctype="LuaPxButtonObjectData">
                    <Size X="46.0000" Y="46.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <Children>
                      <AbstractNodeData Name="ReturnText_TT" ActionTag="-871171647" Tag="113" IconVisible="False" LeftMargin="42.0000" RightMargin="-62.0000" TopMargin="-3.0000" BottomMargin="7.0000" FontSize="32" LabelText="返回" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-2.0000" ShadowEnabled="True" ctype="TextObjectData">
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
          <AbstractNodeData Name="Tip" ActionTag="1912332023" Tag="1998" IconVisible="True" RightMargin="720.0000" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="TipBg" ActionTag="-101334005" Tag="2002" IconVisible="False" LeftMargin="193.9999" RightMargin="-536.9999" TopMargin="-1200.9998" BottomMargin="1108.9998" Scale9Enable="True" LeftEage="16" RightEage="16" TopEage="30" BottomEage="30" Scale9OriginX="16" Scale9OriginY="30" Scale9Width="18" Scale9Height="32" ctype="ImageViewObjectData">
                <Size X="343.0000" Y="92.0000" />
                <AnchorPoint ScaleY="0.5000" />
                <Position X="193.9999" Y="1154.9998" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/02_01_Boast/frame_018.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="TipIcon" ActionTag="1817509444" Tag="2003" IconVisible="False" LeftMargin="216.0000" RightMargin="-264.0000" TopMargin="-1178.9995" BottomMargin="1130.9995" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="15" BottomEage="15" Scale9OriginX="15" Scale9OriginY="15" Scale9Width="18" Scale9Height="18" ctype="ImageViewObjectData">
                <Size X="48.0000" Y="48.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="240.0000" Y="1154.9995" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/02_01_Boast/button_017.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="TipText_1" ActionTag="-1752943777" Tag="2004" IconVisible="False" LeftMargin="287.5000" RightMargin="-482.5000" TopMargin="-1178.9995" BottomMargin="1136.9995" FontSize="32" LabelText="账户修改完成" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="195.0000" Y="42.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="385.0000" Y="1157.9995" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="0" G="0" B="0" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="TipText_2" Visible="False" ActionTag="-1506230907" Tag="2005" IconVisible="False" LeftMargin="294.4998" RightMargin="-475.4998" TopMargin="-1177.9995" BottomMargin="1137.9995" FontSize="30" LabelText="手机绑定成功" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="181.0000" Y="40.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="384.9998" Y="1157.9995" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="0" G="0" B="0" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="TipText_3" Visible="False" ActionTag="1215540508" Tag="2006" IconVisible="False" LeftMargin="293.5000" RightMargin="-476.5000" TopMargin="-1177.9995" BottomMargin="1137.9995" FontSize="30" LabelText="密码修改完成" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="183.0000" Y="40.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="385.0000" Y="1157.9995" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="0" G="0" B="0" />
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