##a script that will read in inat.rds and make a calcualtion or plot with the data
inat <- readRDS("inat.rds")

##plotting the locations of inat observation points
ggplot(data = inat) + geom_point(aes(latitude, longitude), size = 0.5)