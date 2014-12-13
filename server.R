library(shiny)
library(ggplot2)
oj <- read.table("data/oj_pop")
acid<-read.table("data/acid_pop")
roundUp<-function(x) ceiling(max(x)/1)

shinyServer(
            
        function(input, output) {
                 
                output$text1<-renderText({
                        paste("You have selected ", input$hamsters, "hamster(s) and ",input$vehicle, "
                        as the delivery vehicle at the dosage of", input$dosage, "mg")
                })
                output$text2<-renderText({
                        paste("You will need to order the following number of our 10 mg bottles: " ,
                              (roundUp((input$hamsters * input$dosage) / 10)))
                         })
                
                output$plot<-renderPlot({ 
                        if (input$vehicle=="Orange Juice") {
                                p<-ggplot(oj, 
                               aes(x = dose, y = len, group=id)
                                ) +geom_line(aes(color = factor(id))) +labs(title="Orange Juice Trial - 10 Hamster Factor ID's")
                                p + geom_vline(xintercept=input$dosage)
                        }
                        else{
                                p<-ggplot(acid, 
                                aes(x = dose, y = len, group=id)
                                ) +geom_line(aes(color = factor(id))) +labs(title="Abscorbic Acid Trial - 10 Hamster Factor ID's")
                                p + geom_vline(xintercept=input$dosage)
                        }
                })
        })
                
                
 