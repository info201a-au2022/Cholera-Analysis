library("tidyverse")

cases <- read.csv("../data/choleracases.csv")
deaths <- read.csv("../data/choleradeaths.csv")
handwash <- read.csv("../data/handwash.csv")
defecation <- read.csv("../data/opendefecation.csv")

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
deaths <- deaths %>% rename(deaths = Number.of.reported.deaths.from.cholera)

deaths <- deaths %>% 
  filter(deaths != "Unknown") %>%
  mutate(deaths = as.integer(deaths))

handwash <- fix_data(handwash)
defecation <-fix_data(defecation)

handwash <- handwash %>% rename(handwashing = name)
defecation <- defecation %>% rename(defecation = name)


data <- cases %>%
  left_join(deaths, by = c("Country" = "Country", "Year" = "Year")) %>%
  left_join(handwash, by = c("Country" = "Country", "Year" = "Year")) %>%
  left_join(defecation, by = c("Country" = "Country", "Year" = "Year"))

aggregate_data <- function(start, end) {
  data %>%
    filter(start <= Year & Year < end) %>%
    group_by(Country) %>%
    summarise(cases = sum(cases, na.rm = TRUE), deaths = sum(deaths, na.rm = TRUE),
              handwashing = round(mean(handwashing, na.rm = TRUE), 1),
              defecation = round(mean(defecation, na.rm = TRUE), 1))
}

summary_table <- aggregate_data(1970, 2020)
