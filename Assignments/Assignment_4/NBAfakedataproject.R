library(tidyverse)
df <- read.csv("NBAfakedata.csv")
df %>% ggplot(aes(x=day_of_Week,y=Player, color=Points_per_Game))+ geom_point()+theme_minimal()
ggsave("nbaexampleplot.pdf")
