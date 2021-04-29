
############ animated line #############


library(ggplot2)
library(scales)
library(readr)
library(htmltools)

current_fire <- read_csv("data/yearAcresFsenFour.csv")

# plotly

library(plotly)

accumulate_by <- function(dat, var) {
  var <- lazyeval::f_eval(var, dat)
  lvls <- plotly:::getLevels(var)
  dats <- lapply(seq_along(lvls), function(x) {
    cbind(dat[var %in% lvls[seq(1, x)], ], frame = lvls[[x]])
  })
  dplyr::bind_rows(dats)
}

# slow down-NOT
# change text in button
# move title down

df <- current_fire 

fig <- df %>% accumulate_by(~Year)


fig <- fig %>%
  plot_ly(
    x = ~Year, 
    y = ~Acres,
    split= ~Exchange,
    frame = ~frame, 
    type = 'scatter',
    mode = 'lines', 
    line = list(simplyfy = F)
  )
fig <- fig %>% layout(
  xaxis = list(
    title = "Year",
    zeroline = F
  ),
  yaxis = list(
    title = "Acres",
    zeroline = F
  )
) 
fig <- fig %>% animation_opts(
  frame = 100, 
  transition = 0, 
  redraw = FALSE
)
fig <- fig %>% animation_slider(
  hide = T
)
fig <- fig %>% animation_button(
  x = 0.1, xanchor = "left", y = 1.0, yanchor = "top"
)
fig <- fig %>% layout(legend = list(x = 0.1, y = 0.8))

fig <- fig %>% layout(title = 'Wildfire through time (1984-2019)')

fig

# change text in button
# move title down (change margins)

m <- list(
  l = 50,
  r = 50,
  b = 100,
  t = 100,
  pad = 4
)

df <- current_fire 

fig <- df %>% accumulate_by(~Year)


fig <- fig %>%
  plot_ly(
    x = ~Year, 
    y = ~Acres,
    split= ~Exchange,
    frame = ~frame, 
    type = 'scatter',
    mode = 'lines', 
    line = list(simplyfy = F)
  )
fig <- fig %>% layout(
  xaxis = list(
    title = "Year",
    zeroline = F
  ),
  yaxis = list(
    title = "Acres",
    zeroline = F
  )
) 
fig <- fig %>% animation_opts(
  frame = 100, 
  transition = 0, 
  redraw = FALSE
)
fig <- fig %>% animation_slider(
  hide = T
)
fig <- fig %>% animation_button(
  x = 0.1, xanchor = "left", y = 1.0, yanchor = "top", label = "Click here to see the data"
)
fig <- fig %>% layout(legend = list(x = 0.1, y = 0.8))

fig <- fig %>% layout(title = 'Wildfire through time (1984-2019)')

fig <- fig %>% layout(autosize = T, margin = m)

fig
