library(leaflet)

shinyUI(fluidPage(
  titlePanel("Old Faithful Geyser Data"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "sel_site",
        "Site",
        unique(raw$Chemistry$StationID)),
      selectInput(
        "sel_parameter",
        "Parameter",
        unique(raw$Chemistry$ParameterCode))),
    mainPanel(
      dygraphOutput("ts"), 
      p(),
      leafletOutput("map")
    ))
))
