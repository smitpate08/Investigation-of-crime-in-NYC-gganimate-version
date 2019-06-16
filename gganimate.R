library(ggplot2)
library(gganimate)
library(gapminder)
library(dplyr)

df<-read.csv('adult.csv')

new_df<-filter(df,County=='Bronx'|County=='Kings'|County=='Queens'|County=='New York')


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



#Line Chart
ggplot(new_df) +geom_line(aes(Felony.Total, Total, size =Total, colour = County)) +
  geom_point(aes(Felony.Total, Total, size =Total, colour = County),alpha = 0.7, show.legend = FALSE) +
  #scale_colour_manual(values = county_colors) +
  scale_size(range = c(2, 12)) +
  # scale_x_log10() +
  # facet_wrap(~County) +
  # Here comes the gganimate specific bits
  labs(title = 'Year: {frame_time}', x = 'County', y = 'Total Crime') +
  #transition_time(Year)+
transition_reveal(Year)+
  ease_aes('linear')

warnings()

