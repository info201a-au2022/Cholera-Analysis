# Summary_information.R 
# A source file that takes in a dataset and returns a list of info about it:

source("../source/table.R")

summary_info <- list()
summary_info$num_observations <- nrow(summary_table)
summary_info$most_case_country <- summary_table %>%
  filter(cases == max(cases, na.rm = T)) %>%
  pull(Country)
summary_info$most_death_country <- summary_table %>%
  filter(deaths == max(deaths, na.rm = T)) %>%
  pull(Country)
summary_info$top_5_mcc <- summary_table %>%
  arrange(desc(cases)) %>%
  slice(1:5) %>%
  pull(Country)
summary_info$top_5_mdc <- summary_table %>%
  arrange(desc(deaths)) %>%
  slice(1:5) %>%
  pull(Country)
summary_info$ldc <-  summary_table %>%
  filter(cases == min(cases, na.rm = T)) %>%
  pull(Country)
summary_info$lcc <- summary_table %>%
  filter(deaths == min(deaths, na.rm = T)) %>%
  pull(Country)
summary_info$mdc_handwash <- summary_table %>%
  filter(Country == summary_info$most_death_country) %>%
  pull(handwashing)
summary_info$mcc_handwash <- summary_table %>%
  filter(Country == summary_info$most_case_country) %>%
  pull(handwashing)
summary_info$ldc_handwash <-summary_table %>%
  filter(Country == summary_info$ldc) %>%
  pull(handwashing)
summary_info$lcc_handwash <- summary_table %>%
  filter(Country == summary_info$lcc) %>%
  pull(handwashing)
  
