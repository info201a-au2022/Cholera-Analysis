library("shiny")
library("plotly")
library("bslib")
library("tidyverse")

source("app_server.R")
source("app_ui.R")

shinyApp(ui = ui, server = server)