
pollutantmean <- function (directory, pollutant, id = 1:332) {
  
  # obtain list of sensor files in specdata directory
  
  files <- list.files(directory, full.names = TRUE)
  
  
  # create empty data frame
  
  dat <- data.frame()
  
  # subset list of sensor files
  subset <-  files[id] ##useless - take it out 
  
  
  # loop through files in subset list and
  #    * read the csv file
  #    * bind to "collector" data frame
  
  
  for (i in id) {
    dat <- rbind(dat, read.csv(subset[i])) ##this line is the problem!! instead of subset[i], files[i] 
  }
  
  # calculate mean and return to parent environment
  
  mn<- mean (dat[[pollutant]], na.rm = TRUE) 
  mn
}



## QUESTIONS

pollutantmean("specdata", "sulfate", 1:10)

pollutantmean("specdata", "nitrate", 70:72)

pollutantmean("specdata", "sulfate", 34)

pollutantmean("specdata", "nitrate")

