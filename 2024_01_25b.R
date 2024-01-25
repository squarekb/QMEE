library(ggplot2); theme_set(theme_bw(base_size=14))

dat <- readRDS("tmp/homMerge.rds")

names(dat)

base <-(ggplot(dat)
      + aes(Year, rate, color=Place)
      + geom_point() + geom_line()
)

print(base)
print(base + scale_y_log10())
print(base + scale_y_continuous(trans="log1p"))
print(base + scale_y_continuous(trans="log1p")) + aes(linewidth=Population)