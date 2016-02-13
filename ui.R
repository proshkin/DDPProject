library(shiny)
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Wage predictor","fff ddf"),

    sidebarPanel(
      selectInput("selMaritalStatus", "Marital status", c("1. Never Married","2. Married","3. Widowed","4. Divorced","5. Separated")),
      selectInput("selRace", "Race", c("1. White","2. Black","3. Asian","4. Other")),
      selectInput("selEducation", "Education", c("1. < HS Grad","2. HS Grad","3. Some College","4. College Grad","5. Advanced Degree")),
      selectInput("selIndustry", "Industry", c("1. Industrial","2. Information")),
      selectInput("selHealth", "Health", c("1. <=Good","2. >=Very Good")),
      sliderInput("selAge", "Age", min = 18, max = 80, value = 35)
     # submitButton('Submit')
    ),
    mainPanel(
      "Enter parameters to predict the Wage. The data is valid only for men who live in Mid-Atlantic region. The claculations are based on the Wage data of ISLR package.",
      h3('Results of prediction'),
      h4('Median Wage'),
      verbatimTextOutput("predictionWage"),
      h4('Minimum Wage 95% percentiel'),
      verbatimTextOutput("predictionWageMin"),
      h4('Maximum Wage 95% percentiel'),
      verbatimTextOutput("predictionWageMax")
    )
  )
)
