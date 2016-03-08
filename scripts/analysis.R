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
  
  death_causes <- data %>% filter(STATE == 'United States' & CAUSE_NAME != 'All Causes')
  
  death_totals_by_name <- death_causes %>% group_by(CAUSE_NAME) %>% summarise(Death_Sum = sum(DEATHS)) %>% arrange(Death_Sum)
  
  return (death_totals_by_name)
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
    deaths_2013 <- deaths_2013 %>% select(CAUSE_NAME, Diff) %>% arrange(Diff)
  
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

#Builds a bar chart of total deaths by cause name for 1999-2013
Build_Total_Death_Chart <-function(data) {
  data[,5] <- as.numeric(as.character(data[,5]))
  
  death_causes <- data %>% filter(STATE == 'United States' & CAUSE_NAME != 'All Causes')
  
  death_totals_by_name <- death_causes %>% group_by(CAUSE_NAME) %>% summarise(Death_Sum = sum(DEATHS))
  
  plot_ly(death_totals_by_name, x = CAUSE_NAME, y = Death_Sum, type = "bar") %>%
    layout(title = "Total Deaths (1999-2013) By Cause",
           margin = list(t = 100, b = 200, l = 50, r = 150, pad = 5),
           xaxis = list(title = "Cause"),
           yaxis = list(title = "Total Deaths")) %>%
    return()
}

#Builds a bar chart for the death rate per year
Build_Deaths_By_Year_Bar_Chart <- function(data, year) {
  deaths_filtered <-
    data %>% filter(STATE == 'United States') %>%
    select(YEAR, CAUSE_NAME, DEATHS) %>% filter(CAUSE_NAME != 'All Causes')
  
  new_data <- deaths_filtered %>% filter(YEAR == year)
  
  plot_ly(new_data, x = CAUSE_NAME, y = DEATHS, type = "bar", marker = list(color = toRGB("orange"))) %>%
    layout(title = "Total Deaths By Cause", 
           autosize = TRUE, 
           margin = list(b = 200, r = 150, pad = 5),
           xaxis = list(title = "Cause"),
           yaxis = list(title = "Number of Deaths")) %>%
    return()
}

#Builds a bar chart for every year's death rate per cause
Build_Total_Bar_Chart <- function(data) {
  data[,5] <- as.numeric(as.character(data[,5]))
  
  deaths_filtered <-
    data %>% filter(STATE == 'United States') %>%
    select(YEAR, CAUSE_NAME, DEATHS) %>% filter(CAUSE_NAME != 'All Causes')
  
  plot_ly(deaths_filtered, x = YEAR, y = DEATHS, type = "bar") %>%
    layout(barmode = "stack") %>%
    return()
}
