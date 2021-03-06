library(plotly)
library(dplyr)
library(shiny)

top_deaths <- read.csv('data/Top_Ten_US_Causes_Of_Death.csv')
source('scripts/plot_function.R')
source('scripts/map_function.R')
source('scripts/analysis.R')
source('scripts/chart.R')

shinyServer(function(input, output) {
  output$plot <- renderPlotly({
    make_line_plot(top_deaths, input$cause, input$location)
  })
  
  output$plot_2 <- renderPlotly({
    make_age_adjusted_plot(top_deaths, input$cause, input$location)
  })
  
  output$map <- renderPlotly({
    build_map(top_deaths, input$years, input$causes)
  })
  
  output$pie <- renderPlotly({
    Build_Yearly_Deaths_Chart(top_deaths, input$year2)
  })
  
  output$total_bar <- renderPlotly({
    Build_Total_Death_Chart(top_deaths)
  })
  
  output$year_bar <- renderPlotly({
    Build_Deaths_By_Year_Bar_Chart(top_deaths, input$year2)
  })
  
  output$drop2 <- renderUI({
    states <- list(
      "United States" = 'United States',
      "Alabama" = 'Alabama',
      "Alaska" = 'Alaska',
      "Arizona" = 'Arizona',
      "Arkansas" = 'Arkansas',
      "California" = 'California',
      "Colorado" = 'Colorado',
      "Connecticut" = 'Connecticut',
      "Delaware" = 'Delaware',
      "Florida" = 'Florida',
      "Georgia" = 'Georgia',
      "Hawaii" = 'Hawaii',
      "Idaho" = 'Idaho',
      "Illinois" = 'Illinois',
      "Indiana" = 'Indiana',
      "Iowa" = 'Iowa',
      "Kansas" = 'Kansas',
      "Kentucky" = 'Kentucky',
      "Louisiana" = 'Louisiana',
      "Maine" = 'Maine',
      "Maryland" = 'Maryland',
      "Massachusetts" = 'Massachusetts',
      "Michigan" = 'Michigan',
      "Minnesota" = 'Minnesota',
      "Mississippi" = 'Mississippi',
      "Missouri" = 'Missouri',
      "Montana" = 'Montana',
      "Nebraska" = 'Nebraska',
      "Nevada" = 'Nevada',
      "New Hampshire" = 'New Hampshire',
      "New Jersey" = 'New Jersey',
      "New Mexico" = 'New Mexico',
      "New York" = 'New York',
      "North Carolina" = 'North Carolina',
      "North Dakota" = 'North Dakota',
      "Ohio" = 'Ohio',
      "Oklahoma" = 'Oklahoma',
      "Oregon" = 'Oregon',
      "Pennsylvania" = 'Pennsylvania',
      "Rhode Island" = 'Rhode Island',
      "South Carolina" = 'South Carolina',
      "South Dakota" = 'South Dakota',
      "Tennessee" = 'Tennessee',
      "Texas" = 'Texas',
      "Utah" = 'Utah',
      "Vermont" = 'Vermont',
      "Virginia" = 'Virginia',
      "Washington" = 'Washington',
      "West Virginia" = 'West Virginia',
      "Wisconsin" = 'Wisconsin',
      "Wyoming" = 'Wyoming'
    )
    selectInput("state2",
                label = "Select another state:",
                choices = states[states != input$state1],
                selected = 'Texas')
  })
  
  output$state_bar <- renderPlotly({
    chart(top_deaths, input$state1, input$state2, input$year)
  })
})
