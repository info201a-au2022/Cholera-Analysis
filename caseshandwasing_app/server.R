library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)

source("cases_handwashing.R")

server <- function(input, output){
  output$handwashing_plot <- renderPlotly({
    
    # data wrangling
    plot_data <- cases_handwashing_data %>% 
      filter(country %in% input$Country) %>% 
      filter(year >= input$time[1] & year <= input$time[2])
    
    #making chart 
    handwashing_plot <- ggplot(data = cases_handwashing(1000, 2020), 
                               aes(x = handwash, y = cases, size = deaths)) +
      geom_point()
    title = "Number of Cholera Cases and Handwashing Percentages"
    
    return(handwashing_plot)
  
    
  })
  
}