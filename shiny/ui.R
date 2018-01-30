library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Slovensko vinogradništvo"),
  
  tabsetPanel(
    tabPanel("Države in avtohtone trtne sorte ",
             DT::dataTableOutput("druzine")),
    
      tabPanel("Slovensko vinogradništvo",
               DT::dataTableOutput("druzine")),
      
      tabPanel("Ekološko vinogradništvo",
               sidebarPanel(
                  uiOutput("pokrajine")
                ),
               mainPanel(plotOutput("naselja")))
    )
))
