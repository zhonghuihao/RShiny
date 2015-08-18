library(shiny)

shinyUI(fluidPage(
  titlePanel("stockVis"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select a stock to examine. 
               Information will be collected from yahoo finance."),
      
      # textInput("symb", "Symbol", "SPY"),
      selectInput("symb_s","Symbols",
                  c("002405.SZ","600086.SS","603077.SS")),
      
      dateRangeInput("dates", 
                     "Date range",
                     start = "2015-01-01", 
                     end = as.character(Sys.Date())),
      
      # br(),
      # br(),
      
      # checkboxInput("avg","add a 30m-moving average indicator ",value = F),
      
      sliderInput("avg_range",label = "Range of average:",
                  min = 0, max = 90,value = 5,step = 10),
    
      checkboxInput("log", "Plot y axis on log scale", value = FALSE),
      checkboxInput("adjust", "Adjust prices for inflation", value = FALSE)
      ),
    
    mainPanel(
      plotOutput("plot",height = 400, width = 800)
      
      
    )
  )
))
