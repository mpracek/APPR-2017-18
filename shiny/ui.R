library(shiny)

shinyUI(fluidPage(theme = shinytheme("superhero"),
  
  titlePanel("Slovensko vinogradništvo"),
  
  tabsetPanel(
    tabPanel("Države in avtohtone trtne sorte ",
             sidebarLayout(
               sidebarPanel(
                selectInput(inputId = "drzava",
                         label = "Izberi državo iz seznama",
                         choices = stevilo_sort$drzava.izvora, 
                         selected = "Slovenia")),
               mainPanel(textOutput("drzave"))),
    tabsetPanel("Ekološko vinogradništvo"),
              tabPanel("Ekološke kmetije v preusmeritvi",
              sliderInput(inputId = "eko.preu", 
                          label = "Izberi leto",
                          min = 2017,max = 2025, value = 2020),
              plotOutput("eko.pre"),
              textOutput("tekst.pre")),
              tabPanel("Vinogradi na ekoloških kmetijah",
              sliderInput(inputId = "eko.leto", 
                          label = "Izberi leto",
                          min = 2017,max = 2025, value = 2020),
              plotOutput("eko.eko"),
              textOutput("tekst.eko")),
    tabPanel("Slovensko vinogradništvo",
              fluidRow(DT::dataTableOutput("tabela")))))))
