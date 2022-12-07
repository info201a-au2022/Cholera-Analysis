library("shiny")
library("plotly")
library("bslib")
library("tidyverse")

source("shiny_server.R")
source("shiny_ui.R")

shinyApp(ui = ui, server = server)