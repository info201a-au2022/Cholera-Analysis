library("tidyverse")
library("ggpubr")

cases <- read.csv("../data/choleracases.csv")
deaths <- read.csv("../data/choleradeaths.csv")

data <- cases %>%
  left_join(deaths, by = c("Country" = "Country", "Year" = "Year")) %>%
  na.omit()

data_by_years <- function(start, end) {
  data %>%
  filter(start <= Year & Year < end) %>%
  filter(Number.of.reported.deaths.from.cholera != "Unknown") %>%
  group_by(Country) %>%
  summarise(cases = sum(Number.of.reported.cases.of.cholera),
            deaths = sum(as.integer(Number.of.reported.deaths.from.cholera))) %>%
    return()
  
}


graph_by_years <- function(start, end) {
  ggplot(data = data_by_years(start, end), aes(x = cases, y = deaths)) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    stat_regline_equation()
}

death_rate_graph <- plot(graph_by_years(1970, 2020))
             