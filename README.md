# Investigation of Crimes in NYC (gganimate version)

## Introduction:
The `Altair` version of the analysis can be found [here](https://www.kaggle.com/apnanaam08/investigation-of-crimes-in-ny-using-altair-library)  & [here](https://www.kaggle.com/apnanaam08/crimes-in-ny-using-altair-library-p2). The objective of this `github` repo was to explore the functionality of `gganmiate` in R. The dataset used in this analysis are also available in 'Data' folder of the repository. File titled as "adult" contains data about the total number of crimes in NYC between 1970-2017. 
The File titled as "nyjob1" contains data about the employment history of various counties in NYC between 1976-2018.
## Analysis
From `Altair` version of the analysis, it was noticed that 4 boroughs with highest crime were Bronx , Kings, Queens and New York City.
Thus, it was decided that to explore and learn `gganimate` functionality only for those 4 boroughs will be used.
First, the base plot was plotted where Total Crime was plotted on Y-axis and 4 boroughs were plotted on X-axis.The size of the dot represents the total crime. Below animation was obtained
![anim1](https://user-images.githubusercontent.com/29586703/59888166-5f9bce00-9394-11e9-8260-4766f45913ea.gif)

Next, It was decided to plot linechart where Year can be on X-axis and Total Crime on Y-axis, and total crimes from all 4 boroughs on same plot, with each line representing crime from boroughs. Below animation was obtained.
![anim2](https://user-images.githubusercontent.com/29586703/59888352-3b8cbc80-9395-11e9-9f6d-da998bcb7a21.gif)

From above animation it is very hard to see which line represents which borough's crime. So the `color` of the lines/dots were changed using `color` functionality available in `ggplot2`.

