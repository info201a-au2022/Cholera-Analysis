library(tidyverse)
library(viridis)

<<<<<<< HEAD
cases <- read.csv("..data/choleracases.csv")
=======
cases <- read.csv("../data/choleracases.csv")
>>>>>>> 6983d95b32b22b1ba6add1a418111199e4ac8cba
handwash <- read.csv("../data/handwash.csv") 

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

cases_handwashing_data <- left_join(cases, handwash, by = c("Country" = "Country", "Year" = "Year")) %>%
  left_join(deaths, by = c("Country" = "Country", "Year" = "Year")) %>%
  drop_na()

cases_handwashing <- function(start, end) {
  cases_handwashing_data %>% 
    filter(start <= Year & Year < end) %>%
    group_by(Country) %>% 
    summarize(cases = sum(cases, na.rm = TRUE),
              deaths = sum(deaths, na.rm = TRUE),
              handwash = mean(name, na.rm = TRUE)) %>%
<<<<<<< HEAD
    return()
=======
  return()
>>>>>>> 6983d95b32b22b1ba6add1a418111199e4ac8cba
}

cases_handwash_graph <- ggplot(data = cases_handwashing(1000, 2020), aes(x = handwash, y = cases, size = deaths)) +
  geom_point()
<<<<<<< HEAD
title = "Number of Cholera Cases and Handwashing Percentages"
=======
  title = "Number of Cholera Cases and Handwashing Percentages"
>>>>>>> 6983d95b32b22b1ba6add1a418111199e4ac8cba
