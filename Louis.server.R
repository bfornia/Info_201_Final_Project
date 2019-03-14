# Load in libraries
library(dplyr)
library(shiny)
library(ggplot2)

# Source in files
source("regional_analysis.R")
source("Louis.ui.R")

# Define the server logic
server <- function(input, output){
  output$plot <- renderPlot({
    
    data <- regional_means
    
    p <- ggplot(data = data, mapping = aes_string(x = "Region", y = "Median_Salary", color = "Region")) +
      geom_bar(stat = "identity") 
    
    p
  })
}

