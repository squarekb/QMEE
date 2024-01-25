library(ggplot2)
library(sf)

##a script that will read in inat.rds and make a calcualtion or plot with the data
inat <- readRDS("inat.rds")

##plotting the locations of inat observation points

## Script won't work without this, hence not reproducible (!)
## (We're going to be jerks about this)
ggplot(data = inat) + geom_point(aes(longitude, latitude), size = 0.5)

## mark: 1.95 (for non-reproducibility)

## You need to be careful about plotting lat/long. For what it's worth,
##  R has most of the power of a GIS, via the sf package ...
## the tmap package is also handy

inat_sf <- st_as_sf(inat, coords = c("longitude", "latitude"), 
         crs = "WGS84")
ggplot(inat_sf) + geom_sf(size = 0.5)
