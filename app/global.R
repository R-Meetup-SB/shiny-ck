library(shiny)
library(leaflet)
library(dygraphs)
library(here)
library(readxl)


xls <- here("data/hackathon_20180621.xlsx")

read_excel(xls)
excel_sheets(xls)
