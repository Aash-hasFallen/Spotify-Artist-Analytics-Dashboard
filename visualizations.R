source("/Users/krishna/Desktop/R prog/P1/project/proj1.R")
library(plotly)
top10 <- artists %>%
  arrange(desc(Total_Streams)) %>%
  slice(1:10)

p1 <- ggplot(
  top10,
  aes(
    x = reorder(Artist, Total_Streams),
    y = Total_Streams
  )
) +
  geom_col(fill = "darkgreen") +
  coord_flip() +
  labs(
    title = "Top 10 Most Streamed Artists",
    x = "Artist",
    y = "Total Streams (Millions)"
  ) +
  theme_minimal()

print(p1)

genre_count <- artists %>%
  count(Primary_Genre)

p2 <- ggplot(
  genre_count,
  aes(
    x = reorder(Primary_Genre, n),
    y = n,
    fill = Primary_Genre
  )
) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Artists by Genre",
    x = "Genre",
    y = "Number of Artists"
  ) +
  theme_minimal() +
  theme(
    legend.position = "none"
  )

print(p2)

country_count <- artists %>%
  count(Country) %>%
  arrange(desc(n)) %>%
  slice(1:10)

p3 <- ggplot(
  country_count,
  aes(
    x = reorder(Country, n),
    y = n,
    fill = Country
  )
) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Top 10 Countries",
    x = "Country",
    y = "Number of Artists"
  ) +
  theme_minimal() +
  theme(
    legend.position = "none"
  )

print(p3)

gender_count <- artists %>%
  count(Sex)

p4 <- ggplot(
  gender_count,
  aes(
    x = "",
    y = n,
    fill = Sex
  )
) +
  geom_col(width = 1) +
  coord_polar(theta = "y") +
  labs(
    title = "Gender Distribution"
  ) +
  theme_void()

print(p4)

p5 <- ggplot(
  artists,
  aes(
    x = Lead_Streams,
    y = Feature_Streams,
    color = Primary_Genre
  )
) +
  geom_point(
    size = 3,
    alpha = 0.7
  ) +
  labs(
    title = "Lead Streams vs Feature Streams",
    x = "Lead Streams (Millions)",
    y = "Feature Streams (Millions)"
  ) +
  theme_minimal()

print(p5)

p6 <- ggplot(
  artists,
  aes(
    x = Primary_Genre,
    y = Total_Streams,
    fill = Primary_Genre
  )
) +
  geom_boxplot() +
  coord_flip() +
  labs(
    title = "Total Streams by Genre",
    x = "Genre",
    y = "Total Streams (Millions)"
  ) +
  theme_minimal() +
  theme(
    legend.position = "none"
  )

print(p6)


p7 <- ggplot(
  artists,
  aes(
    x = Solo_Streams,
    y = Lead_Streams
  )
) +
  geom_point(
    color = "steelblue",
    size = 3,
    alpha = 0.7
  ) +
  labs(
    title = "Solo Streams vs Lead Streams",
    x = "Solo Streams (Millions)",
    y = "Lead Streams (Millions)"
  ) +
  theme_minimal()

print(p7)

interactive_plot <- ggplot(
  artists,
  aes(
    x = Lead_Streams,
    y = Feature_Streams,
    text = paste(
      "Artist:", Artist,
      "<br>Genre:", Primary_Genre,
      "<br>Country:", Country,
      "<br>Total Streams:", Total_Streams
    )
  )
) +
  geom_point(
    color = "darkgreen",
    size = 3
  ) +
  labs(
    title = "Interactive Stream Analysis"
  ) +
  theme_minimal()

ggplotly(
  interactive_plot,
  tooltip = "text"
)
