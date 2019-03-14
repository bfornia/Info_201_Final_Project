# Load in libraries
library(shiny)

# Source in files
source("regional_analysis.R")

# Define the UI
ui <- navbarPage(
  
  ui <- navbarPage(
    "College Data!",
    
    tabPanel(
      "Regional Data",
      
      titlePanel("How Does Salary Vary Between Region of Colleges?"),
      
      p("This page aims to ..."),
      
      selectInput(
        "percentiles",
        label = "Different Percentiles",
        choices = choices,
        selected = "Mean_10th_Percentile"
      ),
  
      plotOutput("plot")
    )
  ) 
)
