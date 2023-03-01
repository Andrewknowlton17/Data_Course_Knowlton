library(tidyverse)
df <- read_csv("Data/Utah_Religions_by_County.csv")
?pivot_longer
df <- df %>% pivot_longer(cols =  -c(County,Pop_2010,Religious),
                    values_to = "religion_pct", names_to = "religion")
plot1 <-  df %>% ggplot(aes(x=Pop_2010, y=religion_pct, color=religion)) +
  geom_point()+ facet_wrap(~County)+ geom_smooth(method = 'loess',formula = 'y~x')+ theme(axis.text.x = element_text(angle = 90))
 #1 question IT seems there isnt much correlation with the population of a county and 
 #the religious distribution and percentage. 

plot2 <- df %>% ggplot(aes(x=Religious,y=religion_pct,color =Pop_2010))+geom_point()


plot3 <- df %>%  ggplot(aes(x=religion,y=religion_pct, fill=Pop_2010))+geom_bar(stat="identity") + facet_wrap(~County) +
  theme(axis.text.x = element_text(angle = 90))

#plot 3 i think best demonstrates how there isnt much correlation with the population of each county and religion percentage
#with the most populated county being Salt Lake you can see that there is a little bit more diversity but not enough to have a lot of correlation
# especially with it being so big of a difference in population its suprising there isnt more correlation

#because it is hard to make the population readable i am going to create a seperate column with low medium and high population 

df <- df %>% mutate(Pop_size = case_when(Pop_2010 <=10000 ~ "low", Pop_2010 >10000 & Pop_2010 <100000 ~"medium", Pop_2010 > 100000 ~"HIgh" ))
  
#now going to try plot 3 but with Pop_size instead of Pop_2010

plot4 <- df %>%  ggplot(aes(x=religion,y=religion_pct, fill= Pop_size))+geom_bar(stat="identity") + facet_wrap(~County) +
  theme(axis.text.x = element_text(angle = 90))
# it still doesnt seem to have much of a correlation but at least it is easier to read. 
