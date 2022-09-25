#' install the `remotes` package
#' this is going to be necessary to install `grateful` 
#' `grateful` is currently stored on github, so `remotes` pulls it from there
groundhog.library('remotes', '2022-09-01')

#' now install `grateful` using `remotes`
remotes::install_github('Pakillo/grateful')

# I chose to update None when prompted by the console. 