library(shiny)

shinyUI(fluidPage(theme = shinytheme("united"),
                  titlePanel("Slovensko vinogradništvo"),
                  tabsetPanel(
                    tabPanel("Države in avtohtone trtne sorte ",
                            sidebarPanel(selectInput(inputId = "drzava",
                                             label = "Izberi državo iz seznama",
                                             choices = stevilo_sort$drzava.izvora, 
                                             selected = "Slovenia")),
                             mainPanel(textOutput("drzave"),
                                       plotOutput("zemljevid"))),
                  tabPanel("Ekološke kmetije v preusmeritvi",
                           sidebarPanel(sliderInput(inputId = "eko.preu",
                                              label = "Izberi leto",
                                              min = 2017,max = 2025, value = 2020),
                             textOutput("tekst.pre")),
                           mainPanel(plotOutput("eko.pre"))
                           
                           ),
                  tabPanel("Vinogradi na ekoloških kmetijah",
                              sidebarPanel(sliderInput(inputId = "eko.leto", 
                                                  label = "Izberi leto",
                                                  min = 2017,max = 2025, value = 2020),
                                                  textOutput("tekst.eko")),
                                      mainPanel(plotOutput("eko.eko"))),
                  tabPanel("Slovensko vinogradništvo",
                                      fluidRow(DT::dataTableOutput("sorte")
                            )
                           )
                    )
                  )
        )
