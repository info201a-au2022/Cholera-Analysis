library("tidyverse")
library("plotly")
library("shiny")

cases <- read.csv("../data/choleracases.csv")
deaths <- read.csv("../data/choleradeaths.csv")
handwash <- read.csv("../data/handwash.csv") 
medicine <- read.csv("../data/medianmedicines.csv")

#--------------------------------------------------------------------
#Deathrate

deathrate_data <- cases %>%
  left_join(deaths, by = c("Country" = "Country", "Year" = "Year")) %>%
  na.omit()

get_deathrate_data <- function(years) {
  deathrate_data %>%
    filter(years[1] <= Year & Year < years[2]) %>%
    filter(Number.of.reported.deaths.from.cholera != "Unknown") %>%
    group_by(Country) %>%
    summarise(cases = sum(Number.of.reported.cases.of.cholera),
              deaths = sum(as.integer(Number.of.reported.deaths.from.cholera))) %>%
    return()
}

deathrate_graph_by_years <- function(years) {
  graph_data = get_deathrate_data(years)
  plot <- plot_ly(
    type = "scatter",
    data = graph_data,
    x = ~cases, y = ~deaths,
    text = ~Country
  ) %>%
    layout(title = "Cholera Deaths vs. Cases",
           xaxis = list(title = "Cases"),
           yaxis = list(title = "Deaths"))
  
  return(plot)
}

#---------------------------------------------------------------------
#Cases/Handwash

# tidying data
fix_data <- function(data) {
  data <-
    gather(
      data %>% slice_tail(n = -2),
      key = Year,
      value = name,
      -X
    ) %>%
    filter(!str_detect(Year, "\\.")) %>%
    mutate(Year = as.integer(str_sub(Year, 2))) %>%
    mutate(name = as.integer(name)) %>%
    rename(Country = X)
}

cases <- cases %>% rename(cases = Number.of.reported.cases.of.cholera)

handwash <- fix_data(handwash)

# joining cases and handwashing df 
cases_handwashing_data <- left_join(cases, handwash, by = c("Country" = "Country", "Year" = "Year")) %>%
  left_join(deaths, by = c("Country" = "Country", "Year" = "Year")) %>%
  drop_na()

cases_handwashing <- function(start, end) {
  cases_handwashing_data %>% 
    filter(start <= Year & Year < end) %>%
    group_by(Country) %>% 
    summarize(cases = sum(cases, na.rm = TRUE),
              deaths = sum(as.integer(Number.of.reported.deaths.from.cholera), na.rm = TRUE),
              handwash = mean(name, na.rm = TRUE)) %>%
    return()
}
#---------------------------------------------------
#Deaths/Medicine

#Filtering cholera deaths from 2007-2013 to match medicine data
country_deaths <- deaths %>%
  filter(Year > 2006, Year < 2014) %>%
  group_by(Country) %>%
  summarise(total_deaths = sum(as.numeric(Number.of.reported.deaths.from.cholera)))

#Dropping the first row of median data
country_medicine <- medicine[-1,] %>%
  group_by(X) %>%
  rename(Country = X) %>%
  summarise(medicine_av = Median.availability.of.selected.generic.medicines.......Public)

#Joinning the two data sets            
deaths_medicine <- left_join(country_medicine, country_deaths) %>%
  drop_na()
#---------------------------------------------------
server <- function(input, output) {
  #Deathrate
  
  output$deathrate_graph <- renderPlotly({deathrate_graph_by_years(input$years)})
  
  #-------------------------
  #Cases/Handwash
  
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
  #------------------------
  #Deaths/Medicine
  
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
}
