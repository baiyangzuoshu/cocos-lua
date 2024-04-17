<GameFile>
  <PropertyGroup Name="01_07_SittingBindChangeLayer" Type="Layer" ID="70994a02-7c35-499b-a2c6-8c6cc37ce52f" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Layer" Tag="164" ctype="GameLayerObjectData">
        <Size X="720.0000" Y="1280.0000" />
        <Children>
          <AbstractNodeData Name="Bg" ActionTag="627905602" Tag="2" IconVisible="True" RightMargin="720.0000" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="Bg_1" ActionTag="-1467620711" Tag="3" IconVisible="False" RightMargin="-720.0000" TopMargin="-1440.0000" BottomMargin="-160.0000" Scale9Enable="True" LeftEage="6" RightEage="6" TopEage="6" BottomEage="6" Scale9OriginX="6" Scale9OriginY="6" Scale9Width="8" Scale9Height="8" ctype="ImageViewObjectData">
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
          <AbstractNodeData Name="BelowLeftFit" ActionTag="-266673904" Tag="243" IconVisible="True" RightMargin="720.0000" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="Bg_2" ActionTag="874543593" Tag="87" IconVisible="False" LeftMargin="-0.0006" RightMargin="-719.9994" TopMargin="-128.5000" BottomMargin="0.5000" Scale9Enable="True" LeftEage="6" RightEage="6" TopEage="41" BottomEage="41" Scale9OriginX="6" Scale9OriginY="41" Scale9Width="708" Scale9Height="46" ctype="ImageViewObjectData">
                <Size X="720.0000" Y="128.0000" />
                <AnchorPoint ScaleX="0.5000" />
                <Position X="359.9994" Y="0.5000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/00_01_Common/frame_144.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="ReturnPanel" ActionTag="953195366" Tag="239" IconVisible="False" LeftMargin="17.0000" RightMargin="-163.0000" TopMargin="-108.0000" BottomMargin="46.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size X="146.0000" Y="62.0000" />
                <Children>
                  <AbstractNodeData Name="ReturnButton" ActionTag="-2047212585" Tag="240" IconVisible="False" LeftMargin="19.0000" RightMargin="81.0000" TopMargin="8.0000" BottomMargin="8.0000" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="16" Scale9Height="24" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="" ctype="LuaPxButtonObjectData">
                    <Size X="46.0000" Y="46.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <Children>
                      <AbstractNodeData Name="ReturnText_TT" ActionTag="-1182568593" Tag="241" IconVisible="False" LeftMargin="42.0000" RightMargin="-62.0000" TopMargin="-3.0000" BottomMargin="7.0000" FontSize="32" LabelText="返回" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-2.0000" ShadowEnabled="True" ctype="TextObjectData">
                        <Size X="66.0000" Y="42.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="75.0000" Y="28.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="1.6304" Y="0.6087" />
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
            <Position />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="UpLeftFit" ActionTag="-53337576" Tag="242" IconVisible="True" RightMargin="720.0000" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="Title" ActionTag="-1902757622" Tag="925" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="UpLeftBg" ActionTag="-1042282200" Tag="926" IconVisible="False" LeftMargin="-0.0002" RightMargin="-719.9998" TopMargin="-1279.9999" BottomMargin="1151.9999" Scale9Enable="True" LeftEage="6" RightEage="6" TopEage="41" BottomEage="41" Scale9OriginX="6" Scale9OriginY="41" Scale9Width="8" Scale9Height="44" ctype="ImageViewObjectData">
                    <Size X="720.0000" Y="128.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="359.9998" Y="1215.9999" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/01_07_Sitting/bg_007.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="TitleText_TT" ActionTag="1082926421" Tag="244" IconVisible="False" LeftMargin="255.0000" RightMargin="-465.0000" TopMargin="-1243.5000" BottomMargin="1188.5000" FontSize="42" LabelText="更 换 手 机" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="210.0000" Y="55.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="360.0000" Y="1216.0000" />
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
              <AbstractNodeData Name="ContentText_1_TT" ActionTag="-1536127075" Tag="245" IconVisible="False" LeftMargin="80.0000" RightMargin="-306.0000" TopMargin="-1112.0005" BottomMargin="1070.0005" FontSize="32" LabelText="输入新手机号码" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="226.0000" Y="42.0000" />
                <AnchorPoint ScaleY="0.5000" />
                <Position X="80.0000" Y="1091.0005" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="ContentText_2_TT" ActionTag="-78107355" Tag="2394" IconVisible="False" LeftMargin="80.0000" RightMargin="-238.0000" TopMargin="-948.9968" BottomMargin="914.9968" FontSize="26" LabelText="请输入验证吗" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="158.0000" Y="34.0000" />
                <AnchorPoint ScaleY="0.5000" />
                <Position X="80.0000" Y="931.9968" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="PhoneNum" ActionTag="-406124548" Tag="1503" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="PhoneAreaPanel" ActionTag="1489333520" Tag="2395" IconVisible="False" LeftMargin="69.9999" RightMargin="-169.9999" TopMargin="-1039.0006" BottomMargin="979.0006" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size X="100.0000" Y="60.0000" />
                    <Children>
                      <AbstractNodeData Name="PhoneAreaNum" ActionTag="676485435" Tag="2256" IconVisible="False" LeftMargin="10.0000" RightMargin="35.0000" TopMargin="15.0000" BottomMargin="15.0000" FontSize="26" LabelText="+886" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="55.0000" Y="30.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="10.0000" Y="30.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.1000" Y="0.5000" />
                        <PreSize X="0.5500" Y="0.5000" />
                        <FontResource Type="Normal" Path="font/Font003.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="PhoneAreaIcon" ActionTag="1424531469" Tag="224" IconVisible="False" LeftMargin="79.9997" RightMargin="0.0003" TopMargin="24.0000" BottomMargin="24.0000" Scale9Enable="True" LeftEage="6" RightEage="6" TopEage="3" BottomEage="3" Scale9OriginX="6" Scale9OriginY="3" Scale9Width="8" Scale9Height="6" ctype="ImageViewObjectData">
                        <Size X="20.0000" Y="12.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="89.9997" Y="30.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.9000" Y="0.5000" />
                        <PreSize X="0.2000" Y="0.2000" />
                        <FileData Type="Normal" Path="ui/01_07_Sitting/icon_053.png" Plist="" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="119.9999" Y="1009.0006" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <SingleColor A="255" R="150" G="200" B="255" />
                    <FirstColor A="255" R="150" G="200" B="255" />
                    <EndColor A="255" R="255" G="255" B="255" />
                    <ColorVector ScaleY="1.0000" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="PhoneNumPanel" ActionTag="-659578737" Tag="1504" IconVisible="False" LeftMargin="176.9999" RightMargin="-642.9999" TopMargin="-1049.0005" BottomMargin="969.0005" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size X="466.0000" Y="80.0000" />
                    <Children>
                      <AbstractNodeData Name="PhoneNumBg" ActionTag="-1671910531" Tag="1505" IconVisible="False" LeftMargin="3.0000" RightMargin="3.0000" TopMargin="6.0000" BottomMargin="6.0000" Scale9Enable="True" LeftEage="9" RightEage="9" TopEage="9" BottomEage="9" Scale9OriginX="9" Scale9OriginY="9" Scale9Width="44" Scale9Height="44" ctype="ImageViewObjectData">
                        <Size X="460.0000" Y="68.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="3.0000" Y="40.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.0064" Y="0.5000" />
                        <PreSize X="0.9871" Y="0.8500" />
                        <FileData Type="Normal" Path="ui/01_07_Sitting/frame_125.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="PhoneNumField" ActionTag="359204620" Tag="1506" IconVisible="False" LeftMargin="29.0000" RightMargin="29.0000" TopMargin="20.0000" BottomMargin="20.0000" TouchEnable="True" FontSize="30" IsCustomSize="True" LabelText="" PlaceHolderText="" MaxLengthText="12" ctype="TextFieldObjectData">
                        <Size X="408.0000" Y="40.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="29.0000" Y="40.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.0622" Y="0.5000" />
                        <PreSize X="0.8755" Y="0.5000" />
                        <FontResource Type="Default" Path="" Plist="" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleY="0.5000" />
                    <Position X="176.9999" Y="1009.0005" />
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
                <Position />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="Verify" ActionTag="961120765" Tag="2386" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="VerifyPanel" ActionTag="-1332907140" Tag="2387" IconVisible="False" LeftMargin="77.0000" RightMargin="-643.0000" TopMargin="-889.0013" BottomMargin="809.0013" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size X="566.0000" Y="80.0000" />
                    <Children>
                      <AbstractNodeData Name="VerifyBg" ActionTag="-848509469" Tag="2388" IconVisible="False" LeftMargin="3.0000" RightMargin="3.0000" TopMargin="6.0000" BottomMargin="6.0000" Scale9Enable="True" LeftEage="9" RightEage="9" TopEage="9" BottomEage="9" Scale9OriginX="9" Scale9OriginY="9" Scale9Width="44" Scale9Height="44" ctype="ImageViewObjectData">
                        <Size X="560.0000" Y="68.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="3.0000" Y="40.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.0053" Y="0.5000" />
                        <PreSize X="0.9894" Y="0.8500" />
                        <FileData Type="Normal" Path="ui/01_07_Sitting/frame_125.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="VerifyTextField" ActionTag="-2045748130" Tag="2389" IconVisible="False" LeftMargin="29.0000" RightMargin="29.0000" TopMargin="20.0000" BottomMargin="20.0000" TouchEnable="True" FontSize="30" IsCustomSize="True" LabelText="" PlaceHolderText="" MaxLengthText="12" ctype="TextFieldObjectData">
                        <Size X="508.0000" Y="40.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="29.0000" Y="40.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.0512" Y="0.5000" />
                        <PreSize X="0.8975" Y="0.5000" />
                        <FontResource Type="Default" Path="" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="VerifyError" Visible="False" ActionTag="872477529" Tag="2390" IconVisible="True" LeftMargin="283.0000" RightMargin="283.0000" TopMargin="40.0000" BottomMargin="40.0000" ctype="SingleNodeObjectData">
                        <Size X="0.0000" Y="0.0000" />
                        <Children>
                          <AbstractNodeData Name="VerifyErrorBg" ActionTag="-915038587" Tag="2391" IconVisible="False" LeftMargin="-284.9998" RightMargin="-285.0002" TopMargin="-40.0002" BottomMargin="-39.9998" Scale9Enable="True" LeftEage="13" RightEage="13" TopEage="33" BottomEage="33" Scale9OriginX="13" Scale9OriginY="33" Scale9Width="16" Scale9Height="36" ctype="ImageViewObjectData">
                            <Size X="570.0000" Y="80.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="0.0002" Y="0.0002" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition />
                            <PreSize X="0.0000" Y="0.0000" />
                            <FileData Type="Normal" Path="ui/01_06_PersonalCenter/frame_002.png" Plist="" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="VerifyErrorTipBg" ActionTag="-468202226" Tag="2392" IconVisible="False" LeftMargin="134.0000" RightMargin="-294.0000" TopMargin="-56.9994" BottomMargin="2.9994" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="17" BottomEage="17" Scale9OriginX="15" Scale9OriginY="17" Scale9Width="16" Scale9Height="20" ctype="ImageViewObjectData">
                            <Size X="160.0000" Y="54.0000" />
                            <AnchorPoint ScaleX="1.0000" ScaleY="0.5000" />
                            <Position X="294.0000" Y="29.9994" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition />
                            <PreSize X="0.0000" Y="0.0000" />
                            <FileData Type="Normal" Path="ui/01_06_PersonalCenter/frame_001.png" Plist="" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="VerifyErrorTipText_TT" ActionTag="2112638542" Tag="2393" IconVisible="False" LeftMargin="156.9999" RightMargin="-269.9999" TopMargin="-49.4994" BottomMargin="20.4994" FontSize="22" LabelText="驗證碼有誤" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                            <Size X="113.0000" Y="29.0000" />
                            <AnchorPoint ScaleX="1.0000" ScaleY="0.5000" />
                            <Position X="269.9999" Y="34.9994" />
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
                        <Position X="283.0000" Y="40.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.5000" Y="0.5000" />
                        <PreSize X="0.0000" Y="0.0000" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="360.0000" Y="849.0013" />
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
                <Position />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="VertifySendPanel" ActionTag="-1573484238" Tag="2396" IconVisible="False" LeftMargin="483.0004" RightMargin="-643.0004" TopMargin="-879.0001" BottomMargin="819.0001" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size X="160.0000" Y="60.0000" />
                <Children>
                  <AbstractNodeData Name="VertifySendText_TT" ActionTag="1328958983" Tag="2397" IconVisible="False" LeftMargin="21.5000" RightMargin="16.5000" TopMargin="14.0000" BottomMargin="14.0000" FontSize="24" LabelText="发送验证码" HorizontalAlignmentType="HT_Right" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="122.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="1.0000" ScaleY="0.5000" />
                    <Position X="143.5000" Y="30.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.8969" Y="0.5000" />
                    <PreSize X="0.7625" Y="0.5333" />
                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="563.0004" Y="849.0001" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <SingleColor A="255" R="150" G="200" B="255" />
                <FirstColor A="255" R="150" G="200" B="255" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="VertifyTime" Visible="False" ActionTag="-1951453747" Tag="2398" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="VertifyTimeNum" ActionTag="-880774966" Tag="2399" IconVisible="False" LeftMargin="453.5000" RightMargin="-492.5000" TopMargin="-781.5000" BottomMargin="756.5000" FontSize="25" LabelText="60s" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="39.0000" Y="25.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="473.0000" Y="769.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="VertifyTimeText_TT" ActionTag="2087829493" Tag="2400" IconVisible="False" LeftMargin="499.0000" RightMargin="-627.0000" TopMargin="-785.5000" BottomMargin="752.5000" FontSize="25" LabelText="後重新發送" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="128.0000" Y="33.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="563.0000" Y="769.0000" />
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
              <AbstractNodeData Name="Confirm" ActionTag="-1281796858" Tag="775" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="ConfirmButton" ActionTag="400154999" Tag="776" IconVisible="False" LeftMargin="61.0001" RightMargin="-659.0001" TopMargin="-771.9989" BottomMargin="673.9989" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="568" Scale9Height="76" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="Sound004" ctype="LuaPxButtonObjectData">
                    <Size X="598.0000" Y="98.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <Children>
                      <AbstractNodeData Name="ConfirmText_TT" ActionTag="1414784442" Tag="777" IconVisible="False" LeftMargin="241.5000" RightMargin="241.5000" TopMargin="33.5000" BottomMargin="27.5000" FontSize="28" LabelText="确认绑定" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="115.0000" Y="37.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="299.0000" Y="46.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.5000" Y="0.4694" />
                        <PreSize X="0.1923" Y="0.3776" />
                        <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="360.0001" Y="722.9989" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/01_07_Sitting/button_084_1.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/01_07_Sitting/button_084.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/01_07_Sitting/button_084.png" Plist="" />
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
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>