corr <- function(directory, threshold = 0) {
  id = 1:332
  filename <- list.files(directory, full.names = TRUE)
  
  result <-vector(mode="numeric", length=0)
  
  for(i in seq(filename)) {
    airquality <- read.csv(filename[i])
    good <- complete.cases(airquality)
    airquality <- airquality[good, ]
    if (nrow(airquality) > threshold) {
      # We need [[]] around pollutant instead of [] since airquality["sulfate"]
      # is a data.frame but we need a vector here. Hence, [[]]. Please note thatusing either
      #[[]] or [] gives the same results as the test cases
      correlation <- cor(airquality[["sulfate"]], airquality[["nitrate"]])
      result <- append(result, correlation)
      #print(correlation)
    }
  }
  result
}



cr <- corr("specdata")                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)


cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)


cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
