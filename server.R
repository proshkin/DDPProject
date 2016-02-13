library(shiny)
library(ISLR)

data(Wage)
ww <- Wage[c( "wage", "age", "maritl", "race", "education", "jobclass", "health")]
wage.lm = lm(log(wage) ~ . ,  data=ww)

shinyServer(
  function(input, output) {
    res <- reactive({exp(predict(wage.lm, data.frame("age" = {input$selAge}, 
          "maritl" = {input$selMaritalStatus},  
          "race" = {input$selRace}, 
          "education" = {input$selEducation}, 
          "jobclass" = {input$selIndustry}, 
          "health" = {input$selHealth}) , interval="predict")) })

  output$predictionWage <- renderText(  paste(round(res()[1]*1000), '$/year'))
  output$predictionWageMin <- renderText(  paste(round(res()[2]*1000), '$/year'))
  output$predictionWageMax <- renderText(  paste(round(res()[3]*1000), '$/year'))
  }
)
