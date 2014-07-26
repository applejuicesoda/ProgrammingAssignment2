## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) 
{
	m <- NULL 				## Placeholder object for inverse
	set <- function(y) 		## function that enters matrix argument  
	{
		x <<- y 					## saves argument
		m <<- NULL					## clears previous inverse
	}
	get <- function() x				## f()- retrieves matrix arguement
	setinv <- function(solve) m <<- solve 	## f()- saves inverse
	getinv <- function() m				## f()- gets inverse
	list(set = set, get = get, 			## list of f()
	setinv = setinv, getinv = getinv)		## for cacheSolve's use?

}


## Write a short comment describing this function

cacheSolve <- function(x, ...)	## Return matrix that is the inverse of 'x'
{
	m <- x$getinv() 			## retrievs m created by makeCacheMatrix
	if(!is.null(m))			## if matrix was prevously saved
	{
		message("getting cached data")## display message
		return(m)				## return previously saved inverse
	}
	data <- x$get()				## retrieves matrix
	m <- solve(data, ...)			## calculates inverse	
	x$setinv(m)					## saves calculated result
	return(m)
}
