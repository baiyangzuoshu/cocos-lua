<GameFile>
  <PropertyGroup Name="01_01_LoadingTipPopUp_1" Type="Layer" ID="a75a1672-a644-4761-99be-574f1d048a68" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Layer" Tag="78" ctype="GameLayerObjectData">
        <Size X="720.0000" Y="1280.0000" />
        <Children>
          <AbstractNodeData Name="Middle" ActionTag="1387320963" Tag="94" IconVisible="True" LeftMargin="26.0000" RightMargin="694.0000" TopMargin="974.0000" BottomMargin="306.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="Bg" ActionTag="2067069431" Tag="913" IconVisible="False" RightMargin="-668.0000" TopMargin="-668.0000" Scale9Enable="True" LeftEage="17" RightEage="17" TopEage="138" BottomEage="138" Scale9OriginX="17" Scale9OriginY="138" Scale9Width="20" Scale9Height="144" ctype="ImageViewObjectData">
                <Size X="668.0000" Y="668.0000" />
                <AnchorPoint />
                <Position />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/01_06_PersonalCenter/frame_034.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="TitleText_TT" ActionTag="78527780" Tag="915" IconVisible="False" LeftMargin="300.5027" RightMargin="-367.5027" TopMargin="-652.0018" BottomMargin="610.0018" FontSize="32" LabelText="提示" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-1.0000" ShadowEnabled="True" ctype="TextObjectData">
                <Size X="67.0000" Y="42.0000" />
                <AnchorPoint ScaleX="0.6334" ScaleY="0.3730" />
                <Position X="342.9405" Y="625.6678" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="0" G="0" B="0" />
              </AbstractNodeData>
              <AbstractNodeData Name="ContentText_1_TT" ActionTag="-1778733174" Tag="997" IconVisible="False" LeftMargin="75.0000" RightMargin="-593.0000" TopMargin="-498.5000" BottomMargin="326.5000" IsCustomSize="True" FontSize="32" LabelText="检查到游戏当前版本需要更新，本次更新的内容大小约为XX.XXMB，点击确定，即可下载更新，点击取消退出游戏" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="518.0000" Y="172.0000" />
                <AnchorPoint ScaleY="1.0000" />
                <Position X="75.0000" Y="498.5000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="ContentText_2_TT" ActionTag="344961125" Tag="998" IconVisible="False" LeftMargin="54.9999" RightMargin="-612.9999" TopMargin="-270.6350" BottomMargin="238.6350" IsCustomSize="True" FontSize="24" LabelText="当前下载为流量下载，建议打开WIFI网络下载新版本" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="558.0000" Y="32.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="333.9999" Y="254.6350" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FontResource Type="Normal" Path="font/Default.ttf" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="Confirm" ActionTag="-1422836593" Tag="1007" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="ConfirmButton" ActionTag="-1502178229" Tag="1009" IconVisible="False" LeftMargin="76.0000" RightMargin="-284.0000" TopMargin="-160.0000" BottomMargin="62.0000" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="178" Scale9Height="76" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="" ctype="LuaPxButtonObjectData">
                    <Size X="208.0000" Y="98.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <Children>
                      <AbstractNodeData Name="ConfirmText_TT" ActionTag="889598673" Tag="1011" IconVisible="False" LeftMargin="74.5000" RightMargin="74.5000" TopMargin="30.5000" BottomMargin="30.5000" FontSize="28" LabelText="确定" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-1.0000" ShadowEnabled="True" ctype="TextObjectData">
                        <Size X="59.0000" Y="37.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="104.0000" Y="49.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.5000" Y="0.5000" />
                        <PreSize X="0.2837" Y="0.3776" />
                        <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="0" G="0" B="0" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="180.0000" Y="111.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/01_10_Mail/button_034.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/01_10_Mail/button_034.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/01_10_Mail/button_034.png" Plist="" />
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
              <AbstractNodeData Name="Cancel" ActionTag="1633654025" Tag="1008" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="CancelButton" ActionTag="499716670" Tag="1010" IconVisible="False" LeftMargin="383.9995" RightMargin="-591.9995" TopMargin="-160.0000" BottomMargin="62.0000" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="178" Scale9Height="76" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="" ctype="LuaPxButtonObjectData">
                    <Size X="208.0000" Y="98.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <Children>
                      <AbstractNodeData Name="CancelText_TT" ActionTag="300905102" Tag="1012" IconVisible="False" LeftMargin="74.5000" RightMargin="74.5000" TopMargin="30.5000" BottomMargin="30.5000" FontSize="28" LabelText="取消" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="0.0000" ShadowOffsetY="-1.0000" ShadowEnabled="True" ctype="TextObjectData">
                        <Size X="59.0000" Y="37.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="104.0000" Y="49.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.5000" Y="0.5000" />
                        <PreSize X="0.2837" Y="0.3776" />
                        <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="0" G="0" B="0" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="487.9995" Y="111.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/01_10_Mail/button_035.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/01_10_Mail/button_035.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/01_10_Mail/button_035.png" Plist="" />
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
            <Position X="26.0000" Y="306.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.0361" Y="0.2391" />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>