setwd("~/Downloads")
movies_data <- read.csv("movies.csv")
fivePts <- movies_data[movies_data[,3]==5,]
index <- sample(1:7911696,1000)

load("../data/movie15years.RData")
unique(movie.matrix)
index <- match(movie.matrix[,1],movies_data[,1])
samples<-movies_data[index,]
samples <- samples[,-3]
#samples <- fivePts[,-3]

#networkD3
library("networkD3")
src <- c("A", "A", "A", "A",
         "B", "B", "C", "C", "D")
target <- c("B", "C", "D", "J",
            "E", "F", "G", "H", "I")
networkData <- data.frame(src, target)

# Plot
simpleNetwork(networkData)


#igraph
library('Matrix')
A <- spMatrix(nrow=length(unique(samples$product_productid)),
              ncol=length(unique(samples$review_userid)),
              i = as.numeric(factor(samples$product_productid)),
              j = as.numeric(factor(samples$review_userid)),
              x = rep(1, length(as.numeric(samples$product_productid))) )
row.names(A) <- levels(factor(samples$product_productid))
colnames(A) <- levels(factor(samples$review_userid))
A<-A*10

A_igraph <- graph.incidence(A, mode=c('all') )
i96 <- delete.vertices(A_igraph, V(A_igraph)[ degree(A_igraph)==0 ])
V(i96)$label[1:857] <- NA
V(i96)$color[1:857] <-  rgb(1,0,0,1)
V(i96)$size[1:857] <- 2

E(i96)$width <- .3
E(i96)$color <- rgb(.5,.5,0,1)
#
#pdf('i96.2.pdf')
plot(i96, layout=layout.kamada.kawai)


##########
library(igraph)
A_igraph <- graph.incidence(A, mode=c('all') )
A_t <- t(A) %*% A

A_igraph <- graph.adjacency(A_t, mode = 'undirected')
E(A_igraph)$weight <- count.multiple(A_igraph)
A_igraph <- simplify(A_igraph)

V(A_igraph)$label <- V(A_igraph)$name
V(A_igraph)$label.color <- rgb(0,0,1,1)
V(A_igraph)$label.cex <- 0.2
V(A_igraph)$size <- 6
V(A_igraph)$frame.color <- NA
V(A_igraph)$color <- rgb(0,0,1,1)

# Set edge gamma according to edge weight
egam <- (log(E(A_igraph)$weight)+.3)/max(log(E(A_igraph)$weight)+.3)
E(A_igraph)$color <- rgb(.5,.5,0,1)

plot(A_igraph, main = 'layout.kamada.kawai', layout=layout.kamada.kawai)
plot(A_igraph, main = 'layout.fruchterman.reingold', layout=layout.fruchterman.reingold)
#########



