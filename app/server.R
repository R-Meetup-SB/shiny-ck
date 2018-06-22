shinyServer(function(input, output) {
   
  output$map <- renderLeaflet({
    m <- leaflet() %>%
      addTiles() %>%  # Add default OpenStreetMap map tiles
      addMarkers(lng=174.768, lat=-36.852, popup="The birthplace of R")
    m 
  })
  
  output$ts <- renderLeaflet({
    
    lungDeaths <- cbind(mdeaths, fdeaths)
    dygraph(lungDeaths) 
    
  })
  

  
})
