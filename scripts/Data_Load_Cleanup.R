#' Install `groundhog`. Version control for packages. 
#' Load `groundhog`
library(groundhog)

#' Use groundhog to load and install packages with date for version control.
#' load tidyverse
groundhog.library('tidyverse', '2022-09-01')

#' `readr` is a package within `tidyverse` that allows loading of data without downloading data.
#' load .csv data using `readr`, which pulls the data in straight from the url
#' Assign object name as 'salmon'
salmon <- readr::read_csv('https://whitlockschluter3e.zoology.ubc.ca/Data/chapter12/chap12e4ChinookWithBrookTrout.csv')

#' load `skimr`, a package that summarizes data
#' function is `skim()` to get data summary
groundhog.library('skimr', '2022-09-01')
skim(salmon)

class(salmon)
salmon
