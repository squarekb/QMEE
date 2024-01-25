library(readr)
library(dplyr)
library(tidyr)
library(forcats)

load("tmp/homRead.rda")

## this is our useful table, but it's not tidy, it's redundant
## these problems are best fixed upstream
combined <- (full_join(places, rates, by = "Place"))

## fct_reorder reorders factors levels without changing anything else

saveRDS(combined, file="tmp/homMerge.rds")