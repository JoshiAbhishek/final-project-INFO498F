install.packages("dplyr")
library("dplyr")

analysis <- function(dataset) {
  
  #data <- dataset
  
  data <- read.csv("C:/Users/Abhishek/Documents/GitHub/final-project-INFO498F/data/Top_Ten_US_Causes_Of_Death.csv")
  
  data[,5] <- as.numeric(as.character(data[,5]))
  
  #Gets Causes of Death
  unique_causes_of_death <- data %>% distinct(CAUSE_NAME) %>% select(CAUSE_NAME)
  print(unique_causes_of_death)
  
  #Questions: 
  
  #What have been the leading causes of death in order from 1999 to 2013?
  
  death_causes <- data %>% filter(STATE == 'United States' & CAUSE_NAME != 'All Causes')
  print(death_causes)
  
  death_totals_by_name <- death_causes %>% group_by(CAUSE_NAME) %>% summarise(Death_Sum = sum(DEATHS)) %>% arrange(Death_Sum)
  print(death_totals_by_name)

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
  
  deaths_diff_2013_1999 <- deaths_2013 <- deaths_2013 %>% select(CAUSE_NAME, Diff) %>% arrange(Diff)
  print(deaths_diff_2013_1999)
  
  max_death_cause_growth <- deaths_diff_2013_1999 %>% filter(Diff == max(Diff))
  print(max_death_cause_growth)
  
  #What causes of death have declined the most in the past 14 years from 1999 to 2013?
  
  min_death_cause_growth <- deaths_diff_2013_1999 %>% filter(Diff == min(Diff))
  print(min_death_cause_growth)
  
}