#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

source("degree_comparison.R")

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Test Degrees Function"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         checkboxGroupInput(
           "degrees",
           label = "Select a degree:",
           choices = data$Undergraduate.Major,
           selected = "Agriculture"
         )
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotlyOutput("salary_plot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$salary_plot <- renderPlotly({
      degree_comparison(input$degrees)
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

