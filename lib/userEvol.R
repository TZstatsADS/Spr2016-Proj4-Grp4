
setwd("~/Desktop/project4-team-4/lib")
load("../data/activeUser.RData")
samples <- samples[,-3]

#samples <- fivePts[,-3]

#networkD3
# Plot
#simpleNetwork(networkData)
##### FORCE network

generate_net <- function(samples,userInfo){
        names(samples) <- c("product_productid","review_userid")

        library('Matrix')
        A <- spMatrix(nrow=length(unique(samples$review_userid)),
                      ncol=length(unique(samples$product_productid)),
                      i = as.numeric(factor(samples$review_userid)),
                      j = as.numeric(factor(samples$product_productid)),
                      x = rep(1, length(as.numeric(samples$review_userid))) )
        row.names(A) <- levels(factor(samples$review_userid))
        colnames(A) <- levels(factor(samples$product_productid))
        Arow <- tcrossprod(A)
        #print(Arow[1:10,1:10])
        #print(dim(Arow))
        
        size_value <- rep(0,100)
        k<-match(rownames(Arow),userInfo[,2])
        
        size_value[k] <- diag(Arow)
        
        nodes <- cbind(userInfo,size=size_value)
        #print(nodes[1:10,])
        
        source_data = vector()
        for(i in 1:nrow(Arow)){
                cur = rep(i,nrow(Arow))
                source_data = c(source_data,cur)
        }

        target_data = vector()
        for(i in 1:nrow(Arow)){
                cur = seq(1:nrow(Arow))
                target_data = c(target_data,cur)
        }

        links <- cbind(source = source_data-1,target = target_data-1,value=as.vector(Arow))

        repeated <- seq(1,nrow(Arow)*nrow(Arow),nrow(Arow))
        x = seq(1:nrow(Arow))
        repeated <-repeated + x -1
        
        links <- links[-repeated,]
        
        index <- (links[,3] != 0 )
        links <- links[index,]
        
        links <- data.frame(links)
        nodes <- data.frame(nodes)
        nodes[,3]<-as.numeric(as.character(nodes[,3]))

        #####
        #install.packages("igraph")
        #install.packages("network") 
        #install.packages("sna")
        #install.packages("ndtv")
        
        #head(nodes)
        #head(links)
        #nrow(nodes); length(unique(nodes$id))
        #nrow(links); nrow(unique(links[,c("source", "target")]))
        
        #links <- aggregate(links[,3], links[,-3], sum)
        #links <- links[order(links$source, links$target),]
        #colnames(links)[3] <- "weight"
        #rownames(links) <- NULL
        
        library(igraph)
        net <- graph.data.frame(links[,-3], nodes[,-3], directed=F)
        # Compute node degrees (#links) and use that to set node size:
        #change size
        V(net)$size <- round(nodes[,3]/800)
        print(nodes[79,])
        # The labels are currently node IDs.
        # Setting them to NA will render no labels:
        V(net)$label.cex <- 0.5
        V(net)$color <- rgb(0,0,0,0.5)
        # Set edge width based on weight:
        E(net)$width <- links[,3]/1000
        E(net)$color <- rgb(44/256,127/256,184/256,0.2)

        return(net)
}


#net<-generate_net(samples)
#plot(net)
#setwd("~/Downloads")
#load("after2016.RData")
index<-order(after16[,3])
data<-after16[index,]
#min(data[,3])
#max(data[,3])

#after 2007
data <- data[data[,3] >= 1167609600,]
user_names <- as.vector(unique(samples[,2]))
userID <- user_names
user_names <- user_names[order(user_names)]
userInfo <- cbind(id = 0:99,userName = user_names)

#06.07, 06.07....06.12
time_slot <- c(1180656000,1199145600,1212278400,1230768000,
               1243814400,1262304000,1275350400,1293840000,
               1306886400,1325376000,1338508800)

time_plot<-function(data,time,userID,userInfo){
        
        year1 <- data[data[,3] <= as.numeric(time),]
        data_t1 <- year1[which(year1[,2] %in% userID ),-3]
        net<-generate_net(data_t1,userInfo)
        return(net)
}

net1 <- time_plot(data,time_slot[1],userID,userInfo)
net2 <- time_plot(data,time_slot[2],userID,userInfo)
net3 <- time_plot(data,time_slot[3],userID,userInfo)
net4 <- time_plot(data,time_slot[4],userID,userInfo)
net5 <- time_plot(data,time_slot[5],userID,userInfo)
net6 <- time_plot(data,time_slot[6],userID,userInfo)
net7 <- time_plot(data,time_slot[7],userID,userInfo)
net8 <- time_plot(data,time_slot[8],userID,userInfo)
net9 <- time_plot(data,time_slot[9],userID,userInfo)
net10 <- time_plot(data,time_slot[10],userID,userInfo)
net11 <- time_plot(data,time_slot[11],userID,userInfo)

lay <- layout.fruchterman.reingold(net11)
xlim <- range(lay[,1])
ylim <- range(lay[,2])


j_s <- function(a,net,xlim,ylim,lay){
        
        pdf(a)
        plot.igraph(net, layout = lay, 
                    xlim = xlim, ylim = ylim, rescale = FALSE)
        dev.off()
}

j_s("net1.pdf",net1,xlim,ylim,lay)
j_s("net2.pdf",net2,xlim,ylim,lay)
j_s("net3.pdf",net3,xlim,ylim,lay)
j_s("net4.pdf",net4)
j_s("net5.pdf",net5)
j_s("net6.pdf",net6)
j_s("net7.pdf",net7)
j_s("net8.pdf",net8)
j_s("net9.pdf",net9)
j_s("net10.pdf",net10)
j_s("net11.pdf",net11)



plot(net1)
plot(net2)
plot(net3)
plot(net4)
plot(net5)
plot(net6)
plot(net7)
plot(net8)
plot(net9)
plot(net10)
plot(net11)






