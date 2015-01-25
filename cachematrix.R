## -makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.0
## - cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
##If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.


##The function, makeCacheMatrix creates a special "matrix" object that can cache its inverse., 
## In reality it contains a list containing a function to
##set the value of the matrix
##get the value of the matrix
##set the value of the inverse
##get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
	m<- NULL
	set <- function(y){ 
		x<<-y
		m<<- NULL		
	}

	get <- function() x
	setinverse <- function(solve()) m <<-solve()
	getinverse <- function() m
	
	list(set = set, get = get,
             setinverse = setinverse ,
             getinverse = getinverse )
	

}


##The following function calculates the inverse of the special "matrix" created with the above function. 
##However, it first checks to see if the mean has already been calculated. 
## If so, it gets the inverse from the cache and skips the computation. 
## Otherwise, it calculates the mean of the data and sets the value of the mean in the cache via the setmean function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		m <-x$getinverse()

		if(!is.null(m)){
			message("getting the inverse from the cache")
			reurn(m)
		}
		
		data <- z$get()
		m <- solve(data,...)
		x$setinverse(m)
		m
}