setwd("C:/Users/santosh.jani/Desktop/Data Science/R Programming/R Shiny/NO9543/BrandEquityModel/Brand Equity Model SJ")

library(shinydashboard)

# Adding image or logo along with the title in the header
title <- tags$a(href='http://www.adelphiresearchglobal.com/',
                tags$img(src="Logo_and_splash_INSPIRE_ACTION_RGB.jpg", height = '55', width = '220'),
                'Diamonds Explorer', target="_blank")

ui <- dashboardPage(
  # dashboardHeader(title = title,
  #                 dropdownMenu(type = "messages",
  #                   messageItem(
  #                     from = "Sales Dept",
  #                     message = "Sales are steady this month"
  #                   ),
  #                   messageItem(
  #                     from = "New User",
  #                     message = "How do I register?",
  #                     icon = icon("question"),
  #                     time = "13:45"
  #                   ),
  #                   messageItem(
  #                     from = "Support",
  #                     message = "The new server is ready",
  #                     icon = icon("life-ring"),
  #                     time = "2014-12-01"
  #                   )
  #                 )
  # ),
  dashboardHeader(title = "Brand Equity"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Brand Equity Dashboard", tabName = "BrandEquityDashboard", icon = icon("dashboard")),
      menuItem("Brand Comparison Dashboard", tabName = "BrandComparisonDashboard", icon = icon("dashboard")), 
      menuItem("Scorecard Dashboard", tabName = "ScorecardDashboard", icon = icon("clipboard")), 
      menuItem("Unique Association", tabName = "uniqueassocaiation", icon = icon("chart-bar")), 
      menuItem("Help", tabName = "help", icon = icon("question")) 
    )
  ),
  dashboardBody(
      tabItems(
      tabItem(tabName = "BrandEquityDashboard",
      fluidRow(    
      box(plotOutput("plot1", height = 250)),
      
      box(
        title = "Controls",
        sliderInput("slider", "Number of observations:", 1, 100, 50)
      )
      )
    ),
    
      tabItem(tabName = "BrandComparisonDashboard",
              
              box(plotOutput("plot2", height = 250)),
              
              box(
                title = "Controls",
                sliderInput("slider1", "Number of observations:", 101, 200, 150)
              )
      )
    )
  )
)

?renderMenu
?stringsAsFactors

server <- function(input, output){
  set.seed(122)
  histdata <- rnorm(500)
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)})
  
  output$plot2 <- renderPlot({
    data1 <- histdata[seq_len(input$slider1)]
    hist(data1)})
  
}

shinyApp(ui, server)

