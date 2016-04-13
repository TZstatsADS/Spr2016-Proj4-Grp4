ui<-shinyUI(fluidPage(
  titlePanel("Sentiment and Words Analysis"),
  fluidRow(
    
    
    column(width = 4, wellPanel(
      radioButtons("choose", "Topic",
                   c("sentiment", "words" )
      )
    )),
    column(width=4, 
           sliderInput("slider",  "Score",
                       min = 1, max = 5, value = 1)),
  fluidRow(
    column(width = 10,
        plotOutput("plot1", height = 200)
  )
),
fluidRow(
  column(width = 10,
         plotOutput("plot2", height = 200)
  )
)
)))