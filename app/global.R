# libraries
library(tidyverse)
library(shiny)
library(leaflet)
library(dygraphs)
library(xts)
library(here)
library(readxl)
library(sf)
library(sp)
library(glue)

# paths
raw_xls  <- "data/hackathon_20180621.xlsx"
locs_rds <- "data/locations.rda"
huc_rda  <- "data/huc12.rda"

# get raw spreadsheet data
raw <- map(excel_sheets(raw_xls), ~ read_excel(raw_xls, .x), .id=.x)
names(raw) <- excel_sheets(raw_xls)

# get location data
sites = raw$SiteList %>%
  separate(
    `Geographic Coordinates (Decimal Degrees)`, 
    c("lon", "lat"), sep = ", ", convert = T)

# clean up sites
sites[51, "lon"] = -119.2993
sites[37, "lon"] = -119.2941

# watersheds
load(huc_rda)
#huc <- read_rds(huc_rds)
#plot(huc)
