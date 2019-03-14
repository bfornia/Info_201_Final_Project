# Neccessary libraries
library("shiny")
library("rsconnect")

# Source in Server / UI
source("Louis.server.R")
source("Louis.ui.R")
source("regional_analysis.R")

shinyApp(ui = ui, server = server)