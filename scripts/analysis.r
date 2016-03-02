install.packages("dplyr")
library("dplyr")

analysis <- function(dataset) {

  #data <- read.csv("../data/Top_Ten_US_Causes_Of_Death.csv")
  
  data <- read.csv("C:/Users/Abhishek/Documents/GitHub/final-project-INFO498F/data/Top_Ten_US_Causes_Of_Death.csv")
  
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
  
  
  
  
  #What causes of death have declined the most in the past 14 years from 1999 to 2013?
  
  
  
  
  #What is the proportional relation between causes of death most recently? How has it changed in the past 14 years from 1999 to 2013?
  
  
  
  
}