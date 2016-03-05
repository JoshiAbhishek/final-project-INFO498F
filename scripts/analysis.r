library("dplyr")

#Questions:

#What have been the leading causes of death in order from 1999 to 2013?
#What causes of death have grown the most in the past 14 years from 1999 to 2013?
#What causes of death have declined the most in the past 14 years from 1999 to 2013?
#What is the proportional relation between causes of death most recently? How has it changed in the past 14 years from 1999 to 2013

#Returns the unique causes of death names
Unique_Death_Causes <- function(data) {
  unique_causes_of_death <-
    data %>% distinct(CAUSE_NAME) %>% select(CAUSE_NAME)
  
  return(unique_causes_of_death)
}

#Returns the total number of deaths caused from 1999 to 2013, by the cause of death
Death_Cause_Totals <- function(data) {
  data[,5] <- as.numeric(as.character(data[,5]))
  
  death_causes_grouped_by_year <- data %>% group_by(YEAR)
  
  death_causes_by_name_by_year <-
    death_causes_grouped_by_year %>% group_by(CAUSE_NAME)
  
  total_sum_by_death_cause <-
    death_causes_by_name_by_year %>% filter(STATE == 'United States') %>%
    select(DEATHS) %>% filter(CAUSE_NAME != 'All Causes')
  
  return (total_sum_by_death_cause)
}


#Returns the difference in death totals from 1999 to 2013 by cause of death
Diff_2013_1999 <- function() {
  data[,5] <- as.numeric(as.character(data[,5]))
  
  deaths_filtered <-
    data %>% filter(STATE == 'United States') %>%
    select(YEAR, CAUSE_NAME, DEATHS) %>% filter(CAUSE_NAME != 'All Causes')
  
  deaths_1999 <-
    deaths_filtered %>% filter(YEAR == '1999') %>% select(YEAR, CAUSE_NAME, DEATHS)
  
  deaths_2013 <-
    deaths_filtered %>% filter(YEAR == '2013') %>% select(YEAR, CAUSE_NAME, DEATHS)
  
  deaths_2013 <-
    mutate(deaths_2013, Diff = deaths_2013$DEATHS - deaths_1999$DEATHS)
  
  deaths_diff_2013_1999 <-
    deaths_2013 <- deaths_2013 %>% select(CAUSE_NAME, Diff)
  
  return(deaths_diff_2013_1999)
}

#Returns the cause of death with the maximum growth from 1999 to 2013
Max_Cause_Growth <- function(data) {
  data[,5] <- as.numeric(as.character(data[,5]))
  
  deaths_filtered <-
    data %>% filter(STATE == 'United States') %>%
    select(YEAR, CAUSE_NAME, DEATHS) %>% filter(CAUSE_NAME != 'All Causes')
  
  deaths_1999 <-
    deaths_filtered %>% filter(YEAR == '1999') %>% select(YEAR, CAUSE_NAME, DEATHS)
  
  deaths_2013 <-
    deaths_filtered %>% filter(YEAR == '2013') %>% select(YEAR, CAUSE_NAME, DEATHS)
  
  deaths_2013 <-
    mutate(deaths_2013, Diff = deaths_2013$DEATHS - deaths_1999$DEATHS)
  
  deaths_diff_2013_1999 <-
    deaths_2013 <- deaths_2013 %>% select(CAUSE_NAME, Diff)
  
  max_death_cause_growth <-
    deaths_diff_2013_1999 %>% filter(Diff == max(Diff)) %>% select(CAUSE_NAME, Diff)
  
  return(max_death_cause_growth)
}

#Returns the cause of death with the minimum growth from 1999 to 2013
Min_Cause_Growth <- function() {
  data[,5] <- as.numeric(as.character(data[,5]))
  
  deaths_filtered <-
    data %>% filter(STATE == 'United States') %>%
    select(YEAR, CAUSE_NAME, DEATHS) %>% filter(CAUSE_NAME != 'All Causes')
  
  deaths_1999 <-
    deaths_filtered %>% filter(YEAR == '1999') %>% select(YEAR, CAUSE_NAME, DEATHS)
  
  deaths_2013 <-
    deaths_filtered %>% filter(YEAR == '2013') %>% select(YEAR, CAUSE_NAME, DEATHS)
  
  deaths_2013 <-
    mutate(deaths_2013, Diff = deaths_2013$DEATHS - deaths_1999$DEATHS)
  
  deaths_diff_2013_1999 <-
    deaths_2013 <- deaths_2013 %>% select(CAUSE_NAME, Diff)
  
  min_death_cause_growth <-
    deaths_diff_2013_1999 %>% filter(Diff == min(Diff))
  
  return(min_death_cause_growth)
}

#Returns the data, filtered by the country being the United States and the cause of death being everything but "All Causes"
Deaths_Filtered <- function(data) {
  data[,5] <- as.numeric(as.character(data[,5]))
  
  deaths_filtered <-
    data %>% filter(STATE == 'United States') %>%
    select(YEAR, CAUSE_NAME, DEATHS) %>% filter(CAUSE_NAME != 'All Causes')
  
  return(deaths_filtered)
}

#Returns a pie chart showing the proportional deaths by cause of death for the given year
Build_Yearly_Deaths_Chart <- function(data, year) {
  deaths_filtered <-
    data %>% filter(STATE == 'United States') %>%
    select(YEAR, CAUSE_NAME, DEATHS) %>% filter(CAUSE_NAME != 'All Causes')
  
  new_data <- deaths_filtered %>% filter(YEAR == year)
  
  plot_ly(new_data, labels = CAUSE_NAME, values = DEATHS, type = "pie", hole = ".5", showLegend = "T") %>%
    layout(title = "Deaths By Cause Name") %>%
    return()
}


Build_Total_Death_Chart <-function(data) {
  data[,5] <- as.numeric(as.character(data[,5]))
  
  death_causes_grouped_by_year <- data %>% group_by(YEAR)
  
  death_causes_by_name_by_year <-
    death_causes_grouped_by_year %>% group_by(CAUSE_NAME)
  
  total_sum_by_death_cause <-
    death_causes_by_name_by_year %>% filter(STATE == 'United States') %>%
    select(DEATHS) %>% filter(CAUSE_NAME != 'All Causes')
  
  plot_ly(total_sum_by_death_cause, x = CAUSE_NAME, y = DEATHS, type = "bar") %>%
    layout(title = "Total Deaths (1999-2013) By Cause") %>%
    return()
}

Build_Deaths_By_Year_Bar_Chart <- function(data, year) {
  deaths_filtered <-
    data %>% filter(STATE == 'United States') %>%
    select(YEAR, CAUSE_NAME, DEATHS) %>% filter(CAUSE_NAME != 'All Causes')
  
  new_data <- deaths_filtered %>% filter(YEAR == year)
  
  plot_ly(new_data, x = CAUSE_NAME, y = DEATHS, type = "bar", marker = list(color = toRGB("orange"))) %>%
    layout(title = "Total Deaths By Cause") %>%
    return()
}