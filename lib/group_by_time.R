###time trends
load("after2016.RData")

dim(after16)

library(dplyr)
library(ggplot2)
by_time <- group_by(after16,time)
counts_by_time <- summarise(by_time,count = n())
counts_by_time$time<-as.POSIXct(as.numeric(as.character(counts_by_time$time)),origin="1970-01-01",tz="GMT")
plot(counts_by_time,type='l')

ggplot(counts_by_time, aes(time, count)) +
        geom_point(alpha = 0.8) +
        geom_smooth() +
        scale_size_area()+ ylim(0, 5000)


####Genres
source("convertTitleGenres.R")
movies_data <- read.csv("movies.csv")
convertTitleGenre(movies_data[1,1])
ids<-unique(as.vector(movies_data[,1]))
replaces <- as.character(as.numeric(ids))
ids[!is.na(replaces)] <- replaces[!is.na(replaces)]
genres<-sapply(ids,convertGenre)
length(ids)


#stock
stock_price <- read.csv("table.csv")
index <- seq(3500:1)
index <- sort(index,decreasing = TRUE)
stock_price <- stock_price[index,]
stock_data <- data.frame(stock_price[,1],stock_price$Adj.Close)
plot(stock_data)


