library(tidyverse)
library(dplyr)
library(ggplot2)

#importing data
data <- read_csv("qmee_data.csv")

#changing edna_occ to a factor
occ_vec <- c(data$edna_occ)
factor_occ <- factor(occ_vec)

#mutating table to add occupancy as a factor
clean <- data%>%
  mutate(edna_occ, factor_occ)

#boxplot of pH for occupancy
ggplot(clean, aes(x=factor_occ, y=pH)) +
  geom_boxplot()

##tryng to execute a for loop to create a boxplot for each column in "clean" versus factor_occ
#for (i in ncol(clean)){
#  print(ggplot(clean, aes(x=factor_occ, y = clean[, i])) +
#    geom_boxplot())
#}

#facet_wrap()

