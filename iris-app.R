# Load necessary packages
library(shiny)

# Define UI for the app
ui <- fluidPage(
  titlePanel("Iris Dataset"),
  tabsetPanel(
    tabPanel("Description",
             fluidRow(
               column(12, 
                      h3("This Shiny application visualizes the Iris dataset, providing tools to explore the relationship between Sepal Length and other variables in the dataset. Users can also view histograms of different variables and choose to include or exclude outliers in scatter plots."),
                      img(src = 'https://media.licdn.com/dms/image/D4D12AQF5vivFTAdZjQ/article-cover_image-shrink_600_2000/0/1700911428185?e=2147483647&v=beta&t=RaJufpE5-ZMvIMZFVTy4dNtvnKHVgmThtTORx-_qu6Q', width = '100%')
               )
             )
    ),
    tabPanel("Data Visualization",
             sidebarLayout(
               sidebarPanel(
                 numericInput("rows", "Number of rows to display:", value = 5, min = 1, max = nrow(iris)),
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
