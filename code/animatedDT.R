### data table for animated chart ###

library (DT)
library(htmlwidgets)
library(readr)
library(dplyr)
acresYearsFsen <- read_csv("data/acresYearsFsen.csv")

animatedDT <-
datatable(acresYearsFsen,
          filter = 'top',
          options = list(
            pageLength = 10,
            autoWidth = TRUE)) %>%
          formatCurrency('Acres',currency = "", 
                         interval = 3, 
                         mark = ",",
                         "digits" = 0)

animatedDT
          

htmlwidgets::saveWidget(animatedDT, "./charts/year_exchange_acresDT.html")
