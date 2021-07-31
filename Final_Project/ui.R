#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
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


red <- read_excel("E:/Data_824/red.xlsx")

shinyUI(fluidPage(
    titlePanel("Comparing Wine Chemical Composition with Quality"),
    varSelectInput("X", "X Variable:", red),
    selectInput('plot', "Choose a graph type:", choices = c("jitter" = "jitter", "point" = "point", "smooth" = "smooth", "hex" = "hex", "bin2d" = "bin2d", "density" = "density")),
    plotOutput("plot", click = "plot_click"),
    verbatimTextOutput("info")
))
 
