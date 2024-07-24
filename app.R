# Load the Shiny package
library(shiny)

# Define UI for iris dataset viewer app
ui <- fluidPage(
  
  # App title
  titlePanel("Iris Dataset"),
  
  # Short description
  h4("This app visualizes the relationship between Sepal Length and other variables in the Iris dataset, with options to include or exclude outliers."),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs
    sidebarPanel(
      
      # Input: Numeric input for number of rows to display ----
      numericInput(inputId = "rows",
                   label = "Number of rows to display:",
                   value = 5,
                   min = 1,
                   max = nrow(iris)),
      
      # Input: Selector for variable to plot against Sepal.Length ----
      selectInput(inputId = "variable",
                  label = "Variable for Scatter Plot:",
                  choices = names(iris)[-1]),
      
      # Input: Selector for variable to plot histogram ----
      selectInput(inputId = "histVariable",
                  label = "Variable for Histogram:",
                  choices = names(iris)[-1]),
      
      # Input: Checkbox for whether outliers should be included ----
      checkboxInput(inputId = "outliers",
                    label = "Show outliers",
                    value = TRUE)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Data table ----
      tableOutput(outputId = "dataTable"),
      
      # Output: Scatter Plot ----
      plotOutput(outputId = "scatterPlot"),
      
      # Output: Histogram ----
      plotOutput(outputId = "histPlot")
      
    )
  )
)

# Define server logic to plot various variables against Sepal.Length ----
server <- function(input, output) {
  
  # Data table of the iris dataset
  output$dataTable <- renderTable({
    head(iris, n = input$rows)
  })
  
  # Scatterplot of the selected variable against Sepal.Length
  output$scatterPlot <- renderPlot({
    
    x <- iris[[input$variable]]
    y <- iris$Sepal.Length
    
    plot(x, y,
         xlab = input$variable,
         ylab = "Sepal Length",
         main = paste("Sepal Length vs", input$variable),
         pch = 19,
         col = "blue")
    
    # If the checkbox is checked, add outliers
    if (input$outliers) {
      points(x, y, pch = 1, col = "red")
    }
  })
  
  # Histogram of the selected variable
  output$histPlot <- renderPlot({
    
    hist(iris[[input$histVariable]],
         xlab = input$histVariable,
         main = paste("Histogram of", input$histVariable),
         col = "lightblue",
         border = "white")
  })
}

# Create Shiny app
shinyApp(ui = ui, server = server)
