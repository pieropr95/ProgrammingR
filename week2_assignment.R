library(stringr)
setwd('C:/Users/piero/Documents/Cursos/Coursera/Johns Hopkins - R Programming/Datasets')

# PART 1
pollutantmean <- function(directory, pollutant, id=1:332) {
  df <- data.frame()
  for(i in id){
    csv_id <- str_pad(i, 3, pad='0')
    csv_file <- paste('./', directory, '/', csv_id, '.csv', sep='')
    spec <- read.csv(csv_file, sep=",")
    spec <- na.omit(spec)
    df <- rbind(df, spec)
  }
  
	return(mean(df[[pollutant]]))
}

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)

# PART 2
complete <- function(directory, id=1:332) {
  df <- data.frame(matrix(ncol=2, nrow=0))
  colnames(df) <- c("id", "nobs")
  for(i in id){
    csv_id <- str_pad(i, 3, pad='0')
    csv_file <- paste('./', directory, '/', csv_id, '.csv', sep='')
    spec <- read.csv(csv_file, sep=",")
    spec <- na.omit(spec)
    nobs <- nrow(spec)
    df[nrow(df) + 1, ] <- list(i, nobs)
  }
  
  return(df)
}

complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)

# PART 3
corr <- function(directory, threshold=0) {
  id <- 1:332
  Cor <- numeric()
  for(i in id){
    csv_id <- str_pad(i, 3, pad='0')
    csv_file <- paste('./', directory, '/', csv_id, '.csv', sep='')
    spec <- read.csv(csv_file, sep=",")
    spec <- na.omit(spec)
    if(nrow(spec) > threshold){
      Cor <- append(Cor, cor(spec$sulfate, spec$nitrate))
    }
  }
  
  return(Cor)
}

cr <- corr("specdata", 400)
head(cr)
