library(dplyr)
library(shiny)
library(plotly)

source("scripts/degree_comparison.R")

# Define UI
shinyUI(navbarPage("Best University for You",
  
  tabPanel("Introduction",
  
  titlePanel("Where does it pay to go to school?")),

    mainPanel(
      p("THe big question we are asking here is, ", em("where does it pay to go to school?"),
        " We break down this question by asking questions about different regions in the US,
different academic majors, and different types of universities (liberal, Ivy, state, etc.). 
 You will be able to take a look at and compare post-graduation salary information based on 
college type, region, and academic major."),
      p("On this website we are using data from The Wall Street Journal that provides 
information about universities in the US and the average salaries people receive from
each university. Using this information, students, parents, and current university 
students can gain information in order to make a more informed decision about majors
you want to pursue and the university/type of university you might be interested in attending."),
      p("This page is created for the Info 201 Final Project.")
    ),
  tabPanel("Academic Majors",
  titlePanel("Compare Different Academic Majors")),
  
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
      p("On this page, you have the option to compare different different majors based on the
        starting salary averages, the mid-career salary average, the 10th percentile mid-career
        salary and the 90th percentile mid-career salary.  Based on this information, you will 
        recognize that initial starting salary is not always indicative of mid-career salary. 
        Also, take into account that this data does not consider that those pursuing certain majors
        may be more inclined to attend graduate school which would increase their salary and may
        impact the mid-career salary average."),
      plotlyOutput("salary_plot")
  ))))


