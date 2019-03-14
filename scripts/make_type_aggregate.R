make_type_aggregate <- function(type_data){
  return_frame <- type_data %>%
    group_by(School.Type) %>%
    summarize(Average.Starting.Median.Salary =
                mean(Starting.Median.Salary),
              Average.Mid-Career.Median.Salary =
                mean(Mid-Career.Median.Salary),
              Average.Mid-Career.10th.Percentile.Salary =
                mean(Mid-Career.10th.Percentile.Salary),
              Average.Mid-Career.25th.Percentile.Salary =
                mean(Mid-Career.25th.Percentile.Salary),
              Average.Mid-Career.75th.Percentile.Salary =
                mean(Mid-Career.75th.Percentile.Salary),
              Average.Mid-Career.90th.Percentile.Salary =
                mean(Mid-Career.90th.Percentile.Salary)) %>%
    ungroup()
  
  return(return_frame)
}