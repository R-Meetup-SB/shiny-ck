# shiny-ck

Shiny app for [Santa Barbara Channel Keeper Water Quality Monitoring Data](https://www.sbck.org/current-issues/water-quality-monitoring/download-our-data/)

## TODO

- [x] add basic leaflet map
- [x] add basic dygraph timeseries plot
- [ ] use [shinydashboard](http://rstudio.github.io/shinydashboard/)
  - [ ] make tabs of Map & Timeseries
- [ ] expand Parameter drop-down with headings by Excel tab (ie Chemistry, Bacteria, Nutrients)
- [ ] add exceedences (based on CentralCoastStandards, LABasinStandards tabs in xlsx) to dygraph using [dyLimit()](https://rstudio.github.io/dygraphs/gallery-event-lines.html)
- [ ] color [leaflet markers on map](http://rstudio.github.io/leaflet/markers.html) based on number of times in exceedence of threshold in red scale, otherwise green
  - [ ] limit colorized map based on time window of dygraph time series plot and/or include [dateRangeInput]( https://shiny.rstudio.com/gallery/date-and-date-range.html)
- [ ] add other relevant data layers (be sure to Sign In at [SBC Atlas](https://sbcblueprint.databasin.org/) to un-gray Download... button), eg:
  * [Agricultural "Areas of Importance" (EEMS b09) | SBC Atlas](https://sbcblueprint.databasin.org/datasets/807abc2dc06a49b88e815751ffa8a75a) 
  * [Streams and Rivers | SBC Atlas](https://sbcblueprint.databasin.org/datasets/3aacd7ea3d16481bae9e88335001a707)
  * [CalEnviroScreen 3.0, Pollution Burden, Percentile, 2017 | SBC Atlas](https://sbcblueprint.databasin.org/datasets/77b443653446408fbe31aa9e86b6948d)
  * [Major Rivers and Creeks | SBC Atlas](https://sbcblueprint.databasin.org/datasets/1efc53d363cf46319abe6ab5ea31cc00)
- [ ] embed / link app at https://www.sbck.org (eg with [iframe](https://community.rstudio.com/t/iframe-shiny-apps-to-wordpress/962))

Current status:

  [https://bdbest.shinyapps.io/sbck/](https://bdbest.shinyapps.io/sbck/)<br>
  [![](./images/sbck-app_2018-06-25.png)](https://bdbest.shinyapps.io/sbck/)

## Map of Sites

* [Leaflet for R - Introduction](http://rstudio.github.io/leaflet/)
![](./images/leaflet_markers.png)

## Time Series of Variables

* [dygraphs for R](https://rstudio.github.io/dygraphs/index.html)
* [ggplot2 Graphing Library | Plotly](https://plot.ly/ggplot2/)

![](./images/dygraph-threshold.png)

### Horizontal Exceedences

- hi N (better than P), hi P, **lo DO** (fish killer), hi Ph

## Make it Shiny

Start with Rmarkdown output, link map to time series with Shiny.
