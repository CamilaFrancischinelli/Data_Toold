library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

     db <- data(diamonds)

     modelpred <- reactive ({     

     formula = "price ~ "
     if(input$useCarat) {
          formula = paste(formula, "carat", sep = " + ")
     }
     if(input$useCut) {
          formula = paste(formula, "cut", sep = " + ")
     }
     if(input$useColor) {
          formula = paste(formula, "color", sep = " + ")
     }
     if(input$useDepth) {
          formula = paste(formula, "depth", sep = " + ")
     }

     model <- lm(formula = formula, data = diamonds)

               caratInput <- input$Carat
               cutInput <- input$Cut
               colorInput <- input$Color
               depthInput <- input$Depth
          
               predict(model, newdata = data.frame(carat = caratInput, cut = cutInput,
                                                   color = colorInput, depth = depthInput))
          })    

     output$pred <- renderText({
          round(modelpred(), digits = 2)
     })


})
