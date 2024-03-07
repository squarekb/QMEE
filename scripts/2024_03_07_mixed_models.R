library(lme4)
library(lmerTest)

install.packages("broom.mixed")
library(broom.mixed)
data("sleepstudy")

m1 <- lmer(Reaction ~ 1 + Days + (1 + Days | Subject),
             data = sleepstudy)
summary(m1)

library(performance)
check_model(m1)

tidy(m1)
dotwhisker::dwplot(m1, effects = "fixed")