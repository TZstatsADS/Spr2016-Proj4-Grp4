convertGenre <- function(ASIN.inq){
        library(rvest)
        library(tidyr)
        # Install omdbapi
        #devtools::install_github("hrbrmstr/omdbapi")
        library(omdbapi)
        library(pbapply)
        library(dplyr)
        # Example 1, not found in OMDB
        # ASIN.inq="000500005X" 
        # Example 2, found in OMDB
        #ASIN.inq="B00003CXDV" # this movie's title has a "("
        result <- 0
        
        tryCatch({
                movie1<- html(paste("http://www.amazon.com/exec/obidos/ASIN/",
                                    ASIN.inq, sep=""))
                movie1.title=
                        movie1 %>% 
                        html_node("title") %>%
                        html_text()
                movie1.title=strsplit(movie1.title, ": ")[[1]][2]
                movie1.title=strsplit(movie1.title, " \\[")[[1]][1]
                movie1.title=strsplit(movie1.title, " \\(")[[1]][1]
                movie1.title=strsplit(movie1.title, " \\-")[[1]][1]
                omdb.entry=search_by_title(movie1.title)
                
                infos<-find_by_id(omdb.entry$imdbID[1], include_tomatoes=T)
                result <- infos$Genre
                
        },error = function(err){
                result <- NA
        })
        #print(ASIN.inq)
        return(result)
}



