shinyServer(function(input, output) {
   
  output$map <- renderLeaflet({
    
    pop <- paste(
      paste("<Watershed:</strong>", sites$Watershed),
      paste("<strong>Creek:</strong>", sites$`Creek or Stream`),
      paste("<strong>Site Name:</strong>", sites$`Site Name`),
      paste("<strong>Site Name:</strong>", sites$`Site Code`),
      sep = "<br/>")
    
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
        options = layersControlOptions(collapsed = T))
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
  

})
