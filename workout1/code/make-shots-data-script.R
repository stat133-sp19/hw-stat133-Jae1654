#title: Data Preparation
#description: This is a workout to create a csv data file shots-data.csv with GSW player's summary
#input: Inputs are csv files of each player's data so that we can calculate new analysis such as minuite of shots, or modify current data to more descriptive data .
#output: This produces an summary of the each players' data as well as assembled chart of all players  .

library(readr)

curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)


curry$name <- "Stephen Curry"
thompson$name <- "Klay Thompson"
durant$name <- "Kevin Durant"
green$name <- "Draymond Green"
iguodala$name <- "Andre Iguodala"


curry$shot_made_flag[curry$shot_made_flag == "y"] <- "shot_yes"
curry$shot_made_flag[curry$shot_made_flag == "n"] <- "shot_no"

thompson$shot_made_flag[thompson$shot_made_flag == "y"] <- "shot_yes"
thompson$shot_made_flag[thompson$shot_made_flag == "n"] <- "shot_no"

durant$shot_made_flag[durant$shot_made_flag == "y"] <- "shot_yes"
durant$shot_made_flag[durant$shot_made_flag == "n"] <- "shot_no"


green$shot_made_flag[green$shot_made_flag == "y"] <- "shot_yes"
green$shot_made_flag[green$shot_made_flag == "n"] <- "shot_no"

iguodala$shot_made_flag[iguodala$shot_made_flag == "y"] <- "shot_yes"
iguodala$shot_made_flag[iguodala$shot_made_flag == "n"] <- "shot_no"



curry$minute <- (curry$period*12-curry$minutes_remaining)
durant$minute <- (durant$period*12-durant$minutes_remaining)
iguodala$minute <- (iguodala$period*12-iguodala$minutes_remaining)
green$minute <- (green$period*12-green$minutes_remaining)
thompson$minute <- (thompson$period*12-thompson$minutes_remaining)



sink(file = '../output/stephen-curry-summary.txt')
summary(curry)
sink()

sink(file = '../output/kevin-durant-summary.txt')
summary(durant)
sink()

sink(file = '../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

sink(file = '../output/draymond-green-summary.txt')
summary(green)
sink()

sink(file = '../output/klay-thompson-summary.txt')
summary(thompson)
sink()

assembled_data <- rbind(curry,durant,iguodala,green,thompson)

write.csv(
  x = assembled_data,
  file = '../data/shots-data.csv' )

sink(file = '../output/shots-data-summary.txt')
summary(assembled_data)
sink()



