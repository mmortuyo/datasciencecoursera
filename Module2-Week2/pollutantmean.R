pollutantmean <- function(directory, pollutant="sulfate", id=1:332){
  ##set directory as working directory
  setwd(file.path(getwd(), directory))	
  means <- c()	## vector holding pollutant data
  
  for(i in id){
    f <- if(i<10)
      paste("00", as.character(i), ".csv", sep="")
    else if(i<100)
      paste("0", as.character(i), ".csv", sep="")
    else
      paste(as.character(i), ".csv", sep="")
    data <- read.csv(f,header=T,sep=",")
    ## opens file in read only mode
    head(data)
    pollutant
    nar <- data[!is.na(data[,pollutant]), pollutant]
    means <- c(means, nar)
    #means <- mean(data[,pollutant], na.rm=TRUE)
    #print(means)
    #tm <- tm + sum(data[,pollutant])
    #cnt <- cnt+1
  }
  
  setwd("..")
  res <- mean(means)
  return (res)
}