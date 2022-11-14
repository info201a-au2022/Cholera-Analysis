# Summary_information.R 
# A source file that takes in a dataset and returns a list of info about it:

source("../source/table.R")

summary_info <- list()
summary_info$num_observations <- nrow(summary_table)
summary_info$most_case_country <- summary_table %>%
  filter(cases == max(cases, na.rm = T)) %>%
  select(Country)
summary_info$most_death_country <- summary_table %>%
  filter(deaths == max(deaths, na.rm = T)) %>%
  select(Country)