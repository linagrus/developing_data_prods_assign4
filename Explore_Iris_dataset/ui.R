library(shiny)
library(plotly)
ui <- fluidPage(
titlePanel("Measurments of sepal and petal for Iris species"),
# Sidebar layout with input and output definitions ----
    sidebarLayout(
# Sidebar panel for inputs ----
                sidebarPanel(
# Input: Select the part of the flower you are interested in to get measurements ----
selectInput("variable", "Part:", 
            c("Sepal" = "Sepal",
              "Petal" = "Petal")),

sliderInput(inputId = "length", label = "length of a flower part",
        min = 0, max = 10,
        value = c(0, 10)),

sliderInput(inputId = "width", label = "width of a flower part",
            min = 0, max = 5,
            value = c(0, 5)) 
                ),
                
mainPanel(
    # Output: Plot of the length vs width for requested flower part ----
    plotlyOutput("IrisPlot")
)
)
)

