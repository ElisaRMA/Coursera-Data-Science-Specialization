complete <- function(directory, id=1:332){
  
  
  files <- list.files(directory, full.names = TRUE)
  nobs <- numeric()
  
  for(i in id) {
    complete<- sum(complete.cases(read.csv(files[i])))
                   
                   nobs <- c(nobs, complete)
                   
  }
  
  df <- data.frame(id, nobs)
  
  
}

cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete("specdata", 54)
print(cc$nobs)

## did not work for this?

set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])


