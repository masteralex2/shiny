library(shiny)
library(psych)
library(ggplot2)

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {
  
  # Expression that generates a plot of the distribution. The expression
  # is wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should be automatically 
  #     re-executed when inputs change
  #  2) Its output type is a plot 
  #
  output$distPlot2 <- renderPlot({
    
    
    #describe(mtcars)
    #mtcars
    
    qplot(wt, mpg, data=mtcars, geom=c("point", "smooth"),
          method="lm", formula=y~x, color=cyl,
          main="Regression of MPG on Weight",
          xlab="Weight", ylab="Miles per Gallon")
    
    
    #hist(mtcars$mpg)
    #hist(dist)
  })
  
  # Generate a summary of the dataset
  output$summary <- renderPrint({
    
    m1 <- lm(mtcars$mpg ~ mtcars$wt + mtcars$cyl)
    #summary(m1)
    c<-coef(m1)
    
    var1<-input$wt/1000
    var2<-input$cyl
   
    r <- c[1] + var1*c[2] + var2 *c[3]
    paste("Prediction for a vehicle " , var1*1000 ,"Kgs and ", var2, " cylinders. Is ", round(as.numeric(r[1])), " MPG."  )  
    
    
  })
  
  
})

