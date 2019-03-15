#title: Short chart
#description: This step will produce the chart plot of player's shot position, also a facceted chart of all players 
#input: This step requires x and y coordinates of each player's shot position, so that we can plot on the court image 
#output: It will produce pdf plot of position where each player shot, also, pdf and png of facet chart of all players

library(jpeg)
library(grid)
library(ggplot2)


court_file <- "../images/nba-court.jpg" 

court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

dat <- read.csv(file = "../data/shots-data.csv", stringsAsFactors = FALSE)

stephen_curry_shot_chart <- ggplot(data = dat[dat$name == "Stephen Curry",]) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()

pdf(file = "../images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)
stephen_curry_shot_chart
dev.off()

draymond_green_shot_chart <- ggplot(data = dat[dat$name == "Draymond Green",]) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()

pdf(file = "../images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)
draymond_green_shot_chart
dev.off()

kevin_durant_shot_chart <- ggplot(data = dat[dat$name == "Kevin Durant",]) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()

pdf(file = "../images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
kevin_durant_shot_chart
dev.off()

klay_thompson_shot_chart <- ggplot(data = dat[dat$name == "Klay Thompson",]) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()

pdf(file = "../images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
klay_thompson_shot_chart
dev.off()

andre_iguodala_shot_chart <- ggplot(data = dat[dat$name == "Andre Iguodala",]) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre iguodala (2016 season)') +
  theme_minimal()

pdf(file = "../images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)
andre_iguodala_shot_chart
dev.off()

facet_shot_chart <- ggplot(data = dat) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  facet_wrap(~ name)+
  ggtitle('Shot Charts: GSW (2016 season)') +
  theme_minimal()
  
  facet_shot_chart
  
pdf(file = "../images/gsw-shot-charts.pdf", width = 8, height = 7)
facet_shot_chart
dev.off()


png(file = "../images/gsw-shot-charts.png", units = 'in',res = 300, width = 8, height = 7)
facet_shot_chart
dev.off()

