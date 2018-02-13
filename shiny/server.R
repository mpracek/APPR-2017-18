library(shiny)
shinyServer(
  function(input, output) {
  stevilo <- 
  output$drzave <- renderText({paste0(input$drzava ,"ima",stevilo,
                                      "avtohtonih sort.")
    
  })
  output$eko.pre <- renderPlot({
    print(graf.napovedi.preu)
  })
  output$eko.eko <- renderPlot({
    print(graf_napoved.eko)
  } )
  output$sorte <- DT::renderDataTable(datatable(stidy_sorte.povrsina_sadike))
})
