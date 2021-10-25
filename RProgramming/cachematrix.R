## Put comments here that give an overall description of what your
## functions do

## This first function creates a list of functions

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL # set i as a null/empty object to use later
  
  # same as before, only assigns the values to the parent environment
  set <- function (y) { 
    x <<- y              
    i <<- NULL  }
  
  get <- function () x # gets x from the parent environment 
  
  setinverse <- function(inverse) i <<- inverse # sets the inverse of the matrix
  getinverse <- function() i #gets the inverse
  
  #list of the functions
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
 
}

## This function creates the inverse of a matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
i <- x$getinverse() #gets the inverse if..

# if the i is not null it returns i from the parent environment
if(!is.null(i)){
  return(i)
}

#if i is null, the function will get the i, invert it and return it  
mx <- x$get()
  i <- solve(mx,...)
  x$setinverse(i)
  i
}

## To test the functions

#creates a matrix that can be inverted
k <- matrix(c(1, 4, 3, 5, 8, 6, 7, 9, 2), nrow = 3, ncol = 3) 

j <- makeCacheMatrix(k)

j$get() #gets the matrix created
j$getinverse() #should return NULL 
cacheSolve(j) #inverted the matrix that was set

