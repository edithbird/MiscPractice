library(shiny)
library(dygraphs)

shinyUI(fluidPage(
  titlePanel("Simple Stock Charting App"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Input 3 tickers and see them plotted against each other."),
      
      textInput("symb0", label = h6("Input a Valid Stock Ticker"), value = "CGC"),
      textInput("symb1", label = h6("Input a Valid Stock Ticker"), value = "VOO"),
      textInput("symb2", label = h6("Input a Valid Stock Ticker"), value = "EA"), 
      dateRangeInput("dates", label = h3("Date input"))
      ),
    
    ### uncomment for static chart    
    ## mainPanel(plotOutput("plot"))
    
    ### uncomment for dygraphs chart
    mainPanel(dygraphOutput("plot"))
  )
))