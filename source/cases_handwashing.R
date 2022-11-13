library(tidyverse)
library(viridis)

cases <- read.csv("data/choleracases.csv")

handwash <- read.csv("data/handwash.csv") 

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

cases_handwashing_data <- left_join(cases, handwash, by = "Country" = "Country", "Year" = "Year") 

cases_handwashing <- function(start, end) {
  cases_handwashing_data %>% 
    group_by(Country) %>% 
    summarize(cases = sum(cases),
              handwash = sum(Total))
  return()
}

cases_handwashing_plot <- ggplot(data = cases_handwashing, aes(x = cases, y = handwash, group = group) , size=0, alpha=0.9) +
  theme_void() +
  scale_fill_viridis(trans = "log", breaks=c(1,5,10,20,50,100), name="Number of cholera cases", guide = guide_legend( keyheight = unit(3, units = "mm"), keywidth=unit(12, units = "mm"), label.position = "bottom", title.position = 'top', nrow=1) ) +
  labs(
    title = "Number of Cholera Cases and Handwashing Percentages")
cases_handwashing_plot