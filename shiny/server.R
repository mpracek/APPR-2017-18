library(shiny)
shinyServer(function(input, output) {
  output$sorte <- renderText({
    stevilo_sort
    outputArgs = list(input$num)
  })
  output$slovenija <- renderPlot({
    
  })
})
