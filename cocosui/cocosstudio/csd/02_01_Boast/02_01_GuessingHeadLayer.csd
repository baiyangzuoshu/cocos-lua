<GameFile>
  <PropertyGroup Name="02_01_GuessingHeadLayer" Type="Layer" ID="23e7da91-da83-4e2a-9cfd-20ae4d823211" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="70" Speed="1.0000" ActivedAnimationName="PlayersAnimation">
        <Timeline ActionTag="943998915" Property="Position">
          <PointFrame FrameIndex="20" X="50.0000" Y="135.9998">
            <EasingData Type="1" />
          </PointFrame>
          <PointFrame FrameIndex="45" X="50.0000" Y="123.9990">
            <EasingData Type="2" />
          </PointFrame>
          <PointFrame FrameIndex="70" X="50.0000" Y="135.9998">
            <EasingData Type="2" />
          </PointFrame>
        </Timeline>
        <Timeline ActionTag="943998915" Property="Scale">
          <ScaleFrame FrameIndex="20" X="1.0000" Y="1.0000">
            <EasingData Type="1" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="70" X="1.0000" Y="1.0000">
            <EasingData Type="2" />
          </ScaleFrame>
        </Timeline>
        <Timeline ActionTag="943998915" Property="RotationSkew">
          <ScaleFrame FrameIndex="20" X="0.0000" Y="0.0000">
            <EasingData Type="1" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="70" X="0.0000" Y="0.0000">
            <EasingData Type="2" />
          </ScaleFrame>
        </Timeline>
      </Animation>
      <AnimationList>
        <AnimationInfo Name="PlayersAnimation" StartIndex="20" EndIndex="70">
          <RenderColor A="255" R="173" G="216" B="230" />
        </AnimationInfo>
      </AnimationList>
      <ObjectData Name="Layer" Tag="471" ctype="GameLayerObjectData">
        <Size X="100.0000" Y="117.0000" />
        <Children>
          <AbstractNodeData Name="GuessingHeadBg" ActionTag="1594277527" VisibleForFrame="False" Tag="257" IconVisible="False" LeftMargin="-4.0000" RightMargin="-4.0000" TopMargin="-4.0000" BottomMargin="13.0000" ctype="SpriteObjectData">
            <Size X="108.0000" Y="108.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="50.0000" Y="67.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5000" Y="0.5726" />
            <PreSize X="1.0800" Y="0.9231" />
            <FileData Type="Normal" Path="ui/02_01_Boast/frame_149.png" Plist="" />
            <BlendFunc Src="1" Dst="771" />
          </AbstractNodeData>
          <AbstractNodeData Name="GuessingHead" ActionTag="866970392" Tag="479" IconVisible="True" LeftMargin="50.0000" RightMargin="50.0000" TopMargin="50.0000" BottomMargin="67.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <AnchorPoint />
            <Position X="50.0000" Y="67.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5000" Y="0.5726" />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="GuessingHeadPlayersMark_SVT" ActionTag="943998915" VisibleForFrame="False" Tag="258" IconVisible="False" LeftMargin="18.0000" RightMargin="18.0000" TopMargin="-59.9998" BottomMargin="94.9998" ctype="SpriteObjectData">
            <Size X="64.0000" Y="82.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="50.0000" Y="135.9998" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5000" Y="1.1624" />
            <PreSize X="0.6400" Y="0.7009" />
            <FileData Type="Normal" Path="ui/02_01_Boast/picture_074_zh_CN.png" Plist="" />
            <BlendFunc Src="1" Dst="771" />
          </AbstractNodeData>
          <AbstractNodeData Name="HeadBg_1" ActionTag="-1772560634" Tag="473" IconVisible="False" LeftMargin="-1.0000" RightMargin="-1.0000" TopMargin="86.0000" BottomMargin="-1.0000" ctype="SpriteObjectData">
            <Size X="102.0000" Y="32.0000" />
            <Children>
              <AbstractNodeData Name="GuessingNum" ActionTag="1137488880" Tag="474" IconVisible="False" LeftMargin="19.4996" RightMargin="23.5004" TopMargin="2.5000" BottomMargin="3.5000" FontSize="22" LabelText="+1000" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="59.0000" Y="26.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="48.9996" Y="16.5000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="252" G="255" B="0" />
                <PrePosition X="0.4804" Y="0.5156" />
                <PreSize X="0.5784" Y="0.8125" />
                <FontResource Type="Normal" Path="font/Font003.ttf" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="FlyGoldNode" ActionTag="1837515034" Tag="198" IconVisible="True" LeftMargin="15.0000" RightMargin="87.0000" TopMargin="15.0000" BottomMargin="17.0000" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <AnchorPoint />
                <Position X="15.0000" Y="17.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.1471" Y="0.5313" />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="50.0000" Y="15.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5000" Y="0.1282" />
            <PreSize X="1.0200" Y="0.2735" />
            <FileData Type="Normal" Path="ui/02_01_Boast/frame_147.png" Plist="" />
            <BlendFunc Src="1" Dst="771" />
          </AbstractNodeData>
          <AbstractNodeData Name="GuessingHeadPanel" ActionTag="-1441473049" Tag="443" IconVisible="False" BottomMargin="17.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" ctype="PanelObjectData">
            <Size X="100.0000" Y="100.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="50.0000" Y="67.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5000" Y="0.5726" />
            <PreSize X="1.0000" Y="0.8547" />
            <SingleColor A="255" R="150" G="200" B="255" />
            <FirstColor A="255" R="150" G="200" B="255" />
            <EndColor A="255" R="255" G="255" B="255" />
            <ColorVector ScaleY="1.0000" />
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>