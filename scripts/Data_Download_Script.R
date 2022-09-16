library(groundhog)

#use package readr instead of downloading data via the longer method from URL
groundhog.library('tidyverse', '2022-09-01')

salmon <- readr::read_csv('https://whitlockschluter3e.zoology.ubc.ca/Data/chapter12/chap12e4ChinookWithBrookTrout.csv')

groundhog.library('skimr', '2022-09-01')

skim(salmon)

