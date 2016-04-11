
setwd("~/Downloads/project4-team-4-master/lib")
load("movieNew.RData")##only have the movie data named "movie.data"

t=movie.data$time
t=sort(t)
#t.new=t-t[1]
#head(t.new)
time=1:15
for(i in 1:15){
  time[i]=i*3600*24*365
}
library(plyr)
library(dplyr)
movie.data$timeN=movie.data$time-t[1]
movie.data$timeN2 <- ifelse (movie.data$timeN < time[1], "1",
                             ifelse (movie.data$timeN >= time[1] & movie.data$timeN< time[2], "2",
                                     ifelse (movie.data$timeN >= time[2] & movie.data$timeN < time[3], "3",
                                             ifelse (movie.data$timeN >= time[3] & movie.data$timeN < time[4], "4",
                                                     ifelse (movie.data$timeN >= time[4] & movie.data$timeN < time[5], "5",
                                                             ifelse (movie.data$timeN >= time[5] & movie.data$timeN < time[6], "6",
                                                                     ifelse (movie.data$timeN >= time[6] & movie.data$timeN < time[7], "7",
                                                                             ifelse (movie.data$timeN >= time[7] & movie.data$timeN < time[8], "8",
                                                                                     ifelse (movie.data$timeN >= time[8] & movie.data$timeN < time[9], "9",
                                                                                             ifelse (movie.data$timeN >= time[9] & movie.data$timeN < time[10], "10",
                                                                                                     ifelse (movie.data$timeN >= time[10] & movie.data$timeN < time[11], "11",
                                                                                                             ifelse (movie.data$timeN >= time[11] & movie.data$timeN < time[12], "12",
                                                                                                                     ifelse (movie.data$timeN >= time[12] & movie.data$timeN < time[13], "13",
                                                                                                                             ifelse (movie.data$timeN >= time[13] & movie.data$timeN < time[14], "14",
                                                                                                                                     ifelse (movie.data$timeN >= time[14] & movie.data$timeN < time[15], "15",
                                                                                                                                             
                                                                                                                                             ifelse (movie.data$timeN >= time[15], "over 15",NA))))))))))))))))


#library(dplyr)

names(movie.data)
movie.data.ID.product=select(movie.data,productID,timeN,timeN2)
movie.no.na=na.omit(movie.data.ID.product)


count.movie1 <- movie.no.na %>%
  filter(timeN2=="1")%>%
  group_by(productID) %>% 
  summarise(count=n())
dim(count.movie1)

count.movie1=arrange(count.movie1,-count)[1:20,]
count.movie1
##
source("convertTitleGenres.R")
#install.packages("pbapply")

count.movie2 <- movie.no.na %>%
  filter(timeN2=="2")%>%
  group_by(productID) %>% 
  summarise(count=n())
dim(count.movie2)
count.movie2=arrange(count.movie2,-count)[1:5000,]
count.movie2=count.movie2%>%
  distinct(count)
count.movie2=arrange(count.movie2,-count)[1:20,]
count.movie2

###################
###################
###################
###################
###################
###################
###################
################### 之后可以取得10部电影
count.movie3 <- movie.no.na %>%
  filter(timeN2=="3")%>%
  group_by(productID) %>% 
  summarise(count=n())

count.movie3=arrange(count.movie3,-count)[1:200,]
count.movie3=count.movie3%>%
  distinct(count)
count.movie3=arrange(count.movie3,-count)[1:20,]
count.movie3

##

count.movie4 <- movie.no.na %>%
  filter(timeN2=="4")%>%
  group_by(productID) %>% 
  summarise(count=n())

count.movie4=arrange(count.movie4,-count)[1:200,]
count.movie4=count.movie4%>%
  distinct(count)
count.movie4=arrange(count.movie4,-count)[1:20,]

count.movie4

##


count.movie5 <- movie.no.na %>%
  filter(timeN2=="5")%>%
  group_by(productID) %>% 
  summarise(count=n())

count.movie5=arrange(count.movie5,-count)[1:200,]
count.movie5=count.movie5%>%
  distinct(count)
count.movie5=arrange(count.movie5,-count)[1:20,];count.movie5

