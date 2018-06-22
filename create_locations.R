
data = readxl::read_xlsx("/Users/mikejohnson/Desktop/hackathon_20180621.xlsx", sheet = 4)

sites = data$`Geographic Coordinates (Decimal Degrees)`

locs = matrix(unlist(strsplit(sites, ",")), ncol = 2, byrow = T)

locs = data.frame(lat = as.numeric(locs[,2]), lon = as.numeric(locs[,1]))


locs[51,2] = -119.2993
locs[37,2] = -119.2941


data$lat = locs$lat
data$lon = locs$lon

data = data[,-c(5)]

save(data, file = "/Users/mikejohnson/Documents/GitHub/shiny-ck/data/locations.rda")
