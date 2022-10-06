groundhog.library('tidyverse', '2022-09-01')

#' create simplme scatter plot of `salmon`
#' plot shows number of surviving salmon based on the number of salmon released
plot(salmon$surviving_salmon~salmon$salmon_released, # scatterplot
     main = 'Salmon Survival at Lower Granite Dam', # plot title
     xlab = '# of Salmon Released', # x axis label
     ylab = '# of Salmon Surviving', # y axis label
     col = "black") # point color = black


#' create a simple stripchart showing the proportion of surviving salmon based on brook trout presence/absence

salmon %>%
  ggplot(aes(x = brook_trout_presence, y = proportion_survived)) + # set df columns to plot
  geom_jitter(colour = "black", size = 3, shape = 1, width = 0.1) + # point appearance black, circles
  theme(plot.caption = element_text(hjust = 0.5)) + # attempt to center plot.caption
  labs(caption = "Figure 2. Salmon") + # caption label
  xlab("Brook Trout Population") + # x axis label
  ylab("Proportion of surviving salmon") + # y axis label
  ylim(0, 0.5) + 
  theme_bw() # use a black and white theme

#' create a violin plot object of the proportion of surviving salmon based on brook trout presence
#' this violin plot does not show points
surviving_salmon.violin <- salmon %>% 
  ggplot(aes(x = brook_trout_presence, y = proportion_survived)) + # set df columns to plot
  geom_violin() + # use a violin plot
  xlab("Brook Trout Population") + # x axis label
  ylab("Proportion of Surviving Salmon") + # y axis label
  theme_bw() # use a black and white theme

#' view the violin plot
surviving_salmon.violin

#' add points to the violin plot
surviving_salmon.violin.points <- surviving_salmon.violin + geom_jitter(colour = "black", size = 3, shape = 1, width = 0.01)

#' view the violin plot with points
surviving_salmon.violin.points
