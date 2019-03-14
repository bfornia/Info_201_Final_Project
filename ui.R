library(dplyr)
library(shiny)


# Define UI
shinyUI(navbarPage("Best University for You",
  
  tabPanel("Introduction",
  
  titlePanel("Where does it pay to go to school?")),

    mainPanel(
      p("On this website we are using data from The Wall Street Journal that provides
information about universities in the US and the average salaries people receive from
each university. Using this information, students, parents, and current university 
students can gain information in order to make a more informed decision about majors
you want to pursue and the university/type of university you might be interested in attending. 
You will be able to take a look at salary information based on college type
(liberal, Ivy, state, etc.), region, and academic major.  You will also have the chance
to compare the average salaries between two different universities within a region.  
        "),
      p("This page is created for the Info 201 Final Project.")
    )
  ))


