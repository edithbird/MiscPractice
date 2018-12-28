library(quantmod)
library(dygraphs)

shinyServer(function(input, output) {
  
  dataInput <- reactive({
    
    prices <- getSymbols(c(input$symb0, input$symb1, input$symb2), auto.assign = TRUE)
    prices1 <- do.call(merge, lapply(prices, function(x) Cl(get(x))))
    
    
  })
  
  ### uncomment this section to see a static OHLC chart via quantmod
  ##   output$plot <- renderPlot({
  
  ##       prices <- dataInput()
  
  ## chartSeries(prices)
  
  ##       })
  ## })
  
  
  ### uncomment this to see an interactive plot via dygraphs
  output$plot <- renderDygraph({
    
    prices1 <- dataInput()
    
    dygraph(prices1) %>%
      dyOptions(strokeWidth = 2) %>% 
      dyRangeSelector(dateWindow = input$dates, 
                      retainDateWindow = T)
  })
})