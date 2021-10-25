#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
    
    # App title ----
    titlePanel("Miles Per Gallon"),
    sidebarLayout(
    
        sidebarPanel(    
        sliderInput('mpg', 'Choose miles per gallon',value = 26, min = 12, max = 40, step = 1,),
        # Input: Numeric entry for miles per gallon to view ----
        numericInput(inputId = "miles",
                     label = "miles per galon",
                     value = 26)
        ), 
    mainPanel(    
        # Output: Summary of cars with Miles per gallon exceeding input value
        verbatimTextOutput("summary"),
        # Output: HTML table with miles per gallon for cars exceeding input value
        tableOutput("view"),
        # Show a plot of the generated distribution
        plotOutput('newHist')  
    )
))
