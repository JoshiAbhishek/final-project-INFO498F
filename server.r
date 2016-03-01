library(plotly)
library(dplyr)
library(shiny)

top_deaths <- read.csv('data/Top_Ten_US_Causes_Of_Death.csv')

shinyServer(function(input, output) {
  
  output$plot <- renderPlotly({ 
    make_line_plot(top_deaths, input$cause, input$location)
  })
})