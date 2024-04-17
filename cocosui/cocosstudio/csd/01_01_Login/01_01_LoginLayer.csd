<GameFile>
  <PropertyGroup Name="01_01_LoginLayer" Type="Layer" ID="b4fd57d3-207f-4839-8fb3-77fd499af13b" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Layer" Tag="6" ctype="GameLayerObjectData">
        <Size X="720.0000" Y="1280.0000" />
        <Children>
          <AbstractNodeData Name="Bg" ActionTag="532812121" Tag="7" IconVisible="True" RightMargin="720.0000" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="bg_1" ActionTag="-979994527" Tag="22" IconVisible="False" RightMargin="-720.0000" TopMargin="-1440.0000" BottomMargin="-160.0000" LeftEage="237" RightEage="237" TopEage="528" BottomEage="528" Scale9OriginX="237" Scale9OriginY="528" Scale9Width="246" Scale9Height="544" ctype="ImageViewObjectData">
                <Size X="720.0000" Y="1600.0000" />
                <AnchorPoint />
                <Position Y="-160.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/00_03_Bg/bg_001.png" Plist="" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint />
            <Position />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="UpLeftFit" ActionTag="232062983" Tag="125" IconVisible="True" RightMargin="720.0000" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="NoticePanel" ActionTag="629344443" Tag="68" IconVisible="False" LeftMargin="636.0000" RightMargin="-716.0000" TopMargin="-1276.0000" BottomMargin="1196.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size X="80.0000" Y="80.0000" />
                <Children>
                  <AbstractNodeData Name="NoticeButton" ActionTag="-1221769348" Tag="69" IconVisible="False" LeftMargin="10.0000" RightMargin="10.0000" TopMargin="10.0000" BottomMargin="10.0000" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="30" Scale9Height="38" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="1.0000" ClickEffect="" ctype="LuaPxButtonObjectData">
                    <Size X="60.0000" Y="60.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="40.0000" Y="40.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.5000" Y="0.5000" />
                    <PreSize X="0.7500" Y="0.7500" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/01_01_Login/icon_066.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/01_01_Login/icon_066.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/01_01_Login/icon_066.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                    <MixedColor A="255" R="65" G="65" B="70" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="676.0000" Y="1236.0000" />
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
          <AbstractNodeData Name="LogoPicture" ActionTag="1760042672" Tag="399" IconVisible="False" LeftMargin="23.0005" RightMargin="38.9995" TopMargin="53.0000" BottomMargin="865.0000" ctype="SpriteObjectData">
            <Size X="658.0000" Y="362.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="352.0005" Y="1046.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.4889" Y="0.8172" />
            <PreSize X="0.9139" Y="0.2828" />
            <FileData Type="Normal" Path="ui/00_01_Common/picture_064.png" Plist="" />
            <BlendFunc Src="1" Dst="771" />
          </AbstractNodeData>
          <AbstractNodeData Name="PanelBase" ActionTag="-1089268096" Tag="7" IconVisible="True" RightMargin="720.0000" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="Title" ActionTag="371597615" Tag="13" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="TitleText_TT" ActionTag="781961046" Tag="14" IconVisible="False" LeftMargin="69.9998" RightMargin="-203.9998" TopMargin="-906.9979" BottomMargin="872.9979" FontSize="26" LabelText="登录 / 注册" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="134.0000" Y="34.0000" />
                    <AnchorPoint ScaleY="0.5000" />
                    <Position X="69.9998" Y="889.9979" />
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
              <AbstractNodeData Name="UserName" ActionTag="-556903534" Tag="48" IconVisible="True" LeftMargin="360.0000" RightMargin="-360.0000" TopMargin="-806.0000" BottomMargin="806.0000" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="UserNameBg" ActionTag="-142064583" Tag="251" IconVisible="False" LeftMargin="-291.0000" RightMargin="-291.0000" TopMargin="-45.0000" BottomMargin="-45.0000" ctype="SpriteObjectData">
                    <Size X="582.0000" Y="90.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/01_01_Login/frame_003.png" Plist="" />
                    <BlendFunc Src="1" Dst="771" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="UserNameIcon" ActionTag="-1903629817" Tag="8" IconVisible="False" LeftMargin="-259.0000" RightMargin="229.0000" TopMargin="-19.0000" BottomMargin="-19.0000" LeftEage="9" RightEage="9" TopEage="12" BottomEage="12" Scale9OriginX="9" Scale9OriginY="12" Scale9Width="12" Scale9Height="14" ctype="ImageViewObjectData">
                    <Size X="30.0000" Y="38.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="-244.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/01_01_Login/icon_006.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="UserNameTextField" ActionTag="-1457663440" Tag="132" IconVisible="False" LeftMargin="-204.0000" RightMargin="-270.0000" TopMargin="-17.0000" BottomMargin="-17.0000" TouchEnable="True" FontSize="28" IsCustomSize="True" LabelText="" PlaceHolderText="" MaxLengthText="10" ctype="TextFieldObjectData">
                    <Size X="474.0000" Y="34.0000" />
                    <AnchorPoint ScaleY="0.5000" />
                    <Position X="-204.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="UserNameError" ActionTag="1292672775" Tag="58" IconVisible="True" ctype="SingleNodeObjectData">
                    <Size X="0.0000" Y="0.0000" />
                    <Children>
                      <AbstractNodeData Name="UserNameErrorBg" ActionTag="-1804708423" Tag="509" IconVisible="False" LeftMargin="-297.0000" RightMargin="-297.0000" TopMargin="-52.0000" BottomMargin="-52.0000" ctype="SpriteObjectData">
                        <Size X="594.0000" Y="104.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/01_01_Login/frame_002.png" Plist="" />
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
                </Children>
                <AnchorPoint />
                <Position X="360.0000" Y="806.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="Password" ActionTag="-884315191" Tag="9" IconVisible="True" LeftMargin="360.0000" RightMargin="-360.0000" TopMargin="-677.9989" BottomMargin="677.9989" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="PasswordBg" ActionTag="1348941353" Tag="56" IconVisible="False" LeftMargin="-291.0000" RightMargin="-291.0000" TopMargin="-45.0000" BottomMargin="-45.0000" ctype="SpriteObjectData">
                    <Size X="582.0000" Y="90.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/01_01_Login/frame_003.png" Plist="" />
                    <BlendFunc Src="1" Dst="771" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="PasswordIcon" ActionTag="-78914689" Tag="12" IconVisible="False" LeftMargin="-258.0000" RightMargin="230.0000" TopMargin="-18.0000" BottomMargin="-18.0000" LeftEage="9" RightEage="9" TopEage="12" BottomEage="12" Scale9OriginX="9" Scale9OriginY="12" Scale9Width="10" Scale9Height="12" ctype="ImageViewObjectData">
                    <Size X="28.0000" Y="36.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="-244.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/01_01_Login/icon_007.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="PasswordTextField" ActionTag="-1015593868" Tag="135" IconVisible="False" LeftMargin="-204.0000" RightMargin="-270.0000" TopMargin="-14.0000" BottomMargin="-14.0000" TouchEnable="True" FontSize="28" IsCustomSize="True" LabelText="" PlaceHolderText="" MaxLengthText="10" PasswordEnable="True" ctype="TextFieldObjectData">
                    <Size X="474.0000" Y="28.0000" />
                    <AnchorPoint ScaleY="0.5000" />
                    <Position X="-204.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="PasswordError" ActionTag="120880081" Tag="59" IconVisible="True" ctype="SingleNodeObjectData">
                    <Size X="0.0000" Y="0.0000" />
                    <Children>
                      <AbstractNodeData Name="PasswordErrorBg" ActionTag="-940011593" Tag="510" IconVisible="False" LeftMargin="-297.0000" RightMargin="-297.0000" TopMargin="-52.0000" BottomMargin="-52.0000" ctype="SpriteObjectData">
                        <Size X="594.0000" Y="104.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/01_01_Login/frame_002.png" Plist="" />
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
                </Children>
                <AnchorPoint />
                <Position X="360.0000" Y="677.9989" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="LoginNode" ActionTag="416947910" Tag="15" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="TouristButton" ActionTag="-1616383340" Tag="16" IconVisible="False" LeftMargin="61.0000" RightMargin="-659.0000" TopMargin="-502.0000" BottomMargin="410.0000" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="568" Scale9Height="70" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="Sound004" ctype="LuaPxButtonObjectData">
                    <Size X="598.0000" Y="92.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <Children>
                      <AbstractNodeData Name="TouristButtonText_TT" ActionTag="1570411824" Tag="18" IconVisible="False" LeftMargin="241.5000" RightMargin="241.5000" TopMargin="22.5004" BottomMargin="32.4996" FontSize="28" LabelText="游客模式" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-1.0000" ShadowEnabled="True" ctype="TextObjectData">
                        <Size X="115.0000" Y="37.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="299.0000" Y="50.9996" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.5000" Y="0.5543" />
                        <PreSize X="0.1923" Y="0.4022" />
                        <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="0" G="0" B="0" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="360.0000" Y="456.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/01_01_Login/button_001.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/01_01_Login/button_001.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/01_01_Login/button_001.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                    <MixedColor A="255" R="65" G="65" B="70" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="RegisterButton" ActionTag="734434388" Tag="19" IconVisible="False" LeftMargin="61.0000" RightMargin="-359.0000" TopMargin="-604.0000" BottomMargin="512.0000" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="268" Scale9Height="70" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="Sound004" ctype="LuaPxButtonObjectData">
                    <Size X="298.0000" Y="92.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <Children>
                      <AbstractNodeData Name="RegisterButtonText_TT" ActionTag="164567189" Tag="20" IconVisible="False" LeftMargin="120.5000" RightMargin="118.5000" TopMargin="23.5000" BottomMargin="31.5000" FontSize="28" LabelText="注册" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-1.0000" ShadowEnabled="True" ctype="TextObjectData">
                        <Size X="59.0000" Y="37.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="150.0000" Y="50.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.5034" Y="0.5435" />
                        <PreSize X="0.1980" Y="0.4022" />
                        <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="0" G="0" B="0" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="210.0000" Y="558.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/01_01_Login/button_002.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/01_01_Login/button_002.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/01_01_Login/button_002.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                    <MixedColor A="255" R="65" G="65" B="70" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="LoginButton" ActionTag="-921726872" Tag="21" IconVisible="False" LeftMargin="361.0001" RightMargin="-659.0001" TopMargin="-604.0000" BottomMargin="512.0000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="268" Scale9Height="70" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="Sound004" ctype="LuaPxButtonObjectData">
                    <Size X="298.0000" Y="92.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <Children>
                      <AbstractNodeData Name="LoginButtonText_TT" ActionTag="1449865708" Tag="22" IconVisible="False" LeftMargin="120.5000" RightMargin="118.5000" TopMargin="23.5000" BottomMargin="31.5000" FontSize="28" LabelText="登录" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-1.0000" ShadowEnabled="True" ctype="TextObjectData">
                        <Size X="59.0000" Y="37.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="150.0000" Y="50.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.5034" Y="0.5435" />
                        <PreSize X="0.1980" Y="0.4022" />
                        <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="0" G="0" B="0" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="510.0001" Y="558.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/01_01_Login/button_002.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/01_01_Login/button_002.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/01_01_Login/button_002.png" Plist="" />
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
          <AbstractNodeData Name="BelowLeftFit" ActionTag="-383028102" Tag="124" IconVisible="True" RightMargin="720.0000" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="SocialLogin" ActionTag="-355574828" Tag="23" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="SocialLoginText_TT" ActionTag="-2002281758" Tag="24" IconVisible="False" LeftMargin="254.5001" RightMargin="-465.5001" TopMargin="-372.0000" BottomMargin="338.0000" FontSize="26" LabelText="社交账户一键登录" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="211.0000" Y="34.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="360.0001" Y="355.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="FacebookNode" ActionTag="179352592" Tag="28" IconVisible="True" LeftMargin="360.0000" RightMargin="-360.0000" TopMargin="-260.0000" BottomMargin="260.0000" ctype="SingleNodeObjectData">
                    <Size X="0.0000" Y="0.0000" />
                    <Children>
                      <AbstractNodeData Name="FacebookIcon" ActionTag="2084951377" Tag="29" IconVisible="False" LeftMargin="-40.0000" RightMargin="-40.0000" TopMargin="-40.0000" BottomMargin="-40.0000" LeftEage="26" RightEage="26" TopEage="26" BottomEage="26" Scale9OriginX="26" Scale9OriginY="26" Scale9Width="28" Scale9Height="28" ctype="ImageViewObjectData">
                        <Size X="80.0000" Y="80.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/01_01_Login/icon_001.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="FacebookPanel" ActionTag="660278867" Tag="30" IconVisible="False" LeftMargin="-50.0000" RightMargin="-50.0000" TopMargin="-50.0000" BottomMargin="-50.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                        <Size X="100.0000" Y="100.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
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
                    </Children>
                    <AnchorPoint />
                    <Position X="360.0000" Y="260.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="GoogleNode" ActionTag="971997947" Tag="25" IconVisible="True" LeftMargin="200.0000" RightMargin="-200.0000" TopMargin="-260.0000" BottomMargin="260.0000" ctype="SingleNodeObjectData">
                    <Size X="0.0000" Y="0.0000" />
                    <Children>
                      <AbstractNodeData Name="GoogleIcon" ActionTag="467426257" Tag="26" IconVisible="False" LeftMargin="-40.0000" RightMargin="-40.0000" TopMargin="-40.0000" BottomMargin="-40.0000" LeftEage="26" RightEage="26" TopEage="26" BottomEage="26" Scale9OriginX="26" Scale9OriginY="26" Scale9Width="28" Scale9Height="28" ctype="ImageViewObjectData">
                        <Size X="80.0000" Y="80.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/01_01_Login/icon_004.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="GooglePanel" ActionTag="-439923856" Tag="27" IconVisible="False" LeftMargin="-50.0000" RightMargin="-50.0000" TopMargin="-50.0000" BottomMargin="-50.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                        <Size X="100.0000" Y="100.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
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
                    </Children>
                    <AnchorPoint />
                    <Position X="200.0000" Y="260.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="AppleNode" ActionTag="1465338176" Tag="31" IconVisible="True" LeftMargin="200.0000" RightMargin="-200.0000" TopMargin="-260.0000" BottomMargin="260.0000" ctype="SingleNodeObjectData">
                    <Size X="0.0000" Y="0.0000" />
                    <Children>
                      <AbstractNodeData Name="AppleIcon" ActionTag="-489413383" Tag="32" IconVisible="False" LeftMargin="-40.0000" RightMargin="-40.0000" TopMargin="-40.0000" BottomMargin="-40.0000" LeftEage="26" RightEage="26" TopEage="26" BottomEage="26" Scale9OriginX="26" Scale9OriginY="26" Scale9Width="28" Scale9Height="28" ctype="ImageViewObjectData">
                        <Size X="80.0000" Y="80.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/01_01_Login/icon_005.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="ApplePanel" ActionTag="1805366649" Tag="33" IconVisible="False" LeftMargin="-50.0001" RightMargin="-49.9999" TopMargin="-50.0000" BottomMargin="-50.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                        <Size X="100.0000" Y="100.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="-0.0001" />
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
                    <Position X="200.0000" Y="260.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="LineNode" ActionTag="-525952064" Tag="154" IconVisible="True" LeftMargin="520.0000" RightMargin="-520.0000" TopMargin="-260.0000" BottomMargin="260.0000" ctype="SingleNodeObjectData">
                    <Size X="0.0000" Y="0.0000" />
                    <Children>
                      <AbstractNodeData Name="LineIcon" ActionTag="-1890481768" Tag="155" IconVisible="False" LeftMargin="-40.0000" RightMargin="-40.0000" TopMargin="-40.0000" BottomMargin="-40.0000" LeftEage="26" RightEage="26" TopEage="26" BottomEage="26" Scale9OriginX="26" Scale9OriginY="26" Scale9Width="28" Scale9Height="28" ctype="ImageViewObjectData">
                        <Size X="80.0000" Y="80.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/01_01_Login/icon_088.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="LinePanel" ActionTag="848712594" Tag="157" IconVisible="False" LeftMargin="-50.0000" RightMargin="-50.0000" TopMargin="-50.0000" BottomMargin="-50.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                        <Size X="100.0000" Y="100.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
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
                    </Children>
                    <AnchorPoint />
                    <Position X="520.0000" Y="260.0000" />
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
              <AbstractNodeData Name="Agreement" ActionTag="367139263" Tag="34" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="AgreementCheckBox" ActionTag="-2133192147" Tag="35" IconVisible="False" LeftMargin="61.9999" RightMargin="-109.9999" TopMargin="-140.0000" BottomMargin="92.0000" TouchEnable="True" CheckedState="True" ctype="CheckBoxObjectData">
                    <Size X="48.0000" Y="48.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="85.9999" Y="116.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <NormalBackFileData Type="Normal" Path="ui/01_01_Login/icon_003.png" Plist="" />
                    <PressedBackFileData Type="Normal" Path="ui/01_01_Login/icon_003.png" Plist="" />
                    <DisableBackFileData Type="Normal" Path="ui/01_01_Login/icon_003.png" Plist="" />
                    <NodeNormalFileData Type="Normal" Path="ui/01_01_Login/icon_002.png" Plist="" />
                    <NodeDisableFileData Type="Normal" Path="ui/01_01_Login/icon_002.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="Agreement_CN" Visible="False" ActionTag="568497677" Tag="136" IconVisible="True" ctype="SingleNodeObjectData">
                    <Size X="0.0000" Y="0.0000" />
                    <Children>
                      <AbstractNodeData Name="AgreementText_1_CN" ActionTag="286177704" Tag="36" IconVisible="False" LeftMargin="109.5002" RightMargin="-288.5002" TopMargin="-135.4999" BottomMargin="106.4999" FontSize="22" LabelText="我已经阅读并同意" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="179.0000" Y="29.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="109.5002" Y="120.9999" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="160" G="160" B="160" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="AgreementText_2_CN" ActionTag="1539574848" Tag="37" IconVisible="False" LeftMargin="293.5000" RightMargin="-384.5000" TopMargin="-135.5000" BottomMargin="106.5000" FontSize="22" LabelText="用户协议" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="91.0000" Y="29.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="339.0000" Y="121.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="AgreementText_3_CN" ActionTag="174915520" Tag="38" IconVisible="False" LeftMargin="387.5002" RightMargin="-411.5002" TopMargin="-134.4999" BottomMargin="105.4999" FontSize="22" LabelText="和" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="24.0000" Y="29.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="387.5002" Y="119.9999" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="160" G="160" B="160" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="AgreementText_4_CN" ActionTag="-584287502" Tag="39" IconVisible="False" LeftMargin="416.4988" RightMargin="-507.4988" TopMargin="-135.4999" BottomMargin="106.4999" FontSize="22" LabelText="隐私政策" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="91.0000" Y="29.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="461.9988" Y="120.9999" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="AgreementUserPanel_CN" ActionTag="795624394" Tag="40" IconVisible="False" LeftMargin="293.5000" RightMargin="-384.5000" TopMargin="-135.5000" BottomMargin="106.5000" TouchEnable="True" ClipAble="False" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                        <Size X="91.0000" Y="29.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="339.0000" Y="121.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <SingleColor A="255" R="150" G="200" B="255" />
                        <FirstColor A="255" R="150" G="200" B="255" />
                        <EndColor A="255" R="255" G="255" B="255" />
                        <ColorVector ScaleY="1.0000" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="AgreementPrivacyPanel_CN" ActionTag="1197886336" Tag="41" IconVisible="False" LeftMargin="412.5000" RightMargin="-511.5000" TopMargin="-137.0000" BottomMargin="105.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="253" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                        <Size X="99.0000" Y="32.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="462.0000" Y="121.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <SingleColor A="255" R="150" G="200" B="255" />
                        <FirstColor A="255" R="150" G="200" B="255" />
                        <EndColor A="255" R="255" G="255" B="255" />
                        <ColorVector ScaleY="1.0000" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="AgreementStrip_1_CN" ActionTag="-1533954041" Tag="42" IconVisible="False" LeftMargin="293.9978" RightMargin="-383.9978" TopMargin="-108.9994" BottomMargin="106.9994" LeftEage="29" RightEage="29" Scale9OriginX="29" Scale9Width="32" Scale9Height="2" ctype="ImageViewObjectData">
                        <Size X="90.0000" Y="2.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="338.9978" Y="107.9994" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/01_01_Login/strip_001.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="AgreementStrip_2_CN" ActionTag="-1087602113" Tag="43" IconVisible="False" LeftMargin="418.9998" RightMargin="-506.9998" TopMargin="-109.0000" BottomMargin="107.0000" LeftEage="29" RightEage="29" Scale9OriginX="29" Scale9Width="32" Scale9Height="2" ctype="ImageViewObjectData">
                        <Size X="88.0000" Y="2.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="462.9998" Y="108.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
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
                  <AbstractNodeData Name="Agreement_TW" Visible="False" ActionTag="-83054639" Tag="223" IconVisible="True" ctype="SingleNodeObjectData">
                    <Size X="0.0000" Y="0.0000" />
                    <Children>
                      <AbstractNodeData Name="AgreementText_1_TW" ActionTag="-223993011" Tag="224" IconVisible="False" LeftMargin="109.5000" RightMargin="-288.5000" TopMargin="-135.4999" BottomMargin="106.4999" FontSize="22" LabelText="我已經閱讀並同意" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="179.0000" Y="29.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="109.5000" Y="120.9999" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="160" G="160" B="160" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="AgreementText_2_TW" ActionTag="876120083" Tag="225" IconVisible="False" LeftMargin="293.5000" RightMargin="-384.5000" TopMargin="-135.5000" BottomMargin="106.5000" FontSize="22" LabelText="用戶協議" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="91.0000" Y="29.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="339.0000" Y="121.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="AgreementText_3_TW" ActionTag="912585248" Tag="226" IconVisible="False" LeftMargin="387.5000" RightMargin="-411.5000" TopMargin="-135.4999" BottomMargin="106.4999" FontSize="22" LabelText="和" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="24.0000" Y="29.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="387.5000" Y="120.9999" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="160" G="160" B="160" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="AgreementText_4_TW" ActionTag="765435741" Tag="227" IconVisible="False" LeftMargin="416.5000" RightMargin="-507.5000" TopMargin="-135.4999" BottomMargin="106.4999" FontSize="22" LabelText="隱私政策" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="91.0000" Y="29.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="462.0000" Y="120.9999" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="AgreementUserPanel_TW" ActionTag="-1510093875" Tag="228" IconVisible="False" LeftMargin="293.5000" RightMargin="-384.5000" TopMargin="-135.5000" BottomMargin="106.5000" TouchEnable="True" ClipAble="False" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                        <Size X="91.0000" Y="29.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="339.0000" Y="121.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <SingleColor A="255" R="150" G="200" B="255" />
                        <FirstColor A="255" R="150" G="200" B="255" />
                        <EndColor A="255" R="255" G="255" B="255" />
                        <ColorVector ScaleY="1.0000" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="AgreementPrivacyPanel_TW" ActionTag="10577483" Tag="229" IconVisible="False" LeftMargin="416.5000" RightMargin="-507.5000" TopMargin="-135.5000" BottomMargin="106.5000" TouchEnable="True" ClipAble="False" BackColorAlpha="253" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                        <Size X="91.0000" Y="29.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="462.0000" Y="121.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <SingleColor A="255" R="150" G="200" B="255" />
                        <FirstColor A="255" R="150" G="200" B="255" />
                        <EndColor A="255" R="255" G="255" B="255" />
                        <ColorVector ScaleY="1.0000" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="AgreementStrip_1_TW" ActionTag="-809622814" Alpha="127" Tag="230" IconVisible="False" LeftMargin="294.0000" RightMargin="-384.0000" TopMargin="-109.0000" BottomMargin="107.0000" LeftEage="29" RightEage="29" Scale9OriginX="29" Scale9Width="32" Scale9Height="2" ctype="ImageViewObjectData">
                        <Size X="90.0000" Y="2.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="339.0000" Y="108.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/01_01_Login/strip_001.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="AgreementStrip_2_TW" ActionTag="1573253194" Alpha="127" Tag="231" IconVisible="False" LeftMargin="419.0000" RightMargin="-507.0000" TopMargin="-109.0000" BottomMargin="107.0000" LeftEage="29" RightEage="29" Scale9OriginX="29" Scale9Width="32" Scale9Height="2" ctype="ImageViewObjectData">
                        <Size X="88.0000" Y="2.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="463.0000" Y="108.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
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
                  <AbstractNodeData Name="Agreement_EN" ActionTag="-1189010397" Tag="146" IconVisible="True" LeftMargin="-0.0001" RightMargin="0.0001" ctype="SingleNodeObjectData">
                    <Size X="0.0000" Y="0.0000" />
                    <Children>
                      <AbstractNodeData Name="AgreementText_1_EN" ActionTag="-1900418959" Tag="147" IconVisible="False" LeftMargin="106.5002" RightMargin="-344.5002" TopMargin="-133.9999" BottomMargin="107.9999" FontSize="22" LabelText="I've read and agree with" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="238.0000" Y="26.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="106.5002" Y="120.9999" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="160" G="160" B="160" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FontResource Type="Normal" Path="en/font/Default.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="AgreementText_2_EN" ActionTag="2001332660" Tag="148" IconVisible="False" LeftMargin="349.0000" RightMargin="-393.0000" TopMargin="-133.9996" BottomMargin="107.9996" FontSize="22" LabelText="TOS" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="44.0000" Y="26.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="371.0000" Y="120.9996" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FontResource Type="Normal" Path="en/font/Default.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="AgreementText_3_EN" ActionTag="-1955843070" Tag="149" IconVisible="False" LeftMargin="395.5000" RightMargin="-434.5000" TopMargin="-134.0000" BottomMargin="108.0000" FontSize="22" LabelText="and" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="39.0000" Y="26.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="395.5000" Y="121.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="160" G="160" B="160" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FontResource Type="Normal" Path="en/font/Default.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="AgreementText_4_EN" ActionTag="1070567679" Tag="150" IconVisible="False" LeftMargin="439.5000" RightMargin="-583.5000" TopMargin="-134.0000" BottomMargin="108.0000" FontSize="22" LabelText="Privacy Policy" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="144.0000" Y="26.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="511.5000" Y="121.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FontResource Type="Normal" Path="en/font/Default.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="AgreementUserPanel_EN" ActionTag="669530359" Tag="151" IconVisible="False" LeftMargin="344.0000" RightMargin="-398.0000" TopMargin="-135.5000" BottomMargin="106.5000" TouchEnable="True" ClipAble="False" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                        <Size X="54.0000" Y="29.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="371.0000" Y="121.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <SingleColor A="255" R="150" G="200" B="255" />
                        <FirstColor A="255" R="150" G="200" B="255" />
                        <EndColor A="255" R="255" G="255" B="255" />
                        <ColorVector ScaleY="1.0000" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="AgreementPrivacyPanel_EN" ActionTag="-1061882646" Tag="152" IconVisible="False" LeftMargin="434.5000" RightMargin="-588.5000" TopMargin="-135.5000" BottomMargin="106.5000" TouchEnable="True" ClipAble="False" BackColorAlpha="253" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                        <Size X="154.0000" Y="29.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="511.5000" Y="121.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <SingleColor A="255" R="150" G="200" B="255" />
                        <FirstColor A="255" R="150" G="200" B="255" />
                        <EndColor A="255" R="255" G="255" B="255" />
                        <ColorVector ScaleY="1.0000" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="AgreementStrip_1_EN" ActionTag="-360305312" Tag="153" IconVisible="False" LeftMargin="349.0000" RightMargin="-393.0000" TopMargin="-108.0000" BottomMargin="106.0000" LeftEage="29" RightEage="29" Scale9OriginX="29" Scale9Width="32" Scale9Height="2" ctype="ImageViewObjectData">
                        <Size X="44.0000" Y="2.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="371.0000" Y="107.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/01_01_Login/strip_001.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="AgreementStrip_2_EN" ActionTag="1876221307" Tag="154" IconVisible="False" LeftMargin="439.5000" RightMargin="-583.5000" TopMargin="-108.0000" BottomMargin="106.0000" LeftEage="29" RightEage="29" Scale9OriginX="29" Scale9Width="32" Scale9Height="2" ctype="ImageViewObjectData">
                        <Size X="144.0000" Y="2.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="511.5000" Y="107.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/01_01_Login/strip_001.png" Plist="" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint />
                    <Position X="-0.0001" />
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
              <AbstractNodeData Name="VersionNum" ActionTag="276973977" Tag="86" IconVisible="False" LeftMargin="613.0000" RightMargin="-700.0000" TopMargin="-57.0000" BottomMargin="20.0000" FontSize="32" LabelText="0.0.0.0" HorizontalAlignmentType="HT_Right" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="87.0000" Y="37.0000" />
                <AnchorPoint ScaleX="1.0000" ScaleY="0.5000" />
                <Position X="700.0000" Y="38.5000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FontResource Type="Normal" Path="font/Font003.ttf" Plist="" />
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