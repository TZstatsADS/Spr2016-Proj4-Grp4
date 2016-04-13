# Project 4 Collective intelligence
### Mining Amazon Movies Reviews

Term: Spring 2016

Team member: Zac Wu, Max, Qiner Shi, Tianhong Ding, Chi Li


##Contents

```

1. Data Analysis
2. Do extreme score reviews more "Helpful" or "Unhelpful" than other reviews?
3. Review Analysis
4. Network Analysis

```



In this projects, we are interested in the following topics:

- Statistical information about the dataset
- Relationship between Helpfulness and Scores
- Sentimental Analysis
- Network Analysis



## 1. Data analysis

To begin with, we need to explore the dataset, before we can dig into deeeper and more interesting points.

The first thing that come into my mind is that we can produce a list of most popular movies for each year, based on the numbers of reviews. Not only this list can bring us back to our childhoods, when we once again face those familliar names, but also show us the growth of one of the most successful companies over the world. 


pp:film posters
pp:trend map
pp:stock price


## 2.  Do extreme score reviews more "Helpful" or "Unhelpful" than other reviews?


After we have an understanding of the characteristics of the dataset, the following three topics attracts our attention: Relationship between Helpfulness and Scores, Sentimental Analysis, and Network Analysis. 

Prof. Tian has told us an inspring example, that people tend to give 5-star scores at their first reviews. Besides this, we wonder, is there any relationship between reviews' helpfulness and scores? Many people believe that one is more likely to watch those extreme reviews, since comments such as "good" or "not bad" are never informative to people. We enjoy reading those reviews that provide deep insights or strong emotions, because they satisfy our curiosities as well as intentions to know more about that product. As a result, we may say the five-star and one-star reviews may receive much more "helful" or "unhelpful" clicks than other reviews.


pp:![alt tag](https://github.com/TZstatsADS/project4-team-4/blob/master/figs/Active.png)
pp:![alt tag](https://github.com/TZstatsADS/project4-team-4/blob/master/figs/General.png)
pp:![alt tag](https://github.com/TZstatsADS/project4-team-4/blob/master/figs/avg%20vs%20popularity.png)
pp:![alt tag](https://github.com/TZstatsADS/project4-team-4/blob/master/figs/cred%20vs%20avg.png)
pp:![alt tag](https://github.com/TZstatsADS/project4-team-4/blob/master/figs/highscorenonpopular_distribution.png)
pp:![alt tag](https://github.com/TZstatsADS/project4-team-4/blob/master/figs/rate%7Escore-helpful%26read.pdf)

## 3. Review Analysis


We have talked quite a lot about data characteristics, so it is reasonalble to walk into the field of moview reviews.
#### Review Summary-Polarity
We first compute the polarity of the review summery. Generally the review summary will not contains too much information about polarity (most of them get a polarity of 0)but since we are not able to do the review text due to its large size, we might as well take a look at the summary first. 

######Will the polarity affect the helpfulness?
/figs/helpful~polarity-general.pdf

######Will the extreme polarity attract people to read?
/figs/read~polarity-general.pdf

######Polarity can be inaccurate
Unfortunately, the built-in package for polarity computing is not accurate.
/figs/polarity not accurate.pdf

####Review Text-Words
Here we want to explore whether the length of the text will add more value to itself

###### The longer, the better?

/figs/read~words-general.pdf
It seems not’s the case.

/figs/read~words.pdf

As for the helpfulness, people tends to focus more on the brief reviews.
/figs/helpful~words.pdf



## 4. Network Analysis

http://gifmaker.me/PlayVideoAnimation.php?folder=20160412196MMVIKjpkaeHBrRW8dpt96&file=output_mNJLhB.mp4

Social newworks are everywhere. We not only have social networks in the real world, but also in the virtual one. Sometimes we do not even know there might be a network between ourselves and someone who is living thousands of miles away. In order to quantify the closeness between users, we draw a line between two users if they comment on the same movie. As the dataset is very hugh, we give up the idea of making a graph of all users. But rather, we would produce the graph on the top (x%?) users. (describe the graph and then talk about the findings and meanings.)




Following [suggestions](http://nicercode.github.io/blog/2013-04-05-projects/) by [RICH FITZJOHN](http://nicercode.github.io/about/#Team) (@richfitz). This folder is orgarnized as follows.



Please see each subfolder for a README file.

