library(rio)
library(moments) 
library(tidyverse) 
library(ggpubr) 
library(dplyr) 
library(readxl)
library(ggplot2)

# Question 2
covid <- read_excel("~/Desktop/Combined.xlsx", sheet = 'Pasco')

covid1=tibble(covid)
colnames(covid1) <- c('Date', 'NumberofCases', 'MovingAverage')
ggplot(covid1, aes(x=NumberofCases,y=MovingAverage)) + geom_line(color="red")+
  labs(title = "  Daily Number of Cases and Moving Average for Pasco")

# Question 3

covid1$Date <- as.Date(covid1$Date, "%B %d, %Y")
covid_Hillsborough <- read_excel("~/Desktop/Combined.xlsx", sheet = 'Hillsborough')
colnames(covid_Hillsborough) <- c('Date', 'NumberofCases', 'MovingAverage')
ggplot(covid_Hillsborough, aes(x=NumberofCases,y=MovingAverage)) + 
  geom_line(aes(x = NumberofCases),color="blue", size=03) +
  geom_col(aes(y = MovingAverage),color="red")+
  labs(title = "Daily Number of Cases and Moving Average in Hillsborough")


