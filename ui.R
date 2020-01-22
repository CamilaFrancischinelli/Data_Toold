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
               tabsetPanel(type = "tabs",
                           tabPanel("Model", br(), 
                                    h3("Predicted Diamond Price:"),
                                    textOutput("pred")),
                           tabPanel("Documentation", 
                                    br(), 
                                    h3("How to use this model:"),
                                   "This application used the Diamonds database in R to create a model to calculate diamond prices.
                                    Choose which variables you'd like to use: carat, cut, color and/or depth. You must choose at least one variable.
                                    Add the parameters for the diamond that you'd like to predict the price. The result will change automatically."
                                   )
               )
          )
     )
))
