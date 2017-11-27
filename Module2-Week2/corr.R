corr <- function(directory, threshold = 0) {

	if(grep("specdata", directory) == 1) {
        directory <- ("./specdata/")
    }
    all_tabs <- complete("specdata", 1:332)
    nobs <- all_tabs$nobs
    
    ids <- all_tabs$id[nobs > threshold]
    
    id_len <- length(ids)
    corr_vector <- rep(0, id_len)
    
    all_files <- as.character( list.files(directory) )
    file_paths <- paste(directory, all_files, sep="")
    j <- 1
    for(i in ids) {
        current_file <- read.csv(file_paths[i], header=T, sep=",")
        corr_vector[j] <- cor(current_file$sulfate, current_file$nitrate, use="complete.obs")
        j <- j + 1
    }
    return(corr_vector)   
}
