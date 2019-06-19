library(ggplot2)
library(gganimate)
library(dplyr)

df<-read.csv('adult.csv')

new_df<-filter(df,County=='Bronx'|County=='Kings'|County=='Queens'|County=='New York')

#Base
ggplot(new_df, aes(County, Total, size =Total, colour = County)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
 #scale_colour_manual(values = county_colors) +
  scale_size(range = c(2, 12)) +
 # scale_x_log10() +
 # facet_wrap(~County) +
  # Here comes the gganimate specific bits
  labs(title = 'Year: {frame_time}', x = 'County', y = 'Total Crime') +
  transition_time(Year)+
  ease_aes('linear')


#red Dot as lead
anim2 <- ggplot(new_df, aes(Year, Total, group = County)) +
  geom_line() +
  geom_point(aes(group = seq_along(Year))) +
  geom_point(colour='red',size =3) +
  transition_reveal(Year)
anim2
#Changing dot bassed on County Name (Without Facet)
anim2 <- ggplot(new_df,aes(Year, Total, group = County,color=County)) +
  geom_line() +
  geom_point(aes(group = seq_along(Year))) +
  geom_point() +
transition_reveal(Year)
anim2
#With Facet
anim2 <- ggplot(new_df,aes(Year, Total, group = County,color=County)) +
  geom_line() +
  geom_point(aes(group = seq_along(Year))) +
  geom_point() +
  facet_wrap(~County)
  transition_reveal(Year)
anim2
#===========================================================================
library(tidyverse)
library(reshape2)

#From tall to long format
a<-new_df %>% tidyr::gather("id", "value", 4:13)
a$id <- as.factor(a$id)
str(a)
#Crime Types in 5 Cities
  ggplot(a, aes(Year, Total,color=County))+
  #geom_line() +
  geom_point(aes(Year,value,group = seq_along(id))) +
  geom_line(aes(Year,value)) +
  facet_wrap(~id)+
    transition_reveal(Year)
   #shadow_wake(wake_length = 0.5)

 # 4 Cities with Crime Types
  ggplot(a, aes(Year, Total,color=id))+
    #geom_line() +
    geom_point(aes(Year,value,group = seq_along(id))) +
    geom_line(aes(Year,value))+
    #geom_point() +
    facet_wrap(~County)+
    transition_reveal(Year)
    #shadow_wake(wake_length = 0.5)
  
#========================================================================
df1<-read.csv('nyjob1.csv')
df1$Unemployment.Rate<-gsub( "%", "", as.character(df1$Unemployment.Rate))

df2<-filter(df1,Area=='Bronx County'|Area=='Kings County'|Area=='Queens County'|Area=='New York City')

#Renaming
df2$Area<-gsub( "County", "", as.factor(df2$Area))
names(df2)[names(df2) == 'Area'] <- 'County'

# 1990-2017 data filtering
new_df1<-new_df%>% filter(Year %in% (1990:2017))

new_df2<-df2%>% filter(Year %in% (1990:2017))
new_df2
new_df1

new_df2<-new_df2 %>%
  group_by(County, Year,'Unemployed') %>%
  summarize(sum(Unemployed))
str(new_df2)
new_df2<-as.data.frame(new_df2)
new_df2$County<-as.factor(new_df2$County)

new_df3<-merge(new_df1,new_df2,by="row.names")
colnames(new_df3)
names(new_df3)[names(new_df3) == 'sum(Unemployed)'] <- 'Sum_Unemployed'
str(new_df3)

new_df3['log_total']<-log10(new_df3$Total)
new_df3['log_unemp']<-log10(new_df3$Sum_Unemployed)
#================================================
#plotting

ggplot(new_df3, aes(Year.x, log_unemp,color=County.x))+
  #geom_line() +
  geom_point(aes(group = seq_along(County.x))) +
  geom_line()+
  geom_point(aes(Year.x,log_total,group = seq_along(County.x)))+
  geom_line(aes(Year.x,log_total))+
  #geom_line(aes(Year,value))+
  #geom_point() +
  facet_wrap(~County.x)+
  transition_reveal(Year.x)+
  ease_aes('linear')
#shadow_wake(wake_length = 0.5)