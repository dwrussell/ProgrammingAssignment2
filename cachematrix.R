## This file defines functions to get the inverse of a matrix
## Each invereted matrix is cached and that value is returned if 
## the same matrix is passed as an argument again.  
## ie it is not recalculated

## returns a CacheMatrix list with the following functions:
## set -  set the value of the matrix
## get -  get the value of the matrix
## setinverse - set the inverse of the matrix
## getinverse - get the inverse of the matrix or NULL if not set
makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse) m <<- inverse
	getinverse <- function() m
	list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        ## use solve() to calculate it if not cached
        ## or return from cache if possible
        foo = x$getinverse()
        if(!is.null(foo)) {
        	message("retrieved from cache")
        }
        else
        {
        	foo = solve(x$get())
        	x$setinverse(foo)
        }
        foo
}
