library(dplyr)
library(shiny)
library(plotly)
library(ggplot2)

source("scripts/degree_comparison.R")
source("scripts/regional_analysis.R")
source("scripts/make_type_aggregate.R")

#Define Options for SelectInput in Type Comparison Bar Chart
salary_options <-
  colnames(type_aggregate)[2:(length(colnames(type_aggregate)))]
school_options <- pull(type_aggregate, School.Type)

# Define UI
shinyUI(navbarPage("Compare Universities",
  tabPanel("Introduction",
    includeCSS("styles.css"),
    mainPanel(
      h1("Where does it pay to go to school?"),
      p("The big question we are asking here is, ", em("where does it pay to go to school?"),
        " We break down this question by asking questions about universites in different regions in the US,
        different academic majors, and different types of universities (liberal, Ivy, state, etc.). 
        You will be able to take a look at and compare post-graduation salary information based on 
        college type, region, and academic major."),
      p("On this website we are using data from The Wall Street Journal that provides 
        information about universities in the US and the average salaries people receive from
        each university. Using this information, students, parents, and current university 
        students can gain information in order to make a more informed decision about majors
        you want to pursue and the university/type of university you might be interested in attending."),
      
      # image from https://www.paladinoandco.com/wp-content/uploads/2017/08/campus_SPU_Courtesy-of-Seattle-Pacific-University.jpg
      img(src = "spu_fall.png", height = "60%", width = "60%"),
      h4("Created by Damita Gomez, Louis Ta, Benjamin Fornia, and MacKenzie Wood. 
         This page is created for the Info 201 Final Project.")
    )),
    
  tabPanel("Academic Majors",
    titlePanel("Compare Different Academic Majors"),
  
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
  ))),
  tabPanel(
    "Regional Data",
    
    titlePanel("How Does Salary Vary Between Region of Colleges?"),
    sidebarLayout(
    sidebarPanel(
    selectInput(
      "percentiles",
      label = "Different Percentiles",
      choices = choices,
      selected = "Mean_10th_Percentile"
    )),
    mainPanel(
    p("On this page, you can compare the 5 different regions listed (California, Midwest, Northeast, 
      South, West) and the different salary percentiles (10th, 25th, 50th, 90th) for both starting
      pay and mid-career pay. Based on the information you will learn that initial starting salary is
      not always indicative of mid-career salary, but there is a significant trend."),
    plotOutput("plot")
    ))),
 tabPanel("College Types",
    titlePanel("How Does Salary Vary Between Different Types of Colleges?"),
     sidebarLayout(
      sidebarPanel(
      selectInput("school_1", h3("Select First School Type"),
                  choices = school_options),
      selectInput("school_2", h3("Select Second School Type"),
                  choices = school_options,
                  selected = school_options[2]),
      selectInput("bar_type", h3("Select Salary Type to Compare"),
                  choices = salary_options)
    ),
    mainPanel(
      p("On this page, you have the option to compare two different types of schools based on the
        starting salary averages, the mid-career salary average, the 10th percentile mid-career
        salary and the 90th percentile mid-career salary.  Based on this information, you can see
        how salaries over time are less impacted by school type, especially at higher percentiles. 
        Also, take into account that this data does not consider that some may have attended graduate
        school at different types of universities and this may impact the mid-career salary averages."),
      plotOutput("plot_school_type")
    )
  ))))


