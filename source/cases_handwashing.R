library(tidyverse)
library(viridis)

cases <- read.csv("../data/choleracases.csv")
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
  drop_na()

cases_handwashing <- function(start, end) {
  cases_handwashing_data %>% 
    filter(start <= Year & Year < end) %>%
    group_by(Country) %>% 
    summarize(cases = sum(cases, na.rm = TRUE),
              handwash = mean(name, na.rm = TRUE)) %>%
  return()
}

ggplot(data = cases_handwashing(1000, 2020), aes(x = handwash, y = cases)) +
  geom_point()
  title = "Number of Cholera Cases and Handwashing Percentages"
