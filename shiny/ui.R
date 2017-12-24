library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Slovensko vinogradništvo"),
  
  tabsetPanel(
      tabPanel("Vinogradi po sortah",
               DT::dataTableOutput("druzine")),
      
      tabPanel("Vinogradi po ostalih dejavnikih",
               sidebarPanel(
                  uiOutput("pokrajine")
                ),
               mainPanel(plotOutput("naselja")))
    )
))
