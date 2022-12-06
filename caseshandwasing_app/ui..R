library(plotly)
library("bslib")
library(dplyr)
library(knitr)
library(rsconnect)
library(shiny)


cases_df <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-af/main/data/choleracases.csv", stringsAsFactors = FALSE)
handwashing_df <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-af/main/data/handwash.csv", stringsAsFactors =  FALSE)

handwashing_tab <-  tabPanel(
  "Cholera Cases compared to Handwashing Statistics Globally",
  fluidPage(theme = bs_theme(bootswatch = "minty")))


## country selection sidebar
country_sidebar <- sidebarPanel(
  selectionInput(
    input_Id = "Country",
    label = "Country",
    multiple = TRUE,
),



## year selection slide bar
sliderInput(inputId =  "year",
            label = h3("Year"),
            min = min(cases_df$year),
            max = max(cases_df$year),
            sep = "",
            value = c(min(cases_df$year),max(cases_df$year))
),

handwashing_plot <- mainPanel(
  plotlyOutput(outputId = "cases_handwashing_graph")
),


## tab for interactive graph 
handwashing_tab <- tab_Panel(
  "Cases v.s. Handwashing Graph",
  sidebarLayout(
    country_sidebar,
    handwashing_plot
  ),
  
  ## Description of the graph
  h1("Description"),
  p("This graph shows ")
  )
)


ui <- navbarPage(
  #select theme
  theme  = "minty",
  #home page title
  "Cholera Data Analysis",
  country_sidebar,
  
  
)