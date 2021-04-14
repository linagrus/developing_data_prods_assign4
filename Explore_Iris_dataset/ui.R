library(shiny)
library(plotly)
ui <- fluidPage(
titlePanel("Measurments of sepal and petal for Iris species"),
# Sidebar layout with input and output definitions ----
    sidebarLayout(
# Sidebar panel for inputs ----
                sidebarPanel(
# Input: Select the part of the flower you are interested in to get measurements ----
h3("Select your inputs:"),
p("Please select part of a flower (sepal or petal) you are interested in to get measurments:"),
p("Please filter to specific length/width if you want so, only for specific values to be displayed"),

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
    h3("Interpretation of the output"),
    p("The output is a scatter plot showing length and width relationship for a selected part of a flower (sepal or petal) by different Iris species"),
    p("Measurments are filtered to the ones selected in a slider"),
        plotlyOutput("IrisPlot")
)
)
)

