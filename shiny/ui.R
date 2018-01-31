library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Slovensko vinogradništvo"),
  
  tabsetPanel(
    tabPanel("Države in avtohtone trtne sorte ",
             selectInput(inputId = "variable",
                         label = "Izberi državo iz seznama",
                         choices = stevilo_sort$drzava.izvora, 
                         selected = "Slovenia"))),
             #print(zemljevid.drzave))
    tabsetPanel(
      tabPanel("Slovensko vinogradništvo",
               sliderInput(inputId = "num", label = "Izberi sorto",
                           min = 0, max = 100, value = 50)
               )),
    tabsetPanel(
      tabPanel("Ekološko vinogradništvo")
    )
))
