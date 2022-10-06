#' Install `groundhog`. Version control for packages. 
#' Load `groundhog`
library(groundhog)

#' Use groundhog to load and install packages with date for version control.
#' load tidyverse and other packages. 
groundhog.library(c('tidyverse', 'tinytex', 'prereg'), '2022-09-01')

#' `readr` is a package within `tidyverse` that allows loading of data without downloading data.
#' load .csv data using `readr`, which pulls the data in straight from the url
#' Assign object name as 'salmon_raw'
salmon_raw <- readr::read_csv('https://whitlockschluter3e.zoology.ubc.ca/Data/chapter12/chap12e4ChinookWithBrookTrout.csv')

#' view first six rows of `salmon_raw`
head(salmon_raw)

#' use `%>%` to string multiple functions together into one object. 
#' `%^%` goes between each complete function.
salmon <- mutate(salmon_raw,
                 troutTreatment = stringr::str_to_title(troutTreatment),# capitalize first initials
                 site = row_number()) %>% #' add new column `site`
  rename(brook_trout_presence = troutTreatment, # change column name
       salmon_released = nReleased, # change column name
       surviving_salmon = nSurvivors, # change column name
       proportion_survived = proportionSurvived) %>% # change column name
  relocate(site, .before = brook_trout_presence) #' relocate new `site` column to first column in df

# view first size rows of salmon to check clean up
head(salmon)

#' write `salmon` to a new .csv file to store in /data
write.csv(salmon, file = 'data/salmon_clean.csv')

