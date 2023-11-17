library(ggplot2)
install.packages("patchwork")
library(patchwork)

#Question 5

df1 <- read.csv("~/Desktop/2020 Cases only.csv")
df2 <- read.csv("~/Desktop/2021 Cases only.csv")


df1_proc <- subset(df1, select = -c(OBJECTID, Age_group, Case_, Case1, ChartDate) )

names(df1_proc)[names(df1_proc) == 'ObjectId2'] <- 'ObjectId'

df2_proc <- subset(df2, select = -c(Age_group, Case_, Case1, ChartDate) )

df_both <- rbind(df1_proc, df2_proc)

ggplot(df_both, aes(x=EventDate)) +geom_bar()

df_both$Date <- as.Date(df_both$EventDate, "%m/%d/%Y")
ggplot(df_both, aes(x=Date)) + geom_bar()

ggplot(df_both, aes(x=Date)) +stat_count(geom = "line")

#Question 6

df_counties1 <- df_both[(df_both$County == 'Dade' |df_both$County == 'Orange' ),]
df_counties2 <- df_both[(df_both$County == 'Brevard' |df_both$County =='Broward'),]

ggplot(df_counties, aes(x=Date)) +stat_count(geom="line")

g1 <- ggplot(df_counties1, aes(x=Date)) + stat_count(geom="line") +facet_wrap(~County, nrow = 2, ncol = 2, strip.position = "top")
g2 <- ggplot(df_counties2, aes(x=Date)) + stat_count(geom="line") +facet_wrap(~County, nrow = 2, ncol = 2, strip.position = "top")

g1/g2



