library(leaflet)


load("/Users/mikejohnson/Documents/GitHub/shiny-ck/data/huc12.rda")
load("/Users/mikejohnson/Documents/GitHub/shiny-ck/data/locations.rda")


pop <- paste(
  paste("<strong>Watershed:</strong>", data$Watershed),
  paste("<strong>Creek:</strong>", data$`Creek or Stream`),
  paste("<strong>Site Name:</strong>", data$`Site Name`),
  paste("<strong>Site Name:</strong>", data$`Site Code`),
  sep = "<br/>"
)

ll = paste(
  paste("<strong>Name:</strong>", huc$Name),
  paste("<strong>HUC12:</strong>", huc$HUC12),
  sep = "<br/>"
)

m = leaflet() %>%
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
    completedColor = "green"
  )  %>% addMarkers(data = data, lng = data$lon, lat = data$lat, popup = pop ) %>% 
  addPolygons(   data = huc,   fillColor = "lightblue",
                    color = "black",
                    stroke = TRUE,
                    weight = 4,
                    opacity = 1,
                    fillOpacity = .5,
                    smoothFactor = 0.7,
                    popup = ll,
                    group = "WBD",
                    highlight = highlightOptions(
                      weight = 5,
                      color = "darkred",
                      fillOpacity = 0.7,
                      bringToFront = TRUE
                    )) %>% 
  
  addLayersControl(
    baseGroups = c("Base", "Imagery", "Terrain"),
    options = layersControlOptions(collapsed = T)
  )  

m


