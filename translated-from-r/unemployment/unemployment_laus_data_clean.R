library(ipumsr)
library(dplyr)
library(ggplot2)
library(tidyr)

unemployment_2024 <- read.csv("LAUS_Report_2024.csv")
locations <- read.csv("../../location_countyNames copy.csv") |>
  select(Location, LocationId)

cleaned_uemp_2024 <- unemployment_2024 |>
  select(Area, Year, Area.Type, Unemployment, Unemployment.Rate) |>
  mutate(Unemployment = gsub(",", "", Unemployment)) |>
  mutate(Unemployment.Rate = Unemployment.Rate / 100) |>
  mutate(Area.Type = ifelse(Area.Type == "Texas", "State", "County"), Area.Type) |>
  rename(Location = Area, 
         TimeFrame = Year, 
         LocationType = Area.Type) |>
  mutate(Location = trimws(Location, which = "right")) |>
  arrange(desc(LocationType)) 
withids_2024 <- left_join(cleaned_uemp_2024, locations, by = "Location")

nums_2024 <- withids_2024 |>
  select(-Unemployment.Rate) |>
  mutate(DataFormat = "Number") |>
  rename(Data = Unemployment)

percents_2024 <- withids_2024 |>
  select(-Unemployment) |>
  mutate(DataFormat = "Percent") |>
  rename(Data = Unemployment.Rate)

final_unemployment_2024 <- rbind(nums_2024, percents_2024) |>
  arrange(desc(LocationType), Location, DataFormat) |>
  select(LocationId, Location, LocationType, TimeFrame, Data, DataFormat)
