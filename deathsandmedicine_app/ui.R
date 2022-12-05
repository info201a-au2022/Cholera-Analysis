#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Defining UI
shinyUI(fluidPage(

    # Application title
    titlePanel("Deaths and Medicine"),

    # Sidebar with select box input
    sidebarLayout(
        sidebarPanel(
          uiOutput("selectCountry")
        ),
    # Main panel displaying chart
        mainPanel(
          plotlyOutput("countryPlot")
        )
    )
))
