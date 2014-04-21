complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        result <- as.data.frame(matrix(0,ncol=2)) ##creating a set ncol data frame        
        result <- result[-1,] ##deleting an empty unneeded row
        for (i in id) { ##setting an observatoin cycle
                fileName <- sprintf('%s/%03d.csv', directory, i) ##gets files names
                rawData <-read.csv(fileName) ##reading the CSV file
                nobs <- as.numeric(nrow(na.omit(rawData))) ##stores the number of complete observations for the ID
                ##nrow could also use '(rawData[complete.cases(rawData),])' to calculate for data entries
                newRow <- c(i,nobs) ## creating data for a row
                result <- rbind(result, newRow) ##writing a new row of data
        }
        colnames(result) <- c("id", "nobs") ##assigning names to columns
        result
}