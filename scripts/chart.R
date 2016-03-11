library(dplyr)
library(plotly)

chart <- function(df) {
  df <- df %>% select(YEAR, CAUSE_NAME, STATE, DEATHS)
  names(df) <- c("Year", "Cause", "State", "Deaths")
  
  
  
  #plot_ly(df, type = 'bar', x =, y =, orientation = 'h') %>%
  #  layout() %>%
  return(NULL)
}