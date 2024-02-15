library(tidyverse)
library(dplyr)
library(ggplot2); theme_set(theme_bw())
library(performance)
library(emmeans)
library(dotwhisker)
library(broom)

## bringing in poresize data, creating a factor "poresize"
data <- (read_csv("data/poresize_exp.csv", col_types = cols())%>%
           mutate(poresize = as.factor(pore))%>%
           subset(select = -c(pore))
         )

## visualization
ggplot(data, aes(poresize, copies))+
  geom_boxplot()+
  geom_point()

## linear modeling approach, copies response to poresize input
lm <- lm(copies~poresize, data=data, contrasts = list(poresize = contr.sum))

#diagnostics
plot(lm, id.n=4)
check_model(lm)

summary(lm)

## pairwise comparisons of each mean
e1 <- emmeans(lm, spec = ~ poresize)

plot(pairs(e1)) + geom_vline(xintercept = 0, lty = 2)

## expected marginal means plot
plot(e1) + geom_vline(xintercept = 0, lty = 2)

summary(e1)








     
         