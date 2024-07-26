# Load necessary packages
library(shiny)

# Define UI for the app
ui <- fluidPage(
  titlePanel("Iris Dataset"),
  sidebarLayout(
    sidebarPanel(
      numericInput("rows", "Number of rows to display:", value =5, min = 1, max = nrow(iris)),
      selectInput("variable", "Variable for Scatter Plot:", choices = names(iris)[-5]),
      selectInput("histVariable", "Variable for Histogram:", choices = names(iris)[sapply(iris, is.numeric)]),
    ),
    mainPanel(
      tableOutput("dataTable"),
      plotOutput("scatterPlot"),
      plotOutput("histPlot")
    )
  )
)

# Define server logic
server <- function(input, output) {
  output$dataTable <- renderTable({
    head(iris, n = input$rows)
  })
  
  output$scatterPlot <- renderPlot({
    x <- iris[[input$variable]]
    y <- iris$Sepal.Length
    plot(x, y, xlab = input$variable, ylab = "Sepal Length", main = paste("Sepal Length vs", input$variable), pch = 19, col = "blue")
  })
  
  output$histPlot <- renderPlot({
    hist(iris[[input$histVariable]], xlab = input$histVariable, main = paste("Histogram of", input$histVariable), col = "lightblue", border = "white")
  })
}

# Run the app
shinyApp(ui = ui, server = server)