############
count.movie6 <- movie.no.na %>%
  filter(timeN2=="6")%>%
  group_by(productID) %>% 
  summarise(count=n())

count.movie6=arrange(count.movie6,-count)[1:600,]
count.movie6=count.movie6%>%
  distinct(count)
count.movie6=arrange(count.movie6,-count)[1:20,];count.movie6

############
count.movie7 <- movie.no.na %>%
  filter(timeN2=="7")%>%
  group_by(productID) %>% 
  summarise(count=n())

count.movie7=arrange(count.movie7,-count)[1:200,]
count.movie7=count.movie7%>%
  distinct(count)
count.movie7=arrange(count.movie7,-count)[1:20,];count.movie7

############
count.movie8 <- movie.no.na %>%
  filter(timeN2=="8")%>%
  group_by(productID) %>% 
  summarise(count=n())

count.movie8=arrange(count.movie8,-count)[1:200,]
count.movie8=count.movie8%>%
  distinct(count)
count.movie8=arrange(count.movie8,-count)[1:20,];count.movie8

############
count.movie9 <- movie.no.na %>%
  filter(timeN2=="9")%>%
  group_by(productID) %>% 
  summarise(count=n())

count.movie9=arrange(count.movie9,-count)[1:200,]
count.movie9=count.movie9%>%
  distinct(count)
count.movie9=arrange(count.movie9,-count)[1:20,];count.movie9

############
count.movie10 <- movie.no.na %>%
  filter(timeN2=="10")%>%
  group_by(productID) %>% 
  summarise(count=n())

count.movie10=arrange(count.movie10,-count)[1:200,]
count.movie10=count.movie10%>%
  distinct(count)
count.movie10=arrange(count.movie10,-count)[1:20,];count.movie10

############
count.movie11 <- movie.no.na %>%
  filter(timeN2=="11")%>%
  group_by(productID) %>% 
  summarise(count=n())

count.movie11=arrange(count.movie11,-count)[1:200,]
count.movie11=count.movie11%>%
  distinct(count)
count.movie11=arrange(count.movie11,-count)[1:20,];count.movie11
##2007


############
count.movie12 <- movie.no.na %>%
  filter(timeN2=="12")%>%
  group_by(productID) %>% 
  summarise(count=n())

count.movie12=arrange(count.movie12,-count)[1:200,]
count.movie12=count.movie12%>%
  distinct(count)
count.movie12=arrange(count.movie12,-count)[1:20,];count.movie12

############
count.movie13 <- movie.no.na %>%
  filter(timeN2=="13")%>%
  group_by(productID) %>% 
  summarise(count=n())

count.movie13=arrange(count.movie13,-count)[1:200,]
count.movie13=count.movie13%>%
  distinct(count)
count.movie13=arrange(count.movie13,-count)[1:20,];count.movie13

############
count.movie14 <- movie.no.na %>%
  filter(timeN2=="14")%>%
  group_by(productID) %>% 
  summarise(count=n())

count.movie14=arrange(count.movie14,-count)[1:240,]
count.movie14=count.movie14%>%
  distinct(count)
count.movie14=arrange(count.movie14,-count)[1:20,];count.movie14
############
count.movie15 <- movie.no.na %>%
  filter(timeN2=="15")%>%
  group_by(productID) %>% 
  summarise(count=n())

count.movie15=arrange(count.movie15,-count)[1:240,]
count.movie15=count.movie15%>%
  distinct(count)
count.movie15=arrange(count.movie15,-count)[1:20,];count.movie15


#####################


#dim(count.movie1)
total.count=cbind(count.movie1,count.movie2,count.movie3,count.movie4,count.movie5
                  ,count.movie6,count.movie7,count.movie8,count.movie9
                  ,count.movie10,count.movie11,count.movie12,count.movie13
                  ,count.movie14,count.movie15)
m=1:15
for(i in 1:15){
  m[i]=total.count[1,2*i]
}
m
#max(total.count[,4])
# LOAD GGPLOT2 GRAPHICS PACKAGE
library(ggplot2)

# READ IN DATA
year <- c("1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011")
co2_emission_per_cap_qt <- m

