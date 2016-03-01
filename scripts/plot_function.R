# Creates a function that returns a line plot of given data

setwd('~/Documents/INFO498F/final-project-INFO498F')

top_deaths <- read.csv('data/Top_Ten_US_Causes_Of_Death.csv')

make_line_plot <- function(df, cause, location) {
  title_plot <- paste0("Number of Deaths by ", cause, " from 1999-2013 in ", location)
  df_filtered <- filter(df, CAUSE_NAME == cause, STATE == location)
  p <- plot_ly(df_filtered, x = YEAR, y = DEATHS, name = "Number of Deaths") %>%
  layout(title = title_plot)
  
  return(p)
}