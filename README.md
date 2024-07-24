# Iris Dataset Viewer

This Shiny application visualizes the Iris dataset, providing tools to explore the relationship between Sepal Length and other variables in the dataset. Users can also view histograms of different variables and choose to include or exclude outliers in scatter plots.

## Features

- **Data Table**: Display a specified number of rows from the Iris dataset.
- **Scatter Plot**: Visualize the relationship between Sepal Length and a chosen variable, with an option to include or exclude outliers.
- **Histogram**: Generate a histogram for a selected variable.

## Usage

### User Interface

The app is structured with a sidebar for inputs and a main panel for outputs:

- **Sidebar Panel**:
  - **Number of rows to display**: Choose the number of rows from the Iris dataset to display in the data table.
  - **Variable for Scatter Plot**: Select a variable to plot against Sepal Length in the scatter plot.
  - **Variable for Histogram**: Select a variable to generate a histogram.
  - **Show outliers**: Checkbox to include or exclude outliers in the scatter plot.

- **Main Panel**:
  - **Data Table**: Displays the first N rows of the Iris dataset, where N is specified by the user.
  - **Scatter Plot**: Displays a scatter plot of Sepal Length against the chosen variable.
  - **Histogram**: Displays a histogram of the selected variable.

### Running the App

To run the app, you need to have R and the Shiny package installed. You can install Shiny using the following command:

```R
install.packages("shiny")
```
