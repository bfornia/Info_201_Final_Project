library("dplyr")
library("plotly")

data <- read.csv("../data/degrees-that-pay-back.csv", stringsAsFactors = FALSE)


# to use this function, a vector of different majors must be inputted
degree_comparison <- function(degrees) {
  # helper code: https://stackoverflow.com/questions/31944103/convert-currency-with-commas-into-numeric
  data_one <- data %>%
    filter(Undergraduate.Major %in% degrees) %>%
    mutate(
      starting = as.numeric(gsub("[$,]", "", Starting.Median.Salary)),
      mid_median = as.numeric(gsub("[$,]", "", Mid.Career.Median.Salary)),
      mid_10th = as.numeric(gsub("[$,]", "",
                                 Mid.Career.10th.Percentile.Salary)),
      mid_25th = as.numeric(gsub("[$,]", "",
                                 Mid.Career.25th.Percentile.Salary)),
      mid_75th = as.numeric(gsub("[$,]", "",
                                 Mid.Career.75th.Percentile.Salary)),
      mid_90th = as.numeric(gsub("[$,]", "",
                                 Mid.Career.90th.Percentile.Salary))
      ) %>%
    select(-Starting.Median.Salary, -Mid.Career.Median.Salary,
           -Mid.Career.10th.Percentile.Salary,
           -Mid.Career.25th.Percentile.Salary,
           -Mid.Career.75th.Percentile.Salary,
           -Mid.Career.90th.Percentile.Salary)
  salary_plot <- plot_ly(
     data = data_one,
     x = ~Undergraduate.Major,
     y = ~starting,
     name = "Starting Median",
     type = "bar"
     ) %>%
       add_trace(
         y = ~mid_median,
         name = "Mid-Career Median"
       ) %>%
       add_trace(
         y = ~mid_10th,
         name = "Mid-Career 10th Percentile"
       ) %>%
       add_trace(
           y = ~mid_25th,
           name = "Mid-Career 25th Percentile"
       ) %>%
       add_trace(
         y = ~mid_75th,
         name = "Mid-Career 75th Percentile"
       ) %>%
       add_trace(
         y = ~mid_90th,
         name = "Mid-Career 90th Percentile"
       ) %>%
       layout(
         title = "Salary Information for Different Undergraduate Majors",
         xaxis = list(title = "Degree"),
         yaxis = list(title = "Salary"),
         barmode = "group"
       )
  salary_plot
}