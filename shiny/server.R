library(shiny)
shinyServer(function(input, output) {
  
  output$sorte <- renderText({
    stevilo_sort %>% filter(drzava == input$select) %>%
      transmute(text = paste0( drzava, "ima" ,stevilo, "avtohtonih sort." ) %>% as.character()
  )
  
  output$slovenija <- renderPlot({
    
  })
})
