library(tidyverse)
library(dplyr)

artists <- read.csv("/Users/krishna/Desktop/R prog/P1/project/Top_artists_spotify.csv")
colSums(is.na(artists))

dim(artists)
summary(artists)
artists <- na.omit(artists)

artists <- artists %>%
  rename(
    Primary_Genre = Primary.Genre,
    Language = Langugage,
    Artist_Type = Artist.Type,
    Total_Streams = Total.Streams..in.millions.,
    Lead_Streams = Lead.Streams..in.millions.,
    Feature_Streams = Feature.Streams..in.millions.,
    Solo_Streams = Solo.Streams..in.millions.
  )
colSums(is.na(artists))
