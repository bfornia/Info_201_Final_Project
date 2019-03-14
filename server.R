library(shiny)

shinyServer(function(input, output){
  output$plot <- renderPlot({
    
    data <- regional_data
    
    p <- ggplot(data = data, mapping = aes_string(x = "Region", y = input$percentiles, group =1, color = "Region")) +
      geom_line(size = 2) +
      geom_point(size = 5)
    p
  })
  
  output$salary_plot <- renderPlotly({
    degree_comparison(input$degrees)
  })
  
  output$plot_school_type <- renderPlot({
    filtered <- type_aggregate %>%
      filter(School.Type %in% c(input$school_1, input$school_2)) %>%
      select(School.Type, input$bar_type)
    
    ggplot(data = filtered, aes(x = School.Type,
                                y = pull(filtered, input$bar_type),
                                fill = School.Type)) +
      geom_bar(stat = "identity") +
      ylab(gsub("\\.", " ", input$bar_type)) +
      xlab("School Type") +
      theme(axis.title = element_text(size = 14))
  })
})
