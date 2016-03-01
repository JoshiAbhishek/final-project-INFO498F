install.packages("dplyr")
library("dplyr")

analysis <- function(dataset) {

  data <- read.csv("../data/Top_Ten_US_Causes_Of_Death.csv")
  
  #Gets Causes of Death
  unique_causes_of_death <- data %>% distinct(CAUSE_NAME) %>% select(CAUSE_NAME)
  print(unique_causes_of_death)
  
  #Questions: 
  
  #What have been the leading causes of death in order from 1999 to 2013?
  
  
  
  
  #What causes of death have grown the most in the past 14 years from 1999 to 2013?
  
  
  
  
  #What causes of death have declined the most in the past 14 years from 1999 to 2013?
  
  
  
  
  #What is the proportional relation between causes of death most recently? How has it changed in the past 14 years from 1999 to 2013?
  
  
  
  
}