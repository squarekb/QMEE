library(readr)
library(tidyverse)
library(dplyr)

setwd('C:/Users/bradl/Desktop/myrepo')

widedat <- read_csv("homie/CA_homicide.csv", col_types=cols())

popdat <- (read_csv("homie/CA_popdat.csv", col_types=cols())%>%
             mutate(Place=factor(Place))
)

regions <- (read_csv("homie/canadaRegions.csv", col_types=cols())%>%
              mutate(Place=factor(Place))%>%
              mutate(Region=factor(Region))
)

#or use %>%mutate(across(c(Region,Place), factor))

#we will want to make this into a long, tidy data frame
## use a join operator 

places <- (full_join(popdat, regions, by='Place')%>%
             filter(Place != "Canada")%>%
             rename(Population = Pop_2011)
)
summary(places)

## Pivot all columns except for Place
rates <- (widedat%>%
            pivot_longer(cols=-Place, names_to ="Year", values_to = "rate")%>%
            filter(Place != "Canada")%>%
            mutate(Place=factor(Place), Year = as.numeric(Year))
)

save(places, rates, file, file = "tmp/homRead.rda")

## save uses rda

## rates and places represent current relational DB
## DO another merge to check and to make a file for a particular use
