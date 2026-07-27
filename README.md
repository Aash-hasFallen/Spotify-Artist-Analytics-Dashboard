# Spotify Artist Analytics Dashboard 🎵📊

An interactive data analytics and visualization project built using **R Programming** to explore global Spotify artist trends.

The project analyzes streaming performance, genre popularity, country-wise distribution, artist demographics, and collaboration patterns. An interactive dashboard was developed using **R Shiny**, allowing users to dynamically filter and explore Spotify artist data.

---

## 📌 Project Overview

The music industry generates massive amounts of streaming data every day. This project focuses on analyzing Spotify artist data to discover meaningful insights such as:

- Top performing artists based on total streams
- Most popular music genres
- Countries with the highest number of artists
- Gender distribution among artists
- Relationship between lead and feature streams
- Streaming performance across different genres

The project uses data cleaning, exploratory data analysis, and interactive visualization techniques to transform raw Spotify data into meaningful insights.

---

# ✨ Features

## 🧹 Data Cleaning & Preparation

- Imported Spotify artist dataset
- Checked missing values
- Removed incomplete records
- Renamed columns for better readability
- Prepared clean data for analysis

---

## 📊 Exploratory Data Analysis

The project includes multiple visualizations:

### 🎤 Top 10 Most Streamed Artists

Identifies artists with the highest total streaming numbers.

### 🎼 Artists by Genre

Analyzes how artists are distributed across different music genres.

### 🌎 Top Countries

Shows countries with the highest number of Spotify artists.

### 👥 Gender Distribution

Visualizes representation of artists based on gender.

### 📈 Lead Streams vs Feature Streams

Analyzes the relationship between an artist's lead streams and feature streams.

### 📦 Total Streams by Genre

Uses boxplots to compare streaming performance across different genres.

### 🎵 Solo Streams vs Lead Streams

Explores how solo performances contribute to overall artist success.

---

# 🚀 Interactive Shiny Dashboard

The project includes an interactive dashboard created using **R Shiny**.

Users can dynamically filter the dataset using:

- Genre
- Country
- Gender

The dashboard automatically updates all visualizations based on user selections.

## Dashboard Components

- Top 10 Most Streamed Artists
- Gender Distribution
- Artists by Genre
- Total Streams by Genre
- Top Countries
- Interactive Lead vs Feature Streams Scatter Plot

---

# 🛠️ Technologies Used

## Programming Language

- R

## Libraries

### Data Processing

- tidyverse
- dplyr

### Data Visualization

- ggplot2

### Interactive Visualization

- plotly

### Dashboard Development

- shiny

---

# 📂 Project Structure

```
Spotify-Artist-Analytics-Dashboard/

│
├── proj1.R
│   └── Data loading, cleaning and preprocessing
│
├── analysis.R
│   └── Exploratory data analysis and visualizations
│
├── dashboard.R
│   └── Interactive Shiny dashboard
│
├── Top_artists_spotify.csv
│   └── Spotify artist dataset
│
└── README.md
```

---

# 🔄 Project Workflow

```
Raw Spotify Dataset
          |
          ↓
Data Cleaning & Preprocessing
          |
          ↓
Exploratory Data Analysis
          |
          ↓
Data Visualization
          |
          ↓
Interactive Shiny Dashboard
```

---

# 📌 Key Insights

This project helps identify:

- Artists with the highest streaming performance
- Popular music genres worldwide
- Countries contributing the most artists
- Gender representation trends
- Patterns between lead and feature streams
- Differences in streaming distribution among genres

---

# ▶️ How to Run the Project

## 1. Clone the Repository

```bash
git clone https://github.com/yourusername/Spotify-Artist-Analytics-Dashboard.git
```

## 2. Open the Project in RStudio

Navigate to the project directory.

## 3. Install Required Libraries

Run:

```r
install.packages(c(
  "tidyverse",
  "dplyr",
  "ggplot2",
  "plotly",
  "shiny"
))
```

## 4. Run the Dashboard

Open:

```
dashboard.R
```

Execute:

```r
shinyApp(ui, server)
```

The interactive dashboard will launch in your browser.

---

# 🔮 Future Improvements

Possible enhancements:

- Integrate Spotify API for real-time data
- Add yearly streaming trend analysis
- Build machine learning models for popularity prediction
- Create artist recommendation systems
- Deploy dashboard online using ShinyApps.io

---

# 👨‍💻 Author

**Aashray Biswal <br> Disha Bhawsar <br> Aatiya Sharma <br> Rishi Jaiswal**

---

# 📜 License

This project is created for educational and analytical purposes.
