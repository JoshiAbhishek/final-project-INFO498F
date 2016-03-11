library(dplyr)
library(plotly)

chart <- function(df, state1, state2, year) {
  df <- df %>% select(YEAR, CAUSE_NAME, STATE, DEATHS)
  names(df) <- c("Year", "Cause", "State", "Deaths")

  tmp1 <- df %>%
    filter(State == state1 & Year == year) %>%
    select(Cause, Deaths)
  
  tmp2 <- df %>%
    filter(State == state2 & Year == year) %>%
    select(Deaths)
  
  tmp1$Deaths2 <- tmp2$Deaths
  
  plot_ly(tmp1, 
          name = state1,
          type = 'bar', 
          x = Deaths,
          y = Cause, 
          orientation = 'h') %>%
    add_trace(tmp1,
              name = state2,
              type = 'bar',
              x = Deaths2,
              y = Cause,
              orientation = 'h') %>%
    layout(margins = list(l = 375),
           xaxis = list(),
           yaxis = list()) %>%
  return()
}
