shinyServer(function(input, output) {
   
  output$map <- renderLeaflet({
    
    pop <- paste(
      paste("<Watershed:</strong>", sites$Watershed),
      paste("<strong>Creek:</strong>", sites$`Creek or Stream`),
      paste("<strong>Site Name:</strong>", sites$`Site Name`),
      paste("<strong>Site Name:</strong>", sites$`Site Code`),
      sep = "<br/>")
    
    ll = paste(
      paste("<strong>Name:</strong>", huc$Name),
      paste("<strong>HUC12:</strong>", huc$HUC12),
      sep = "<br/>"
    )
    
    m <- leaflet(sites) %>%
      addProviderTiles(providers$CartoDB.Positron, group = "Base") %>%
      addProviderTiles(providers$Esri.WorldImagery, group = "Imagery") %>%
      addProviderTiles(providers$Esri.NatGeoWorldMap , group = "Terrain") %>%
      
      addScaleBar("bottomleft") %>%
      addMiniMap(tiles = providers$OpenStreetMap.BlackAndWhite,
                 toggleDisplay = TRUE) %>%
      addMeasure(
        position = "bottomleft",
        primaryLengthUnit = "feet",
        primaryAreaUnit = "sqmiles",
        activeColor = "red",
        completedColor = "green") %>% 
      addMarkers(
        data = sites, lng = ~lon, lat = ~lat, popup = pop) %>% 
      addLayersControl(
        baseGroups = c("Base", "Imagery", "Terrain"),
        overlayGroups = "HUC12",
        options = layersControlOptions(collapsed = T)) %>% 
      addPolygons(
        data = huc,   fillColor = "lightblue",
        color = "black",
        stroke = TRUE,
        weight = 4,
        opacity = 1,
        fillOpacity = .5,
        smoothFactor = 0.7,
        popup = ll,
        group = "HUC12",
        highlight = highlightOptions(
          weight = 5,
          color = "darkred",
          fillOpacity = 0.7,
          bringToFront = TRUE))
    m
    
  })
  
  output$ts <- renderLeaflet({
  
      
    d <- raw$Chemistry %>%
      filter(
        StationID == input$sel_site,
        ParameterCode == input$sel_parameter) %>%
      select(SampleDate, Result)
    
    x <- xts(d$Result, order.by = d$SampleDate)
    
    dygraph(x, main = glue("{input$sel_site}: {input$sel_parameter}"))
    
  })
  
  #obser
  

})
