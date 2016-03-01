# Final Project Shiny UI

shinyUI(navbarPage("Top Leading Causes of Death in the United States from 1999-2013",
  tabPanel("Plot",
  
  sidebarLayout(
    
    sidebarPanel(
      
      # Widget 1: Select box for death cause
      selectInput("cause", label = h3("Choose a cause of death:"), 
                  choices = list("All Causes" = 'All Causes', "Alzheimer's disease" = "Alzheimer's disease", "Cancer" = 'Cancer', 
                                 "Chronic liver disease and cirrhosis" = 'Chronic liver disease and cirrhosis', "Chronic Lower Respiratory Disease (CLRD)" = 'CLRD',
                                 "Diabetes" = 'Diabetes', "Diseases of Heart" = 'Diseases of Heart', "Essential hypertension and hypertensive renal disease" = 'Essential hypertension and hypertensive renal disease',
                                 "Homicide" = 'Homicide', "Influenza and pneumonia" = 'Influenza and pneumonia', "Kidney Disease" = 'Kidney Disease', "Parkinson's disease" = "Parkinson's disease", 
                                 "Pneumonitis due to solids and liquids" = 'Pneumonitis due to solids and liquids', "Septicemia" = 'Septicemia', "Stroke" = 'Stroke', "Suicide" = 'Suicide', "Unintentional Injuries" = 'Unintentional Injuries'), 
                  selected = 'All Causes'),
      
      # Widget 2: Select box for location
      selectInput("location", label = h3("Choose a location:"), 
                  choices = list("United States" = 'United States', "Alabama" = 'Alabama', "Alaska" = 'Alaska', "Arizona" = 'Arizona', "Arkansas" = 'Arkansas',
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
                  selected = 'United States')
    ),
    
    mainPanel(
      plotlyOutput("plot")
      
      )
    )
  ),
  tabPanel("Map",
     sidebarLayout(
       
       sidebarPanel(
       ),
       
       mainPanel(
         plotlyOutput("map")
       ) 
       
       
     )
  
  ),
  
  tabPanel("Analysis",
     sidebarLayout(
       
       sidebarPanel(
       ),
       
       mainPanel(
         verbatimTextOutput("analysis")
       ) 
       
       
     )
           
  ),
  tabPanel("Bar Graph",
     sidebarLayout(
       
       sidebarPanel(
       ),
       
       mainPanel(
         plotlyOutput("bar_graph")
       ) 
       
       
     )
           
  )
))