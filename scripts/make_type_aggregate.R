library(dplyr)

#SET WORKING DIRECTORY IN MAIN FILE
read_frame <- read.csv("data/salaries-by-college-type.csv")

format_frame <- read_frame %>%
  mutate_at(vars(Starting.Median.Salary,
                 Mid.Career.Median.Salary,
                 Mid.Career.10th.Percentile.Salary,
                 Mid.Career.25th.Percentile.Salary,
                 Mid.Career.75th.Percentile.Salary,
                 Mid.Career.90th.Percentile.Salary),
            funs(n = as.numeric(gsub("[$,]", "", .))))

type_aggregate <- format_frame %>%
    group_by(School.Type) %>%
    summarize(Average.Starting.Median.Salary =
                mean(Starting.Median.Salary_n, na.rm = TRUE),
              Average.Mid.Career.Median.Salary =
                mean(Mid.Career.Median.Salary_n, na.rm = TRUE),
              Average.Mid.Career.10th.Percentile.Salary =
                mean(Mid.Career.10th.Percentile.Salary_n, na.rm = TRUE),
              Average.Mid.Career.25th.Percentile.Salary =
                mean(Mid.Career.25th.Percentile.Salary_n, na.rm = TRUE),
              Average.Mid.Career.75th.Percentile.Salary =
                mean(Mid.Career.75th.Percentile.Salary_n, na.rm = TRUE),
              Average.Mid.Career.90th.Percentile.Salary =
                mean(Mid.Career.90th.Percentile.Salary_n, na.rm = TRUE)) %>%
    ungroup()