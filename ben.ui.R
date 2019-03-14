library(dplyr)
library(shiny)


##COPYPASTE THIS AS A TABPANEL

source("scripts/make_type_aggregate.R")

salary_options <-
  colnames(type_aggregate)[2:(length(colnames(type_aggregate)))]

school_options <- pull(type_aggregate, School.Type)

ben_ui <- sidebarLayout(
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
    plotOutput("plot_school_type")
  )
)


