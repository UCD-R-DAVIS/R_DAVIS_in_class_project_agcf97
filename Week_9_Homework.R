library(tidyverse)
surveys <- read.csv("data/portal_data_joined.csv")
glimpse(surveys)
for(i in unique(surveys$taxa)){
  taxanames <- surveys[surveys$taxa == i, ]
  longtaxon <- taxanames[nchar(taxanames$species) == max(nchar(taxanames$species)),] |>
    select(species)
  print(paste0("The longest species name(s) among ", i, "s is/are: "))
  print(unique(longtaxon$species))
}
mloa <- read_csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")
glimpse(mloa)
maxval <- mloa |>
  select("windDir","windSpeed_m_s","baro_hPa","temp_C_2m",
         "temp_C_10m","temp_C_towertop","rel_humid", "precip_intens_mm_hr") |>
  map(max, na.rm = TRUE)
C_to_F <- function(tempF) {
  return((tempC * 1.8) + 32)
}
mloa1 <- mloa |>
  mutate(temp_F_2m = C_to_F(mloa$temp_C_2m), 
         temp_F_10m = C_to_F(mloa$temp_C_10m), 
         temp_F_towertop = C_to_F(mloa$temp_C_towertop))
glimpse(mloa1)
