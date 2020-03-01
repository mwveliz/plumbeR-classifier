#!/usr/bin/env Rscript

library(plumber)
library(textcat)
pr <- plumb('api.R')
pr$run(host="0.0.0.0", port=8888)
