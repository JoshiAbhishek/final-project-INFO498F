# Creates functions that return a line plots of given data
# setwd('~/Documents/INFO498F/final-project-INFO498F')

# top_deaths <- read.csv('data/Top_Ten_US_Causes_Of_Death.csv')

# Line plot for number of deaths per cause by year and location
make_line_plot <- function(df, cause, location) {
  title_plot <- paste0("Number of Deaths by ", cause, " from 1999-2013 in ", location)
  df_filtered <- filter(df, CAUSE_NAME == cause, STATE == location)
  p <- plot_ly(df_filtered, x = YEAR, y = DEATHS) %>%
  layout(title = title_plot, yaxis = list(title = "Number of Deaths")) 
  return(p)
}

# Age adjusted death rates for the U.S. plot function
make_age_adjusted_plot <- function(df, cause, location) {
  title_plot <- paste0("Age-Adjusted Death Rates for ", cause, ": ", location, " (1999-2013)")
  df_filtered <- filter(df, CAUSE_NAME == cause, STATE == location)
  p <- plot_ly(df_filtered, x = YEAR, y = AADR, color = 'orange') %>%
    layout(title = title_plot, yaxis = list(title = "Rate per 100,000 U.S. standard population")) 
  return(p)  
}
