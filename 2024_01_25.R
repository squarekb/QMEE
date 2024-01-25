library(readr)
library(tidyverse)

setwd('C:/Users/bradl/Desktop/myrepo/homie')

widedat <- read_csv("CA_homicide.csv", col_types=cols())

popdat <- read_csv("CA_popdat.csv", col_types=cols())

regions <- read_csv("canadaRegions.csv", col_types=cols())

summary(widedat)

#we will want to make this into a long, tidy data frame

