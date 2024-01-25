library(tidyverse)
library(dplyr)
library(ggplot2)

#importing data
data <- read_csv("qmee_data.csv")

#changing edna_occ to a factor of occupancy
occ_vec <- c(data$edna_occ)
occupancy <- factor(occ_vec)

#mutating table to add occupancy as a factor
clean <- data%>%
  mutate(edna_occ, occupancy)

#boxplot of pH for occupancy
ggplot(clean, aes(x=occupancy, y=pH)) +
  geom_boxplot(aes(fill=occupancy))

##tryng to execute a for loop to create a boxplot for each column in "clean" versus factor_occ
for (i in ncol(clean)){
  print(ggplot(clean, aes(x = occupancy, y = clean[, i])) +
    geom_boxplot())
}

#facet_grid()

