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
    
    data <- regional_data
    
    p <- ggplot(data = data, mapping = aes_string(x = "Region", y = input$percentiles, group =1, color = "Region")) +
      geom_line(size = 2) +
      geom_point(size = 5)
    
    p
  })
}

