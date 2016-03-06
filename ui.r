# Final Project Shiny UI
library(plotly)
library(dplyr)
library(shiny)
shinyUI(
  navbarPage(
    "Top U.S. Causes of Death",
    
    theme = "styles.css",
    
    tabPanel("Home",
             
             mainPanel(
               h1("About this project"),
               p("This informatics (INFO 498F) project is based off of a dataset of death rates for the top leading causes of death in the United States, including mortality patterns from 1999 through 2013, and by state of residence for selected year and cause of death."),
               p("The data was collected and published by the CDC (Centers for Disease Control and Prevention) and accessed through data.gov."),
               p("The dataset can be found through this ",  a("data.gov ", href ="http://catalog.data.gov/dataset/age-adjusted-death-rates-for-the-top-10-leading-causes-of-death-united-states-2013/resource/0e603f1d-31bf-4809-8f10-a994b305b379"), "link."),
               h1("Our analysis"),
               p("During our project, we sought to answer four major questions: "),
               tags$ul(
                 tags$li("What have been the leading causes of death in order from 1999 to 2013?"),
                 tags$li("What causes of death have grown the most in the past 14 years from 1999 to 2013?"),
                 tags$li("What causes of death have declined the most in the past 14 years from 1999 to 2013?"),
                 tags$li("What is the proportional relation between causes of death most recently? How has it changed in the past 14 years from 1999 to 2013")
               ),
               p("We chose to answer these questions with multiple data visualizations. To summarize our findings, we found that the leading causes of deaths in total from 1999 to 2013 included Cancer and Disease of Heart, with Pneumonitis and Parkinson's Disease as the lowest."),
               p("From 1999 to 2013, Alzeihmer's Disease grew the most with 40,231 more deaths in 2013 than 1999; Diseases of Heart declined the most with 114,087 deaths less in 2013 than 1999. "),
               p("During 1999, Cancer and Diseases of Heart accounted for over 60% of deaths - 27.1% and 35.8% respectively. During 2013, both causes still accounted for over 57% of deaths - 28.2% and 29.4% respectively. ")
             ) 
    ),
    
    tabPanel("Growth By State & Cause",
       sidebarLayout(
         
         sidebarPanel(h4("View the mortality rate growth or decline by state and cause"),
           # Widget 1: Select box for death cause
           selectInput(
             "cause", label = h3("Choose a cause of death:"),
             choices = list(
               "All Causes" = 'All Causes', "Alzheimer's disease" = "Alzheimer's disease", "Cancer" = 'Cancer',
               "Chronic liver disease and cirrhosis" = 'Chronic liver disease and cirrhosis', "Chronic Lower Respiratory Disease (CLRD)" = 'CLRD',
               "Diabetes" = 'Diabetes', "Diseases of Heart" = 'Diseases of Heart', "Essential hypertension and hypertensive renal disease" = 'Essential hypertension and hypertensive renal disease',
               "Homicide" = 'Homicide', "Influenza and pneumonia" = 'Influenza and pneumonia', "Kidney Disease" = 'Kidney Disease', "Parkinson's disease" = "Parkinson's disease",
               "Pneumonitis due to solids and liquids" = 'Pneumonitis due to solids and liquids', "Septicemia" = 'Septicemia', "Stroke" = 'Stroke', "Suicide" = 'Suicide', "Unintentional Injuries" = 'Unintentional Injuries'
             ),
             selected = 'All Causes'
           ),
           
           # Widget 2: Select box for location
           selectInput(
             "location", label = h3("Choose a location:"),
             choices = list(
               "United States" = 'United States', "Alabama" = 'Alabama', "Alaska" = 'Alaska', "Arizona" = 'Arizona', "Arkansas" = 'Arkansas',
               "California" = 'California', "Colorado" = 'Colorado', "Connecticut" = 'Connecticut', "Delaware" = 'Delaware', "Florida" = 'Florida',
               "Georgia" = 'Georgia', "Hawaii" = 'Hawaii', "Idaho" = 'Idaho', "Illinois" = 'Illinois', "Indiana" = 'Indiana', "Iowa" = 'Iowa',
               "Kansas" = 'Kansas', "Kentucky" = 'Kentucky', "Louisiana" = 'Louisiana', "Maine" = 'Maine', "Maryland" = 'Maryland', "Massachusetts" = 'Massachusetts',
               "Michigan" = 'Michigan', "Minnesota" = 'Minnesota', "Mississippi" = 'Mississippi', "Missouri" = 'Missouri', "Montana" = 'Montana',
               "Nebraska" = 'Nebraska', "Nevada" = 'Nevada', "New Hampshire" = 'New Hampshire', "New Jersey" = 'New Jersey', "New Mexico" = 'New Mexico',
               "New York" = 'New York', "North Carolina" = 'North Carolina', "North Dakota" = 'North Dakota', "Ohio" = 'Ohio', "Oklahoma" = 'Oklahoma',
               "Oregon" = 'Oregon', "Pennsylvania" = 'Pennsylvania', "Rhode Island" = 'Rhode Island', "South Carolina" = 'South Carolina',
               "South Dakota" = 'South Dakota', "Tennessee" = 'Tennessee', "Texas" = 'Texas', "Utah" = 'Utah', "Vermont" = 'Vermont', "Virginia" = 'Virginia',
               "Washington" = 'Washington', "West Virginia" = 'West Virginia', "Wisconsin" = 'Wisconsin', "Wyoming" = 'Wyoming'
             ),
             selected = 'United States'
           )
         ),
         
         mainPanel(plotlyOutput("plot"))
       )),

  tabPanel("State Distribution",
     sidebarLayout(
       
       sidebarPanel(h4("View the mortality distribution across the U.S. by year and cause"),
         # Widget 1: slider input for year
         sliderInput("year", label = h3("Year"), min = 1999, 
          max = 2013, value = 1, sep = "", animate= animationOptions(interval=500, loop=TRUE)
         ),
           
         
         
         # Widget 2: Select box for cause
         selectInput("causes", label = h3("Choose a cause of death:"), 
                     choices = list("All Causes" = 'All Causes', "Alzheimer's disease" = "Alzheimer's disease", "Cancer" = 'Cancer', 
                                    "Chronic liver disease and cirrhosis" = 'Chronic liver disease and cirrhosis', "Chronic Lower Respiratory Disease (CLRD)" = 'CLRD',
                                    "Diabetes" = 'Diabetes', "Diseases of Heart" = 'Diseases of Heart', "Essential hypertension and hypertensive renal disease" = 'Essential hypertension and hypertensive renal disease',
                                    "Homicide" = 'Homicide', "Influenza and pneumonia" = 'Influenza and pneumonia', "Kidney Disease" = 'Kidney Disease', "Parkinson's disease" = "Parkinson's disease", 
                                    "Pneumonitis due to solids and liquids" = 'Pneumonitis due to solids and liquids', "Septicemia" = 'Septicemia', "Stroke" = 'Stroke', "Suicide" = 'Suicide', "Unintentional Injuries" = 'Unintentional Injuries') 
         )
       ),
       
       mainPanel(
         plotlyOutput("map")
       ) 
       
       
     )
  
  ),
  
  tabPanel("Causes By Year",
     sidebarLayout(
       
       sidebarPanel(h4("View the mortality rate for a given year in the U.S."),
         selectInput("year2", label = h3("Choose a year:"), 
                     choices = list("1999" = '1999', "2000" = '2000', "2001" = '2001', "2002" = '2002',
                                    "2003" = '2003', "2004" = '2004', "2005" = '2005', "2006" = '2006',
                                    "2007" = '2007', "2008" = '2008', "2009" = '2009', "2010" = '2010',
                                    "2011" = '2011', "2012" = '2012', "2013" = '2013'), 
                     selected = "1999")
       ),
       
       mainPanel(
         plotlyOutput("pie"),
         plotlyOutput("year_bar")
         
       ) 
       
     )
           
  ),
  tabPanel("Totals",
      plotlyOutput("total_bar")
  )
  
))
