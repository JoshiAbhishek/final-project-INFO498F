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
    build_map(top_deaths, input$year, input$causes)  
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
})
