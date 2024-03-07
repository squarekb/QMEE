library(tidyverse)
library(dplyr)
library(ggplot2)

## JD Looks good. Might have been cooler if you had used your cleaned data from previous assignment.

#importing data and adding occupancy as a factor, creating a longer dataset with gather()
data <- (read_csv("data/edna.csv", col_types=cols())
         %>% mutate(occupancy = as.factor(occ))
         %>% gather('size', 'water_temp','air_temp','pH','salinity','do', 'turbidity', 'cond', 'canopy_pct', 'tds', 'day', key = "env", value = "score")
)

#boxplots of environmental variables by occupancy, scales are adjusted by the bounds of each environmental variable using "free"
figure <- ggplot(data, aes(x=score, y=occupancy)) + 
  geom_boxplot(aes(fill=occupancy), show.legend = FALSE)+
  facet_wrap(~env, scales = "free")

## JD: You should try to suppress the legend, since it's redundant.
## BS: legend removed with show.legend = FALSE

## Grade: 2

print(figure)
