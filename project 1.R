#loading necessary packages
library(ggplot2)

#reading in the .csv file
stroop <- read.csv(file = "~/R projects/stroopdata.csv")

#finding averages and standard deviations for congruent and incongruent groups
averages <- lapply(stroop, mean)
SDs <- lapply(stroop, sd)

#plotting congruent group times
con.plot <- ggplot(data = stroop, aes(stroop$Congruent)) + 
  geom_histogram(breaks = seq(0, 40, by = 2),
                 col = "white",
                 fill = "black",
                 alpha = .66) +
  labs(title = "Histogram of congruent stroop task",
       x = "Time on congruent stroop task (s)",
       y = "Count") +
  ylim(c(0,8))

#plotting incongruent group times
incon.plot <- ggplot(data = stroop, aes(stroop$Incongruent)) + 
  geom_histogram(breaks = seq(0, 40, by = 2),
                 col = "white",
                 fill = "black",
                 alpha = .66) +
  labs(title = "Histogram of incongruent stroop task",
       x = "Time on incongruent stroop task (s)",
       y = "Count") +
  ylim(c(0,8))

#running paired t-test of two groups
test <- t.test(x = stroop$Congruent, y = stroop$Incongruent, paired = TRUE, p.value = .05)

#showing results
averages
SDs
test

#printing plots
con.plot
incon.plot