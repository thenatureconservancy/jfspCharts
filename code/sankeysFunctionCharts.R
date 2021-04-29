

#### sankey as a function #####

# libraries
library(networkD3)
library(dplyr)
library(readr)
library(htmlwidgets)
library(htmltools)

# make function

sankey <- function(x) {
  
  nodes <- data.frame(
    name=c(as.character(snkyPdata$source), 
           as.character(snkyPdata$target)) %>% 
      unique())
  
  # add source and target fields
  snkyPdata$IDsource <- match(snkyPdata$source, nodes$name)-1 
  snkyPdata$IDtarget <- match(snkyPdata$target, nodes$name)-1
  
  # Make the Network
  snkyCA <- sankeyNetwork(Links = snkyPdata, 
                          Nodes = nodes,
                          Source = "IDsource", 
                          Target = "IDtarget",
                          Value = "value", 
                          NodeID = "name", 
                          width = 1700,
                          height = 750, 
                          fontSize=18,
                          iterations = 0,
                          sinksRight=FALSE)
  
}


##  List of exchanges to plot  California, Northwest, Southern Rockies, Southwest, Great Basin

# CALIFORNIA

snkyPdata <- read_csv("data/fsen_bps_evt.csv") %>%
      filter (exchange == "California")

# make plots and save

caSnky <- sankey(snkyPdata)
caSnky
saveNetwork(caSnky, "./charts/caSnky.html", selfcontained = TRUE)

# try title and save
caSnkyTitle <- htmlwidgets::prependContent(caSnky, htmltools::tags$h1("California"))
saveNetwork(caSnkyTitle, "./charts/caSnkyTitle.html", selfcontained = TRUE)

# NORTHWEST
snkyPdata <- read_csv("data/fsen_bps_evt.csv") %>%
  filter (exchange == "Northwest")

# make plots and save

nwSnky <- sankey(snkyPdata)
nwSnky
saveNetwork(nwSnky, "./charts/nwSnky.html", selfcontained = TRUE)
# try title and save
nwSnkyTitle <- htmlwidgets::prependContent(nwSnky, htmltools::tags$h1("Northwest"))
saveNetwork(nwSnkyTitle, "./charts/nwSnkyTitle.html", selfcontained = TRUE)

# SOUTHERN ROCKIES

snkyPdata <- read_csv("data/fsen_bps_evt.csv") %>%
  filter (exchange == "Southern Rockies")

# make plots and save

srSnky <- sankey(snkyPdata)
srSnky
saveNetwork(srSnky, "./charts/srSnky.html", selfcontained = TRUE)

# try title and save
srSnkyTitle <- htmlwidgets::prependContent(srSnky, htmltools::tags$h1("Southern Rockies"))
saveNetwork(srSnkyTitle, "./charts/srSnkyTitle.html", selfcontained = TRUE)

# SOUTHWEST

snkyPdata <- read_csv("data/fsen_bps_evt.csv") %>%
  filter (exchange == "Southwest")

# make plots and save

swSnky <- sankey(snkyPdata)
swSnky
saveNetwork(swSnky, "./charts/swSnky.html", selfcontained = TRUE)


# try title and save
swSnkyTitle <- htmlwidgets::prependContent(swSnky, htmltools::tags$h1("Southwest"))
saveNetwork(swSnkyTitle, "./charts/swSnkyTitle.html", selfcontained = TRUE)

# GREAT BASIN


snkyPdata <- read_csv("data/fsen_bps_evt.csv") %>%
  filter (exchange == "Great Basin")

# make plots and save

gbSnky <- sankey(snkyPdata)
gbSnky
saveNetwork(gbSnky, "./charts/gbSnky.html", selfcontained = TRUE)


# try title and save
gbSnkyTitle <- htmlwidgets::prependContent(gbSnky, htmltools::tags$h1("Great Basin"))
saveNetwork(gbSnkyTitle, "./charts/gbSnkyTitle.html", selfcontained = TRUE)
