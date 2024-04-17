<GameFile>
  <PropertyGroup Name="02_01_BoastChatPopUp" Type="Layer" ID="bd93ce93-0a99-4544-8f77-9c27f94d9ba7" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Layer" Tag="25" ctype="GameLayerObjectData">
        <Size X="720.0000" Y="621.0000" />
        <Children>
          <AbstractNodeData Name="ChatPopup" ActionTag="618782983" Tag="41" IconVisible="True" RightMargin="720.0000" TopMargin="621.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="InteractionPopups" ActionTag="682782876" Tag="40" IconVisible="False" RightMargin="-720.0000" TopMargin="-621.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size X="720.0000" Y="621.0000" />
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
              <AbstractNodeData Name="Move" ActionTag="401718711" Tag="141" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="Chat" ActionTag="696625504" Tag="142" IconVisible="True" ctype="SingleNodeObjectData">
                    <Size X="0.0000" Y="0.0000" />
                    <Children>
                      <AbstractNodeData Name="ChatBg_1" ActionTag="-1180827044" Tag="582" IconVisible="False" RightMargin="-720.0000" TopMargin="-620.0000" ctype="SpriteObjectData">
                        <Size X="720.0000" Y="620.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="360.0000" Y="310.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/04_01_Chat/frame_084.png" Plist="" />
                        <BlendFunc Src="1" Dst="771" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="ChatTitleText" ActionTag="1906570867" Tag="145" IconVisible="False" LeftMargin="278.4999" RightMargin="-439.4999" TopMargin="-611.0000" BottomMargin="569.0000" FontSize="32" LabelText="拜拜甜甜圈" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="161.0000" Y="42.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="358.9999" Y="590.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="ChatPanel" ActionTag="406199063" Tag="153" IconVisible="False" RightMargin="-720.0000" TopMargin="-554.0000" BottomMargin="150.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                        <Size X="720.0000" Y="404.0000" />
                        <AnchorPoint />
                        <Position Y="150.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <SingleColor A="255" R="150" G="200" B="255" />
                        <FirstColor A="255" R="150" G="200" B="255" />
                        <EndColor A="255" R="255" G="255" B="255" />
                        <ColorVector ScaleY="1.0000" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="ChannelButton" ActionTag="1558285777" Tag="146" IconVisible="False" LeftMargin="7.0005" RightMargin="-65.0005" TopMargin="-615.0016" BottomMargin="557.0016" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="28" Scale9Height="36" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="1.0000" ClickEffect="Sound004" ctype="LuaPxButtonObjectData">
                        <Size X="58.0000" Y="58.0000" />
                        <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                        <Children>
                          <AbstractNodeData Name="ChannelTipDotIcon" ActionTag="1297232824" Tag="270" IconVisible="False" LeftMargin="17.0000" RightMargin="-13.0000" TopMargin="-13.0000" BottomMargin="17.0000" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="15" BottomEage="15" Scale9OriginX="15" Scale9OriginY="15" Scale9Width="24" Scale9Height="24" ctype="ImageViewObjectData">
                            <Size X="54.0000" Y="54.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="44.0000" Y="44.0000" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.7586" Y="0.7586" />
                            <PreSize X="0.9310" Y="0.9310" />
                            <FileData Type="Normal" Path="ui/00_01_Common/icon_045.png" Plist="" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="ChannelTipDotNum" ActionTag="-2097225526" Tag="269" IconVisible="False" LeftMargin="31.0000" RightMargin="3.0000" TopMargin="1.0000" BottomMargin="31.0000" FontSize="22" LabelText="99" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                            <Size X="24.0000" Y="26.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="43.0000" Y="44.0000" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.7414" Y="0.7586" />
                            <PreSize X="0.4138" Y="0.4483" />
                            <FontResource Type="Normal" Path="font/Font003.ttf" Plist="" />
                            <OutlineColor A="255" R="255" G="0" B="0" />
                            <ShadowColor A="255" R="110" G="110" B="110" />
                          </AbstractNodeData>
                        </Children>
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="36.0005" Y="586.0016" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <TextColor A="255" R="255" G="255" B="255" />
                        <DisabledFileData Type="Normal" Path="ui/04_01_Chat/button_061.png" Plist="" />
                        <PressedFileData Type="Normal" Path="ui/04_01_Chat/button_061.png" Plist="" />
                        <NormalFileData Type="Normal" Path="ui/04_01_Chat/button_061.png" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                        <MixedColor A="255" R="65" G="65" B="70" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="Move_1" ActionTag="1823168842" Tag="78" IconVisible="True" ctype="SingleNodeObjectData">
                        <Size X="0.0000" Y="0.0000" />
                        <Children>
                          <AbstractNodeData Name="ChatSend" ActionTag="655234991" Tag="149" IconVisible="True" ctype="SingleNodeObjectData">
                            <Size X="0.0000" Y="0.0000" />
                            <Children>
                              <AbstractNodeData Name="ChatSendInteraction" ActionTag="-107585900" Tag="150" IconVisible="False" RightMargin="-720.0000" TopMargin="-150.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                                <Size X="720.0000" Y="150.0000" />
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
                              <AbstractNodeData Name="ChatSendBg" ActionTag="2057437102" Tag="584" IconVisible="False" RightMargin="-720.0000" TopMargin="-150.0000" ctype="SpriteObjectData">
                                <Size X="720.0000" Y="150.0000" />
                                <AnchorPoint ScaleY="1.0000" />
                                <Position Y="150.0000" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition />
                                <PreSize X="0.0000" Y="0.0000" />
                                <FileData Type="Normal" Path="ui/04_01_Chat/frame_083.png" Plist="" />
                                <BlendFunc Src="1" Dst="771" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="ChatTextFieldPanel" ActionTag="905558220" Tag="152" IconVisible="False" LeftMargin="21.0000" RightMargin="-523.0000" TopMargin="-131.9930" BottomMargin="65.9930" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                                <Size X="502.0000" Y="66.0000" />
                                <Children>
                                  <AbstractNodeData Name="ChatTextFieldBg" ActionTag="1342708390" Tag="464" IconVisible="False" TopMargin="5.5000" BottomMargin="5.5000" Scale9Enable="True" LeftEage="17" RightEage="17" TopEage="18" BottomEage="18" Scale9OriginX="17" Scale9OriginY="18" Scale9Width="56" Scale9Height="18" ctype="ImageViewObjectData">
                                    <Size X="502.0000" Y="55.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="251.0000" Y="33.0000" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition X="0.5000" Y="0.5000" />
                                    <PreSize X="1.0000" Y="0.8333" />
                                    <FileData Type="Normal" Path="ui/04_01_Chat/frame_082.png" Plist="" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="TextFieldInteractionPanel" ActionTag="1822012709" Tag="71" IconVisible="False" LeftMargin="10.0000" RightMargin="10.0000" TopMargin="-12.0000" BottomMargin="-10.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                                    <Size X="482.0000" Y="88.0000" />
                                    <AnchorPoint ScaleY="0.5000" />
                                    <Position X="10.0000" Y="34.0000" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition X="0.0199" Y="0.5152" />
                                    <PreSize X="0.9602" Y="1.3333" />
                                    <SingleColor A="255" R="150" G="200" B="255" />
                                    <FirstColor A="255" R="150" G="200" B="255" />
                                    <EndColor A="255" R="255" G="255" B="255" />
                                    <ColorVector ScaleY="1.0000" />
                                  </AbstractNodeData>
                                  <AbstractNodeData Name="ChatTextField" ActionTag="-785914464" Tag="154" IconVisible="False" LeftMargin="10.0000" RightMargin="10.0000" TopMargin="19.0000" BottomMargin="19.0000" TouchEnable="True" FontSize="23" IsCustomSize="True" LabelText="" PlaceHolderText="" MaxLengthText="10" ctype="TextFieldObjectData">
                                    <Size X="482.0000" Y="28.0000" />
                                    <AnchorPoint ScaleY="0.5000" />
                                    <Position X="10.0000" Y="33.0000" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="0" G="0" B="0" />
                                    <PrePosition X="0.0199" Y="0.5000" />
                                    <PreSize X="0.9602" Y="0.4242" />
                                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                                  </AbstractNodeData>
                                </Children>
                                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                <Position X="272.0000" Y="98.9930" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition />
                                <PreSize X="0.0000" Y="0.0000" />
                                <SingleColor A="255" R="150" G="200" B="255" />
                                <FirstColor A="255" R="150" G="200" B="255" />
                                <EndColor A="255" R="255" G="255" B="255" />
                                <ColorVector ScaleY="1.0000" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="SendButton" ActionTag="577136850" Tag="155" IconVisible="False" LeftMargin="643.0269" RightMargin="-709.0269" TopMargin="-129.0029" BottomMargin="63.0029" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="36" Scale9Height="44" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="Sound004" ctype="LuaPxButtonObjectData">
                                <Size X="66.0000" Y="66.0000" />
                                <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                <Position X="676.0269" Y="96.0029" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition />
                                <PreSize X="0.0000" Y="0.0000" />
                                <TextColor A="255" R="255" G="255" B="255" />
                                <DisabledFileData Type="Normal" Path="ui/04_01_Chat/button_081.png" Plist="" />
                                <PressedFileData Type="Normal" Path="ui/04_01_Chat/button_081.png" Plist="" />
                                <NormalFileData Type="Normal" Path="ui/04_01_Chat/button_081.png" Plist="" />
                                <OutlineColor A="255" R="255" G="0" B="0" />
                                <ShadowColor A="255" R="110" G="110" B="110" />
                                <MixedColor A="255" R="65" G="65" B="70" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="ExpressionButton" ActionTag="-1111343409" Tag="157" IconVisible="False" LeftMargin="562.0004" RightMargin="-626.0004" TopMargin="-129.9935" BottomMargin="65.9935" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="34" Scale9Height="42" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="Sound004" ctype="LuaPxButtonObjectData">
                                <Size X="64.0000" Y="64.0000" />
                                <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                <Position X="594.0004" Y="97.9935" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition />
                                <PreSize X="0.0000" Y="0.0000" />
                                <TextColor A="255" R="255" G="255" B="255" />
                                <DisabledFileData Type="Normal" Path="ui/04_01_Chat/button_054.png" Plist="" />
                                <PressedFileData Type="Normal" Path="ui/04_01_Chat/button_054.png" Plist="" />
                                <NormalFileData Type="Normal" Path="ui/04_01_Chat/button_054.png" Plist="" />
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
                      <AbstractNodeData Name="Expression" ActionTag="-1629349154" Tag="158" IconVisible="True" TopMargin="15.0000" BottomMargin="-15.0000" ctype="SingleNodeObjectData">
                        <Size X="0.0000" Y="0.0000" />
                        <Children>
                          <AbstractNodeData Name="ExpressionBg" ActionTag="1686897579" Tag="159" IconVisible="False" LeftMargin="21.0007" RightMargin="-700.0007" TopMargin="-374.0002" BottomMargin="19.0002" Scale9Enable="True" LeftEage="19" RightEage="19" TopEage="19" BottomEage="19" Scale9OriginX="19" Scale9OriginY="19" Scale9Width="22" Scale9Height="22" ctype="ImageViewObjectData">
                            <Size X="679.0000" Y="355.0000" />
                            <AnchorPoint />
                            <Position X="21.0007" Y="19.0002" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition />
                            <PreSize X="0.0000" Y="0.0000" />
                            <FileData Type="Normal" Path="ui/04_01_Chat/frame_071.png" Plist="" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="ExpressionPanel" ActionTag="289690784" Tag="160" IconVisible="False" LeftMargin="55.0000" RightMargin="-665.0000" TopMargin="-360.0001" BottomMargin="40.0001" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                            <Size X="610.0000" Y="320.0000" />
                            <AnchorPoint ScaleY="1.0000" />
                            <Position X="55.0000" Y="360.0001" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition />
                            <PreSize X="0.0000" Y="0.0000" />
                            <SingleColor A="255" R="150" G="200" B="255" />
                            <FirstColor A="255" R="150" G="200" B="255" />
                            <EndColor A="255" R="255" G="255" B="255" />
                            <ColorVector ScaleY="1.0000" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="ExpressionListBg" ActionTag="1252292506" VisibleForFrame="False" Tag="161" IconVisible="False" LeftMargin="13.0000" RightMargin="-708.0000" TopMargin="-118.0004" BottomMargin="12.0004" Scale9Enable="True" LeftEage="25" RightEage="25" TopEage="34" BottomEage="34" Scale9OriginX="25" Scale9OriginY="34" Scale9Width="26" Scale9Height="38" ctype="ImageViewObjectData">
                            <Size X="695.0000" Y="106.0000" />
                            <AnchorPoint ScaleY="0.5000" />
                            <Position X="13.0000" Y="65.0004" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition />
                            <PreSize X="0.0000" Y="0.0000" />
                            <FileData Type="Normal" Path="ui/04_01_Chat/frame_072.png" Plist="" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="ExpressionListPanel" ActionTag="-1870987297" VisibleForFrame="False" Tag="162" IconVisible="False" LeftMargin="43.0004" RightMargin="-677.0004" TopMargin="-99.0002" BottomMargin="23.0002" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                            <Size X="634.0000" Y="76.0000" />
                            <AnchorPoint />
                            <Position X="43.0004" Y="23.0002" />
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
                        <Position Y="-15.0000" />
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
                <Position />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="Channel" Visible="False" ActionTag="-205352895" Tag="163" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="ChannelInteraction" ActionTag="-324164194" Tag="164" IconVisible="False" RightMargin="-519.0000" TopMargin="-621.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" LeftEage="171" RightEage="171" TopEage="204" BottomEage="204" Scale9OriginX="171" Scale9OriginY="204" Scale9Width="178" Scale9Height="212" ctype="PanelObjectData">
                    <Size X="519.0000" Y="621.0000" />
                    <AnchorPoint />
                    <Position />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/04_01_Chat/frame_078.png" Plist="" />
                    <SingleColor A="255" R="150" G="200" B="255" />
                    <FirstColor A="255" R="150" G="200" B="255" />
                    <EndColor A="255" R="255" G="255" B="255" />
                    <ColorVector ScaleY="1.0000" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="ChannelBg" ActionTag="1742312466" Tag="834" IconVisible="False" RightMargin="-520.0000" TopMargin="-620.0000" ctype="SpriteObjectData">
                    <Size X="520.0000" Y="620.0000" />
                    <AnchorPoint />
                    <Position />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/04_01_Chat/frame_078.png" Plist="" />
                    <BlendFunc Src="1" Dst="771" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="ChannelTitleText_TT" ActionTag="-2106371727" Tag="166" IconVisible="False" LeftMargin="226.4998" RightMargin="-291.4998" TopMargin="-598.5046" BottomMargin="557.5046" FontSize="31" LabelText="消息" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="65.0000" Y="41.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="258.9998" Y="578.0046" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="ChannelPannel" ActionTag="-2146491014" Tag="167" IconVisible="False" LeftMargin="18.9996" RightMargin="-497.9996" TopMargin="-533.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size X="479.0000" Y="533.0000" />
                    <AnchorPoint />
                    <Position X="18.9996" />
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