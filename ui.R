library(shiny)

shinyUI(fluidPage(
     titlePanel("Create your own Diamond price model"),
     
     sidebarLayout(
          sidebarPanel(
               h3("Select Variables"),
               checkboxInput("useCarat", "Carat", value = TRUE),
               checkboxInput("useCut", "Cut", value = TRUE),
               checkboxInput("useColor", "Color", value = TRUE),
               checkboxInput("useDepth", "Depth", value = TRUE),
               br(),
               br(),
               h3("Test Your Model"),
               numericInput("Carat", "Carat:", 0.5, min = 0.2, max = 5.0, step = 0.1),
               selectInput("Cut", "Cut:", 
                           choices = list("Fair" = "Fair", "Good" = "Good",
                                          "Very Good" = "Very Good", "Premium" = "Premium",
                                          "Ideal" = "Ideal"), selected = "Fair"),
               selectInput("Color", "Color:", 
                           choices = list("D" = "D", "E" = "E", "F" = "F", "G" = "G",
                                          "H" = "H", "I" = "I", "J" = "J"), selected = "D"),
               numericInput("Depth", "Depth:", 40, min = 40, max = 80, step = 1)
          ),
          
          mainPanel(
               h3("Predicted Diamond Price:"),
               textOutput("pred")
          )
     )
))
