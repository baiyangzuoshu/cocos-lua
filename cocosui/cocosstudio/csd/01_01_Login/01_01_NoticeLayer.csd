<GameFile>
  <PropertyGroup Name="01_01_NoticeLayer" Type="Layer" ID="cb3d45e5-8762-4da2-8953-8002d779460a" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Layer" Tag="165" ctype="GameLayerObjectData">
        <Size X="720.0000" Y="1280.0000" />
        <Children>
          <AbstractNodeData Name="Bg" ActionTag="548837069" Tag="166" IconVisible="True" RightMargin="720.0000" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="Bg_2" ActionTag="-642729501" Tag="208" IconVisible="False" RightMargin="-720.0000" TopMargin="-1440.0000" BottomMargin="-160.0000" LeftEage="237" RightEage="237" TopEage="528" BottomEage="528" Scale9OriginX="237" Scale9OriginY="528" Scale9Width="246" Scale9Height="544" ctype="ImageViewObjectData">
                <Size X="720.0000" Y="1600.0000" />
                <AnchorPoint />
                <Position Y="-160.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/00_03_Bg/bg_008.png" Plist="" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint />
            <Position />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="Middle" ActionTag="-76354200" Tag="169" IconVisible="True" LeftMargin="-0.0006" RightMargin="720.0006" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="Bg_1" ActionTag="766665048" Tag="163" IconVisible="False" LeftMargin="15.9997" RightMargin="-701.9997" TopMargin="-1061.9993" BottomMargin="245.9992" ctype="SpriteObjectData">
                <Size X="686.0000" Y="816.0000" />
                <AnchorPoint />
                <Position X="15.9997" Y="245.9992" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/01_11_ActivitiesBulletin/frame_045.png" Plist="" />
                <BlendFunc Src="1" Dst="771" />
              </AbstractNodeData>
              <AbstractNodeData Name="NoticeIcon_IVT" ActionTag="217537709" Tag="170" IconVisible="False" LeftMargin="39.9995" RightMargin="-415.9995" TopMargin="-1103.9995" BottomMargin="981.9995" Scale9Enable="True" LeftEage="93" RightEage="93" TopEage="44" BottomEage="44" Scale9OriginX="93" Scale9OriginY="44" Scale9Width="190" Scale9Height="34" ctype="ImageViewObjectData">
                <Size X="376.0000" Y="122.0000" />
                <AnchorPoint ScaleY="0.5000" />
                <Position X="39.9995" Y="1042.9995" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/01_11_ActivitiesBulletin/picture_004_zh_CN.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="NoticeText" ActionTag="-1271415582" Tag="171" IconVisible="False" LeftMargin="76.0001" RightMargin="-633.0001" TopMargin="-937.0009" BottomMargin="607.0009" IsCustomSize="True" FontSize="24" LabelText="尊敬的玩家：&#xA;非常感謝你在appstore對XXXXXXXXXXXXXXXXX&#xA;&#xA;&#xA;&#xA;&#xA;&#xA;&#xA;&#xA;" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="557.0000" Y="330.0000" />
                <AnchorPoint ScaleY="1.0000" />
                <Position X="76.0001" Y="937.0009" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="Know" ActionTag="396866354" Tag="27" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="KnowButton" ActionTag="-2173079" Tag="24" IconVisible="False" LeftMargin="261.0000" RightMargin="-459.0000" TopMargin="-390.9998" BottomMargin="298.9998" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="168" Scale9Height="76" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="Sound004" ctype="LuaPxButtonObjectData">
                    <Size X="198.0000" Y="92.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <Children>
                      <AbstractNodeData Name="KnowText_TT" ActionTag="455021299" Tag="28" IconVisible="False" LeftMargin="56.0000" RightMargin="56.0000" TopMargin="26.5000" BottomMargin="28.5000" FontSize="28" LabelText="知道了" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-1.0000" ShadowEnabled="True" ctype="TextObjectData">
                        <Size X="86.0000" Y="37.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="99.0000" Y="47.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="0" G="0" B="0" />
                        <PrePosition X="0.5000" Y="0.5109" />
                        <PreSize X="0.4343" Y="0.4022" />
                        <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="0" G="0" B="0" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="360.0000" Y="344.9998" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/01_11_ActivitiesBulletin/button_038.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/01_11_ActivitiesBulletin/button_038.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/01_11_ActivitiesBulletin/button_038.png" Plist="" />
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
              <AbstractNodeData Name="YippeeIcon" ActionTag="-2111968245" Tag="182" IconVisible="False" LeftMargin="491.0046" RightMargin="-643.0046" TopMargin="-535.0023" BottomMargin="423.0023" Scale9Enable="True" LeftEage="50" RightEage="50" TopEage="36" BottomEage="36" Scale9OriginX="50" Scale9OriginY="36" Scale9Width="52" Scale9Height="40" ctype="ImageViewObjectData">
                <Size X="152.0000" Y="112.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="567.0046" Y="479.0023" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/01_11_ActivitiesBulletin/picture_005.png" Plist="" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint />
            <Position X="-0.0006" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.0000" />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>