<GameFile>
  <PropertyGroup Name="01_04_TaskCell" Type="Layer" ID="e952f4e8-e305-433f-84e1-6d70aa0e317d" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Layer" Tag="93" ctype="GameLayerObjectData">
        <Size X="609.0000" Y="158.0000" />
        <Children>
          <AbstractNodeData Name="Task" ActionTag="324119512" Tag="97" IconVisible="True" LeftMargin="304.5000" RightMargin="304.5000" TopMargin="79.0000" BottomMargin="79.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="TaskImage" ActionTag="-655354763" Tag="99" IconVisible="False" LeftMargin="-304.5000" RightMargin="-304.5000" TopMargin="-79.0000" BottomMargin="-79.0000" Scale9Enable="True" LeftEage="17" RightEage="17" TopEage="52" BottomEage="52" Scale9OriginX="17" Scale9OriginY="52" Scale9Width="18" Scale9Height="54" ctype="ImageViewObjectData">
                <Size X="609.0000" Y="158.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/01_04_Task/frame_057.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="ActivityPanel" ActionTag="-1211202185" Tag="38" IconVisible="False" LeftMargin="-269.0000" RightMargin="185.0000" TopMargin="-50.0000" BottomMargin="-46.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size X="84.0000" Y="96.0000" />
                <Children>
                  <AbstractNodeData Name="ActivityIcon" ActionTag="2046367596" Tag="100" IconVisible="False" Scale9Enable="True" LeftEage="27" RightEage="27" TopEage="31" BottomEage="31" Scale9OriginX="19" Scale9OriginY="15" Scale9Width="8" Scale9Height="16" ctype="ImageViewObjectData">
                    <Size X="84.0000" Y="96.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="42.0000" Y="48.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.5000" Y="0.5000" />
                    <PreSize X="1.0000" Y="1.0000" />
                    <FileData Type="Default" Path="Default/ImageFile.png" Plist="" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="-227.0000" Y="2.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <SingleColor A="255" R="150" G="200" B="255" />
                <FirstColor A="255" R="150" G="200" B="255" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="TaskText" ActionTag="328037448" Tag="101" IconVisible="False" LeftMargin="-158.0000" RightMargin="-1.0000" TopMargin="-57.0000" BottomMargin="23.0000" FontSize="26" LabelText="每日登录游戏" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-1.0000" ShadowEnabled="True" ctype="TextObjectData">
                <Size X="159.0000" Y="34.0000" />
                <AnchorPoint ScaleY="0.5000" />
                <Position X="-158.0000" Y="40.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="0" G="0" B="0" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="127" G="127" B="127" />
              </AbstractNodeData>
              <AbstractNodeData Name="TaskLoading" ActionTag="-2110505657" Tag="104" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="TaskLoadingBarImage" ActionTag="-79853487" Tag="476" IconVisible="False" LeftMargin="-157.0000" RightMargin="-127.0000" TopMargin="-15.0000" BottomMargin="-9.0000" ctype="SpriteObjectData">
                    <Size X="284.0000" Y="24.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="-15.0000" Y="3.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/01_04_Task/strip_013.png" Plist="" />
                    <BlendFunc Src="1" Dst="771" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="TaskLoadingBar" ActionTag="-2002378407" Tag="102" IconVisible="False" LeftMargin="-157.0000" RightMargin="-127.0000" TopMargin="-15.0000" BottomMargin="-9.0000" ProgressInfo="100" ctype="LoadingBarObjectData">
                    <Size X="284.0000" Y="24.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="-15.0000" Y="3.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <ImageFileData Type="Normal" Path="ui/01_04_Task/strip_012.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="TaskLoadingNum" ActionTag="1686429307" Tag="105" IconVisible="False" LeftMargin="-31.5000" RightMargin="0.5000" TopMargin="-17.0000" BottomMargin="-11.0000" FontSize="24" LabelText="1/1" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="31.0000" Y="28.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="-16.0000" Y="3.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FontResource Type="Normal" Path="font/Font003.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="TaskLoadingText_TT" Visible="False" ActionTag="254971419" Tag="113" IconVisible="False" LeftMargin="-39.5000" RightMargin="-7.5000" TopMargin="-17.5000" BottomMargin="-11.5000" FontSize="22" LabelText="完成" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="47.0000" Y="29.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="-16.0000" Y="3.0000" />
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
              <AbstractNodeData Name="TaskState" CanEdit="False" ActionTag="-132983753" Tag="106" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="Start" ActionTag="-1574318313" Tag="108" IconVisible="True" ctype="SingleNodeObjectData">
                    <Size X="0.0000" Y="0.0000" />
                    <Children>
                      <AbstractNodeData Name="StartButton" ActionTag="404802305" Tag="111" IconVisible="False" LeftMargin="140.0000" RightMargin="-278.0000" TopMargin="-39.0000" BottomMargin="-39.0000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="18" Scale9Height="56" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="Sound004" ctype="LuaPxButtonObjectData">
                        <Size X="138.0000" Y="78.0000" />
                        <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                        <Children>
                          <AbstractNodeData Name="StartText_TT" ActionTag="-1395475521" Tag="110" IconVisible="False" LeftMargin="43.5000" RightMargin="43.5000" TopMargin="19.0000" BottomMargin="27.0000" FontSize="24" LabelText="前往" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-1.0000" ShadowEnabled="True" ctype="TextObjectData">
                            <Size X="51.0000" Y="32.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="69.0000" Y="43.0000" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.5513" />
                            <PreSize X="0.3696" Y="0.4103" />
                            <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                            <OutlineColor A="255" R="255" G="0" B="0" />
                            <ShadowColor A="255" R="42" G="42" B="57" />
                          </AbstractNodeData>
                        </Children>
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="209.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <TextColor A="255" R="255" G="255" B="255" />
                        <DisabledFileData Type="Normal" Path="ui/01_04_Task/button_045.png" Plist="" />
                        <PressedFileData Type="Normal" Path="ui/01_04_Task/button_045.png" Plist="" />
                        <NormalFileData Type="Normal" Path="ui/01_04_Task/button_045.png" Plist="" />
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
                  <AbstractNodeData Name="Receive" Visible="False" ActionTag="1697466824" Tag="114" IconVisible="True" ctype="SingleNodeObjectData">
                    <Size X="0.0000" Y="0.0000" />
                    <Children>
                      <AbstractNodeData Name="ReceiveButton" ActionTag="1670001504" Tag="115" IconVisible="False" LeftMargin="141.0000" RightMargin="-279.0000" TopMargin="-46.0001" BottomMargin="-37.9999" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="108" Scale9Height="62" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="Sound004" ctype="LuaPxButtonObjectData">
                        <Size X="138.0000" Y="84.0000" />
                        <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                        <Children>
                          <AbstractNodeData Name="ReceiveText_TT" ActionTag="-98418363" Tag="116" IconVisible="False" LeftMargin="43.5000" RightMargin="43.5000" TopMargin="26.0000" BottomMargin="26.0000" FontSize="24" LabelText="领取" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-1.0000" ShadowEnabled="True" ctype="TextObjectData">
                            <Size X="51.0000" Y="32.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="69.0000" Y="42.0000" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.5000" />
                            <PreSize X="0.3696" Y="0.3810" />
                            <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                            <OutlineColor A="255" R="255" G="0" B="0" />
                            <ShadowColor A="255" R="42" G="42" B="57" />
                          </AbstractNodeData>
                        </Children>
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="210.0000" Y="4.0001" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <TextColor A="255" R="255" G="255" B="255" />
                        <DisabledFileData Type="Normal" Path="ui/01_04_Task/button_085.png" Plist="" />
                        <PressedFileData Type="Normal" Path="ui/01_04_Task/button_085.png" Plist="" />
                        <NormalFileData Type="Normal" Path="ui/01_04_Task/button_085.png" Plist="" />
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
                  <AbstractNodeData Name="Received" Visible="False" ActionTag="-1000432843" Tag="117" IconVisible="True" ctype="SingleNodeObjectData">
                    <Size X="0.0000" Y="0.0000" />
                    <Children>
                      <AbstractNodeData Name="ReceivedText_TT" ActionTag="844292581" Tag="118" IconVisible="False" LeftMargin="170.1440" RightMargin="-245.1440" TopMargin="-19.7274" BottomMargin="-12.2726" FontSize="24" LabelText="已领取" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="75.0000" Y="32.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="207.6440" Y="3.7274" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="193" G="189" B="237" />
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
              <AbstractNodeData Name="Reward" ActionTag="1929141352" Tag="167" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="Reward_1" ActionTag="528626681" Tag="164" IconVisible="True" ctype="SingleNodeObjectData">
                    <Size X="0.0000" Y="0.0000" />
                    <Children>
                      <AbstractNodeData Name="RewardNode_1" ActionTag="-102172145" Tag="169" IconVisible="True" LeftMargin="-140.0000" RightMargin="140.0000" TopMargin="32.0000" BottomMargin="-32.0000" ctype="SingleNodeObjectData">
                        <Size X="0.0000" Y="0.0000" />
                        <AnchorPoint />
                        <Position X="-140.0000" Y="-32.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="RewardText_1" ActionTag="1803611469" Tag="171" IconVisible="False" LeftMargin="-122.9256" RightMargin="101.9256" TopMargin="14.7131" BottomMargin="-51.7131" FontSize="32" LabelText="×" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="21.0000" Y="37.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="-112.4256" Y="-33.2131" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="0" G="0" B="0" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FontResource Type="Normal" Path="font/Font003.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="RewardNum_1" ActionTag="523368449" Tag="172" IconVisible="False" LeftMargin="-106.0011" RightMargin="43.0011" TopMargin="14.5000" BottomMargin="-51.5000" FontSize="32" LabelText="1000" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="63.0000" Y="37.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="-106.0011" Y="-33.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="0" G="0" B="0" />
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
                  <AbstractNodeData Name="Reward_2" ActionTag="-1017695805" Tag="165" IconVisible="True" ctype="SingleNodeObjectData">
                    <Size X="0.0000" Y="0.0000" />
                    <Children>
                      <AbstractNodeData Name="RewardNode_2" ActionTag="1772580379" Tag="173" IconVisible="True" LeftMargin="10.0004" RightMargin="-10.0004" TopMargin="32.0004" BottomMargin="-32.0004" ctype="SingleNodeObjectData">
                        <Size X="0.0000" Y="0.0000" />
                        <AnchorPoint />
                        <Position X="10.0004" Y="-32.0004" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="RewardText_2" ActionTag="1074429507" Tag="174" IconVisible="False" LeftMargin="27.0743" RightMargin="-48.0743" TopMargin="14.7131" BottomMargin="-51.7131" FontSize="32" LabelText="×" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="21.0000" Y="37.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="37.5743" Y="-33.2131" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="0" G="0" B="0" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FontResource Type="Normal" Path="font/Font003.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="RewardNum_2" ActionTag="-1092072987" Tag="175" IconVisible="False" LeftMargin="43.9991" RightMargin="-106.9991" TopMargin="14.5003" BottomMargin="-51.5003" FontSize="32" LabelText="1000" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="63.0000" Y="37.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="43.9991" Y="-33.0003" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="0" G="0" B="0" />
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
                <AnchorPoint />
                <Position />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint />
            <Position X="304.5000" Y="79.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5000" Y="0.5000" />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="TaskPanel" Visible="False" ActionTag="1973583913" Tag="67" IconVisible="False" LeftMargin="9.0000" RightMargin="10.0000" TopMargin="6.0000" BottomMargin="12.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ComboBoxIndex="1" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size X="590.0000" Y="140.0000" />
            <AnchorPoint />
            <Position X="9.0000" Y="12.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.0148" Y="0.0759" />
            <PreSize X="0.9688" Y="0.8861" />
            <SingleColor A="255" R="0" G="0" B="0" />
            <FirstColor A="255" R="150" G="200" B="255" />
            <EndColor A="255" R="255" G="255" B="255" />
            <ColorVector ScaleY="1.0000" />
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>