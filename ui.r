shinyUI(fluidPage(
  
  titlePanel("Tabsets"),
  
  sidebarLayout(
    
    sidebarPanel(
      sliderInput("obs", "Number of observations:",  
                  min = 1, max = 1000, value = 500)
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Map", plotOutput("map")), 
        tabPanel("Analysis", verbatimTextOutput("analysis")), 
        tabPanel("Line Plot", tableOutput("plot")),
        tabPanel("Bar Graph", tableOutput("bar_graph"))
      )
    )
  )
))
