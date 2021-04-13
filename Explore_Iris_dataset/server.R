library(shiny)
library(plotly)
IrisData <- iris
server <- function(input, output) {

    filtered_data <- reactive({
        data <- IrisData
        data <- select(
                 data,
                 which(grepl(input$variable, names(data))|grepl("Species", names(data)))
            )
        colnames(data) = gsub("Sepal.", "", colnames(data))
        colnames(data) = gsub("Petal.", "", colnames(data))
        data <- subset(
            data,
            data$Length >= input$length[1] & data$Length <= input$length[2] &
                data$Width >= input$width[1] & data$Width <= input$width[2]
            )
        data
    })
    
    Text1 <- reactive({
        paste(input$variable, " Length")
    })
    
    Text2 <- reactive({
        paste(input$variable, " Width")
    })
    
    Text3 <- reactive({
        paste(input$variable, " Length vs Width by Iris Species")
    })

    output$IrisPlot <- renderPlotly({
        

            data <- filtered_data()
            xtitle <- Text1()
            ytitle <- Text2()
            maintitle <- Text3()
            p <- plot_ly(data, x=data$Length, y=data$Width, 
                    mode = "markers", color = data$Species, type="scatter") %>%
                layout(xaxis=list(title =xtitle), 
                       yaxis=list(title =ytitle),
                       title = maintitle)
            p

    })
}