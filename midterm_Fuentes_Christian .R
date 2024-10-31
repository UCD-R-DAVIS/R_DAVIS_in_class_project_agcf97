library(tidyverse)
url <- 'https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/refs/heads/main/data/tyler_activity_laps_10-24.csv'
read_csv('https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/refs/heads/main/data/tyler_activity_laps_10-24.csv')
lap_dt <- read_csv(url) 
running_laps <- lap_dt %>% 
  filter(sport == 'running') %>%
  filter(total_elapsed_time_s >= 60) %>%
  filter(minutes_per_mile < 10 & minutes_per_mile > 5) %>%
  mutate(pace_cat = case_when(minutes_per_mile < 6 ~ 'fast',
  minutes_per_mile >=6 & minutes_per_mile < 8 ~ 'medium',
  T ~ 'slow'),
  form = case_when(year == 2024 ~ 'new form',
  T ~ 'old form'))
running_laps %>% group_by(form,pace_cat)
