## The first function, makeVector creates a special "vector", 
## which is really a list containing functions to
## 1.set the value of the matrix
## 2.get the value of the matrix
## 3.set the value of the inverse matrix
## 4.get the value of the inverse matrix	

makeCacheMatrix <- function(x = matrix()) {
	InvMat <- NULL
        set <- function(y) {
                x <<- y
                InvMat <<- NULL
        }
        get <- function() x
        setInverseMatrix <- function(inverse) InvMat <<- inverse
        getInverseMatrix <- function() InvMat
        list(set = set, get = get,
             setInverseMatrix = setInverseMatrix,
             getInverseMatrix = getInverseMatrix)
}


## The following function calculates the Inverse Matrix of the special "vector" created with the above 
## function. However, it first checks to see if the inverse matrix has already been calculated. 
## If so, it gets the inverse matrix from the cache and skips the computation. 
## Otherwise, it calculates the inverse matrix of the data and sets the value of the inverse matrix
## in the cache via the setInverseMatrix function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		invM <- x$getInverseMatrix()
        if(!is.null(invM)) {
                message("getting cached data")
                return(invM)
        }
        data <- x$get()
        invM <- solve(data, ...)
        x$setmean(invM)
        invM
}
