# Summary_information.R 
# A source file that takes in a dataset and returns a list of info about it:

source("../source/table.R")

summary_info <- list()

most_case_country <- summary_table %>%
  filter(cases == max(cases)) %>%
  pull(Country)

most_death_country <- summary_table %>%
  filter(deaths == max(deaths)) %>%
  pull(Country)

top_5_mdc <- summary_table %>%
  arrange(desc(deaths)) %>%
  slice_head(n = 5) %>%
  pull(Country)

top_5_mcc <- summary_table %>%
  arrange(desc(cases)) %>%
  slice_head(n = 5) %>%
  pull(Country)

mc_handwash <- summary_table %>%
  filter(Country == most_case_country) %>%
  pull(handwashing)

mc_defecation <- summary_table %>%
  filter(Country == most_case_country) %>%
  pull(defecation)

md_handwash <- summary_table %>%
  filter(Country == most_death_country) %>%
  pull(handwashing)

md_defecation <- summary_table %>%
  filter(Country == most_death_country) %>%
  pull(defecation)

