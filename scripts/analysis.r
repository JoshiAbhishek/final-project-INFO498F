library("dplyr")

analysis <- function(dataset) {

  data <- dataset
  
  #data <- read.csv("C:/Users/Abhishek/Documents/GitHub/final-project-INFO498F/data/Top_Ten_US_Causes_Of_Death.csv")
  
  data[,5] <- as.numeric(as.character(data[,5]))
  
  #Gets Causes of Death
  unique_causes_of_death <- data %>% distinct(CAUSE_NAME) %>% select(CAUSE_NAME)
  print(unique_causes_of_death)
  
  #Questions: 
  
  #What have been the leading causes of death in order from 1999 to 2013?
  
  death_causes_grouped_by_year <- data %>% group_by(YEAR) 
  print(death_causes_grouped_by_year)
  
  death_causes_by_name_by_year <- death_causes_grouped_by_year %>% group_by(CAUSE_NAME)
  print(year_grouped_death_causes)
  
  total_sum_by_death_cause <- death_causes_by_name_by_year %>% filter(STATE == 'United States') %>% select(DEATHS) %>% filter(CAUSE_NAME != 'All Causes')
  print(total_sum_by_death_cause)
  
  #What causes of death have grown the most in the past 14 years from 1999 to 2013?
  
  deaths_filtered <- data %>% filter(STATE == 'United States') %>% select(YEAR, CAUSE_NAME, DEATHS) %>% filter(CAUSE_NAME != 'All Causes')
  print(deaths_filtered)
  
  deaths_1999 <- deaths_filtered %>% filter(YEAR == '1999') %>% select(YEAR, CAUSE_NAME, DEATHS)
  print(deaths_1999)
  
  deaths_2013 <- deaths_filtered %>% filter(YEAR == '2013') %>% select(YEAR, CAUSE_NAME, DEATHS)
  print(deaths_2013)

  #deaths_filtered_1999_2013 <- deaths_filtered %>% filter(YEAR == '1999' | YEAR == '2013')
  #print(deaths_filtered_1999_2013)

  deaths_2013 <- mutate(deaths_2013, Diff = deaths_2013$DEATHS - deaths_1999$DEATHS)
  
  deaths_diff_2013_1999 <- deaths_2013 <- deaths_2013 %>% select(CAUSE_NAME, Diff)
  print(deaths_diff_2013_1999)
  
  max_death_cause_growth <- deaths_diff_2013_1999 %>% filter(Diff == max(Diff))
  print(max_death_cause_growth)
  
  #What causes of death have declined the most in the past 14 years from 1999 to 2013?
  
  min_death_cause_growth <- deaths_diff_2013_1999 %>% filter(Diff == min(Diff))
  print(min_death_cause_growth)
  
  #What is the proportional relation between causes of death most recently? How has it changed in the past 14 years from 1999 to 2013?
  
  Deaths_Filtered <- function() {
    return(deaths_filtered)
  }
  
  Death_Cause_Totals <- function() {
    return (total_sum_by_death_cause)
  }
  
  Diff_2013_1999 <- function() {
    return(deaths_diff_2013_1999)
  }
  
  Max_Cause_Growth <- function() {
    return(max_death_cause_growth)
  }
  
  Min_Cause_Growth <- function() {
    return(min_death_cause_growth)
  }
  
}

Build_Yearly_Deaths_Chart <- function(data, year) {
  deaths_filtered <- data %>% filter(STATE == 'United States') %>% select(YEAR, CAUSE_NAME, DEATHS) %>% filter(CAUSE_NAME != 'All Causes')
  
  new_data <- deaths_filtered %>% filter(YEAR == year)
  
  plot_ly(new_data, labels = CAUSE_NAME, values = DEATHS, type = "pie") %>%
    layout(title = "Deaths By Cause Name") %>%
    return()
}
