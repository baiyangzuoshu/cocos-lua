<GameFile>
  <PropertyGroup Name="01_16_GuideBoastLayer" Type="Layer" ID="20dd0c4b-067d-4c06-b433-b274af929ae7" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Layer" Tag="82" ctype="GameLayerObjectData">
        <Size X="720.0000" Y="1280.0000" />
        <Children>
          <AbstractNodeData Name="BelowLeftFit_1" ActionTag="-521234332" Tag="957" IconVisible="True" RightMargin="720.0000" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="Bg_1" CanEdit="False" ActionTag="-1100930960" Tag="86" IconVisible="False" RightMargin="-720.0000" TopMargin="-1600.0000" LeftEage="237" RightEage="237" TopEage="528" BottomEage="528" Scale9OriginX="237" Scale9OriginY="528" Scale9Width="246" Scale9Height="544" ctype="ImageViewObjectData">
                <Size X="720.0000" Y="1600.0000" />
                <AnchorPoint />
                <Position />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/00_03_Bg/bg_004.png" Plist="" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint />
            <Position />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="CurrentPoints" ActionTag="105044299" Tag="33" IconVisible="True" RightMargin="720.0000" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="CurrentFrame" ActionTag="446250692" Tag="363" IconVisible="False" LeftMargin="251.9998" RightMargin="-467.9998" TopMargin="-875.0008" BottomMargin="729.0008" ctype="SpriteObjectData">
                <Size X="216.0000" Y="146.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="359.9998" Y="802.0008" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/02_01_Boast/frame_010.png" Plist="" />
                <BlendFunc Src="1" Dst="771" />
              </AbstractNodeData>
              <AbstractNodeData Name="BottomInjectionButton" ActionTag="-1287043343" Tag="35" IconVisible="False" LeftMargin="408.0000" RightMargin="-442.0000" TopMargin="-772.0010" BottomMargin="738.0010" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="4" Scale9Height="12" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="Sound004" ctype="LuaPxButtonObjectData">
                <Size X="34.0000" Y="34.0000" />
                <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="425.0000" Y="755.0010" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <TextColor A="255" R="255" G="255" B="255" />
                <DisabledFileData Type="Normal" Path="ui/02_01_Boast/button_014.png" Plist="" />
                <PressedFileData Type="Normal" Path="ui/02_01_Boast/button_014.png" Plist="" />
                <NormalFileData Type="Normal" Path="ui/02_01_Boast/button_014.png" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
                <MixedColor A="255" R="65" G="65" B="70" />
              </AbstractNodeData>
              <AbstractNodeData Name="BottomInjectionText_2_TT" ActionTag="-427929033" Alpha="153" Tag="41" IconVisible="False" LeftMargin="280.5002" RightMargin="-331.5002" TopMargin="-774.0013" BottomMargin="742.0013" FontSize="24" LabelText="底注" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="51.0000" Y="32.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="306.0002" Y="758.0013" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="BottomInjectionText_3" ActionTag="754403362" Tag="42" IconVisible="False" LeftMargin="329.5001" RightMargin="-406.5001" TopMargin="-773.0000" BottomMargin="743.0000" FontSize="26" LabelText="1000萬" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="77.0000" Y="30.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="368.0001" Y="758.0000" />
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
          <AbstractNodeData Name="DesktopCallPoint" ActionTag="-1240908736" Tag="96" IconVisible="True" RightMargin="720.0000" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="BottomInjectionText_TT" ActionTag="-1701768297" Tag="40" IconVisible="False" LeftMargin="306.5000" RightMargin="-413.5000" TopMargin="-914.0000" BottomMargin="880.0000" FontSize="26" LabelText="当前叫点" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-1.0000" ShadowEnabled="True" ctype="TextObjectData">
                <Size X="107.0000" Y="34.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="360.0000" Y="897.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="0" G="0" B="0" />
              </AbstractNodeData>
              <AbstractNodeData Name="BottomInjectionText" ActionTag="361356100" Tag="37" IconVisible="False" LeftMargin="292.9999" RightMargin="-322.9999" TopMargin="-862.0000" BottomMargin="792.0000" FontSize="60" LabelText="2" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="30.0000" Y="70.0000" />
                <AnchorPoint ScaleX="0.8000" ScaleY="0.5000" />
                <Position X="316.9999" Y="827.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FontResource Type="Normal" Path="font/Font003.ttf" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="BottomInjectionText_1_TT" ActionTag="1736157908" Tag="38" IconVisible="False" LeftMargin="335.4980" RightMargin="-384.4980" TopMargin="-860.5017" BottomMargin="797.5017" FontSize="48" LabelText="個" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="49.0000" Y="63.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="359.9980" Y="829.0017" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="BottomInjectionImage" ActionTag="753409077" Tag="39" IconVisible="False" LeftMargin="379.9975" RightMargin="-455.9975" TopMargin="-863.9982" BottomMargin="787.9982" LeftEage="21" RightEage="21" TopEage="15" BottomEage="15" Scale9OriginX="21" Scale9OriginY="15" Scale9Width="34" Scale9Height="46" ctype="ImageViewObjectData">
                <Size X="76.0000" Y="76.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="417.9975" Y="825.9982" />
                <Scale ScaleX="0.9000" ScaleY="0.9000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/00_01_Common/2D_Small_5.png" Plist="" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint />
            <Position />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="GuessingShowNode" ActionTag="-1184576585" Tag="97" IconVisible="True" LeftMargin="361.0000" RightMargin="359.0000" TopMargin="579.0000" BottomMargin="701.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <AnchorPoint />
            <Position X="361.0000" Y="701.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5014" Y="0.5477" />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="GuideMiniTipPopUpNode" ActionTag="1535695445" Tag="437" IconVisible="True" LeftMargin="360.0000" RightMargin="360.0000" TopMargin="580.0000" BottomMargin="700.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <AnchorPoint />
            <Position X="360.0000" Y="700.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5000" Y="0.5469" />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="playerNode_4" ActionTag="996587248" Tag="253" IconVisible="True" LeftMargin="362.0000" RightMargin="358.0000" TopMargin="238.0000" BottomMargin="1042.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <AnchorPoint />
            <Position X="362.0000" Y="1042.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5028" Y="0.8141" />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="playerNode_5" ActionTag="330922571" Tag="279" IconVisible="True" LeftMargin="552.0000" RightMargin="168.0000" TopMargin="284.0000" BottomMargin="996.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <AnchorPoint />
            <Position X="552.0000" Y="996.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.7667" Y="0.7781" />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="playerNode_3" ActionTag="1413873406" Tag="251" IconVisible="True" LeftMargin="170.0000" RightMargin="550.0000" TopMargin="284.0000" BottomMargin="996.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <AnchorPoint />
            <Position X="170.0000" Y="996.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.2361" Y="0.7781" />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="playerNode_6" ActionTag="351730410" Tag="254" IconVisible="True" LeftMargin="620.0000" RightMargin="100.0000" TopMargin="550.0000" BottomMargin="730.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <AnchorPoint />
            <Position X="620.0000" Y="730.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.8611" Y="0.5703" />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="playerNode_2" ActionTag="-1484685828" Tag="249" IconVisible="True" LeftMargin="90.0000" RightMargin="630.0000" TopMargin="550.0000" BottomMargin="730.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <AnchorPoint />
            <Position X="90.0000" Y="730.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.1250" Y="0.5703" />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="playerNode_1" ActionTag="-2018618267" Tag="280" IconVisible="True" LeftMargin="130.0000" RightMargin="590.0000" TopMargin="842.0000" BottomMargin="438.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <AnchorPoint />
            <Position X="130.0000" Y="438.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.1806" Y="0.3422" />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="playerNode_7" ActionTag="-2076842883" Tag="252" IconVisible="True" LeftMargin="582.0000" RightMargin="138.0000" TopMargin="842.0000" BottomMargin="438.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <AnchorPoint />
            <Position X="582.0000" Y="438.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.8083" Y="0.3422" />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="playerNode_0" ActionTag="1670326284" Tag="248" IconVisible="True" LeftMargin="363.0000" RightMargin="357.0000" TopMargin="918.0000" BottomMargin="362.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <AnchorPoint />
            <Position X="363.0000" Y="362.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5042" Y="0.2828" />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="BelowLeftFit" ActionTag="-1486848606" Tag="89" IconVisible="True" RightMargin="720.0000" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="BottomFrame" ActionTag="1670755676" Tag="380" IconVisible="False" RightMargin="-720.0000" TopMargin="-184.0000" ctype="SpriteObjectData">
                <Size X="720.0000" Y="184.0000" />
                <AnchorPoint />
                <Position />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/02_01_Boast/frame_011.png" Plist="" />
                <BlendFunc Src="1" Dst="771" />
              </AbstractNodeData>
              <AbstractNodeData Name="NameText_O" ActionTag="-476121529" Tag="623" IconVisible="False" LeftMargin="140.5000" RightMargin="-311.5000" TopMargin="-150.5000" BottomMargin="113.5000" FontSize="28" LabelText="我是至尊哥哥" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="171.0000" Y="37.0000" />
                <AnchorPoint ScaleY="0.5000" />
                <Position X="140.5000" Y="132.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="Head" ActionTag="871615276" Tag="621" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="HeadPanel" ActionTag="-868106801" Tag="206" IconVisible="False" LeftMargin="27.9997" RightMargin="-127.9997" TopMargin="-150.9999" BottomMargin="50.9999" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size X="100.0000" Y="100.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="77.9997" Y="100.9999" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <SingleColor A="255" R="150" G="200" B="255" />
                    <FirstColor A="255" R="150" G="200" B="255" />
                    <EndColor A="255" R="255" G="255" B="255" />
                    <ColorVector ScaleY="1.0000" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="HeadIcon" ActionTag="-2088641606" Tag="431" IconVisible="True" LeftMargin="78.0000" RightMargin="-78.0000" TopMargin="-101.0000" BottomMargin="101.0000" ctype="SingleNodeObjectData">
                    <Size X="0.0000" Y="0.0000" />
                    <AnchorPoint />
                    <Position X="78.0000" Y="101.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="HeadFrame_1" ActionTag="979491084" Tag="322" IconVisible="False" LeftMargin="17.9998" RightMargin="-137.9998" TopMargin="-161.0000" BottomMargin="41.0000" Scale9Width="46" Scale9Height="46" ctype="ImageViewObjectData">
                    <Size X="120.0000" Y="120.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="77.9998" Y="101.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Default" Path="Default/ImageFile.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="HeadShade" ActionTag="2137516838" Tag="124" IconVisible="False" LeftMargin="24.9998" RightMargin="-130.9998" TopMargin="-154.0000" BottomMargin="48.0000" LeftEage="15" RightEage="15" TopEage="15" BottomEage="15" Scale9OriginX="15" Scale9OriginY="15" Scale9Width="72" Scale9Height="72" ctype="ImageViewObjectData">
                    <Size X="106.0000" Y="106.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="77.9998" Y="101.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/02_01_Boast/frame_129.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="ReplaceBottomInjectionState" ActionTag="-1511434318" Tag="161" IconVisible="False" LeftMargin="52.0000" RightMargin="-100.0000" TopMargin="-74.0000" BottomMargin="26.0000" LeftEage="15" RightEage="15" TopEage="15" BottomEage="15" Scale9OriginX="15" Scale9OriginY="15" Scale9Width="18" Scale9Height="18" ctype="ImageViewObjectData">
                    <Size X="48.0000" Y="48.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="76.0000" Y="50.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/02_01_Boast/button_017.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="OwnRightCallPoint" ActionTag="-377898953" Tag="948" IconVisible="False" LeftMargin="106.0000" RightMargin="-252.0000" TopMargin="-192.0000" BottomMargin="122.0000" ctype="SpriteObjectData">
                    <Size X="146.0000" Y="70.0000" />
                    <Children>
                      <AbstractNodeData Name="VerticesImage_0" ActionTag="-1201141623" Tag="70" IconVisible="False" LeftMargin="75.0000" RightMargin="-5.0000" TopMargin="-8.0000" BottomMargin="2.0000" LeftEage="21" RightEage="21" TopEage="25" BottomEage="25" Scale9OriginX="21" Scale9OriginY="25" Scale9Width="34" Scale9Height="26" ctype="ImageViewObjectData">
                        <Size X="76.0000" Y="76.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="113.0000" Y="40.0000" />
                        <Scale ScaleX="0.7000" ScaleY="0.7000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.7740" Y="0.5714" />
                        <PreSize X="0.5205" Y="1.0857" />
                        <FileData Type="Normal" Path="ui/00_01_Common/2D_Small_6.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="VerticesText_0_TT" ActionTag="-1595471759" Tag="71" IconVisible="False" LeftMargin="52.5000" RightMargin="58.5000" TopMargin="6.5000" BottomMargin="21.5000" FontSize="32" LabelText="个" HorizontalAlignmentType="HT_Right" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="35.0000" Y="42.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="70.0000" Y="42.5000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="0" G="0" B="0" />
                        <PrePosition X="0.4795" Y="0.6071" />
                        <PreSize X="0.2397" Y="0.6000" />
                        <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="VerticesNum_0" ActionTag="-1080829902" Tag="494" IconVisible="False" LeftMargin="24.5000" RightMargin="99.5000" TopMargin="6.5000" BottomMargin="16.5000" FontSize="40" LabelText="7" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="22.0000" Y="47.0000" />
                        <AnchorPoint ScaleX="0.7500" ScaleY="0.5000" />
                        <Position X="41.0000" Y="40.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="0" G="0" B="0" />
                        <PrePosition X="0.2808" Y="0.5714" />
                        <PreSize X="0.1507" Y="0.6714" />
                        <FontResource Type="Normal" Path="font/Font003.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint />
                    <Position X="106.0000" Y="122.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/02_01_Boast/frame_026.png" Plist="" />
                    <BlendFunc Src="1" Dst="771" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="OwnRightOpenImage_IVT" ActionTag="1121121783" Tag="72" IconVisible="False" LeftMargin="106.0000" RightMargin="-182.0000" TopMargin="-192.0000" BottomMargin="122.0000" Scale9Enable="True" LeftEage="25" RightEage="25" TopEage="23" BottomEage="23" Scale9OriginX="25" Scale9OriginY="23" Scale9Width="26" Scale9Height="24" ctype="ImageViewObjectData">
                    <Size X="76.0000" Y="70.0000" />
                    <AnchorPoint />
                    <Position X="106.0000" Y="122.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/02_01_Boast/picture_012_zh_CN.png" Plist="" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint />
                <Position />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="Gold" ActionTag="492660199" Tag="624" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="GoldBg" ActionTag="-331645933" Tag="364" IconVisible="False" LeftMargin="141.0000" RightMargin="-311.0000" TopMargin="-93.0001" BottomMargin="51.0001" ctype="SpriteObjectData">
                    <Size X="170.0000" Y="42.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="226.0000" Y="72.0001" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/02_01_Boast/frame_020.png" Plist="" />
                    <BlendFunc Src="1" Dst="771" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="GoldIcon" ActionTag="-884850413" Tag="627" IconVisible="False" LeftMargin="142.0000" RightMargin="-182.0000" TopMargin="-92.0000" BottomMargin="52.0000" LeftEage="13" RightEage="13" TopEage="13" BottomEage="13" Scale9OriginX="13" Scale9OriginY="13" Scale9Width="14" Scale9Height="14" ctype="ImageViewObjectData">
                    <Size X="40.0000" Y="40.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="162.0000" Y="72.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/00_02_Default/2.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="GoldNum" ActionTag="617260863" Tag="628" IconVisible="False" LeftMargin="180.0000" RightMargin="-276.0000" TopMargin="-91.5000" BottomMargin="56.5000" FontSize="30" LabelText="523.5万" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="96.0000" Y="35.0000" />
                    <AnchorPoint ScaleX="0.1000" ScaleY="0.5000" />
                    <Position X="189.6000" Y="74.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="229" G="221" B="186" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FontResource Type="Normal" Path="font/Font003.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="GoldRollNum" ActionTag="-1518975020" VisibleForFrame="False" Tag="156" IconVisible="False" LeftMargin="180.0000" RightMargin="-276.0000" TopMargin="-91.5000" BottomMargin="56.5000" FontSize="30" LabelText="523.5万" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="96.0000" Y="35.0000" />
                    <AnchorPoint ScaleX="0.1000" ScaleY="0.5000" />
                    <Position X="189.6000" Y="74.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="229" G="221" B="186" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FontResource Type="Normal" Path="font/Font003.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="GoldButtonPanel" ActionTag="1417800043" Tag="520" IconVisible="False" LeftMargin="141.0000" RightMargin="-311.0000" TopMargin="-93.0000" BottomMargin="51.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size X="170.0000" Y="42.0000" />
                    <Children>
                      <AbstractNodeData Name="GoldButton" ActionTag="1958378180" Tag="30" IconVisible="False" LeftMargin="135.0000" RightMargin="5.0000" TopMargin="6.0000" BottomMargin="6.0000" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="1" Scale9Height="8" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="Sound004" ctype="LuaPxButtonObjectData">
                        <Size X="30.0000" Y="30.0000" />
                        <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="150.0000" Y="21.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.8824" Y="0.5000" />
                        <PreSize X="0.1765" Y="0.7143" />
                        <TextColor A="255" R="255" G="255" B="255" />
                        <DisabledFileData Type="Normal" Path="ui/02_01_Boast/button_016.png" Plist="" />
                        <PressedFileData Type="Normal" Path="ui/02_01_Boast/button_016.png" Plist="" />
                        <NormalFileData Type="Normal" Path="ui/02_01_Boast/button_016.png" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                        <MixedColor A="255" R="65" G="65" B="70" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="226.0000" Y="72.0000" />
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
              <AbstractNodeData Name="openRange" ActionTag="-2128491197" Tag="169" IconVisible="False" LeftMargin="263.0000" RightMargin="-463.0000" TopMargin="-610.0000" BottomMargin="310.0000" ClipAble="False" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size X="200.0000" Y="300.0000" />
                <AnchorPoint />
                <Position X="263.0000" Y="310.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <SingleColor A="255" R="150" G="200" B="255" />
                <FirstColor A="255" R="150" G="200" B="255" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="CalledBoxImage_0_IVT" Visible="False" ActionTag="-437101998" Tag="92" IconVisible="False" LeftMargin="594.6296" RightMargin="-694.6296" TopMargin="-211.5083" BottomMargin="153.5083" Scale9Enable="True" LeftEage="33" RightEage="33" TopEage="19" BottomEage="19" Scale9OriginX="33" Scale9OriginY="19" Scale9Width="34" Scale9Height="20" ctype="ImageViewObjectData">
                <Size X="100.0000" Y="58.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="644.6296" Y="182.5083" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/02_01_Boast/frame_022_zh_CN.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="diceBoxDian" Visible="False" ActionTag="1486381134" Tag="59" IconVisible="True" TopMargin="-10.0000" BottomMargin="10.0000" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="PointSelectionPanel" ActionTag="888678030" Tag="68" IconVisible="False" LeftMargin="9.9997" RightMargin="-709.9997" TopMargin="-310.9999" BottomMargin="160.9999" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size X="700.0000" Y="150.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="359.9997" Y="235.9999" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <SingleColor A="255" R="150" G="200" B="255" />
                    <FirstColor A="255" R="150" G="200" B="255" />
                    <EndColor A="255" R="255" G="255" B="255" />
                    <ColorVector ScaleY="1.0000" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="PointSelectionBox" ActionTag="-677111242" Tag="69" IconVisible="False" LeftMargin="0.9997" RightMargin="-718.9997" TopMargin="-316.9999" BottomMargin="134.9999" LeftEage="237" RightEage="237" TopEage="59" BottomEage="59" Scale9OriginX="237" Scale9OriginY="59" Scale9Width="244" Scale9Height="64" ctype="ImageViewObjectData">
                    <Size X="718.0000" Y="182.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="359.9997" Y="225.9999" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/02_01_Boast/frame_021.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="ListDian" ActionTag="-76704015" Tag="74" IconVisible="False" LeftMargin="11.9997" RightMargin="-707.9997" TopMargin="-295.9998" BottomMargin="175.9998" TouchEnable="True" ClipAble="True" BackColorAlpha="0" ComboBoxIndex="1" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ScrollDirectionType="0" ItemMargin="-6" ctype="ListViewObjectData">
                    <Size X="696.0000" Y="120.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="359.9997" Y="235.9998" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <SingleColor A="255" R="150" G="150" B="255" />
                    <FirstColor A="255" R="150" G="150" B="255" />
                    <EndColor A="255" R="255" G="255" B="255" />
                    <ColorVector ScaleY="1.0000" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="CalledBoxImage_IVT" Visible="False" ActionTag="1208830093" Tag="67" IconVisible="False" LeftMargin="22.9989" RightMargin="-122.9989" TopMargin="-344.9999" BottomMargin="286.9999" Scale9Enable="True" LeftEage="33" RightEage="33" TopEage="19" BottomEage="19" Scale9OriginX="33" Scale9OriginY="19" Scale9Width="34" Scale9Height="20" ctype="ImageViewObjectData">
                    <Size X="100.0000" Y="58.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="72.9989" Y="315.9999" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/02_01_Boast/frame_022_zh_CN.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="GuideTextNode_4" ActionTag="1166289432" Tag="298" IconVisible="True" LeftMargin="526.0000" RightMargin="-526.0000" TopMargin="-336.0000" BottomMargin="336.0000" ctype="SingleNodeObjectData">
                    <Size X="0.0000" Y="0.0000" />
                    <Children>
                      <AbstractNodeData Name="GuideBg_4" ActionTag="-1936314548" Tag="299" IconVisible="False" LeftMargin="-60.0000" RightMargin="-60.0000" TopMargin="-30.0000" BottomMargin="-30.0000" Scale9Enable="True" LeftEage="19" RightEage="19" TopEage="19" BottomEage="19" Scale9OriginX="19" Scale9OriginY="19" Scale9Width="22" Scale9Height="22" ctype="ImageViewObjectData">
                        <Size X="120.0000" Y="60.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/01_16_NoviceGuidance/frame_214.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="GuideImage_4" ActionTag="-685527552" Tag="300" IconVisible="False" LeftMargin="-8.0000" RightMargin="-8.0000" TopMargin="24.0000" BottomMargin="-36.0000" LeftEage="5" RightEage="5" TopEage="3" BottomEage="3" Scale9OriginX="5" Scale9OriginY="3" Scale9Width="6" Scale9Height="6" ctype="ImageViewObjectData">
                        <Size X="16.0000" Y="12.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position Y="-30.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/01_16_NoviceGuidance/picture_113.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="GuideText_4_TT" ActionTag="1996262582" Tag="301" IconVisible="False" LeftMargin="-50.0000" RightMargin="-50.0000" TopMargin="-31.0000" BottomMargin="-19.0000" IsCustomSize="True" FontSize="20" LabelText="点击选择" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-2.0000" ShadowEnabled="True" ctype="TextObjectData">
                        <Size X="100.0000" Y="50.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position Y="6.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="0" G="0" B="0" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="255" G="255" B="255" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint />
                    <Position X="526.0000" Y="336.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint />
                <Position Y="10.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="diceBoxNum" Visible="False" ActionTag="-1459293693" Tag="58" IconVisible="True" TopMargin="-10.0000" BottomMargin="10.0000" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="NumberSelectionPanel" ActionTag="-429620259" Tag="60" IconVisible="False" LeftMargin="9.9997" RightMargin="-709.9997" TopMargin="-310.9999" BottomMargin="160.9999" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size X="700.0000" Y="150.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="359.9997" Y="235.9999" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <SingleColor A="255" R="150" G="200" B="255" />
                    <FirstColor A="255" R="150" G="200" B="255" />
                    <EndColor A="255" R="255" G="255" B="255" />
                    <ColorVector ScaleY="1.0000" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="NumberSelectionBox" ActionTag="1271601519" Tag="61" IconVisible="False" LeftMargin="0.9997" RightMargin="-718.9997" TopMargin="-316.9999" BottomMargin="134.9999" LeftEage="21" RightEage="26" TopEage="60" BottomEage="60" Scale9OriginX="21" Scale9OriginY="60" Scale9Width="671" Scale9Height="62" ctype="ImageViewObjectData">
                    <Size X="718.0000" Y="182.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="359.9997" Y="225.9999" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/02_01_Boast/frame_025.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="NumberList" ActionTag="-694329892" Tag="70" IconVisible="False" LeftMargin="11.9997" RightMargin="-707.9997" TopMargin="-295.9998" BottomMargin="175.9998" TouchEnable="True" ClipAble="True" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ScrollDirectionType="0" ItemMargin="-6" ctype="ListViewObjectData">
                    <Size X="696.0000" Y="120.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="359.9997" Y="235.9998" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <SingleColor A="255" R="150" G="150" B="255" />
                    <FirstColor A="255" R="150" G="150" B="255" />
                    <EndColor A="255" R="255" G="255" B="255" />
                    <ColorVector ScaleY="1.0000" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="GuideTextNode_2" ActionTag="-1264745095" Tag="151" IconVisible="True" LeftMargin="80.0000" RightMargin="-80.0000" TopMargin="-336.0000" BottomMargin="336.0000" ctype="SingleNodeObjectData">
                    <Size X="0.0000" Y="0.0000" />
                    <Children>
                      <AbstractNodeData Name="GuideBg_2" ActionTag="-1032283895" Tag="152" IconVisible="False" LeftMargin="-60.0000" RightMargin="-60.0000" TopMargin="-30.0000" BottomMargin="-30.0000" Scale9Enable="True" LeftEage="19" RightEage="19" TopEage="19" BottomEage="19" Scale9OriginX="19" Scale9OriginY="19" Scale9Width="22" Scale9Height="22" ctype="ImageViewObjectData">
                        <Size X="120.0000" Y="60.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/01_16_NoviceGuidance/frame_214.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="GuideImage_2" ActionTag="-1950469894" Tag="153" IconVisible="False" LeftMargin="-8.0000" RightMargin="-8.0000" TopMargin="24.0000" BottomMargin="-36.0000" LeftEage="5" RightEage="5" TopEage="3" BottomEage="3" Scale9OriginX="5" Scale9OriginY="3" Scale9Width="6" Scale9Height="6" ctype="ImageViewObjectData">
                        <Size X="16.0000" Y="12.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position Y="-30.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/01_16_NoviceGuidance/picture_113.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="GuideText_2_TT" ActionTag="-1566243687" Tag="154" IconVisible="False" LeftMargin="-50.0000" RightMargin="-50.0000" TopMargin="-31.0000" BottomMargin="-19.0000" IsCustomSize="True" FontSize="20" LabelText="点击选择" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-2.0000" ShadowEnabled="True" ctype="TextObjectData">
                        <Size X="100.0000" Y="50.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position Y="6.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="0" G="0" B="0" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="255" G="255" B="255" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint />
                    <Position X="80.0000" Y="336.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint />
                <Position Y="10.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="PointNode" ActionTag="-441968749" Tag="626" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="Number" ActionTag="-785640135" Tag="127" IconVisible="True" ctype="SingleNodeObjectData">
                    <Size X="0.0000" Y="0.0000" />
                    <Children>
                      <AbstractNodeData Name="NumberFrame" ActionTag="-958122927" Tag="692" IconVisible="False" LeftMargin="345.0000" RightMargin="-443.0000" TopMargin="-156.0001" BottomMargin="58.0001" LeftEage="32" RightEage="32" TopEage="32" BottomEage="32" Scale9OriginX="32" Scale9OriginY="32" Scale9Width="32" Scale9Height="32" ctype="ImageViewObjectData">
                        <Size X="98.0000" Y="98.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="394.0000" Y="107.0001" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/02_01_Boast/frame_012.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="NumberBg" ActionTag="555971037" Tag="125" IconVisible="False" LeftMargin="343.9997" RightMargin="-441.9997" TopMargin="-157.0000" BottomMargin="59.0000" LeftEage="32" RightEage="32" TopEage="32" BottomEage="32" Scale9OriginX="32" Scale9OriginY="32" Scale9Width="34" Scale9Height="34" ctype="ImageViewObjectData">
                        <Size X="98.0000" Y="98.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="392.9997" Y="108.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/02_01_Boast/frame_013.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="NumberText" ActionTag="-28611769" Tag="693" IconVisible="False" LeftMargin="369.0000" RightMargin="-417.0000" TopMargin="-137.0001" BottomMargin="81.0001" FontSize="48" LabelText="17" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="48.0000" Y="56.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="393.0000" Y="109.0001" />
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
                  <AbstractNodeData Name="GuideTextNode_1" ActionTag="-2041483746" Tag="147" IconVisible="True" LeftMargin="393.0000" RightMargin="-393.0000" TopMargin="-194.0000" BottomMargin="194.0000" ctype="SingleNodeObjectData">
                    <Size X="0.0000" Y="0.0000" />
                    <Children>
                      <AbstractNodeData Name="GuideBg_1" ActionTag="2082532522" Tag="149" IconVisible="False" LeftMargin="-110.0000" RightMargin="-110.0000" TopMargin="-30.0000" BottomMargin="-30.0000" Scale9Enable="True" LeftEage="19" RightEage="19" TopEage="19" BottomEage="19" Scale9OriginX="19" Scale9OriginY="19" Scale9Width="22" Scale9Height="22" ctype="ImageViewObjectData">
                        <Size X="220.0000" Y="60.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/01_16_NoviceGuidance/frame_214.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="GuideImage_1" ActionTag="-1759465319" Tag="148" IconVisible="False" LeftMargin="-8.0000" RightMargin="-8.0000" TopMargin="24.0000" BottomMargin="-36.0000" LeftEage="5" RightEage="5" TopEage="3" BottomEage="3" Scale9OriginX="5" Scale9OriginY="3" Scale9Width="6" Scale9Height="6" ctype="ImageViewObjectData">
                        <Size X="16.0000" Y="12.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position Y="-30.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/01_16_NoviceGuidance/picture_113.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="GuideText_1_TT" ActionTag="-731429023" Tag="150" IconVisible="False" LeftMargin="-100.0000" RightMargin="-100.0000" TopMargin="-31.0000" BottomMargin="-19.0000" IsCustomSize="True" FontSize="20" LabelText="点击选择骰子个数" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-2.0000" ShadowEnabled="True" ctype="TextObjectData">
                        <Size X="200.0000" Y="50.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position Y="6.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="0" G="0" B="0" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="255" G="255" B="255" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint />
                    <Position X="393.0000" Y="194.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="PointText_TT" ActionTag="-803324660" Tag="141" IconVisible="False" LeftMargin="446.4998" RightMargin="-479.4998" TopMargin="-130.0000" BottomMargin="90.0000" FontSize="30" LabelText="个" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="33.0000" Y="40.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="462.9998" Y="110.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="Point" ActionTag="-2030840216" Tag="128" IconVisible="True" ctype="SingleNodeObjectData">
                    <Size X="0.0000" Y="0.0000" />
                    <Children>
                      <AbstractNodeData Name="PointFrame" ActionTag="-907643183" Tag="694" IconVisible="False" LeftMargin="488.9999" RightMargin="-586.9999" TopMargin="-156.0000" BottomMargin="58.0000" LeftEage="32" RightEage="32" TopEage="32" BottomEage="32" Scale9OriginX="32" Scale9OriginY="32" Scale9Width="32" Scale9Height="32" ctype="ImageViewObjectData">
                        <Size X="98.0000" Y="98.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="537.9999" Y="107.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/02_01_Boast/frame_012.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="PointBg_1" ActionTag="-793794282" Tag="126" IconVisible="False" LeftMargin="487.9999" RightMargin="-585.9999" TopMargin="-157.0000" BottomMargin="59.0000" LeftEage="32" RightEage="32" TopEage="32" BottomEage="32" Scale9OriginX="32" Scale9OriginY="32" Scale9Width="34" Scale9Height="34" ctype="ImageViewObjectData">
                        <Size X="98.0000" Y="98.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="536.9999" Y="108.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/02_01_Boast/frame_013.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="Vertices" ActionTag="823355650" Tag="695" IconVisible="False" LeftMargin="498.9999" RightMargin="-574.9999" TopMargin="-145.0000" BottomMargin="69.0000" LeftEage="21" RightEage="21" TopEage="34" BottomEage="34" Scale9OriginX="21" Scale9OriginY="34" Scale9Width="34" Scale9Height="8" ctype="ImageViewObjectData">
                        <Size X="76.0000" Y="76.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="536.9999" Y="107.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/00_01_Common/2D_Small_2.png" Plist="" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint />
                    <Position />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="GuideTextNode_3" ActionTag="-772271560" Tag="155" IconVisible="True" LeftMargin="538.0000" RightMargin="-538.0000" TopMargin="-194.0000" BottomMargin="194.0000" ctype="SingleNodeObjectData">
                    <Size X="0.0000" Y="0.0000" />
                    <Children>
                      <AbstractNodeData Name="GuideBg_3" ActionTag="-738314581" Tag="156" IconVisible="False" LeftMargin="-110.0000" RightMargin="-110.0000" TopMargin="-30.0000" BottomMargin="-30.0000" Scale9Enable="True" LeftEage="19" RightEage="19" TopEage="19" BottomEage="19" Scale9OriginX="19" Scale9OriginY="19" Scale9Width="22" Scale9Height="22" ctype="ImageViewObjectData">
                        <Size X="220.0000" Y="60.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/01_16_NoviceGuidance/frame_214.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="GuideImage_3" ActionTag="-1162846118" Tag="157" IconVisible="False" LeftMargin="-8.0000" RightMargin="-8.0000" TopMargin="24.0000" BottomMargin="-36.0000" LeftEage="5" RightEage="5" TopEage="3" BottomEage="3" Scale9OriginX="5" Scale9OriginY="3" Scale9Width="6" Scale9Height="6" ctype="ImageViewObjectData">
                        <Size X="16.0000" Y="12.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position Y="-30.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/01_16_NoviceGuidance/picture_113.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="GuideText_3_TT" ActionTag="1604221329" Tag="158" IconVisible="False" LeftMargin="-100.0000" RightMargin="-100.0000" TopMargin="-31.0000" BottomMargin="-19.0000" IsCustomSize="True" FontSize="20" LabelText="点击选择骰子点数" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-2.0000" ShadowEnabled="True" ctype="TextObjectData">
                        <Size X="200.0000" Y="50.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position Y="6.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="0" G="0" B="0" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="255" G="255" B="255" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint />
                    <Position X="538.0000" Y="194.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="PointButton" ActionTag="2067634460" Tag="31" IconVisible="False" LeftMargin="585.9999" RightMargin="-697.9999" TopMargin="-163.5000" BottomMargin="54.5000" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="82" Scale9Height="87" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="Sound004" ctype="LuaPxButtonObjectData">
                    <Size X="112.0000" Y="109.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <Children>
                      <AbstractNodeData Name="Text_TT" ActionTag="-898310934" Tag="697" IconVisible="False" LeftMargin="23.0878" RightMargin="25.9122" TopMargin="35.2898" BottomMargin="33.7102" FontSize="30" LabelText="叫点" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-1.0000" ctype="TextObjectData">
                        <Size X="63.0000" Y="40.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="54.5878" Y="53.7102" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="0" G="0" B="0" />
                        <PrePosition X="0.4874" Y="0.4928" />
                        <PreSize X="0.5625" Y="0.3670" />
                        <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="0" G="0" B="0" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="641.9999" Y="109.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/02_01_Boast/button_015_1.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/02_01_Boast/button_015.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/02_01_Boast/button_015.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                    <MixedColor A="255" R="65" G="65" B="70" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="GuideTextNode_5" ActionTag="-1626795731" Tag="302" IconVisible="True" LeftMargin="642.0000" RightMargin="-642.0000" TopMargin="-194.0000" BottomMargin="194.0000" ctype="SingleNodeObjectData">
                    <Size X="0.0000" Y="0.0000" />
                    <Children>
                      <AbstractNodeData Name="GuideBg_5" ActionTag="-433761940" Tag="303" IconVisible="False" LeftMargin="-60.0000" RightMargin="-60.0000" TopMargin="-30.0000" BottomMargin="-30.0000" Scale9Enable="True" LeftEage="19" RightEage="19" TopEage="19" BottomEage="19" Scale9OriginX="19" Scale9OriginY="19" Scale9Width="22" Scale9Height="22" ctype="ImageViewObjectData">
                        <Size X="120.0000" Y="60.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/01_16_NoviceGuidance/frame_214.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="GuideImage_5" ActionTag="-1547788601" Tag="304" IconVisible="False" LeftMargin="-8.0000" RightMargin="-8.0000" TopMargin="24.0000" BottomMargin="-36.0000" LeftEage="5" RightEage="5" TopEage="3" BottomEage="3" Scale9OriginX="5" Scale9OriginY="3" Scale9Width="6" Scale9Height="6" ctype="ImageViewObjectData">
                        <Size X="16.0000" Y="12.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position Y="-30.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FileData Type="Normal" Path="ui/01_16_NoviceGuidance/picture_113.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="GuideText_5_TT" ActionTag="1597027653" Tag="305" IconVisible="False" LeftMargin="-50.0000" RightMargin="-50.0000" TopMargin="-31.0000" BottomMargin="-19.0000" IsCustomSize="True" FontSize="20" LabelText="点击选择" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-2.0000" ShadowEnabled="True" ctype="TextObjectData">
                        <Size X="100.0000" Y="50.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position Y="6.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="0" G="0" B="0" />
                        <PrePosition />
                        <PreSize X="0.0000" Y="0.0000" />
                        <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="255" G="255" B="255" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint />
                    <Position X="642.0000" Y="194.0000" />
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
          <AbstractNodeData Name="UpLeftFit" ActionTag="545452732" Tag="90" IconVisible="True" RightMargin="720.0000" TopMargin="1280.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="Help" ActionTag="-107361512" Tag="243" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="HelpPanel" ActionTag="-183866452" Tag="244" IconVisible="False" LeftMargin="525.0000" RightMargin="-595.0000" TopMargin="-1271.0009" BottomMargin="1201.0009" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size X="70.0000" Y="70.0000" />
                    <Children>
                      <AbstractNodeData Name="HelpButton" ActionTag="1432672706" Tag="245" IconVisible="False" LeftMargin="5.0000" RightMargin="5.0000" TopMargin="5.0000" BottomMargin="5.0000" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="30" Scale9Height="38" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="1.0000" ClickEffect="" ctype="LuaPxButtonObjectData">
                        <Size X="60.0000" Y="60.0000" />
                        <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="35.0000" Y="35.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.5000" Y="0.5000" />
                        <PreSize X="0.8571" Y="0.8571" />
                        <TextColor A="255" R="255" G="255" B="255" />
                        <DisabledFileData Type="Normal" Path="ui/02_01_Boast/button_097.png" Plist="" />
                        <PressedFileData Type="Normal" Path="ui/02_01_Boast/button_097.png" Plist="" />
                        <NormalFileData Type="Normal" Path="ui/02_01_Boast/button_097.png" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                        <MixedColor A="255" R="65" G="65" B="70" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="560.0000" Y="1236.0009" />
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
              <AbstractNodeData Name="GuideTextNode_6" ActionTag="-1449807079" Tag="306" IconVisible="True" LeftMargin="560.0000" RightMargin="-560.0000" TopMargin="-1161.0000" BottomMargin="1161.0000" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="GuideBg_6" ActionTag="741286583" Tag="307" IconVisible="False" LeftMargin="-110.0000" RightMargin="-110.0000" TopMargin="-30.0000" BottomMargin="-30.0000" Scale9Enable="True" LeftEage="19" RightEage="19" TopEage="19" BottomEage="19" Scale9OriginX="19" Scale9OriginY="19" Scale9Width="22" Scale9Height="22" ctype="ImageViewObjectData">
                    <Size X="220.0000" Y="60.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/01_16_NoviceGuidance/frame_214.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="GuideImage_6" ActionTag="-1594534776" Tag="308" IconVisible="False" LeftMargin="-8.0000" RightMargin="-8.0000" TopMargin="-44.0000" BottomMargin="32.0000" LeftEage="5" RightEage="5" TopEage="3" BottomEage="3" Scale9OriginX="5" Scale9OriginY="3" Scale9Width="6" Scale9Height="6" ctype="ImageViewObjectData">
                    <Size X="16.0000" Y="12.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position Y="38.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/01_16_NoviceGuidance/picture_114.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="GuideText_6_TT" ActionTag="-882396123" Tag="309" IconVisible="False" LeftMargin="-100.0000" RightMargin="-100.0000" TopMargin="-31.0000" BottomMargin="-19.0000" IsCustomSize="True" FontSize="20" LabelText="点此查看游戏帮助" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-2.0000" ShadowEnabled="True" ctype="TextObjectData">
                    <Size X="200.0000" Y="50.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position Y="6.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="0" G="0" B="0" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="255" G="255" B="255" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint />
                <Position X="560.0000" Y="1161.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="Exit" ActionTag="1709729568" Tag="1322" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="ExitPanel" ActionTag="1414942906" Tag="1323" IconVisible="False" LeftMargin="598.0000" RightMargin="-708.0000" TopMargin="-1271.0000" BottomMargin="1201.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size X="110.0000" Y="70.0000" />
                    <Children>
                      <AbstractNodeData Name="ExitIcon_SVT" ActionTag="2145195633" Tag="1325" IconVisible="False" LeftMargin="5.0000" RightMargin="5.0000" TopMargin="5.0000" BottomMargin="5.0000" ctype="SpriteObjectData">
                        <Size X="100.0000" Y="60.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="55.0000" Y="35.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.5000" Y="0.5000" />
                        <PreSize X="0.9091" Y="0.8571" />
                        <FileData Type="Normal" Path="ui/01_16_NoviceGuidance/button_105_zh_CN.png" Plist="" />
                        <BlendFunc Src="1" Dst="771" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="653.0000" Y="1236.0000" />
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