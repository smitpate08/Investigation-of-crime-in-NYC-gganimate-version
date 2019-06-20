library(ggplot2)
library(gganimate)
library(dplyr)
library(tidyverse)
library(reshape2)


#Reading Dataset 1
#This Dataset containg crimes in NY between 1970-2017
df<-read.csv('adult.csv')

#Filtering 4 boroughs of interest
new_df<-filter(df,County=='Bronx'|County=='Kings'|County=='Queens'|County=='New York')

#Basic plot of Total Crimes in 4 boroughs, Size representing Crimes
ggplot(new_df, aes(County, Total, size =Total, colour = County)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
 #scale_colour_manual(values = county_colors) +
  scale_size(range = c(2, 12)) +
  labs(title = 'Year: {frame_time}', x = 'County', y = 'Total Crime') +
  transition_time(Year)+
  ease_aes('linear')

#Scatter plot of Total crimes in 4 boroughs
#red Dot as lead
anim2 <- ggplot(new_df, aes(Year, Total, group = County)) +
  geom_line() +
  geom_point(aes(group = seq_along(Year))) +
  geom_point(colour='red',size =3) +
  transition_reveal(Year)
anim2

#Changing Dot color based on County Name (Without Facet)
anim3 <- ggplot(new_df,aes(Year, Total,color=County)) +
  #geom_line() +
  geom_point(aes(Year, Total,group = seq_along(County))) +
  geom_line(aes(Year,Total)) +
  #facet_wrap(~County)+
  labs(title = 'Total Crimes in 4 Boroughs', x = 'Year', y = 'Total Crime',color='Boroughs') +
  transition_reveal(Year)
anim3


#With Facet
anim4 <- ggplot(new_df,aes(Year, Total,color=County)) +
  #geom_line() +
   geom_point(aes(Year, Total,group = seq_along(County))) +
   geom_line(aes(Year,Total)) +
  facet_wrap(~County)+
  transition_reveal(Year)
anim4
#========================================================================================================================================
#Getting all Crime Types 
#From tall to long format

a<-new_df %>% tidyr::gather("id", "value", 4:13)
a$id <- as.factor(a$id) #Converting data into factor

#All Crime Types in 4 Boroughs
  ggplot(a, aes(Year, Total,color=County))+
  #geom_line() +
  geom_point(aes(Year,value,group = seq_along(id))) +
  geom_line(aes(Year,value)) +
  facet_wrap(~id)+
  transition_reveal(Year)

 # Facetted crime Types in 4 boroughs
    ggplot(a, aes(Year, Total,color=id))+
    #geom_line() +
    geom_point(aes(Year,value,group = seq_along(id))) +
    geom_line(aes(Year,value))+
    #geom_point() +
    facet_wrap(~County)+
    transition_reveal(Year)+
    labs(title = 'Crime Types in 4 boroughs', x = 'Year', y = 'Total Crime')
    #shadow_wake(wake_length = 0.5)
  
#=========================================================================================================================================
#Combining two data sets
#Data Set 2 : 'Unemployment Dataset"
    
df1<-read.csv('nyjob1.csv')
    
#Removing % present in "Unemployment rate" column    
df1$Unemployment.Rate<-gsub( "%", "", as.character(df1$Unemployment.Rate))

#Filtering Boroughs of interest
df2<-filter(df1,Area=='Bronx County'|Area=='Kings County'|Area=='Queens County'|Area=='New York City')

#Renaming/Comverting
df2$Area<-gsub( "County", "", as.factor(df2$Area))
names(df2)[names(df2) == 'Area'] <- 'County'

# 1990-2017 data filtering from both dataset
new_df1<-new_df%>% filter(Year %in% (1990:2017))
new_df2<-df2%>% filter(Year %in% (1990:2017))

#Grouping new dataset by Boroughs, Year and summing Unemployment
new_df2<-new_df2 %>%
  group_by(County, Year,'Unemployed') %>%
  summarize(sum(Unemployed))

#Converting grouped data into factor
new_df2<-as.data.frame(new_df2)
new_df2$County<-as.factor(new_df2$County)

#Merging dataframes
new_df3<-merge(new_df1,new_df2,by="row.names")

#Renaming column
names(new_df3)[names(new_df3) == 'sum(Unemployed)'] <- 'Sum_Unemployed'

#Log Transformation of Total Crime and Unemployment between 1990-2017
new_df3['log_total']<-log10(new_df3$Total)
new_df3['log_unemp']<-log10(new_df3$Sum_Unemployed)
#========================================================================================================================================
#Final Plotting

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
  labs(title = 'Unemployment & Crimes in 4 Boroughs between 1990-2017',subtitle = 'Top line = Unemployment, Bottom line =Total Crime', x = 'Year', y = 'Unemployment (Log Transformed)',color='Boroughs')+
  ease_aes('linear')
#shadow_wake(wake_length = 0.5)
