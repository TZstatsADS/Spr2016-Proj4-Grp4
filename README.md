#How to become a Decent Moives Reviewer?
### Mining Amazon Movies Reviews

Term: Spring 2016

Team member: Zac Ziyue Wu, Max Mattioli, Qiner Shi, Tianhong Ding, Chi Li
###Summary
In this project, we mined the amazon movie scores and reviews to explore some topics like trying to find out movies with high scores but few reviewers, figuring out the relationship between review scores and the polarity of the review, etc. We also explored the reviewer network of which we can have a glance at the relationship about who might share a similar movie taste.

###Contribution Statement

Zac Ziyue Wu:  
1.Net-work analysis.  
2.Presentation.  

Max Mattioli:  
1.Data preparation.  
2.Exploration of reviewers in other categories besides movies.  

Qiner Shi:  
1.Title and genre match and improve the movie title mining.  
2.The third part of the project, mainly about review text mining (3. How to Comment).  

Tianhong Ding:  
1.Review numbers of the most popular movies each year.  
2.Sketch of markdown file.  

Chi Li:  
1.General statistic analysis/data organization
2.The second part of the project.(2.How to Star Movies?)  

All team members approve our work presented in our GitHub repository including this contribution statement.


##Contents

```

1. Generally Speaking
2. How to stars movies
3. How to comment
4. How to interact with other reviewers? 

```

