surveys<- read.csv("data/portal_data_joined.csv")
#select(surveys, species_id, weight, plot_id)
library(dplyr)
select(surveys, species_id, weight, plot_id)
colnames(surveys)
surveys_base <- surveys[1:5000, c(6, 9, 13)]
surveys_base <- surveys_base[complete.cases(surveys_base),]
surveys_base$species_id <- factor(surveys_base$species_id)                             
surveys_base$plot_type <- factor(surveys_base$plot_type)
levels(surveys_base$species_id)
