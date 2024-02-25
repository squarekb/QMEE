library(tidyverse)
library(dplyr)
library(ggplot2)
library(performance)
library(emmeans)
library(dotwhisker)
library(broom)

##Hypothesis: eDNA yield, or copy number will be impacted by changes in wetland size and julian day of observation. 

## modified my original dataset to include DNA copy number instead of just positive or negative occupancy, dataset includes only positive observations
pos <- (read_csv("edna_data.csv",  col_types=cols())
         %>% mutate(occupancy = as.factor(occ))
         %>% subset(copy_no > 0, select = -c(occ))
)
## JD: Generally good to avoid just dropping data unless you have a reason; if you did it for simplicity for this assignment, it's find to say so.

## modeling the relationship between transformed log(copy_no) and some environmental factors expected to have influence on degradation and availability
lmint <- lm(log(copy_no)~size*day, data=pos)
lmboth <- lm(log(copy_no)~size + day, data=pos)
lmsize <- lm(log(copy_no)~size, data=pos)
lmday <- lm(log(copy_no)~day, data=pos)

## JD: Usually better to just stick with the full model, unless you have some specific concern.

## diagnostics of interaction model
plot(lmint, id.n=4)
check_model(lmint)
#note: high collinearity 

#interaction model summary
print(summary(lmint))

#coefficient plot using dwplot/dotwhisker
lmint_df <- tidy(lmint)%>%
  by_2sd(pos)

dwplot(lmint_df, 
       ci = 0.95,
       style = "dotwhisker",
       vline = geom_vline(xintercept = 0, linetype = "dashed"))

## Discussion

## JD: What do you think about the diagnostic plots?

## The coefficient plot of the "lmint" model displays rather inconclusive results as the confidence intervals of all predictors, including interactions, include positive and negative values. 
## In terms of effect sizes, the wetland size parameter (5.55 (SE = 4.39)) may have a slightly larger positive effect on the log of eDNA copy number and the julian day parameter (2.16(SE = 1.22)) may have a smaller effect. 
## JD: I can't find these numbers in the script output.
## The parameter describing the interaction between size and day (-5.66(SE = 4.51)) may have a negative effect on edna copy number but again, it is uncertain since positive and negative values are included in the CI.
## None of the parameter effects are particular clear, or significant. To re-evaluate the null hypothesis, wetland size and julian day likely have an effect on dna copy number but it is unclear. 
## JD: Do you have some way of evaluating what you would consider a biologically important effect? Can you show that these effects are small compared to that standard?
## The data I used was randomly simulated and it's likely that it does not represent the true distribution of environmental parameters that I will collect this summer.
## I noted that my diagnostic test suggested high collinearity between the size parameter and the size:day parameter, but I decided not to remove either to avoid "fishing". 

## JD: I feel like correlations between parameters and their own interactions are even less of a concern than regular interactions.

## Grade 2/3

