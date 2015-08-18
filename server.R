# server.R

library(quantmod)
library(zoo)
source("helpers.R")

shinyServer(function(input, output) {
  
  output$plot <- renderPlot({
#     data <- getSymbols(input$symb, src = "yahoo", 
#                        from = input$dates[1],
#                        to = input$dates[2],
#                        auto.assign = FALSE)

    data <- getSymbols(input$symb_s, src = "yahoo", 
                       from = input$dates[1],
                       to = input$dates[2],
                       auto.assign = FALSE)    
    
    
    chartSeries(data, theme = chartTheme("white",up.col="red",dn.col="green"), 
                type = "candlesticks", log.scale = input$log, TA = NULL)
    
#     if (input$avg) {
#       addSMA(30,on=1 ,with.col = Cl , overlay = T, col = "red")
#     }    
    
      if (input$avg_range > 0) {
        addSMA(input$avg_range,on=1 ,with.col = Cl , overlay = T, col = "red")
      }        
    
  })
  
  
  
  
})