![](https://raw.githubusercontent.com/TZstatsADS/project4-team-4/master/figs/movie_profile.png)
![](https://raw.githubusercontent.com/TZstatsADS/project4-team-4/master/figs/Review.png)


## 1. Generally Speaking


To begin with, we need to explore the dataset, before we can dig into deeper and more interesting points.

The first thing that come into my mind is that we can produce a list of most popular movies for each year, based on the numbers of reviews. Not only this list can bring us back to our childhoods, when we once again face those familliar names, but also show us the growth of one of the most successful companies over the world.


- **Review numbers of the most popular movies each year**

![](https://raw.githubusercontent.com/TZstatsADS/project4-team-4/master/figs/tom%20trnd%201.png?token=AP_dxNHl5qkvcO9urWVA7KfSsddPaDGQks5XF5xrwA%3D%3D)


### Patterns of review numbers over 15 years

![](https://raw.githubusercontent.com/TZstatsADS/project4-team-4/master/figs/1997%20trend%20plot%201.png?token=AP_dxKNfuuYdjw8EZFTRiM3K-LZ7jE56ks5XF508wA%3D%3D)


![](https://raw.githubusercontent.com/TZstatsADS/project4-team-4/master/figs/thomas%2006%20trend.png?token=AP_dxFO9B7A8RkFb-zvOskD_2VrtgAxBks5XF52JwA%3D%3D)

We decided to focus on:
- data after 2007
- especially top 100 most active users



## 2.  How to Star Movies?


After we have an understanding of the characteristics of the dataset, the following three topics attracts our attention: Relationship between Helpfulness and Scores, Sentimental Analysis, and Network Analysis. 

Prof. Tian has told us an inspring example, that people tend to give 5-star scores at their first reviews. Besides this, we wonder, is there any relationship between reviews' helpfulness and scores? Many people believe that one is more likely to watch those extreme reviews, since comments such as "good" or "not bad" are never informative to people. We enjoy reading those reviews that provide deep insights or strong emotions, because they satisfy our curiosities as well as intentions to know more about that product. As a result, we may say the five-star and one-star reviews may receive much more "helful" or "unhelpful" clicks than other reviews.

In general, the average score distribution looks like this:

![alt tag](https://github.com/TZstatsADS/project4-team-4/blob/master/figs/General.png)

This indicates that people tend to rate high scores overall and, as you can see, the number of average score of exactly integers are more likely, and that is because for many movies there is one or two rates are their average tend to be more likely an integer. 

With the 100 active user data we are going to show u later, we found the distribution look like this:

![alt tag](https://github.com/TZstatsADS/project4-team-4/blob/master/figs/Active.png)

This one is not quite different from last one, that makes sense, because the 100 active users' behavior should represent the general users' behavior overall. The main difference is that the active users are not that likely to rate a 5 star, they are more critical and tend to give 4 stars rather than a 5 star.

Now we want to know the relationship between average review score and popularity. Intuitively, We assume that the average review score should be high when the popularity goes high. We assume the total read of all reviews of one movie indicates the popularity of that movie

![alt tag](https://github.com/TZstatsADS/project4-team-4/blob/master/figs/avg%20vs%20popularity.png)

However, from this picture, we can see that it is not the case. There is more than thirty thousand movies that are rated as 5 star, but they don't have much review and not poplular at all, which we call as high score but not popular movies. And the most popular movie, as you can see in the plot, is the single point right on top of everything. This is a 3.5 score movie. In the mean time, we can also find that as the popularity goes high, it does not indicate the average score of the movies goes high as well. It is actually not that hard to understand, because there are always bad movies that are more popular than some good movies. 

Some may argue that we forgot about the helpfulness. In fact, in this figure below, we considered average score against credibility, by which we calculated helpful number(helpful.v) devided by total number(total.v). 

![alt tag](https://github.com/TZstatsADS/project4-team-4/blob/master/figs/cred%20vs%20avg.png)

As we can see, since the plot is more focused on top right corner, we can intepret that there is more movies that have high score and high review credibility overall. If this figure is not that clear, we calculated another plot of average value of helpness and read on each unit of score based on the previous data, which is:

![alt tag](https://github.com/TZstatsADS/project4-team-4/blob/master/figs/rate%7Escore-helpful%26read.png)

This indicates that the credibility (helpful devided by read) is going higher when the score goes higher.

Finally, since we are interested in high-score-nonpopular movies, we plotted a figure that shows the overall distribution of that kind of nonpopular movie. We define the high-score-nonpopular movies threshold as credibility > 0.9, and total read count(popularity) < 100. There is more than 60 thousands movies of this kind, out of 250 thousands of movies of the whole data set.

![alt tag](https://github.com/TZstatsADS/project4-team-4/blob/master/figs/highscorenonpopular_distribution.png)

This figure looks quite similar as the general distribution, but there is more proportion of high score movies within these nonpopular
movies, this indicates we have more good movies that are not popular than bad movies.

So be brave and happy to watch those movies you never heard of! Because it is more likely that you are watching a good movie instead of a bad one.


## 3. How to Comment? 

- read: counts of reviewers who react to the helpfulness evaluation. 
- helpful: scores of helpfulness



We have talked quite a lot about data characteristics, so it is reasonalble to walk into the field of movie reviews.

#### Review Summary-Polarity

We first compute the polarity of the review summery. Generally the review summary will not contains too much information about polarity (most of them get a polarity of 0) but since we are not able to do the review text due to its large size, we might as well take a look at the summary first. 

###### Will the polarity affect the helpfulness?

![alt tag](https://github.com/TZstatsADS/project4-team-4/blob/master/figs/helpful~polarity-general.png)

###### Will the extreme polarity attract people to read?

![alt tag](https://github.com/TZstatsADS/project4-team-4/blob/master/figs/read~polarity-general.png)


###### Polarity can be inaccurate

Unfortunately, the built-in package for polarity computing is not accurate.

![alt tag](https://github.com/TZstatsADS/project4-team-4/blob/master/figs/polarity-not-accurate.png)

#### Review Text-Words

Here we want to explore whether the length of the text will add more value to itself

######  The longer, the better?

![alt tag](https://github.com/TZstatsADS/project4-team-4/blob/master/figs/read~words-general.png)

It's seems not the case.

![alt tag](https://github.com/TZstatsADS/project4-team-4/blob/master/figs/read~words.png)

As for the helpfulness, people tends to focus more on the brief reviews.

![alt tag](https://github.com/TZstatsADS/project4-team-4/blob/master/figs/helpful~words.png)



## 4. How to interact with other reviewers? 
####Network Analysis of top 100 users

Social newworks are everywhere. We not only have social networks in the real world, but also in the virtual one. Sometimes we do not even know there might be a network between ourselves and someone who is living thousands of miles away. In order to quantify the closeness between users, we draw a line between two users if they comment on the same movie. Thus, we applied a network analysis to the top 100 active reviewer in Amazon.


- user: 100
- related movies: 90209
- Nodes: User
- Nodes size: number of reviews wrote 
- Links: Commented on the same movie
- Links width: number of same movie commented 

we have the following network of the most recent time.
![](https://raw.githubusercontent.com/TZstatsADS/project4-team-4/master/figs/evol_GIF/net9.jpg?token=AKN9cRvcAPM2ZEb_oNtLHfSgyl2PdrK3ks5XF5NTwA%3D%3D)

### Evolution by every 30 days

<a href="http://gifmaker.me/PlayVideoAnimation.php?folder=20160412196MMVIKjpkaeHBrRW8dpt96&file=output_mNJLhB.mp4
">![every half year](https://github.com/TZstatsADS/project4-team-4/blob/master/figs/evol_GIF/output_3YUqFn.gif)</a>

<a href="http://gifmaker.me/PlayVideoAnimation.php?folder=20160412196MMVIKjpkaeHBrRW8dpt96&file=output_mNJLhB.mp4
">Evolution by every 30 days</a>










