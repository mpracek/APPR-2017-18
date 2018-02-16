library(shiny)
shinyServer(
  function(input, output) {
    output$drzave <- renderText({paste0(input$drzava ," ima ",
                                        filter(stevilo_sort,drzava.izvora == input$drzava) %>% select(n),
                                        " avtohtonih sort.")})
    output$zemljevid <- renderPlot({print(zemljevid.drzave)})  
    output$eko.pre <- renderPlot({print(graf.napovedi.preu)})
    output$eko.eko <- renderPlot({print(graf_napoved.eko)} )
    output$tekst.pre <- renderText({paste0("Predvideva se, da bo v letu ",  input$eko.preu, " ",
                                           round(filter(napoved.pre.eko, Leto == input$eko.preu) %>% select(st.vinogradov), digits = 0),
                                           " vinogradov na kmetijah v preusmeritvi v ekološko kmetijstvo.")})
    output$tekst.eko <- renderText({paste0("Predvideva se, da bo v letu ", input$eko.leto, " ",
                                           round(filter(napoved, Leto == input$eko.leto) %>% select(st.vinogradov), digits = 0),
                                           " vinogradov na ekoloških kmetijah")})
    output$sorte <- DT::renderDataTable(datatable(stidy_sorte.povrsina_sadike))
    })
