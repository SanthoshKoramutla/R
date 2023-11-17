# Question 1

library(rio)
library(moments) 
library(tidyverse) 
library(ggpubr) 
library(dplyr) 
library(readxl)
library(ggplot2)
t = import("~/Desktop/2018 Data.xlsx")

h <- ggplot(data=t, aes(x = t$`Median Family Income` , y=t$`Perc with health Insurance` ))
 h+geom_point(color="green",size=10, shape='+')+labs(title = "median household income against the percentage of the population with health insurance",
                                                  x = "Median Family Income",
                                                  y = 'Perc with health Insurance',
                                                  caption = "Correlation between Median Family Income and percentage with health Insurance")

 
  