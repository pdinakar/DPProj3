#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(dplyr)
data(mtcars)

shinyServer(  
    function(input, output) {   
        
        output$newHist <- renderPlot({      
            hist(mtcars$mpg, xlab='miles per gallon', col='lightblue',main='Histogram')      
            mu <- input$miles      
            lines(c(mu, mu), c(0, 200),col="red",lwd=5)      
            mse <- mean((mtcars$mpg - mu)^2)      
            text(63, 150, paste("mu = ", mu))      
            text(63, 140, paste("MSE = ", round(mse, 2)))      
        })     
        # This is in a reactive expression since it is shared by Plot and Table data
        reactInp <- reactive({input$mpg})
        output$inMiles <- reactInp
        output$summary <- renderPrint({
          mtcars %>% filter(mpg > input$mpg)
        })
        output$view <- renderTable({
          mtcars[0:6] %>% filter(mpg > input$miles)
        })
        
        
        }
)