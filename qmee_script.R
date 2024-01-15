data <- read.csv("qmee_data.csv")
print(data)
data$tempdiff <- data$water_temp - data$air_temp
print(data)