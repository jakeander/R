library(forecast)
library(zoo)
library(ggplot2)

#Putting the Air Passengers time series dataset 
AP <- AirPassengers

#Checking the class of the dataset
class(AP)

#Forecasting the twelve months out
AP_12 <- forecast(AirPassengers, 12)

#Storing the results to the forecast
AP_12 <- ts(AP_12$mean, start=1961, frequency = 12)

#Adding the results onto the old air passengers dataset
AP_72 <- ts(c(AP, AP_12), start=1949, frequency = 12)

#Looking at the result
AP_72

#Creating an expanded time series data frame with a forecast
df <- data.frame(date=as.Date(time(AP_72)), Y=as.matrix(AP_72))

#Plotting the time series data frame using a line chart and smooth chart
ggplot() + 
  geom_line(data=df[df$date<"1961-01-01",], aes(x=date, y=Y)) + 
  geom_smooth(data = df[df$date>="1961-01-01",], aes(date,Y))
