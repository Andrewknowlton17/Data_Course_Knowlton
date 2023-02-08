# 1
covid <- read.csv("cleaned_covid_data.csv")

library(tidyverse)
#2

A_States <- covid %>%  filter(substr(Province_State,1,1)=="A")


#3

Aplot <- A_States %>% ggplot(aes(x=Last_Update, y=Deaths))+ geom_point()
Aplot + facet_wrap(~Province_State, scales = "free")+geom_smooth(method="lm",se=FALSE) 

#4
  state_max_fatality_ratio <-  covid %>% filter(!is.na(Province_State)) %>% group_by(Province_State,) %>% 
     summarize(Maximum_Fatality_Ratio = max(Case_Fatality_Ratio,na.rm=TRUE)) %>% arrange(desc(Maximum_Fatality_Ratio))

  #5
  state_max_fatality_ratio %>%  ggplot(aes(x=reorder(Province_State, -Maximum_Fatality_Ratio),y=Maximum_Fatality_Ratio)) +geom_bar(stat = "identity" ) +
    theme(axis.text.x = element_text(angle=90,hjust = 1)) 
  
  
  
  
    
