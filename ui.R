
library(dplyr)
library(shiny)

# read in data
degrees <- read.csv("data/degrees-that-pay-back.csv", stringsAsFactors = FALSE)
college_regions <- read.csv("data/salaries-by-region.csv", stringsAsFactors = FALSE)
college_types <- read.csv("data/salaries-by-college-type.csv", stringsAsFactors = FALSE)

# filter data
regions <- select(college_regions, Region) %>% group_by(Region) %>% summarise()
university <- select(college_regions, School.Name)

# Define UI for application that draws a histogram
shinyUI(navbarPage("Best University for You",
  
  tabPanel("Introduction",
  
  # Application title
  titlePanel("Where does it pay to go to school?")
  ),
  
  # Sidebar with a slider input for number of bins 

    
    # Show a plot of the generated distribution
    mainPanel(
      p("On this website we are using data from The Wall Street Journal that provides
information about universities in the US and the average salaries people receive from
each university. Using this information, students, parents, and current university 
students can gain information in order to make a more informed decision about majors
you want to pursue and the university/type of university you might be interested in attending. 
You will be able to take a look at salary information based on college type
(liberal, Ivy, state, etc.), region, and academic major.  You will also have the chance
to compare the average salaries between two different universities within a region.  
        ")
    )
  ),
  tabPanel("Compare Schools",
           # Add a titlePanel to your tab
           titlePanel("Compare two universities (by region)"),
           
           # Create a sidebar layout for this tab (page)
           sidebarLayout(sidebarPanel(
             
             # Make a selectInput widget to select a region
             selectInput(inputId = "region",
                         label = "Choose a Region",
                         choices = regions),
             # Make a selectInput widget to select a university
             selectInput(inputId = "school",
                         label = "Choose a University",
                         choices = university)
           ),
           # Create a main panel, in which you should display the scatter plot
           mainPanel(
             p("Here you can pick two universities from the same region and compare 
               both the average starting salary and the average mid-career salary."),
             plotOutput(outputId = "name")
           )))
)
