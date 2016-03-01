#Final Project group FB7
#Visualization for number of deaths per year

#top_deaths <- read.csv('data/Top_Ten_US_Causes_Of_Death.csv')

build_map <- function(data, year, cause){
  map_title <- paste("Distribution of deaths in", year, "caused by", cause)
  #new_data <- data %>% 
                #filter(YEAR == year, CAUSE_NAME == cause, STATE, DEATHS)

  # give state boundaries a white border
  l <- list(color = toRGB("white"), width = 2)
  
  # specify some map projection/options
  g <- list(
    scope = 'usa',
    projection = list(type = 'albers usa'),
    showlakes = TRUE,
    lakecolor = toRGB('white')
  )
  
  
  plot_ly(data, z = cause, type = 'choropleth', locations = STATE,
          locationmode = 'USA-states', color = cause,
          marker = list(line = l)) %>% 
            layout(title = map_title, geo = g) %>% 
              return()
}
