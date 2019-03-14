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
      
      titlePanel("How does Mid Career Salary Vary Between Region of Colleges?"),
      
      p("This page aims to ..."),
  
      plotOutput("plot")
    )
  ) 
)
