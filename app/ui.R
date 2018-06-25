library(leaflet)

shinyUI(fluidPage(
  titlePanel("Santa Barbara Channel Keeper - Water Quality Monitoring Data"),
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