# COMBINE DATA INTO DATAFRAME
df.china_co2 <- data.frame(year,co2_emission_per_cap_qt)

# PLOT WITH GGPLOT2 PACKAGE
ggplot(data=df.china_co2, aes(x=year, y=co2_emission_per_cap_qt,group=1)) +
  geom_line(color="#aa0022", size=1.75) +
  geom_point(color="#aa0022", size=3.5) +
  #scale_x_discrete(breaks=c("1995","2000","2005","2010")) +
  ggtitle("Top review counts") +
  labs(x="Year", y="") +
  theme(axis.title.y = element_text(size=14, family="Trebuchet MS", color="#666666")) +
  theme(axis.text = element_text(size=16, family="Trebuchet MS")) +
  theme(plot.title = element_text(size=26, family="Trebuchet MS", face="bold", hjust=0, color="#666666"))
#################


convertTitleGenre("B003Y5H5HO")
aa1=c("078062999X"  , "078322544X"   ,  "6300987558" ,"6302506166" ,"6303144667" ,"6304016212",
      "B0009VNCPU"  , "B000BT96DW"  )
##################



a2= c("6304913176" ,"6305242143", "6305342741", "6300183971" ,"078062551X"  , "1558908242",
      "079073320X"  , "079284209X" ,  "078062162X" ,  "076400722X" )

a3=c("B00003CWPQ" ,  "630580706X" ,  "B00003CX74"  , "5554295126", "6305784906" ,"B00000JDIL" , 
     "B000021Y74"  , "6301562941" ,"6305627347", "B00002E233"  )


aa4=c("B00003CXR3"  , "B000ZNVAME" ,  "B00003CX8I" ,  "B00003CXQA" ,  "B00003CXDG" ,
      "B00003CXN3" ,  "5553899192" , "B00003CXFG"  , "B00003CXJC" ,  "B00003CXMG" ,  "B00003CXKM" ) 

a4=aa4[1:10]

aa5=c("B00003CXZ3" ,  "B00003CXXO"  , "5553600715", "B00003CY67" ,  "B00005RDPT" ,  "B00005NGUN"  ,
      "B00005KIWZ"  , "B00003CY5C" ,  "B00003CXSP"  , "B00003CXT9"  , "B00005JKQZ" ,  "B00005JKYX" ,  "B00005JKMY"  ,
      "B00005JKEC"   ,"B00003CXXU")

a5=aa5[1:10]

##
aa6=c("B00006FMUW" , "B00008OSD4" , "B00005JLRT" , "B00005JL78" , "B00005JLSA",  "B00003CXXM"  ,"B00008DZ81" ,
      "B0068FYZ9S"  ,"B00005JLET" , "B00006LA86" , "B00008X5J1",  "B002XUBDVK" , "B00005JKN9" , "B00005JLTJ" )
a6=aa6[1:10]
##
a1=total.count[,13]
a1=as.character(a1)
a1
a7=a1[1:10]
##
a1=total.count[,15]
a1=as.character(a1)
a1
a1[2]=c("5559375241")
a1[6]=c("7883704591")
a8=a1[1:10]
##
a1=total.count[,17]
a1=as.character(a1)
a1[8]=c("7883704141")
a1
a9=a1[1:10]

##10
a1=total.count[,19]
a1=as.character(a1)
a1
a1[7]=c("7883685635")
a10=a1[1:10]

##11
a1=total.count[,21]
a1=as.character(a1)
a1
a1[4]=c("7883704540")
a1[11]=c("7883703331")
a11=a1[1:10]
##12

a1=total.count[,23]
a1=as.character(a1)
a1
a12=a1[1:10]
##13
a1=total.count[,25]
a1=as.character(a1)
a1
a13=a1[1:10]

##14
a1=total.count[,27]
a1=as.character(a1)
a1
a1[1]=c("7799128836")

a1[5]=c("7799125187")
a14=a1[1:10]

##15
a1=total.count[,29]
a1=as.character(a1)
a1
a15=a1[1:10]
###############


movies.top.revised=cbind(a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15)
movies.top.revised

save(movies.top.revised,file="new_movies_names.RData")
