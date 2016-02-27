install.packages("dplyr")
library("dplyr")

analysis <- function(dataset) {

  data <- read.csv("../data/Top_Ten_US_Causes_Of_Death.csv")
  
  unique_causes_of_death <- data %>% distinct(CAUSE_NAME) %>% select(CAUSE_NAME)
  print(unique_causes_of_death)
  
  
}