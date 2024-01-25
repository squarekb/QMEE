library(tidyverse)
library(dplyr)
library(ggplot2)

#importing data and adding occupancy as a factor, creating a longer dataset with gather()
data <- (read_csv("qmee_data.csv", col_types=cols())
         %>% mutate(occupancy = as.factor(edna_occ))
         %>% gather('wetland_size', 'water_temp','air_temp','pH','salinity','rdo_conc', 'turbidity', 'conductivity', 'canopy_cover', 'tds', 'julian_day_eDNA', key = "env", value = "score")
         %>% subset(select = -c(edna_occ,pct_pos_qpcr))
)

#boxplots of environmental variables by occupancy, scales are adjusted by the bounds of each environmental variable using "free"
figure <- ggplot(data, aes(x=occupancy, y=score)) + 
  geom_boxplot(aes(fill=occupancy))+
  facet_wrap(~env, scales = "free")

print(figure)
