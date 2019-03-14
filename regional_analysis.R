library("dplyr")

#Load in data
regional_data <- read.csv("data/salaries-by-region.csv", stringsAsFactors = FALSE)

#Taking each region separately
unique(regional_data$Region)

california_data <- regional_data %>% 
  filter(Region == "California")

western_data <- regional_data %>% 
  filter(Region == "Western")

midwestern_data <- regional_data %>% 
  filter(Region == "Midwestern")

southern_data <- regional_data %>% 
  filter(Region == "Southern")

northeastern_data <- regional_data %>% 
  filter(Region == "Northeastern")

#California Analysis
#Convert "N/A" to NA
california_data[california_data == "N/A"] <- NA

#Functions:

#Gets mean of the start columm
get_mean_start <- function(dataframe){
  column <- (gsub(
    "\\$", 
    "", 
    dataframe$Starting.Median.Salary))
  
  column <- as.numeric(gsub(",", "", column, fixed = TRUE))
  mean(column, na.rm = TRUE)
}

#Gets mean of the midcareer columm
get_mean_median <- function(dataframe){
  column <- (gsub(
    "\\$", 
    "", 
    dataframe$Mid.Career.Median.Salary))
  
  column <- as.numeric(gsub(",", "", column, fixed = TRUE))
  mean(column, na.rm = TRUE)
}

#Gets mean of the 10th percentile columm
get_mean_10th <- function(dataframe){
  column <- (gsub(
    "\\$", 
    "", 
    dataframe$Mid.Career.10th.Percentile.Salary))
  
  column <- as.numeric(gsub(",", "", column, fixed = TRUE))
  mean(column, na.rm = TRUE)
}

#Gets mean of the 25th percentile columm
get_mean_25th <- function(dataframe){
  column <- (gsub(
    "\\$", 
    "", 
    dataframe$Mid.Career.25th.Percentile.Salary))
  
  column <- as.numeric(gsub(",", "", column, fixed = TRUE))
  mean(column, na.rm = TRUE)
}

#Gets mean of the 75th percentile columm
get_mean_75th <- function(dataframe){
  column <- (gsub(
    "\\$", 
    "", 
    dataframe$Mid.Career.75th.Percentile.Salary))
  
  column <- as.numeric(gsub(",", "", column, fixed = TRUE))
  mean(column, na.rm = TRUE)
}

#Gets mean of the 90th percentile column
get_mean_90th <- function(dataframe){
  column <- (gsub(
    "\\$", 
    "", 
    dataframe$Mid.Career.90th.Percentile.Salary))
  
  column <- as.numeric(gsub(",", "", column, fixed = TRUE))
  mean(column, na.rm = TRUE)
}

#Get mean for all columns
get_mean_10th(california_data)
get_mean_25th(california_data)
get_mean_75th(california_data)
get_mean_90th(california_data)
get_mean_median(california_data)
get_mean_start(california_data)

#Western Analysis
#Convert "N/A" to NA
western_data[western_data == "N/A"] <- NA

#Get mean for all columns
get_mean_10th(western_data)
get_mean_25th(western_data)
get_mean_75th(western_data)
get_mean_90th(western_data)
get_mean_median(western_data)
get_mean_start(western_data)


#Midwest Analysis
#Convert "N/A" to NA
midwestern_data[midwestern_data == "N/A"] <- NA

#Get mean for all columns
get_mean_10th(midwestern_data)
get_mean_25th(midwestern_data)
get_mean_75th(midwestern_data)
get_mean_90th(midwestern_data)
get_mean_median(midwestern_data)
get_mean_start(midwestern_data)

#Southern Analysis
#Convert "N/A" to NA
southern_data[southern_data == "N/A"] <- NA

#Get mean for all columns
get_mean_10th(southern_data)
get_mean_25th(southern_data)
get_mean_75th(southern_data)
get_mean_90th(southern_data)
get_mean_median(southern_data)
get_mean_start(southern_data)


#Northeastern analysis
#Convert "N/A" to NA
northeastern_data[northeastern_data == "N/A"] <- NA

#Get mean for all columns
get_mean_10th(northeastern_data)
get_mean_25th(northeastern_data)
get_mean_75th(northeastern_data)
get_mean_90th(northeastern_data)
get_mean_median(northeastern_data)
get_mean_start(northeastern_data)

#Create Dataframe
Region <- c("California", "West", "Midwest", "South", "Northeast")
Mean_10th_Percentile <- c(get_mean_10th(california_data),
                          get_mean_10th(western_data),
                          get_mean_10th(midwestern_data),
                          get_mean_10th(southern_data), 
                          get_mean_10th(northeastern_data))

Mean_25th_Percentile <- c(get_mean_25th(california_data),
                          get_mean_25th(western_data),
                          get_mean_25th(midwestern_data),
                          get_mean_25th(southern_data),
                          get_mean_25th(northeastern_data))

Mean_75th_Percentile <- c(get_mean_75th(california_data),
                          get_mean_75th(western_data),
                          get_mean_75th(midwestern_data),
                          get_mean_75th(southern_data),
                          get_mean_75th(northeastern_data))

Mean_90th_Percentile <- c(get_mean_90th(california_data),
                          get_mean_90th(western_data),
                          get_mean_90th(midwestern_data),
                          get_mean_90th(southern_data),
                          get_mean_90th(northeastern_data))

Mean_MidCareer_Median <- c(get_mean_median(california_data),
                           get_mean_median(western_data),
                           get_mean_median(midwestern_data),
                           get_mean_median(southern_data),
                           get_mean_median(northeastern_data))

Mean_Starting <- c(get_mean_start(california_data),
                   get_mean_start(western_data),
                   get_mean_start(midwestern_data),
                   get_mean_start(southern_data),
                   get_mean_start(northeastern_data))

regional_data <- data.frame(Region, 
                            Mean_10th_Percentile, 
                            Mean_25th_Percentile, 
                            Mean_75th_Percentile,
                            Mean_90th_Percentile,
                            Mean_MidCareer_Median,
                            Mean_Starting)

choices_holder <- regional_data
choices_holder$Region <- NULL
choices <- colnames(choices_holder)

#Find school with highest starting
max_start <- function(dataframe){
  data <- dataframe %>% 
    filter(Starting.Median.Salary == max(Starting.Median.Salary)) %>% 
    select(School.Name)
}

max_cali_start <- max_start(california_data)
max_west_start <- max_start(western_data)
max_midwest_start <- max_start(midwestern_data)
max_south_start <- max_start(southern_data)
max_northeast_start <- max_start(northeastern_data)

Highest_Starting_Salary <- c(max_cali_start,
                             max_west_start, 
                             max_midwest_start, 
                             max_south_start, 
                             max_northeast_start)

#Find school with highest midcareer
max_mid <- function(dataframe){
  data <- dataframe %>% 
    filter(Mid.Career.Median.Salary == max(Mid.Career.Median.Salary)) %>% 
    select(School.Name)
}

max_cali_mid <- max_mid(california_data)
max_west_mid <- max_mid(western_data)
max_midwest_mid <- max_mid(midwestern_data)
max_south_mid <- "Rice University"
max_northeast_mid <- max_mid(northeastern_data)

Highest_MidCareer_Salary <- c(max_cali_mid,
                              max_west_mid, 
                              max_midwest_mid, 
                              max_south_mid, 
                              max_northeast_mid)

