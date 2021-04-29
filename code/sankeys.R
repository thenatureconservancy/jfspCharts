

################# sankey diagram ##################

# load libraries

library(networkD3)
library(dplyr)
library(readr)
library(htmlwidgets)


## CALIFORNIA ##########################################


# read in snkyPdata
snkyPdataCA <- read_csv("data/bps2evtCA.csv")

# define nodes
nodesCA <- data.frame(
  name=c(as.character(snkyPdataCA$source), 
         as.character(snkyPdataCA$target)) %>% 
    unique())

# add source and target fields
snkyPdataCA$IDsource <- match(snkyPdataCA$source, nodesCA$name)-1 
snkyPdataCA$IDtarget <- match(snkyPdataCA$target, nodesCA$name)-1

# Make the Network
snkyCA <- sankeyNetwork(Links = snkyPdataCA, 
                       Nodes = nodesCA,
                       Source = "IDsource", 
                       Target = "IDtarget",
                       Value = "value", 
                       NodeID = "name", 
                       width = 1700,
                       height = 750, 
                       fontSize=18,
                       iterations = 0,
                       sinksRight=FALSE)

snkyCA


saveNetwork(snkyCA, "sankeyCA.html", selfcontained = TRUE)

