library(shiny)
library(bslib)
library(bsicons)




Population <- nav_panel(
  title = 'Population',
  
)

ui <- page_navbar(
  Population,
  title = "Japan Health Dashboard, 2026",
  window_title = 'Health Dashboard - STA 322 2.0',
  fillable = TRUE, fillable_mobile = TRUE
  
)