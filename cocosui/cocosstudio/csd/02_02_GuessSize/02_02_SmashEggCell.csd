<GameFile>
  <PropertyGroup Name="02_02_SmashEggCell" Type="Layer" ID="952fa6f1-81c1-4d82-a689-a3c350cc0a91" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="170" Speed="1.0000">
        <Timeline ActionTag="-480913168" Property="Position">
          <PointFrame FrameIndex="0" X="-30.0000" Y="30.0000">
            <EasingData Type="3" />
          </PointFrame>
          <PointFrame FrameIndex="60" X="10.0000" Y="30.0000">
            <EasingData Type="6" />
          </PointFrame>
          <PointFrame FrameIndex="120" X="-30.0000" Y="30.0000">
            <EasingData Type="6" />
          </PointFrame>
          <PointFrame FrameIndex="130" X="0.0000" Y="30.0000">
            <EasingData Type="0" />
          </PointFrame>
        </Timeline>
        <Timeline ActionTag="-480913168" Property="Scale">
          <ScaleFrame FrameIndex="0" X="1.0000" Y="1.0000">
            <EasingData Type="3" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="60" X="1.0000" Y="1.0000">
            <EasingData Type="6" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="120" X="1.0000" Y="1.0000">
            <EasingData Type="6" />
          </ScaleFrame>
        </Timeline>
        <Timeline ActionTag="-480913168" Property="RotationSkew">
          <ScaleFrame FrameIndex="0" X="1.0000" Y="1.0000">
            <EasingData Type="3" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="60" X="-1.0000" Y="-1.0000">
            <EasingData Type="6" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="120" X="1.0000" Y="1.0000">
            <EasingData Type="6" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="130" X="0.0000" Y="0.0000">
            <EasingData Type="0" />
          </ScaleFrame>
        </Timeline>
        <Timeline ActionTag="1074014961" Property="Position">
          <PointFrame FrameIndex="130" X="0.0000" Y="0.0000">
            <EasingData Type="0" />
          </PointFrame>
          <PointFrame FrameIndex="170" X="0.0000" Y="0.0000">
            <EasingData Type="0" />
          </PointFrame>
        </Timeline>
        <Timeline ActionTag="1074014961" Property="Scale">
          <ScaleFrame FrameIndex="130" X="1.0000" Y="1.0000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="170" X="1.0000" Y="1.0000">
            <EasingData Type="0" />
          </ScaleFrame>
        </Timeline>
        <Timeline ActionTag="1074014961" Property="RotationSkew">
          <ScaleFrame FrameIndex="130" X="0.0000" Y="0.0000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="134" X="-8.0000" Y="-8.0000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="150" X="2.0000" Y="2.0000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="156" X="0.0000" Y="0.0000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="170" X="0.0000" Y="0.0000">
            <EasingData Type="0" />
          </ScaleFrame>
        </Timeline>
      </Animation>
      <AnimationList>
        <AnimationInfo Name="NormalcyAnimation" StartIndex="0" EndIndex="120">
          <RenderColor A="255" R="250" G="250" B="210" />
        </AnimationInfo>
        <AnimationInfo Name="ClickAnimation" StartIndex="130" EndIndex="170">
          <RenderColor A="255" R="255" G="239" B="213" />
        </AnimationInfo>
      </AnimationList>
      <ObjectData Name="Layer" Tag="12" ctype="GameLayerObjectData">
        <Size X="184.0000" Y="361.0000" />
        <Children>
          <AbstractNodeData Name="SmashEggNode" ActionTag="2066386057" Tag="13" IconVisible="True" LeftMargin="92.0000" RightMargin="92.0000" TopMargin="180.5000" BottomMargin="180.5000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="SmashEggAnimation_1" ActionTag="1074014961" Tag="117" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="SmashEggAnimation_2" ActionTag="-480913168" Tag="115" IconVisible="True" TopMargin="-30.0000" BottomMargin="30.0000" ctype="SingleNodeObjectData">
                    <Size X="0.0000" Y="0.0000" />
                    <Children>
                      <AbstractNodeData Name="SmashEggSpineATNode" ActionTag="-1125003166" Tag="14" IconVisible="True" TopMargin="29.9997" BottomMargin="-29.9997" ctype="SingleNodeObjectData">
                        <Size X="0.0000" Y="0.0000" />
                        <AnchorPoint />
                        <Position Y="-29.9997" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="SmashEggPlayerHead" ActionTag="1433863042" Tag="15" IconVisible="True" LeftMargin="4.0000" RightMargin="-4.0000" TopMargin="-80.0000" BottomMargin="80.0000" ctype="SingleNodeObjectData">
                        <Size X="0.0000" Y="0.0000" />
                        <AnchorPoint />
                        <Position X="4.0000" Y="80.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="SmashEggNum" ActionTag="249981722" Tag="16" IconVisible="False" LeftMargin="-62.0000" RightMargin="-66.0000" TopMargin="159.4997" BottomMargin="-206.4997" FontSize="40" LabelText="123.4万" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="128.0000" Y="47.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="2.0000" Y="-182.9997" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="252" B="10" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FontResource Type="Normal" Path="font/Font003.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="SmashEggNumSpineATNode" ActionTag="1368040519" Tag="103" IconVisible="True" ctype="SingleNodeObjectData">
                        <Size X="0.0000" Y="0.0000" />
                        <AnchorPoint />
                        <Position />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="SmashEggPanel" ActionTag="-1601641265" Tag="17" IconVisible="False" LeftMargin="-92.0000" RightMargin="-92.0000" TopMargin="-150.5003" BottomMargin="-210.4997" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                        <Size X="184.0000" Y="361.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position Y="-29.9997" />
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
                    <Position Y="30.0000" />
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
            <Position X="92.0000" Y="180.5000" />
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