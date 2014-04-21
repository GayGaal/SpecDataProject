corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        id <- 1:332 ## sets all files for scanning
        cDt <- complete(directory, id) ## runs 'complete' function on all of the files
        files <- cDt[cDt[,"nobs"] > threshold,"id"] ## creates a list of all valid files
        results <- c() ## creates an empty vector for results
        counter <- 1 ## set a counter value to 1
        for(i in files) { ## creates a cycle with duration of number of files
                fileName <- sprintf('%s/%03d.csv', directory, i) ## gets files names
                data <- read.csv(fileName) ## reades CSV file
                data <- na.omit(data) ## removes lines with NA values in them
                results[counter] <- cor(data[,"nitrate"],data[,"sulfate"]) ## writes a result for an attempt to its place
                counter <- counter + 1 ## renews the counter       
        }
        results
}