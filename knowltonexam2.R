library(tidyverse)
library(janitor)
library(modelr)
df <- read.csv("unicef-u5mr.csv")
df <- df %>%pivot_longer(-c(CountryName,Continent,Region), names_prefix = "U5MR.", names_transform = as.numeric)
df <- df %>% clean_names()

df %>% ggplot(aes(x=name,y=value,group=country_name)) + geom_line()+ facet_wrap(~continent)



df %>% group_by(continent,name) %>%  summarize(u5mr_mean = mean(value,na.rm = TRUE)) %>%  
  ggplot(aes(x=name, y=u5mr_mean,color=continent))+ geom_line()


mod1 <- glm(data = df, formula = value ~ name)

mod2 <-  glm(data=df, formula = value ~ name +continent)

mod3 <-  glm(data= df , formula = value~ name * continent )

gather_predictions(df,mod1,mod2,mod3) %>%  ggplot(aes(x=name,y=pred,color = continent))
+ geom_smooth(method= "glm") + facet_wrap(~model)

