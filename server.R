library(shiny)
library(ggplot2)
oj <- read.table("data/oj_pop")
acid<-read.table("data/acid_pop")

shinyServer(
        function(input, output) {
                             
             
                output$text1 <- renderText({ 
                        paste("You have selected ", input$vehicle)
                })
                
                output$text2 <- renderText({ 
                        paste("Your dosage in milligrams ",input$dosage)
                })
                
                output$plot<-renderPlot({
                if (input$vehicle=="Orange Juice") {                            
                        p<- ggplot(oj, 
                                   aes(x = dose, y = len, group=id)
                        ) + geom_line(aes(color = factor(id))) +labs(title="Orange Juice Clinical Trial")  
                       p + geom_vline(xintercept=input$dosage) }
                else 
                { p<-ggplot(acid, 
                        aes(x = dose, y = len, group=id)
                        ) +geom_line(aes(color = factor(id))) +labs(title="Ascorbic Acid Trial")
                  p + geom_vline(xintercept=input$dosage) }
                })
        })
                        
                    
                        
                           

