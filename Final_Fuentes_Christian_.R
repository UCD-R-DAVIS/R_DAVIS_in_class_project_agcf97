# Load necessary libraries
library(tidyverse)
library(ggplot2)




url <- "https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv"
running_activities <- read_csv(url)


head(running_activities)


running_activities <- running_activities %>%
  mutate(timestamp = as.POSIXct(timestamp, format = "%Y-%m-%d %H:%M:%S"))


running_activities <- running_activities %>%
  filter(minutes_per_mile <= 10 & minutes_per_mile >= 5) %>%  
  filter(total_elapsed_time_s > 60)  

running_activities <- running_activities %>%
  mutate(time_period = case_when(
    year(timestamp) < 2024 ~ "Pre-2024",
    year(timestamp) == 2024 & month(timestamp) <= 6 ~ "Jan-Jun 2024",
    year(timestamp) == 2024 & month(timestamp) > 6 ~ "Jul 2024-Present",
    TRUE ~ "Other"
  ))


running_activities <- running_activities %>%
  mutate(speed_m_per_min = (total_distance_m / total_elapsed_time_s) * 60)

# Scatter plot of SPM vs Speed 
ggplot(running_activities, aes(x = speed_m_per_min, y = steps_per_minute, color = time_period)) +
  geom_point(alpha = 0.7, size = 3) +  
  geom_smooth(method = "lm", aes(color = time_period), se = FALSE, linetype = "solid") +  
  labs(
    x = "Speed (meters per minute)", 
    y = "Steps per Minute (SPM)", 
    title = "SPM vs Speed by Lap",
    subtitle = "Trendlines for Different Time Periods",
    color = "Time Period"  # Legend title for color
  ) +
  theme_minimal() +  # Clean theme
  theme(
    legend.position = "top",          
    legend.title = element_text(size = 12),  
    legend.text = element_text(size = 10),   
    axis.title = element_text(size = 14),    
    axis.text = element_text(size = 12),     
    plot.title = element_text(size = 16, face = "bold"),  
    plot.subtitle = element_text(size = 12, face = "italic"),  
    panel.grid.major = element_line(color = "grey", linewidth = 0.5),  
    panel.grid.minor = element_blank()  
  )

#post-intervention runs (after July 1, 2024)
post_intervention <- running_activities %>%
  filter(year(timestamp) == 2024 & month(timestamp) > 6)


post_intervention <- post_intervention %>%
  group_by(date = as.Date(timestamp)) %>%
  mutate(lap_number = rank(timestamp)) %>%
  ungroup()


post_intervention_laps <- post_intervention %>%
  filter(lap_number <= 3)


ggplot(post_intervention_laps, aes(x = lap_number, y = speed_m_per_min, color = factor(lap_number))) +
  geom_point(alpha = 0.7, size = 3) +  
  geom_line(aes(group = 1), linetype = "solid") +  
  labs(
    x = "Lap Number", 
    y = "Speed (meters per minute)",
    title = "Speed vs Lap Number for Post-Intervention Runs (Laps 1-3)",
    subtitle = "Tracking Speed and Lap Number After July 1, 2024",
    color = "Lap Number"
  ) +
  theme_minimal() +  # Clean theme
  theme(
    legend.position = "top",          
    legend.title = element_text(size = 12),  
    legend.text = element_text(size = 10),   
    axis.title = element_text(size = 14),    
    axis.text = element_text(size = 12),     
    plot.title = element_text(size = 16, face = "bold"),  
    plot.subtitle = element_text(size = 12, face = "italic"),  
    panel.grid.major = element_line(color = "grey", linewidth = 0.5),  
    panel.grid.minor = element_blank()  
  )

url <- "https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv"
running_activities <- read_csv(url)


running_activities <- running_activities %>%
  mutate(timestamp = as.POSIXct(timestamp, format = "%Y-%m-%d %H:%M:%S"))


running_activities <- running_activities %>%
  filter(minutes_per_mile <= 10 & minutes_per_mile >= 5) %>%  # Filter for normal running pace
  filter(total_elapsed_time_s > 60)  # Remove laps with elapsed time less than 60 seconds


running_activities <- running_activities %>%
  mutate(time_period = case_when(
    year(timestamp) < 2024 ~ "Pre-2024",  # Before 2024
    year(timestamp) == 2024 & month(timestamp) <= 6 ~ "Jan-Jun 2024",  # Rehab period
    year(timestamp) == 2024 & month(timestamp) > 6 ~ "Jul 2024-Present",  # Post-rehab
    TRUE ~ "Other"
  ))


running_activities <- running_activities %>%
  mutate(speed_m_per_min = (total_distance_m / total_elapsed_time_s) * 60)


ggplot(running_activities, aes(x = speed_m_per_min, y = steps_per_minute, color = time_period)) +
  geom_point(alpha = 0.7, size = 3) +  
  geom_smooth(method = "lm", aes(color = time_period), se = FALSE, linetype = "solid") +  
  labs(
    x = "Speed (meters per minute)", 
    y = "Steps per Minute (SPM)", 
    title = "Relationship Between SPM and Speed by Lap",
    subtitle = "Trendlines for Different Time Periods",
    color = "Time Period"  # Legend title for color
  ) +
  theme_minimal() +  
  theme(
    legend.position = "top",  
    legend.title = element_text(size = 12),  
    legend.text = element_text(size = 10),   
    axis.title = element_text(size = 14),    
    axis.text = element_text(size = 12),     
    plot.title = element_text(size = 16, face = "bold"),  
    plot.subtitle = element_text(size = 12, face = "italic"),  
    panel.grid.major = element_line(color = "grey", linewidth = 0.5),  
    panel.grid.minor = element_blank()  