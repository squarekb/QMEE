setwd("C:/Users/bradl/Desktop/myrepo")

#final is in new directory "data"
dir.create("data")
download.file(url="https://ndownloader.figshare.com/files/2292169",
              destfile = "data/portal_data_joined.csv")
list.files("data")
ls()

library(tidyverse)
dd <- read_csv("data/portal_data_joined.csv")

install.packages(c("tidyverse", "hexbin", "patchwork", "RSQLite"))

str(dd)

##select grabs columns
select(dd, plot_id, species_id, weight)

##filter (including and excluding rows)
filter(dd, year == 1995)

##pipe (%>% or |>)
survey2 <- dd %>%
  select(year, record_id) %>%
  filter(year == 1995)

##mutate (modify an old variable or make a new variable)
dd %>% mutate(weight_kg = weight/1000, squared_weight =weight^2)

spec(dd)
summary(dd)

##problems function comes from these packages
library(readr)
library(dplyr)

problems(dd)

## replace blank values with NA in read_csv("data/portal_data_joined.csv, n=c("","NA","0000-00-00","1972-12-00"))
