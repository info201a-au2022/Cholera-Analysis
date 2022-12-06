library("tidyverse")
library("plotly")
library("shiny")

cases <- read.csv("../data/choleracases.csv")
deaths <- read.csv("../data/choleradeaths.csv")

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

#---------------------------------------------
deathrate_tab <- tabPanel(
  "Deathrate",
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        "years",
        "Time",
        min = min(deathrate_data$Year),
        max = max(deathrate_data$Year),
        value = c(min(deathrate_data$Year), max(deathrate_data$Year))
      )
    ),
    mainPanel(
      plotlyOutput(outputId = "deathrate_graph"),
      p("caption goes here")
    )
  )
)

ui <- fluidPage(
  tabsetPanel(
    deathrate_tab
  )
)

server <- function(input, output) {
  output$deathrate_graph <- renderPlotly({deathrate_graph_by_years(input$years)})
}

shinyApp(ui = ui, server = server)