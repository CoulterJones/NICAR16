## ---- message=FALSE, warning=FALSE, echo=FALSE---------------------------
require(knitr)
opts_chunk$set(eval=FALSE)

## ---- eval=FALSE---------------------------------------------------------
## ?mean

## ---- eval=FALSE---------------------------------------------------------
## help(mean)

## ---- message=FALSE, warning=FALSE---------------------------------------
require(mosaic)
require(ggplot2)

## ------------------------------------------------------------------------
data(midwest)
head(midwest)

## ------------------------------------------------------------------------
?midwest

## ------------------------------------------------------------------------
help(midwest)

## ------------------------------------------------------------------------
str(midwest)

## ------------------------------------------------------------------------
summary(midwest)

## ------------------------------------------------------------------------
names(midwest)

## ------------------------------------------------------------------------
midwest <- midwest %>%
  mutate(inmetro = factor(inmetro))

## ------------------------------------------------------------------------
xyplot(popwhite~popblack, data=midwest)

## ------------------------------------------------------------------------
histogram(~percprof, data=midwest)
densityplot(~percprof, data=midwest)
bwplot(~percprof, data=midwest)

## ------------------------------------------------------------------------
histogram(~percprof|inmetro, data=midwest)
bwplot(~percprof|inmetro, data=midwest)

## ------------------------------------------------------------------------
densityplot(~percprof, groups=inmetro, data=midwest, auto.key=TRUE)
bwplot(inmetro~percprof, data=midwest)

## ------------------------------------------------------------------------
xyplot(poptotal~area, groups=inmetro, data=midwest)

## ------------------------------------------------------------------------
mean(~popblack, data=midwest)

## ------------------------------------------------------------------------
favstats(~popblack, data=midwest)

## ------------------------------------------------------------------------
mean(popblack~inmetro, data=midwest)

## ------------------------------------------------------------------------
tally(~inmetro, data=midwest)

## ------------------------------------------------------------------------
tally(inmetro~category, data=midwest)

## ------------------------------------------------------------------------
barchart(tally(~category, data=midwest))

## ------------------------------------------------------------------------
midwest %>% arrange(percblack)

## ------------------------------------------------------------------------
midwest %>% arrange(desc(percblack))

## ------------------------------------------------------------------------
require(mosaic)
require(ggplot2)
require(dplyr)

## ------------------------------------------------------------------------
docs <- read.csv("/data/Intro_to_R/MAC/PartD_Providers_FORCLASS.csv", header = T)

## ------------------------------------------------------------------------
str(docs)

## ------------------------------------------------------------------------
summary(docs)

## ------------------------------------------------------------------------
favstats(~COST_SUM, data=docs)

## ------------------------------------------------------------------------
qplot(COST_SUM, data = docs)

## ------------------------------------------------------------------------
qplot(COST_SUM, data = docs, geom = "histogram")

## ------------------------------------------------------------------------
qplot(CLAIM_COUNT, data = docs, geom = "density")

## ------------------------------------------------------------------------
qplot(CLAIM_COUNT, BRAND_COUNT, data = docs)

## ------------------------------------------------------------------------
qplot(CLAIM_COUNT, BRAND_COUNT, data = docs, geom = "line")

## ------------------------------------------------------------------------
qplot(CLAIM_COUNT, BRAND_COUNT, data = docs, geom = "smooth")

## ------------------------------------------------------------------------
qplot(CLAIM_COUNT, BRAND_COUNT, data = docs, geom = c("point", "smooth"))

## ------------------------------------------------------------------------
2+4

## ------------------------------------------------------------------------
2+4*3^2

## ------------------------------------------------------------------------
(2+4)*3^2

## ------------------------------------------------------------------------
docs <- mutate(docs, BRAND_PCT = BRAND_COUNT/CLAIM_COUNT)

## ------------------------------------------------------------------------
head(docs)

str(docs)

## ------------------------------------------------------------------------
docs <- mutate(docs, BRAND_PCT = (BRAND_COUNT/CLAIM_COUNT)*100)

head(docs)

## ------------------------------------------------------------------------
require(dplyr)

## ------------------------------------------------------------------------
colorado_docs <- filter(docs, STATE == "CO")

View(colorado_docs)

## ------------------------------------------------------------------------
colorado_high <- filter(docs, STATE == "CO" & COST_SUM > 500000)

## ------------------------------------------------------------------------
head(colorado_high, 20) %>% arrange(desc(COST_SUM))

## ------------------------------------------------------------------------
state_group <- group_by(docs, STATE)

## ------------------------------------------------------------------------
state_docs <- summarise(state_group,
  count = n(),
  median_cost = median(COST_SUM)
)

state_docs

## ------------------------------------------------------------------------
state_docs <- summarise(state_group,
  count = n(),
  median_cost = median(COST_SUM),
  total_cost = sum(COST_SUM),
  high_cost = max(COST_SUM),
  sd_cost = sd(COST_SUM),
  median_scripts = sum(CLAIM_COUNT),
  total_scripts = sum(CLAIM_COUNT)
)

## ------------------------------------------------------------------------
state_group <- group_by(docs, CITY, STATE)

## ------------------------------------------------------------------------
state_docs <- summarise(state_group,
  count = n(),
  median_cost = median(COST_SUM),
  total_cost = sum(COST_SUM),
  high_cost = max(COST_SUM),
  sd_cost = sd(COST_SUM),
  median_scripts = sum(CLAIM_COUNT),
  total_scripts = sum(CLAIM_COUNT)
)

## ------------------------------------------------------------------------
median(colorado_high$CLAIM_COUNT)

## ------------------------------------------------------------------------
hist(colorado_high$CLAIM_COUNT)

## ------------------------------------------------------------------------
plot(colorado_high$CLAIM_COUNT ~ colorado_high$BRAND_COUNT)

