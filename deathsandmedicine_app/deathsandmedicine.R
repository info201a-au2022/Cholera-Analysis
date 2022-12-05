library(tidyverse)
library(ggplot2)
deaths <- read.csv("../data/choleradeaths.csv")
medicine <- read.csv("../data/medianmedicines.csv")

#Filtering cholera deaths from 2007-2013 to match medicine data
country_deaths <- deaths %>%
  filter(Year > 2006, Year < 2014) %>%
  group_by(Country) %>%
  summarise(total_deaths = sum(as.numeric(Number.of.reported.deaths.from.cholera)))

#Dropping the first row of median data
country_medicine <- medicine[-1,] %>%
  group_by(X) %>%
  rename(Country = X) %>%
  summarise(medicine_av = Median.availability.of.selected.generic.medicines.......Public)

#Joinning the two data sets            
deaths_medicine <- left_join(country_medicine, country_deaths) %>%
  drop_na()

#Plot of just the filtered cholera deaths
death_plot <- ggplot(data = deaths_medicine) +
  geom_col(mapping = aes(
    x = total_deaths,
    y = Country,
    fill = "Total Deaths")
  )
death_plot

#Plot of just availability of public medicine
medicine_plot <- ggplot(data = deaths_medicine) +
  geom_col(mapping = aes(
    x = medicine_av,
    y = Country,
    fill = "Total Percentage"
  ))
medicine_plot

#Plot comparing deaths and medicine
death_medicine_plot <- ggplot(data = deaths_medicine) +
  geom_col(mapping = aes(
    x = total_deaths,
    y = Country,
    fill = "Total Deaths")
    ) +
  geom_col(mapping = aes(
    x = as.numeric(medicine_av),
    y = Country,
    fill = "Median Availability of Public Medicine"
  )) +
  labs(x = "Total Deaths Recorded", y = "Countries", title = "Correlation between Cholera Deaths and Availablity of Medicine(2007-2013)")
death_medicine_plot

