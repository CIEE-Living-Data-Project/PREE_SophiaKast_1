#' Install `groundhog`. Version control for packages. 
#' Load `groundhog`
library(groundhog)

#' Use groundhog to load and install packages with date for version control.
#' load tidyverse
groundhog.library(c('tidyverse', 'tinytex', 'skimr', 'prereg'), '2022-09-01')

#' `readr` is a package within `tidyverse` that allows loading of data without downloading data.
#' load .csv data using `readr`, which pulls the data in straight from the url
#' Assign object name as 'salmon'
salmon_raw <- readr::read_csv('https://whitlockschluter3e.zoology.ubc.ca/Data/chapter12/chap12e4ChinookWithBrookTrout.csv')

#' load `skimr`, a package that summarizes data
#' function is `skim()` to get data summary
groundhog.library('skimr', '2022-09-01')
skim(salmon_raw)

#' view first six rows of `salmon_raw`
head(salmon_raw)

#' use `%>%` to string multiple functions together into one object. 
#' `%^%` goes between each complete function.
#' practice adding a column to denote treatment site number
#' practice changing column names
#' practice relocating site column to first column in data frame 
salmon <- mutate(salmon_raw,
                 troutTreatment = stringr::str_to_title(troutTreatment),
                 site = row_number()) %>% 
  rename(brook_trout_presence = troutTreatment, 
       salmon_released = nReleased,
       surviving_salmon = nSurvivors,
       proportion_survived = proportionSurvived) %>%
  relocate(site, .before = brook_trout_presence)

# view first size rows of salmon to check clean up
head(salmon)

#' write `salmon` to a new .csv file to store in /data
write.csv(salmon, file = 'data/salmon_clean.csv')

