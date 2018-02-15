library(shiny)
shinyServer(
  function(input, output) {
    output$drzave <- renderText({paste0(input$drzava ," ima ",
                                        filter(stevilo_sort,drzava.izvora == input$drzava) %>% select(n),
                                        " avtohtonih sort.")})
    output$zemljevid <- renderPlot({print(zemljevid.drzave)})  
    output$eko.pre <- renderPlot({print(graf.napovedi.preu)})
    output$eko.eko <- renderPlot({print(graf_napoved.eko)} )
    outuput$slika1 <- renderImage({"slike/eko.vinograd.jpg"})
    output$tekst.pre <- renderText({napoved.pre.eko$st.vinogradov[napoved.pre.eko$Leto == "eko.preu"]})
    output$tekst.eko <- renderText({napoved$st.vinogradov[napoved$Leto == "eko.leto"]})
    output$sorte <- DT::renderDataTable(datatable(stidy_sorte.povrsina_sadike))
  })
