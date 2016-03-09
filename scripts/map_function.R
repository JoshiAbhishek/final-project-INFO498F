#Final Project group FB7
#Visualization for number of deaths per year

#top_deaths <- read.csv('data/Top_Ten_US_Causes_Of_Death.csv')

build_map <- function(data, year, cause) {
  map_title <- paste("Distribution of deaths in", year, "caused by", cause)
  
  new_data <- data %>% 
                filter(YEAR == year, CAUSE_NAME == cause)
  #add new column with state abbreviations to use for the map
  new_data$code <- state.abb[match(new_data$STATE,state.name)]
  
  # Removes the rows with NA in it
  new_data <- new_data[complete.cases(new_data),]
  new_data <- new_data[new_data$DEATHS != "x",]
  
  # give state boundaries a white border
  l <- list(color = toRGB("white"), width = 2)

  # specify some map projection/options
  g <- list(
    bgcolor = "#f8f8ff",
    scope = 'usa',
    projection = list(type = 'albers usa')
  )
  
  
  plot_ly(new_data, z = DEATHS, text = paste("There were", DEATHS, "total deaths in", STATE), 
          type = 'choropleth', locations = code, 
          locationmode = 'USA-states', color = "Set3",
          marker = list(line = l), colorbar = list(title = "Number of Deaths")) %>% 
            layout(title = map_title, geo = g) %>% 
              return()
}
