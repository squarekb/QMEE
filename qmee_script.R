library(unmarked)

data <- read.csv("qmee_data.csv")
data$tempdiff <- data$water_temp - data$air_temp

#Presence/absence matrix
y = data[,1:15]

#Site and observation covariates
siteCovs <- y[,c("site")]
obsCovs <- list(date=y[,c("edna_occ","wetland_size","pct_pos_qpcr","water_temp","air_temp","pH","salinity","rdo_conc","turbidity","conductivity","canopy_cover","tds","julian_day_eDNA","tempdiff")])

#Creating a special data.frame for analysis in unmarked
umf <- unmarkedFrameOccu(y = y, siteCovs = siteCovs, obsCovs = obsCovs)
