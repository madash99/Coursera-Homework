library(shiny)
library(datasets)
oj <- read.table("data/oj_pop")
acid<-read.table("data/acid_pop")
roundUp<-function(x) ceiling(max(x)/1)

# ui.R


shinyUI(fluidPage(
        titlePanel("Longer Shinier Teeth"),
        sidebarLayout(
                sidebarPanel(
                        h4("How to Use this Application"),
                        p("Using a Vitamin C supplement will increase the size and beauty of your rodent's teeth.  
                          Choose the delivery vehicle using the radio button, the slider bar to specify dosage.
                          and enter the number of hamsters you own.  The chart line will highlight the range of possible effect on your pet's teeth as demonstrated by our advanced
                          clinical trials. As you move the slider, a vertical line will move along with your selection.  
                          You'll also see that we calculate how many bottles of supplement you'll need to order 
                          to participate.  Experiment on your own hamster and see if your results fall into the same range as ours!
                          Send your results to:"),
                        h5("HamstersWelfare@gmail.com"),
                        p("and we'll add them to our data set."),
                        br(),
                        radioButtons("vehicle", 
                                    label = "Choose delivery vehicle",
                                    choices = list("Orange Juice", "Ascorbic Acid"),
                                    selected = "Orange Juice"),
                        
                        sliderInput("dosage", 
                                    label = "Dosage in mg:",
                                    min = .5, max = 2, value = c(.5),
                                    ),
                       numericInput("hamsters", 
                                    label = "Enter # of hamsters to treat", 
                                            min=1, max=25, value = 1),
                        br(),
                        br(),
                        img(src = "hamster.jpg", height = 35, width = 35),
                        "Study is sponsored by ", 
                        span("Welfare for Hamsters, Inc.", style = "color:green")
                        
                ),
                mainPanel(
                        h3("Predicting Results"),
                        p("Vitamin C Supplements are", 
                          em("incredibly easy"), 
                          " to administer to your hamster."),
                        br(),
                        textOutput("text1"),
                        textOutput("text2"),
                        plotOutput("plot")
                        
                        
                )
        )
))
                