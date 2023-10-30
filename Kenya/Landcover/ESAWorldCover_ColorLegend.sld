<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" version="1.0.0" xmlns:ogc="http://www.opengis.net/ogc" xmlns:gml="http://www.opengis.net/gml" xmlns:sld="http://www.opengis.net/sld">
  <UserLayer>
    <sld:LayerFeatureConstraints>
      <sld:FeatureTypeConstraint/>
    </sld:LayerFeatureConstraints>
    <sld:UserStyle>
      <sld:Name>worldcover100m</sld:Name>
      <sld:FeatureTypeStyle>
        <sld:Rule>
          <sld:RasterSymbolizer>
            <sld:ChannelSelection>
              <sld:GrayChannel>
                <sld:SourceChannelName>1</sld:SourceChannelName>
              </sld:GrayChannel>
            </sld:ChannelSelection>
            <sld:ColorMap type="values">
              <sld:ColorMapEntry label="Tree cover" quantity="10" color="#006400"/>
              <sld:ColorMapEntry label="Shrubland" quantity="20" color="#ffbb22"/>
              <sld:ColorMapEntry label="Grassland" quantity="30" color="#ffff4c"/>
              <sld:ColorMapEntry label="Cropland" quantity="40" color="#f096ff"/>
              <sld:ColorMapEntry label="Built-up" quantity="50" color="#fa0000"/>
              <sld:ColorMapEntry label="Bare / sparse vegetation" quantity="60" color="#b4b4b4"/>
              <sld:ColorMapEntry label="Snow and ice" quantity="70" color="#f0f0f0"/>
              <sld:ColorMapEntry label="Permanent water bodies" quantity="80" color="#0064c8"/>
              <sld:ColorMapEntry label="Herbaceous wetland" quantity="90" color="#0096a0"/>
              <sld:ColorMapEntry label="Mangroves" quantity="95" color="#00cf75"/>
              <sld:ColorMapEntry label="Moss and lichen" quantity="100" color="#fae6a0"/>
            </sld:ColorMap>
          </sld:RasterSymbolizer>
        </sld:Rule>
      </sld:FeatureTypeStyle>
    </sld:UserStyle>
  </UserLayer>
</StyledLayerDescriptor>
