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
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Drug Interaction"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      textInput("drug1", label = h4("Drug 1"), 
                value = "Ezetimibe"),
      textInput("drug2", label = h4("Drug 2"), 
                value = "Gramicidin"),
      submitButton("Submit")
    ), 
    
    # Show a plot of the generated distribution
    mainPanel(
      
      h4("Overview"),
      p("This app can look up the interaction between 2 drug.",br(), "You can type the name of drugs in the left sidebar and submit.",br(), "The Severity and Description (if any) can show below.",br(), "You can use some example:",br(), " - Ezetimibe vs Gramicidin",br(), " - Verapamil vs Digoxin",br(), " - Warfarin vs Phenytoin"),
      
      
      
      h4("Severity:"),
      textOutput("severity"),
      
      h4("Description:"),
      textOutput("description")
      
    )
  )
))
