#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(tidyverse)
library(tibble)
library(dplyr)
library(readxl)



shinyServer(function(input, output) {
  
  red <- read_excel("E:/Data_824/red.xlsx")
  plottype = reactive({
    switch(input$plot, jitter = geom_jitter, point = geom_point, smooth = geom_smooth, hex = geom_hex, bin2d = geom_bin2d, density = geom_density2d)
  })
    output$plot <- renderPlot({
      pt = plottype()
      ggplot(red, aes(!!input$X, Quality)) + pt()

    }, res = 96)
    
    output$info <- renderPrint({
      req(input$plot_click)
      x <- round(input$plot_click$x, 2)
      y <- round(input$plot_click$y, 2)
      cat("[", x, ", ", y, "]", sep = "")
    })

})
