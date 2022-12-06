#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)


# Tab for graph
deaths_medicine_tab <- tabPanel("Deaths and Medicine",
sidebarLayout(
  sidebarPanel(
    uiOutput("selectCountry")
  ),
  mainPanel(
    plotlyOutput("countryPlot"),
    h3("What does it mean?"),
    p("While looking at this chart we are able to see the total deaths recorded over the span of 2007 to 2013, and the median percentage of generic medicine available for a selected country over the same span of years. From further analyzing the results, it can be seen that a country with a lower percentage of accessibility to medicine tends to have a higher overall death toll.")
  )
))



# Defining UI
shinyUI(fluidPage(
  tabsetPanel(
  deaths_medicine_tab
)))
