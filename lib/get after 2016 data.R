#setwd("~/Downloads/project4-team-4-master/lib")
load("movieNew.RData")##only have the movie data named "movie.data"

t=movie.data$time
t=sort(t)
#t.new=t-t[1]
#head(t.new)
time=1:15
for(i in 1:15){
  time[i]=i*3600*24*365
}
#library(plyr)
#library(dplyr)
movie.data$timeN=movie.data$time-t[1]
movie.data$timeN2 <- ifelse (movie.data$timeN >= time[9], "15",NA)


#library(dplyr)

names(movie.data)
movie.data.ID.product=select(movie.data,productID,userID,time,timeN,timeN2)
head(movie.data.ID.product)
movie.no.na=na.omit(movie.data.ID.product)

new.review.after16=save(movie.no.na,file="after2016.RData")





