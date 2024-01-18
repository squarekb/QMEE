library(tidyverse)
library(dplyr)

#import inaturalist data from csv
inat <- read_csv("iNaturalist_data.csv") 

#cleaning up inaturalist data to select rows of interest and to filter for non-obscured and research grade observations
clean <- inat %>% 
  select(id, observed_on, quality_grade, coordinates_obscured, latitude, longitude, scientific_name, common_name) %>% 
  filter(quality_grade == "research", coordinates_obscured == "FALSE")%>%
  mutate(common_name, if_else(is.na(common_name), common_name = scientific_name, common_name = common_name))

