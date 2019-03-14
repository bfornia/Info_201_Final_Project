library(shiny)
library(ggplot2)

source("scripts/make_type_aggregate.R")

###COPYPASTE THE BELOW METHOD INTO THE SHINYSERVER

ben_server <- function(input, output){
  output$plot_school_type <- renderPlot({
    filtered <- type_aggregate %>%
      filter(School.Type %in% c(input$school_1, input$school_2)) %>%
      select(School.Type, input$bar_type)
    
    ggplot(data = filtered, aes(x = School.Type,
                                y = pull(filtered, input$bar_type),
                                fill = School.Type)) +
      geom_bar(stat = "identity") +
      ylab(input$bar_type)
  })
}