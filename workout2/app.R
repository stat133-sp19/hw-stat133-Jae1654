
library(shiny)
library(ggplot2)
library(tidyr)
library(rsconnect)


# Define UI for application that draws a histogram
ui <- fluidPage(
  
  titlePanel("Future value of invest opportunities"),
  
  fluidRow(
    column(3,sliderInput("initial","Initial Amount", min = 0, max = 100000, 
                         value = 1000, step = 500),
           sliderInput("contribution","Annual Contribution",min = 0, max = 50000, 
                       value = 2000, step = 500)
    ),
    
    column(3,
           sliderInput("r", "Return Rate (in %)",
                       min = 0, max = 20, value = 5, step = 0.1),
           sliderInput("g", "Growth Rate (in %)",
                       min = 0, max = 20, value = 2, step = 0.1)
    ),
    
    column(3,
           sliderInput("y","Years",
                       min = 0, max = 50, value = 20, step = 1),
           selectInput("fac","Facet?",
                       choices = c("Yes", "No"),
                       selected = "No")
    )
  ),
  hr(),
  # Show a plot of the generated distribution
  h4(strong("Timelines")),
  plotOutput("FVplot"),
  h4(strong("Balances")),
  verbatimTextOutput("FVtable")
)
  
# Define server logic required to draw a histogram
server <- function(input, output) {
  
  dataInput <- reactive({
    year <- vector()
    no_contrib <- vector()
    fixed_contrib<- vector()
    growing_contrib <- vector()
    
    modalities_function <- function(amount = 1,contrib=1,rate =1, growth = 0,years = 1){
      
      for(i in 0:years){
        year[i+1] <- i
        no_contrib[i+1] <- amount*(1+rate)^(i)
        fixed_contrib[i+1] <- (contrib/rate)*((1+rate)^i-1) +no_contrib[i+1]
        growing_contrib[i+1] <- (contrib/(rate-growth))*((1+rate)^i -(1+growth)^i) +no_contrib[i+1]
      }
      
      df <- as.data.frame(cbind(year,no_contrib,fixed_contrib,growing_contrib))
      return(df)
    }
    
    
    modalities <- modalities_function(amount = input$initial,contrib = input$contribution,
                                      rate = (input$r/100),growth = (input$g/100),years = input$y)
    return(modalities)
    
  })
  
  
  output$FVplot <- renderPlot({
    
    #gather
    long_data <- gather(dataInput(),modality,fv,no_contrib:growing_contrib)
    #assign color

    cols <- c("no_contrib" = "#F8766D", "fixed_contrib" = "#00BA38" ,"growing_contrib" = "#619CFF")
    
    if(input$fac == "Yes"){
      
      long_data$facet = factor(long_data$modality, levels = c("no_contrib", "fixed_contrib", "growing_contrib"))
      
    plot <-  ggplot(long_data,aes(x = year,y =fv))+
      geom_line(aes(color = modality))+
      geom_point(aes(color = modality))+
      labs(title = "Three modes of investing") +
      xlab("Timeline (in year)")+
      ylab("Future value ($)")+
      scale_colour_manual(values = cols,breaks=c("no_contrib","fixed_contrib","growing_contrib"))+
      geom_area(position='identity',aes(fill = facet),alpha = 0.4,show.legend = FALSE)+
       facet_wrap(~ facet)+
      theme_bw()
     
    
    }else{
     
       plot <-  ggplot(long_data,aes(x = year,y =fv))+
        geom_line(aes(color = modality))+
        geom_point(aes(color = modality))+
        labs(title = "Three modes of investing") +
        xlab("Timeline (in year)")+
        ylab("Future value ($)")+
        scale_colour_manual(values = cols,breaks=c("no_contrib","fixed_contrib","growing_contrib"))
      }
    
 
    return(plot)
  })
  
  output$FVtable <- renderPrint({dataInput()})
}

# Run the application 
shinyApp(ui = ui, server = server)

