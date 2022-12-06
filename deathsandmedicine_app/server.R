#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(ggplot2)
library(plotly)
library(dplyr)

source("deathsandmedicine.R")

# Define server logic 
shinyServer(function(input, output) {
  # Creating select box
  output$selectCountry <- renderUI({
    selectInput("country", "Choose a country:", choices = unique(deaths_medicine$Country))
  })
  # Making plot reactive for input
  dnmPlot <- reactive({
    plotData <- deaths_medicine %>%
      filter(Country %in% input$country)
  # Making chart
    ggplot(plotData) +
      geom_col(mapping = aes(
        x = Country,
        y = total_deaths,
        fill = "Total Deaths Recorded")
      ) +
      geom_col(mapping = aes(
        x = Country,
        y = as.numeric(medicine_av),
        fill = "Median Percentage of Publicly Available Medicine"
      ))+
      scale_y_continuous() +
      labs(x = "Country",
           y = "",
           title = "Correlation between Cholera Deaths and Availablity of Medicine(2007-2013)",
           fill = "Metrics Recorded")
  })
  # Making chart interactive
  output$countryPlot <- renderPlotly({
    ggplotly(dnmPlot())
  })
  
})
