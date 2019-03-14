# Neccessary libraries
library("shiny")
library("rsconnect")

# Source in Server / UI
source("ben.server.R")
source("ben.ui.R")

shinyApp(ui = ben_ui, server = ben_server)