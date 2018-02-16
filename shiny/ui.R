library(shiny)

shinyUI(fluidPage(theme = shinytheme("cerulean"),
                  titlePanel("Slovensko vinogradništvo"),
                  tabsetPanel(
                    tabPanel("Države in avtohtone trtne sorte ",
                            sidebarPanel(selectInput(inputId = "drzava",
                                             label = "Izberi državo iz seznama",
                                             choices = stevilo_sort$drzava.izvora, 
                                             selected = "Slovenia"),
                                         textOutput("drzave")),
                             mainPanel(plotOutput("zemljevid"))),
                  tabPanel("Ekološke kmetije v preusmeritvi",
                           sidebarPanel(sliderInput(inputId = "eko.preu",
                                              label = "Izberi leto",
                                              min = 2017,max = 2025, value = 2020),
                             textOutput("tekst.pre"),
                             img(src = "slike/eko.vinograd.jpg")),
                           mainPanel(plotOutput("eko.pre"))
                           
                           ),
                  tabPanel("Vinogradi na ekoloških kmetijah",
                              sidebarPanel(sliderInput(inputId = "eko.leto", 
                                                  label = "Izberi leto",
                                                  min = 2017,max = 2025, value = 2020),
                                                  textOutput("tekst.eko"),
                                           img(src = "slike/eko.vinograd.jpg")),
                                      mainPanel(plotOutput("eko.eko"))),
                  tabPanel("Slovensko vinogradništvo",
                                      fluidRow(DT::dataTableOutput("sorte")
                            )
                           )
                    )
                  )
        )
