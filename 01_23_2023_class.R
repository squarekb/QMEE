library(ggplot2)
library(tidyverse)
library(lme4)

head(mtcars)

ggplot(mtcars, aes(x=disp, y=mpg)) +
  geom_point()+
  ##geom_smooth(method = "lm")
  geom_smooth()

m1 <- lm(mpg ~ disp, mtcars)
performance::check_model(m1)

##gives residuals, coefficients, intercepts, and statistics of m1

summary(m1)

m2 <- lm(mpg ~ cyl + disp + hp, mtcars)
dwplot(m2, by_2sd + TRUE)+
  geom_vline(xintercept = 0, lty =2)
