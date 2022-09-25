groundhog.library('tidyverse', '2022-09-01')

#' create simplme scatter plot of `salmon`
#' plot shows number of surviving salmon based on the number of salmon released
plot(salmon$surviving_salmon~salmon$salmon_released, 
     main = 'Salmon Survival at Lower Granite Dam', 
     xlab = '# of Salmon Released', 
     ylab = '# of Salmon Surviving',
     col = "dark red")


#' create a simple stripchart showing the proportion of surviving salmon based on brook trout presence/absence
salmon %>%
  ggplot(aes(x = brook_trout_presence, y = proportion_survived)) +
  geom_jitter(colour = "blue", size = 3, shape = 1, width = 0.1) +
  xlab("Brook Trout Population") +
  ylab("Proportion of surviving salmon") +
  ylim(0, 0.5) +
  theme_bw()

#' create a violin plot object of the proportion of surviving salmon based on brook trout presence
#' this violin plot does not show points
surviving_salmon.violin <- salmon %>% 
  ggplot(aes(x = brook_trout_presence, y = proportion_survived)) +
  geom_violin() +
  xlab("Brook Trout Population") +
  ylab("Proportion of Surviving Salmon") +
  theme_bw()

#' view the violin plot
surviving_salmon.violin

#' add points to the violin plot
surviving_salmon.violin.points <- surviving_salmon.violin + geom_jitter(colour = "blue", size = 3, shape = 1, width = 0.1)

#' view the violin plot with points
surviving_salmon.violin.points
