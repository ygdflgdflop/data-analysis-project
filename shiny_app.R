#install.packages(c('shiny', 'shinythemes'))
#library('shiny')
#library('shinythemes')

valstat <- read.csv("C:/Users/ashwa/OneDrive/Documents/Columbia/Data Analysis/valorant-stats.csv")
valstat <- data.frame(valstat$Weapon.Type, valstat$Price, valstat$Fire.Rate, valstat$Wall.Penetration, valstat$Magazine.Capacity, valstat$BDMG_0, valstat$BDMG_1, valstat$BDMG_2)
colnames(valstat) <- c('Type', 'Price', 'Fire.Rate', 'Wall.Penetration', 'Magazine.Capacity', 'Short.Range.Body.Damage', 'Medium.Range.Body.Damage', 'Long.Range.Body.Damage')

ui <- fluidPage(theme = shinytheme("superhero"),
      navbarPage(
        "Valorant Gun Stats",
        tabPanel("Choose your Chart",
                   sidebarPanel(
                     tags$h3("Type of gun:"),
                     radioButtons("gun", label = "Category: ",
                                  choices = rownames(table(valstat$Type)),
                                  selected = "Sidearm")
                   ),
                   mainPanel(
                     h1("Stats"),
                     plotOutput(outputId = "allGuns")
                   )
                 )
      )
)

server <- function(input, output) {
  output$allGuns <- renderPlot({
    valstat %>% filter(valstat$Type == input$gun) -> gunType
    ggplot(data = gunType, aes(x = Price, y = Medium.Range.Body.Damage)) + geom_point(color = "8D918D")
  })
}

shinyApp(ui=ui, server=server)