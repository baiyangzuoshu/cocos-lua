<GameFile>
  <PropertyGroup Name="01_02_MainFriendsList" Type="Layer" ID="f928ce63-e7b1-472b-af74-25b998d77992" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="105" Speed="1.0000">
        <Timeline ActionTag="1578469729" Property="Position">
          <PointFrame FrameIndex="10" X="0.0000" Y="0.0000">
            <EasingData Type="1" />
          </PointFrame>
          <PointFrame FrameIndex="33" X="-260.0000" Y="0.0000">
            <EasingData Type="1" />
          </PointFrame>
          <PointFrame FrameIndex="35" X="-255.0000" Y="0.0000">
            <EasingData Type="0" />
          </PointFrame>
          <PointFrame FrameIndex="80" X="-255.0000" Y="0.0000">
            <EasingData Type="2" />
          </PointFrame>
          <PointFrame FrameIndex="103" X="5.0000" Y="0.0000">
            <EasingData Type="2" />
          </PointFrame>
          <PointFrame FrameIndex="105" X="0.0000" Y="0.0000">
            <EasingData Type="1" />
          </PointFrame>
        </Timeline>
        <Timeline ActionTag="1578469729" Property="Scale">
          <ScaleFrame FrameIndex="10" X="1.0000" Y="1.0000">
            <EasingData Type="1" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="80" X="1.0000" Y="1.0000">
            <EasingData Type="2" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="103" X="1.0000" Y="1.0000">
            <EasingData Type="2" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="105" X="1.0000" Y="1.0000">
            <EasingData Type="1" />
          </ScaleFrame>
        </Timeline>
        <Timeline ActionTag="1578469729" Property="RotationSkew">
          <ScaleFrame FrameIndex="10" X="0.0000" Y="0.0000">
            <EasingData Type="1" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="80" X="0.0000" Y="0.0000">
            <EasingData Type="2" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="103" X="0.0000" Y="0.0000">
            <EasingData Type="2" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="105" X="0.0000" Y="0.0000">
            <EasingData Type="1" />
          </ScaleFrame>
        </Timeline>
      </Animation>
      <AnimationList>
        <AnimationInfo Name="ExtendAnimation" StartIndex="80" EndIndex="105">
          <RenderColor A="255" R="255" G="222" B="173" />
        </AnimationInfo>
        <AnimationInfo Name="ReduceAnimation" StartIndex="10" EndIndex="35">
          <RenderColor A="255" R="240" G="128" B="128" />
        </AnimationInfo>
      </AnimationList>
      <ObjectData Name="Layer" Tag="98" ctype="GameLayerObjectData">
        <Size X="396.0000" Y="918.0000" />
        <Children>
          <AbstractNodeData Name="FriendsList" ActionTag="2015637796" Tag="53" IconVisible="True" RightMargin="396.0000" TopMargin="918.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="FriendsList_2" ActionTag="1578469729" Tag="56" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="InteractionPopUp_2" ActionTag="1016994831" Tag="58" IconVisible="False" RightMargin="-380.0000" TopMargin="-913.0003" BottomMargin="13.0003" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size X="380.0000" Y="900.0000" />
                    <AnchorPoint ScaleY="0.5000" />
                    <Position Y="463.0003" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <SingleColor A="255" R="150" G="200" B="255" />
                    <FirstColor A="255" R="150" G="200" B="255" />
                    <EndColor A="255" R="255" G="255" B="255" />
                    <ColorVector ScaleY="1.0000" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="FriendsListBg_2" ActionTag="1209178671" Tag="52" IconVisible="False" RightMargin="-388.0000" TopMargin="-917.9995" BottomMargin="-0.0005" ctype="SpriteObjectData">
                    <Size X="388.0000" Y="918.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="194.0000" Y="458.9995" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/01_02_Main/frame_133.png" Plist="" />
                    <BlendFunc Src="1" Dst="771" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="ListContentPanel_2" ActionTag="-1139818755" Tag="326" IconVisible="False" LeftMargin="1.9999" RightMargin="-378.9999" TopMargin="-866.9994" BottomMargin="35.9994" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size X="377.0000" Y="831.0000" />
                    <AnchorPoint ScaleY="0.5000" />
                    <Position X="1.9999" Y="451.4994" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <SingleColor A="255" R="150" G="200" B="255" />
                    <FirstColor A="255" R="150" G="200" B="255" />
                    <EndColor A="255" R="255" G="255" B="255" />
                    <ColorVector ScaleY="1.0000" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="RetractPanel" ActionTag="202837143" Tag="311" IconVisible="False" LeftMargin="349.9957" RightMargin="-407.9957" TopMargin="-492.9996" BottomMargin="434.9996" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" LeftEage="19" RightEage="19" TopEage="19" BottomEage="19" Scale9OriginX="-19" Scale9OriginY="-19" Scale9Width="38" Scale9Height="38" ctype="PanelObjectData">
                    <Size X="58.0000" Y="58.0000" />
                    <Children>
                      <AbstractNodeData Name="RetractIcon" ActionTag="-1845311805" Tag="312" IconVisible="False" LeftEage="19" RightEage="19" TopEage="19" BottomEage="19" Scale9OriginX="19" Scale9OriginY="19" Scale9Width="20" Scale9Height="20" ctype="ImageViewObjectData">
                        <Size X="58.0000" Y="58.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="29.0000" Y="29.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.5000" Y="0.5000" />
                        <PreSize X="1.0000" Y="1.0000" />
                        <FileData Type="Normal" Path="ui/01_02_Main/icon_085.png" Plist="" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="378.9957" Y="463.9996" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <SingleColor A="255" R="150" G="200" B="255" />
                    <FirstColor A="255" R="150" G="200" B="255" />
                    <EndColor A="255" R="255" G="255" B="255" />
                    <ColorVector ScaleY="1.0000" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="UnfoldPanel" ActionTag="1513148106" Tag="308" IconVisible="False" LeftMargin="350.0000" RightMargin="-408.0000" TopMargin="-493.0006" BottomMargin="435.0006" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" LeftEage="19" RightEage="19" TopEage="19" BottomEage="19" Scale9OriginX="-19" Scale9OriginY="-19" Scale9Width="38" Scale9Height="38" ctype="PanelObjectData">
                    <Size X="58.0000" Y="58.0000" />
                    <Children>
                      <AbstractNodeData Name="UnfoldIcon" ActionTag="-1898356192" Tag="309" IconVisible="False" LeftEage="19" RightEage="19" TopEage="19" BottomEage="19" Scale9OriginX="19" Scale9OriginY="19" Scale9Width="20" Scale9Height="20" ctype="ImageViewObjectData">
                        <Size X="58.0000" Y="58.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="29.0000" Y="29.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.5000" Y="0.5000" />
                        <PreSize X="1.0000" Y="1.0000" />
                        <FileData Type="Normal" Path="ui/01_02_Main/icon_084.png" Plist="" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="379.0000" Y="464.0006" />
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
              <AbstractNodeData Name="ListContentPanel_3" ActionTag="1736282942" Tag="124" IconVisible="False" LeftMargin="2.0000" RightMargin="-122.0000" TopMargin="-867.0000" BottomMargin="36.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size X="120.0000" Y="831.0000" />
                <AnchorPoint ScaleY="0.5000" />
                <Position X="2.0000" Y="451.5000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <SingleColor A="255" R="150" G="200" B="255" />
                <FirstColor A="255" R="150" G="200" B="255" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="OnlineText_TT" ActionTag="692579117" Tag="54" IconVisible="False" LeftMargin="30.0006" RightMargin="-90.0006" TopMargin="-900.9991" BottomMargin="874.9991" FontSize="20" LabelText="在线 3" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="60.0000" Y="26.0000" />
                <AnchorPoint ScaleY="0.5000" />
                <Position X="30.0006" Y="887.9991" />
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