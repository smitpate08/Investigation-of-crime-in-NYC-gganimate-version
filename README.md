# Investigation of Crimes in NYC (gganimate version)

## Introduction:
The `Altair` version of the analysis can be found [here](https://www.kaggle.com/apnanaam08/investigation-of-crimes-in-ny-using-altair-library)  & [here](https://www.kaggle.com/apnanaam08/crimes-in-ny-using-altair-library-p2). The objective of this `github` repo was to explore  and learn the functionality of `gganmiate` in R. The dataset used in this analysis are also available in 'Data' folder of the repository. File titled as "adult" contains data about the total number of crimes in NYC between 1970-2017. 
The File titled as "nyjob1" contains data about the employment history of various counties in NYC between 1976-2018.
## Analysis
From `Altair` version of the analysis, it was noticed that 4 boroughs with highest crime were Bronx , Kings, Queens and New York City.
Thus, it was decided that to explore and learn `gganimate` functionality only for those 4 boroughs will be used.
First, the base plot was plotted where Total Crime was plotted on Y-axis and 4 boroughs were plotted on X-axis.The size of the dot represents the total crime. Below animation was obtained
![anim1](https://user-images.githubusercontent.com/29586703/59888166-5f9bce00-9394-11e9-8260-4766f45913ea.gif)

Next, It was decided to plot linechart where Year can be on X-axis and Total Crime on Y-axis, and total crimes from all 4 boroughs on same plot, with each line representing crime from boroughs. Below animation was obtained.
![anim2](https://user-images.githubusercontent.com/29586703/59888352-3b8cbc80-9395-11e9-9f6d-da998bcb7a21.gif)

From above animation it is very hard to see which line represents which borough's crime. So the `color` of the lines/dots were changed using `color` functionality available in `ggplot2`.
![anim3](https://user-images.githubusercontent.com/29586703/59888476-f1f0a180-9395-11e9-89c8-5c9f09faec7f.gif)

Next, `facet_wrap` function was used to plot total crimes in each 4 borough separately. Below animation displays the output.

![anim4](https://user-images.githubusercontent.com/29586703/59888588-72170700-9396-11e9-880e-94cf06ec386f.gif)

Since, the dataset contained different types of crimes such as felony,Drug, DWI and other Misdemeanor. It was decided to plot all crimes in facetted plots for all 4 boroughs, and see if any visible trend can be find.
![anim5](https://user-images.githubusercontent.com/29586703/59888882-b525aa00-9397-11e9-8f08-bde9442ab11d.gif)

Form the above animation it is very hard to detect any trend. Thus, it was decided to plot facetted plot of 4 broughs and all crimes.

![anim6](https://user-images.githubusercontent.com/29586703/59888989-409f3b00-9398-11e9-95f8-8c85e1dd6b04.gif)

Finally, the Employment data was mereged with total crimes dataset. For the below animation, Year between 1990-2017 were subsetted from both dataset becasue the second dataset did not contain sufficent data for those 4 boroughs. Additionally, log transformation was performed for both the dataset, this was done to normalize the dataset.
![anim7](https://user-images.githubusercontent.com/29586703/59889217-55c89980-9399-11e9-94d9-154d5e55e78e.gif)

## Results
 Eventhough Unemplolyment rate was high during 1990's in 4 boroughs, the crime rate was much lower (similar conclusion was obtained in `Altair` version too) Thus, there can be other factors such as Poverty, Eduction, and Population demographics that might have caused increase in crimes in NYC during 1990's.
 
## What's next ?
Find dataset that involves population demographics and try to correlate with crime dataset.
