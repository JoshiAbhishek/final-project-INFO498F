library(plotly)
library(dplyr)
library(shiny)

top_deaths <- read.csv('data/Top_Ten_US_Causes_Of_Death.csv')
source('scripts/plot_function.R')
source('scripts/map_function.r')
source('scripts/analysis.r')

shinyServer(function(input, output) {
  
  output$plot <- renderPlotly({ 
    make_line_plot(top_deaths, input$cause, input$location)
  })
  
  output$map <- renderPlotly({ 
    build_map(top_deaths, input$year, input$causes)  
  })
  
  output$pie <- renderPlotly({
    Build_Yearly_Deaths_Chart(top_deaths, input$year2)
  })
})