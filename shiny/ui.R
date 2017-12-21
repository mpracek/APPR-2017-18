library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Slovensko vinogradništvo"),
  
  tabsetPanel(
      tabPanel("Velikost družine",
               DT::dataTableOutput("druzine")),
      
      tabPanel("Število naselij",
               sidebarPanel(
                  uiOutput("pokrajine")
                ),
               mainPanel(plotOutput("naselja")))
    )
))
