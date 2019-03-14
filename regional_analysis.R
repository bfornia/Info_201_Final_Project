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

#Get rid of $ sign and convert to numeric
california_data$Mid.Career.Median.Salary <- (gsub(
  "\\$", 
  "", 
  california_data$Mid.Career.Median.Salary))

california_data$Mid.Career.Median.Salary <- as.numeric(gsub(
  ",","",california_data$Mid.Career.Median.Salary,fixed=TRUE))

#Take mean
california_mean <- mean(california_data[["Mid.Career.Median.Salary"]], na.rm = TRUE)

  #Western Analysis

#Convert "N/A" to NA
western_data[western_data == "N/A"] <- NA

#Get rid of $ sign and convert to numeric
western_data$Mid.Career.Median.Salary <- (gsub(
  "\\$", 
  "", 
  western_data$Mid.Career.Median.Salary))

western_data$Mid.Career.Median.Salary <- as.numeric(gsub(
  ",","",western_data$Mid.Career.Median.Salary,fixed=TRUE))

#Take mean
western_mean <- mean(western_data[["Mid.Career.Median.Salary"]], na.rm = TRUE)

  #Midwest Analysis

#Convert "N/A" to NA
midwestern_data[midwestern_data == "N/A"] <- NA

#Get rid of $ sign and convert to numeric
midwestern_data$Mid.Career.Median.Salary <- (gsub(
  "\\$", 
  "", 
  midwestern_data$Mid.Career.Median.Salary))

midwestern_data$Mid.Career.Median.Salary <- as.numeric(gsub(
  ",","",midwestern_data$Mid.Career.Median.Salary,fixed=TRUE))

#Take mean
midwest_mean <- mean(midwestern_data[["Mid.Career.Median.Salary"]], na.rm = TRUE)


  #Southern Data

#Convert "N/A" to NA
southern_data[southern_data == "N/A"] <- NA

#Get rid of $ sign and convert to numeric
southern_data$Mid.Career.Median.Salary <- (gsub(
  "\\$", 
  "", 
  southern_data$Mid.Career.Median.Salary))

southern_data$Mid.Career.Median.Salary <- as.numeric(gsub(
  ",","",southern_data$Mid.Career.Median.Salary,fixed=TRUE))

#Take mean
southern_mean <- mean(southern_data[["Mid.Career.Median.Salary"]], na.rm = TRUE)

  #Northeastern analysis

#Convert "N/A" to NA
northeastern_data[northeastern_data == "N/A"] <- NA

#Get rid of $ sign and convert to numeric
northeastern_data$Mid.Career.Median.Salary <- (gsub(
  "\\$", 
  "", 
  northeastern_data$Mid.Career.Median.Salary))

northeastern_data$Mid.Career.Median.Salary <- as.numeric(gsub(
  ",","",northeastern_data$Mid.Career.Median.Salary,fixed=TRUE))

#Take mean
northeast_mean <- mean(northeastern_data[["Mid.Career.Median.Salary"]], na.rm = TRUE)

Region <- c("California", "West", "Midwest", "South", "Northeast")
Median_Salary <- c(california_mean, western_mean, midwest_mean, southern_mean, northeast_mean)
regional_means <- data.frame(Region, Median_Salary)


test <- ((gsub( "\\$", "", california_data$Mid.Career.90th.Percentile.Salary)))

 test <- function(column){
  b <- ((gsub( "\\$", "", california_data$Mid.Career.90th.Percentile.Salary)))
   b
   # northeastern_data$Mid.Career.Median.Salary <- (gsub(
   #   "\\$", 
   #   "", 
   #   northeastern_data$Mid.Career.Median.Salary))
 }
 
 test(california_data[Mid.Career.90th.Percentile.Salary])
