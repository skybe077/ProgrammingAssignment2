## Put comments here that give an overall description of what your
## functions do

# makeCacheMatrix = making the Cache Matrix
# cacheSolve = Getting the inverse of cache Matrix

## how to use: 
# 1. cm <- makeCacheMatrix(someMatrix)
# 2. cacheSolve(cm)
# --> read the messages that pop up :)


## Write a short comment describing this function
# Essentially a data structure to store the matrix and its inverse.
# Contains functions to access this data structure. 
# Note: You should  assign this function to a value for easy use in R

makeCacheMatrix <- function(x = matrix()) {
  
  InverseMatrix <- NULL
  # Resets and stores new matrix in the parent frame
  setMatrix<- function(y){
    x <- y
    InverseMatrix <- NULL
  }
  
  # returns the stored  matrix
  # uses an annonymous function to return x
  getMatrix <- function() x
  
  # Stores inverse matrix. Needs to be called from another function
  # Does not do any calculation 
  setInverse <- function(inverse) InverseMatrix <<- inverse
  
  # Returns inverse matrix. Needs to be called from another function
  getInverse <- function() InverseMatrix
  
  # Returns the data structure as a list
  list(setMatrix = setMatrix, getMatrix = getMatrix, 
       setInverse = setInverse, getInverse = getInverse)
}


## Write a short comment describing this function
# The function that creates the inverse Matrix

cacheSolve <- function(x, ...) {
  
  ## Return a matrix that is the inverse of 'x'
  inverse <- x$getInverse()
  
  # test if we have an inverse matrix. If yes-> return
  if (!is.null(inverse)){  
    message("Happy happy joy joy. We have a cached inverse matrix! :)")
    return(inverse)
  }
  
  # If no -> create the inverse matrix  
  message("Ugh. We'll have to calculate and cache the inverse matrix. >.<")
  
  M <- x$getMatrix()
  inverse <- solve(M)    
  
  #set inverse. Return
  x$setInverse(inverse)
  inverse
}