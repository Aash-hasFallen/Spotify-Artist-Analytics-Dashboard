library(tidyverse)
library(shiny)
library(plotly)

source("~/Desktop/R prog/P1/project/proj1.R")

ui <- fluidPage(
  
  titlePanel("Spotify Artist Analytics Dashboard"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput(
        "genre",
        "Select Genre",
        choices = c("All", sort(unique(artists$Primary_Genre))),
        selected = "All"
      ),
      
      selectInput(
        "country",
        "Select Country",
        choices = c("All", sort(unique(artists$Country))),
        selected = "All"
      ),
      
      selectInput(
        "sex",
        "Select Sex",
        choices = c("All", sort(unique(artists$Sex))),
        selected = "All"
      )
      
    ),
    
    mainPanel(
      
      h3("Top 10 Most Streamed Artists"),
      plotOutput("topArtists", height = "400px"),
      
      hr(),
      
      h3("Gender Distribution"),
      plotOutput("genderPie", height = "400px"),
      
      hr(),
      
      h3("Artists by Genre"),
      plotOutput("genreChart", height = "400px"),
      
      hr(),
      
      h3("Total Streams by Genre"),
      plotOutput("genreBox", height = "400px"),
      
      hr(),
      
      h3("Top Countries"),
      plotOutput("countryChart", height = "400px"),
      
      hr(),
      
      h3("Lead vs Feature Streams"),
      plotlyOutput("scatter", height = "500px")
      
    )
    
  )
  
)

server <- function(input, output) {
  
  
  filtered_data <- reactive({
    
    data <- artists
    
    if (input$genre != "All") {
      data <- data %>%
        filter(Primary_Genre == input$genre)
    }
    
    if (input$country != "All") {
      data <- data %>%
        filter(Country == input$country)
    }
    
    if (input$sex != "All") {
      data <- data %>%
        filter(Sex == input$sex)
    }
    
    data
    
  })
 
  
  output$topArtists <- renderPlot({
    
    top10 <- filtered_data() %>%
      arrange(desc(Total_Streams)) %>%
      slice(1:10)
    
    ggplot(
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
        y = "Streams"
      ) +
      theme_minimal()
    
  })
  
  
  output$genderPie <- renderPlot({
    
    gender <- filtered_data() %>%
      count(Sex)
    
    ggplot(
      gender,
      aes(
        x = "",
        y = n,
        fill = Sex
      )
    ) +
      geom_col(width = 1) +
      coord_polar(theta = "y") +
      labs(title = "Gender Distribution") +
      theme_void()
    
  })

  
  output$genreChart <- renderPlot({
    
    genre <- filtered_data() %>%
      count(Primary_Genre)
    
    ggplot(
      genre,
      aes(
        x = reorder(Primary_Genre, n),
        y = n,
        fill = Primary_Genre
      )
    ) +
      geom_col() +
      coord_flip() +
      theme_minimal() +
      theme(legend.position = "none")
    
  })

  
  output$genreBox <- renderPlot({
    
    ggplot(
      filtered_data(),
      aes(
        x = Primary_Genre,
        y = Total_Streams,
        fill = Primary_Genre
      )
    ) +
      geom_boxplot() +
      coord_flip() +
      theme_minimal() +
      theme(legend.position = "none")
    
  })

  
  output$countryChart <- renderPlot({
    
    country <- filtered_data() %>%
      count(Country) %>%
      arrange(desc(n)) %>%
      slice(1:10)
    
    ggplot(
      country,
      aes(
        x = reorder(Country, n),
        y = n,
        fill = Country
      )
    ) +
      geom_col() +
      coord_flip() +
      theme_minimal() +
      theme(legend.position = "none")
    
  })
  

  
  output$scatter <- renderPlotly({
    
    p <- ggplot(
      
      filtered_data(),
      
      aes(
        
        x = Lead_Streams,
        
        y = Feature_Streams,
        
        color = Primary_Genre,
        
        text = paste(
          
          "Artist:", Artist,
          
          "<br>Genre:", Primary_Genre,
          
          "<br>Country:", Country,
          
          "<br>Total Streams:", Total_Streams
          
        )
        
      )
      
    ) +
      
      geom_point(size = 3) +
      
      theme_minimal()
    
    ggplotly(p, tooltip = "text")
    
  })
  
}

shinyApp(ui, server)