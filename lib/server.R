server <- function(input, output) {
  output$plot1 <- renderPlot({
     if (input$choose == "sentiment") {
      nonzero<-subset(nonzero,nonzero$review_score ==input$slider)
      user.table0=nonzero%>%
        group_by(review_score,s.polarity)%>%
        summarize(
          read=mean(total.v, na.rm=T)
        )
      ggplot(user.table0, aes(x=s.polarity, y=read,colour=review_score))+
        geom_point(aes(x = s.polarity,y=read,colour = factor(review_score)))+xlim(-2.5,2.5)+ylim(0,60)
      }

     else if (input$choose == "words") {
              subdata.words<-subset(subdata,subdata$review_score == input$slider)
              user.table1=subdata.words%>%
              group_by(review_score,words)%>%
              summarize(
              read=mean(total.v, na.rm=T)
                )
             ggplot(user.table1, aes(x=words, y=read,colour=review_score))+
             geom_point(aes(x = words,y=read,colour = factor(review_score)))+xlim(0,1555)+ylim(0,60)
              }
  })
  output$plot2 <- renderPlot({
      if (input$choose == "sentiment") {
        nonzero<-subset(nonzero,nonzero$review_score ==input$slider)
        user.table0=nonzero%>%
        group_by(review_score,s.polarity)%>%
        summarize(
        helpful=mean(review_h,na.rm=T)
      )
      ggplot(user.table0, aes(x=s.polarity, y=helpful,colour=review_score))+
        geom_point(aes(x = s.polarity,y=helpful,colour = factor(review_score)))+xlim(-2.5,2.5)
    }
      else if (input$choose == "words") {
        subdata.words<-subset(subdata,subdata$review_score == input$slider)
        user.table1=subdata.words%>%
          group_by(review_score,words)%>%
          summarize(
            helpful=mean(review_h,na.rm=T)
          )
        ggplot(user.table1, aes(x=words, y=helpful,colour=review_score))+
          geom_point(aes(x = words,y=helpful,colour = factor(review_score)))+xlim(0,1555)
      }
})
}