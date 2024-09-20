#!/usr/bin/env Rscript
suppressPackageStartupMessages(library(dplyr))

fzbz <- function(x){
 # 
 out[x%%5 & x%%3] <- 'fizzbuzz'

 out[x%%3] <- 'fizz'
 out[x%%5] <- 'buzz'
}

x <- seq(1,10)
out <- fzvz

print(out)
