library(shiny)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Welcome to Miles Per Gallon Prediction"),
  
  
  # Sidebar with a slider input for number of observations
  
  sidebarPanel(
    
    helpText('Please select the weight and cylinders. And Press -Update Results- button. The predictor will estimate the MPG.'),
    sliderInput("wt", 
                "Car weight - Kg", 
                min = 2000,
                max = 6000, 
                value = 4000),
    
    sliderInput("cyl", 
                "Engine cylinders:", 
                min = 2,
                max = 8, 
                  value = 4),
    
    
    helpText("Note: Press Update Results  button to calculate"),
    
    
    submitButton("Update Results")
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    
    h3('Plot shows relationship between Weight and MPG'),
    plotOutput("distPlot2"),
    
    h3('MPG prediction based on Weight and Cylinders:'),
    
    verbatimTextOutput("summary")
  )
))




