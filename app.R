library(ggplot2)
MLData <- read.csv('/Users/Hubble_Space_Telescope/Desktop/LargeData/BioPython/BC_search_test_doc.csv')
ui <- fluidPage(
  fluidRow(
    plotOutput("plot1",
               hover = "plot1_hover"
    )
  ),
  #verbatimTextOutput("x_value"),
  verbatimTextOutput("selected_rows")
)

server <- function(input, output) {
  output$plot1 <- renderPlot({
    ggplot(data=MLData, aes(x=year, y = count)) + geom_col(data=MLData, aes(fill = count)) + labs(title = "Machine Learning Papers by Year", x = "Year", y = "Number of Papers")
  })
  
  # Print the name of the x value
  output$x_value <- renderPrint({
    if (is.null(input$plot1_hover$x)) return()
    
    lvls <- levels(MLData$year)
    lvls[round(input$plot1_hover$x)]
  })
  #a lot of the code to get hovering to work is based on
  #internet sources, but edited to work for this project
  # Print the rows of the data frame which match the x value
  output$selected_rows <- renderPrint({
    if (is.null(input$plot1_hover$x)) return()
    
    keeprows <- round(input$plot1_hover$x) == as.numeric(MLData$year)
    MLData[keeprows, ]
  })
}

shinyApp(ui, server)