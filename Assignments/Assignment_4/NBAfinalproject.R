library(tidyverse)
df %>% ggplot(aes(x=Date ,y=WinningTeam, color=GameType)) + geom_point()
ggsave("nbaplot.pdf")
