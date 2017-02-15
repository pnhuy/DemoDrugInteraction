#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(rjson)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  getRxId <- function(name) {
    baseLink <- paste0("https://rxnav.nlm.nih.gov/REST/rxcui.json?name=", name)
    f <- rjson::fromJSON(file=baseLink)
    return(f$idGroup$rxnormId)
  }
  
  getInteractionPair <- function(drug1, drug2) {
    baseLink <- paste0("https://rxnav.nlm.nih.gov/REST/interaction/list.json?rxcuis=", getRxId(drug1), "+", getRxId(drug2))
    f <- rjson::fromJSON(file=baseLink)
    return(f$fullInteractionTypeGroup[[1]]$fullInteractionType[[1]]$interactionPair[[1]])
  } 
  
  i <- reactive({getInteractionPair(input$drug1, input$drug2)})
  
  output$description <- renderText({i()$description})
  output$severity <- renderText({i()$severity})
  
})
