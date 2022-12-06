library(plotly)
library("bslib")
library(dplyr)
library(knitr)
library(rsconnect)
library(shiny)

source("cases_handwashing.R")

## adding theme to tab for cases and handwashing graph
handwashing_tab <-  tabPanel(
  "Cholera Cases vs Handwashing",
  fluidPage(theme = bs_theme(bootswatch = "minty")))

## year selection slide bar
year_select <- sliderInput(
  "chw_years",
  "Time",
  min = min(cases_handwashing_data$Year),
  max = max(cases_handwashing_data$Year),
  value = c(min(cases_handwashing_data$Year), max(cases_handwashing_data$Year))
)

##  selection sidebar
country_sidebar <- sidebarPanel(
  selectInput(
    inputId = "Country",
    label = "Country",
    choices = unique(cases_handwashing_data$Country),
    multiple = TRUE,
    selected = "Congo"
  ),
  year_select
)

## adding interactive plot
handwashing_plot <- mainPanel(
  plotlyOutput(outputId = "cases_handwashing_graph")
)


## tab for interactive graph 
handwashing_tab <- tabPanel(
  "Cases v.s. Handwashing Graph",
  sidebarLayout(
    country_sidebar,
    handwashing_plot
  ),
  
 ## graph description 
  h1("Description"),
  p("This graph shows the disribution in the number of cholera cases globally from 2000-2018 with relation to handwashing statistics. The size of each bubble represents the number of deaths per country"),

 ## page footer
  p("INFO 201 | Autumn 2022 | Marika Fong, Carter Case, Bihn Kim, Brandon Vuong", align = "center"),
  p("Link to ", a(strong(code("INFO201-Final-Project")), href = "https://github.com/info201a-au2022/project-group-4-section-af"), align = "center")
)


  

ui <- navbarPage(
  #select theme
  theme  = "minty",
  #home page title
  "Cholera Data Analysis",
  handwashing_tab
)
