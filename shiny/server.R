library(shiny)
shinyServer(
  function(input, output) {
  stevilo <- stevilo_sort$n[stevilo_sort$drzava.izvora == "input$drzava"]
  output$drzave <- renderText({paste0(input$drzava ,"ima",stevilo,
                                      "avtohtonih sort.")
    
  })
  output$eko.pre <- renderPlot({
    print(graf.napovedi.preu)
  })
  output$eko.eko <- renderPlot({
    print(graf_napoved.eko)
  } )
  output$tekst.pre <- renderText({napoved.pre.eko$st.vinogradov[napoved.pre.eko$Leto == "eko.preu"]})
  output$tekst.eko <- renderText({napoved$st.vinogradov[napoved$Leto == "eko.leto"]})
  output$sorte <- DT::renderDataTable(datatable(stidy_sorte.povrsina_sadike))
})
