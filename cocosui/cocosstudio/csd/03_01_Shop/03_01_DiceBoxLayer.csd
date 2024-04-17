<GameFile>
  <PropertyGroup Name="03_01_DiceBoxLayer" Type="Layer" ID="7a4739ab-a844-4986-be42-52469ba9d3dc" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Layer" Tag="306" ctype="GameLayerObjectData">
        <Size X="238.0000" Y="278.0000" />
        <Children>
          <AbstractNodeData Name="Node" ActionTag="-1468008152" Tag="420" IconVisible="True" LeftMargin="9.0000" RightMargin="229.0000" TopMargin="266.0000" BottomMargin="12.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="RechargeFrame" ActionTag="354507559" Tag="421" IconVisible="False" LeftMargin="-9.0006" RightMargin="-228.9994" TopMargin="-267.0000" BottomMargin="-11.0000" Scale9Enable="True" LeftEage="16" RightEage="16" TopEage="91" BottomEage="91" Scale9OriginX="16" Scale9OriginY="91" Scale9Width="206" Scale9Height="96" ctype="ImageViewObjectData">
                <Size X="238.0000" Y="278.0000" />
                <AnchorPoint ScaleY="1.0000" />
                <Position X="-9.0006" Y="267.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="ui/03_01_Shop/frame_212.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="DiceBoxIcon" ActionTag="-1776377876" Tag="422" IconVisible="False" LeftMargin="54.0000" RightMargin="-166.0000" TopMargin="-228.0000" BottomMargin="60.0000" LeftEage="15" RightEage="15" TopEage="15" BottomEage="15" Scale9OriginX="15" Scale9OriginY="15" Scale9Width="16" Scale9Height="16" ctype="ImageViewObjectData">
                <Size X="112.0000" Y="168.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="110.0000" Y="144.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Default" Path="Default/ImageFile.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="DiceBoxText" ActionTag="1900425587" Tag="124" IconVisible="False" LeftMargin="56.0000" RightMargin="-164.0000" TopMargin="-251.0000" BottomMargin="215.0000" FontSize="26" LabelText="骰盅名称" OutlineEnabled="True" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="108.0000" Y="36.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="110.0000" Y="233.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FontResource Type="Normal" Path="font/Font001.ttf" Plist="" />
                <OutlineColor A="255" R="18" G="6" B="57" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="ConfirmNode" Visible="False" ActionTag="28849655" Tag="187" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="ConfirmButton" ActionTag="-2098039422" Tag="425" IconVisible="False" LeftMargin="5.0000" RightMargin="-215.0000" TopMargin="-87.0000" BottomMargin="-1.0000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="180" Scale9Height="66" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" LabelText="0.9800" ClickEffect="Sound004" ctype="LuaPxButtonObjectData">
                    <Size X="210.0000" Y="88.0000" />
                    <ScriptData FileType="Lua" RelativeScriptFile="newButton.lua" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="110.0000" Y="43.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/03_01_Shop/button_007_1.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/03_01_Shop/button_007.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/03_01_Shop/button_007.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                    <MixedColor A="255" R="65" G="65" B="70" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="ConfirmNum" ActionTag="1604847213" Tag="427" IconVisible="False" LeftMargin="106.0000" RightMargin="-154.0000" TopMargin="-63.5000" BottomMargin="26.5000" FontSize="32" LabelText="200" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="48.0000" Y="37.0000" />
                    <Children>
                      <AbstractNodeData Name="ConfirmIcon" ActionTag="-596282450" Tag="426" IconVisible="False" LeftMargin="-41.0000" RightMargin="51.0000" TopMargin="4.0000" BottomMargin="1.0000" LeftEage="13" RightEage="13" TopEage="13" BottomEage="13" Scale9OriginX="13" Scale9OriginY="13" Scale9Width="12" Scale9Height="6" ctype="ImageViewObjectData">
                        <Size X="38.0000" Y="32.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="-22.0000" Y="17.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="-0.4583" Y="0.4595" />
                        <PreSize X="0.7917" Y="0.8649" />
                        <FileData Type="Normal" Path="ui/03_01_Shop/icon_029.png" Plist="" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="130.0000" Y="45.0000" />
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
              <AbstractNodeData Name="PossessNode" ActionTag="1897410517" Tag="188" IconVisible="True" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="PossessBg" ActionTag="-1104642927" Tag="190" IconVisible="False" LeftMargin="5.0003" RightMargin="-215.0003" TopMargin="-84.0005" BottomMargin="-3.9995" Scale9Enable="True" LeftEage="79" RightEage="79" TopEage="35" BottomEage="27" Scale9OriginX="79" Scale9OriginY="35" Scale9Width="52" Scale9Height="26" ctype="ImageViewObjectData">
                    <Size X="210.0000" Y="88.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="110.0003" Y="40.0005" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="Normal" Path="ui/03_01_Shop/frame_213.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="PossessText_TT" ActionTag="756069562" Tag="191" IconVisible="False" LeftMargin="78.5000" RightMargin="-141.5000" TopMargin="-54.0000" BottomMargin="28.0000" FontSize="20" LabelText="已拥有" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="63.0000" Y="26.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="110.0000" Y="41.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="216" G="213" B="244" />
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
            <Position X="9.0000" Y="12.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.0378" Y="0.0432" />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>