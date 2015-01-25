makeMatrix <- function(x = numeric()) {
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