library(leaflet)

data = readxl::read_xlsx("./shiny-ck/data/hackathon_20180621.xlsx", sheet = 4)

pop <- paste(
  paste("<Watershed:</strong>", data$Watershed),
  paste("<strong>Creek:</strong>", data$`Creek or Stream`),
  paste("<strong>Site Name:</strong>", data$`Site Name`),
  paste("<strong>Site Name:</strong>", data$`Site Code`),
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
  )  %>% addMarkers(data = locs, lng = locs$lon, lat = locs$lat, popup = pop ) %>% addLayersControl(
    baseGroups = c("Base", "Imagery", "Terrain"),
    options = layersControlOptions(collapsed = T)
  )


