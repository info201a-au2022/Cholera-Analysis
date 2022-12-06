library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)

cases_df <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-af/main/data/choleracases.csv", stringsAsFactors = FALSE)
handwashing_df <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-af/main/data/handwash.csv", stringsAsFactors =  FALSE)


source("cases_handwashing.R")

shinyServer(function(input, output){
  output$cases_handwashing_graph <- renderPlotly({
    
    # data wrangling
    df <- cases_df %>% 
      filter(country %in% input$Country) %>% 
      filter(year >= input$time[1] & year <= input$time[2])
    
    
    
    )
  })
  
  
})