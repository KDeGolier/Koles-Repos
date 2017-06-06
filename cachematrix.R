#function below creates the matrix that can cache it's inverse, using the "solve" function

makeCacheMatrix <- function(x = matrix()) {
        s <- NULL
        set <- function(y) {
                x <<- y
                s <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) s <<- solve
        getsolve <- function() s 
        list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)

}


## function below computes the inverse of the matrix, or pulls the solution from cache if
# the matrix has already been solved 

cacheSolve <- function(x, ...) {
        s <- x$getsolve()
        if(!is.null(s)){
                message("getting cached data")
                return(s)
        }
        data <- x$get()
        s <- solve(data, ...)
        x$setsolve(s)
        
}
