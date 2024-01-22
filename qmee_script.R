library(unmarked)
library(tidyverse)
library(dplyr)

#importing data
data <- read_csv("qmee_data.csv")

#creating a new variable
## JD: This is fine; you should also check that you can do this with dplyr/mutate
data$tempdiff <- data$water_temp - data$air_temp

#Presence/absence matrix
y = data[,1:15]
## JD: This doesn't seem like good code; maybe try to be tidy and specify exactly what you want
## Currently, it doesn't seem to do _anything_ (you already have 15 columns) -- maybe this is related to why the script does not run (it gives an error at the end)

#Site and observation covariates
siteCovs <- y[,c("site")]
## JD: This looks like it's just equivalent to the simpler y[["site"]] or y$site (the former is more robust)
obsCovs <- list(date=y[,c("edna_occ","wetland_size","pct_pos_qpcr","water_temp","air_temp","pH","salinity","rdo_conc","turbidity","conductivity","canopy_cover","tds","julian_day_eDNA","tempdiff")])
## JD: Avoid ugly lists like this; there's probably a tidy way to do what you're trying to do, but I'm not quite sure what you're trying to do.

#Creating a special data.frame for analysis in unmarked
umf <- unmarkedFrameOccu(y = y, siteCovs = siteCovs, obsCovs = obsCovs)

## JD: Please make sure in future that your scripts run (beginning to end, no errors)
## Grade: 2 (fine)
