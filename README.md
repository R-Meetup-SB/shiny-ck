# shiny-ck
Shiny app for Channel Keeper

## TODO

- [x] add basic leaflet map
- [x] add basic dygraph timeseries plot
- [ ] use [shinydashboard](http://rstudio.github.io/shinydashboard/)
  - [ ] make tabs of Map & Timeseries
- [ ] expand Parameter drop-down with headings by Excel tab (ie Chemistry, Bacteria, Nutrients)
- [ ] color [leaflet markers on map](http://rstudio.github.io/leaflet/markers.html) based on number of times in exceedence of threshold in red scale, otherwise green
  - [ ] limit colorized map based on time window of dygraph time series plot and/or include [dateRangeInput]( https://shiny.rstudio.com/gallery/date-and-date-range.html)
- embed / link app at https://www.sbck.org (eg with [iframe](https://community.rstudio.com/t/iframe-shiny-apps-to-wordpress/962))

## Map of Sites

* [Leaflet for R - Introduction](http://rstudio.github.io/leaflet/)
![](./leaflet_markers.png)

## Time Series of Variables

* [dygraphs for R](https://rstudio.github.io/dygraphs/index.html)
* [ggplot2 Graphing Library | Plotly](https://plot.ly/ggplot2/)

![](./dygraph-threshold.png)

### Horizontal Exceedences

- hi N (better than P), hi P, **lo DO** (fish killer), hi Ph

## Make it Shiny

Start with Rmarkdown output, link map to time series with Shiny.
