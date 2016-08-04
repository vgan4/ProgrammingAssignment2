#****************************************************************************************************************************************************
#This program is written to get the inverse of the matrix. It is achieved through writing 2 functions. 
#makeCacheMatrix is the function to cache the inverse of the matrix or to get the inverse matrix from the cache.
#CacheSolve function is invoked everytime there is a need to find the matrix. 
#How to Invoke the function in R Console
#Example: 
#source("Matrix.R")
#m<-matrix((1:4),2,2)
#a<- makeCacheMatrix(m)                       #This passes 2X2 matrix to the function makeCacheMatrix with the values of 1,2,3,4
#cacheSolve(a)                               #This command gets the Inverse of the above said matrix. For the first time it is calculate
#cacheSolve(a)                               #When the cacheSolve function is invoked after first time, the values are got from the cache and makeCacheMatrix is not invoked to process this
#m<-matrix((4:7),2,2)                          # Set new values to m matrix 
#a$setmatrix(m)                               #Reset the cached values and set new input
#cacheSolve(a)                                #output of new matrix
#****************************************************************************************************************************************************************




##makeCacheMatrix is the function to cache the inverse of the matrix when inverse
##is passed from cacheSolve and also sets the input value x 
makeCacheMatrix <- function(x = matrix()) {

Inversematrix<-NULL                                         #Initialized Matrix to NULL

#Set function for resetting values of x to new input and reset Inversematrix 
setmatrix <- function(newmatrix) {
			x<<-newmatrix
			Inversematrix<<-NULL
					    }

#Get function for getting the input matrix and passes input matrix
getinputmatrix <- function() x

#Get inverse matrix from cache if stored
getinverse <- function() Inversematrix

#Set Inverse matrix to cache if newly calculated
setinverse <- function(Inverseout) Inversematrix <<- Inverseout

list(setmatrix=setmatrix,getinputmatrix=getinputmatrix,getinverse=getinverse,setinverse=setinverse) #Pass the functionss as arguments


}


## cacheSolve is used to get the cached value of inverse matrix if present
## else calculates the inverse of the matrix

cacheSolve <- function (x,...) {
Inversematrix <- x$getinverse()  #Try to get inverse matrix from cache

if(!is.null(Inversematrix)) {                     #if Null matrix, then it is first invocation of function and hence calculate the inverse
        print("Picking up from Cache")           #if value is present in cache, then use this as output without doing anything else.
        return(Inversematrix)
    }

Inputmatrix <- x$getinputmatrix()
Inverseout <- solve(Inputmatrix)  #calculate inverse of the matrix
x$setinverse(Inverseout) 
Inverseout

} 
		
