library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)

source("cases_handwashing.R")

server <- function(input, output){
  output$cases_handwashing_graph <- renderPlotly({
    
    # data wrangling
    plot_data <- cases_handwashing(input$chw_years[1], input$chw_years[2]) %>% 
      filter(Country %in% input$Country)
    
    #making chart 
    handwashing_plot <- ggplot(data = plot_data, 
                               aes(x = handwash, y = cases, size = deaths, color = Country)) +
    scale_size(range = c(0.05, 10), name="Cholera Deaths per") +
      geom_point(alpha=0.5) +
     labs(title = "Number of Cholera Cases and Handwashing Percentages", x = "Population with Basic Handwashing Facilities at Hpme (%)", y = "Cholera Cases")
    
    
    return(ggplotly(handwashing_plot))
  
    
  })
  
}
