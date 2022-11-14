library(tidyverse)
install.packages("viridis")
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

cases_handwashing_data <- left_join(cases, handwash, by = "Country" = "Country", "Year" = "Year") %>% 
  drop.na()

cases_handwashing <- function(start, end) {
  cases_handwashing_data %>% 
    group_by(Country) %>% 
    summarize(cases = sum(cases),
              handwash = sum(Total))
  return()
}

cases_handwashing_plot <- ggplot(data = cases_handwashing, aes(x = cases, y = handwash) +
                                   title = "Number of Cholera Cases and Handwashing Percentages" +
                                   geom_col(x = "Cholera Cases", y = "Handwashing Population")
cases_handwashing_plot
                            