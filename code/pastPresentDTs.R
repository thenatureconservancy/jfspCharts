############ Past Present ###############

# libraries

library (DT)
library(htmlwidgets)
library(readr)
library(dplyr)


# read data
caPastPresent <- read_csv("data/caPastPresent.csv")
gbPastPresent <- read_csv("data/gbPastPresent.csv")
nwPastPresent <- read.csv("data/nwPastPresent.csv")
srPastPresent <- read_csv("data/srPastPresent.csv")
swPastPresent <- read_csv("data/swPastPresent.csv")

# make and save the tables
# california
caDT <-
  datatable(caPastPresent,
            filter = 'top',
            options = list(
              pageLength = 10,
              autoWidth = TRUE)) %>%
  formatCurrency('Acres',currency = "", 
                 interval = 3, 
                 mark = ",",
                 "digits" = 0)
caDT
htmlwidgets::saveWidget(caDT, "./charts/caPastPresentDT.html")

# great basin
gbDT <-
  datatable(gbPastPresent,
            filter = 'top',
            options = list(
              pageLength = 10,
              autoWidth = TRUE)) %>%
  formatCurrency('Acres',currency = "", 
                 interval = 3, 
                 mark = ",",
                 "digits" = 0)
gbDT
htmlwidgets::saveWidget(gbDT, "./charts/gbPastPresentDT.html")

# northwest
nwDT <-
  datatable(nwPastPresent,
            filter = 'top',
            options = list(
              pageLength = 10,
              autoWidth = TRUE)) %>%
  formatCurrency('Acres',currency = "", 
                 interval = 3, 
                 mark = ",",
                 "digits" = 0)
nwDT
htmlwidgets::saveWidget(nwDT, "./charts/nwPastPresentDT.html")

#southern rockies

srDT <-
  datatable(srPastPresent,
            filter = 'top',
            options = list(
              pageLength = 10,
              autoWidth = TRUE)) %>%
  formatCurrency('Acres',currency = "", 
                 interval = 3, 
                 mark = ",",
                 "digits" = 0)
srDT
htmlwidgets::saveWidget(srDT, "./charts/srPastPresentDT.html")


# southwestern

swDT <-
  datatable(swPastPresent,
            filter = 'top',
            options = list(
              pageLength = 10,
              autoWidth = TRUE)) %>%
  formatCurrency('Acres',currency = "", 
                 interval = 3, 
                 mark = ",",
                 "digits" = 0)
swDT
htmlwidgets::saveWidget(swDT, "./charts/swPastPresentDT.html")
